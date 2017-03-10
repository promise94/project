<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../../module/fckeditor/fckeditor.asp"-->
<!--#INCLUDE FILE="../../module/YeatPage/Zhuna_vbsPage.asp"-->
<%
Dim Action,ModuleName,CheckErr,MsgStr

ModuleName=D("Article")
CheckAdminLogin 1
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "add":   header(""):Call Add_Artical()
Case "mod":   header("exviewimg("&Getviewimgvalue(FU.CheckNumeric(Request("Id")))&");loadform();"):Call Mod_Artical()
Case "do_add":header(""):Call Do_Add_Artical()
Case "do_mod":header(""):Call Do_Mod_Artical()
Case "del":   header(""):Call Del_Artical()
Case Else:	  header(""):Call Artical()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If

footer
destroy

Sub Artical()
Dim Pages,ClassId,Where
Pages=FU.CheckNumeric(Request("Pages"))
ClassId=FU.CheckNumeric(Request("ClassId"))
Where=""
If ClassId<>0 Then Where = " Article_ClassId="&ClassId
%>
<div id="main">
  <div class="main_box">
    <h2>内容列表</h2>
    <form action="" method="post" name="delform" id="delform">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
      <tr>
      <th>&nbsp;</th>
        <th width="100">编号</th>
        <th width="254">类别</th>
        <th width="593">标题</th>
        <th width="153">状态</th>
        <th>管理</th>
      </tr>
<%Dim orss,Rs,NullMSG:NullMSG=False
Set orss=new Zhuna_vbsPage
Set orss.Conn=DB.OutConn
With orss
	.PageSize=15
	.PageName="Pages"
	.DbType="AC"
	.RecType=-1
	.JsUrl="../../module/YeatPage/"	
	.Pkey="Article_ID"	
	.Field="Article_ID,Article_Title,Article_Order,Article_ClassId,Article_State_Radio"
	.Table="ZN_"&ModuleName
	.Condition=Where
	.OrderBy=" Article_Order desc,Article_ID desc"
End With
Rs=orss.ResultSet()
If IsNull(Rs) Then
NullMSG=True
Else
Dim Cols,iCount,i,j
cols=1
icount=ubound(Rs,2)
if icount mod cols = 0 then icount=icount+1
for i=0 to icount step cols
%><tr onmouseover="this.style.background='#f6f9fd'" onmouseout="this.style.background='#fff'">
<%
for j=0 to cols-1
if (i+j)<=ubound(rs,2) then
%>
<td width="57"><%="<input type=checkbox name=id value=" & rs(0,i+j) & ">"%></td>
<td width="100"><%=rs(0,i+j)%></td>
<td width="254"><a href="?ClassId=<%=Rs(3,i+j)%>&Pages=<%=Pages%>"><%=DB.GetClassName("Select ClassName From ZN_"&ModuleName&"_Class Where ClassID="&rs(3,i+j))%></a></td>
<td><%=rs(1,i+j)%></td> 
<td><%If rs(4,i+j)=0 Then%><div style="color:#f00">停止</div><%ElseIf Rs(4,i+j)=2 Then%><div style="color:#a00">推荐</div><%ElseIf Rs(4,i+j)=3 Then%><div style="color:#aa0">图片推荐</div><%Else%>正常<%End If%></td> 
<td width="237"><a href="?action=mod&id=<%=rs(0,i+j)%>&ClassId=<%=ClassID%>&Pages=<%=Pages%>">修改</a>| <a href="?action=del&id=<%=rs(0,i+j)%>&ClassId=<%=ClassID%>&Pages=<%=Pages%>">删除</a></td>

<%
end if
next%>
</tr>
<%
next
End If
%>   
<tr style="background:#f8f8f8;">
		<td ><input type="checkbox" onClick="CheckBoxCheckAll('id',this);"></td>
        <td colspan="5" class="td_left">
  	  <input name="Submit" type="submit" value="删除所选" class="btn02"  onClick="return confirm('确定要执行这次操作吗？')">
      <input name="action" type="hidden" value="del"></th>
</tr>
</table></FORM>
<%orss.ShowPage()%>
<%If NullMSG Then Response.Write("<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" class=""t_list""><tr><td style=""color:#f00; padding:10px 0;"">对不起!目前还没有发布信息! </td></tr></table>")%>
</div>
</div>
<%
End Sub

Sub Add_Artical()
%>
<div id="main">
  <div class="main_box">
    <h2>添加文章</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
    <form name="addform" method="post" action="?action=do_add">
      <tr>
        <td width="100" class="td_right_f00">所属类别：</td>
        <td class="td_left">
<select name="ClassID" id="ClassID">
<%Admin_ShowClass_Option 0,"ZN_"&ModuleName&"_Class",2%>
</select>
</td>
      </tr>
       <tr>
        <td class="td_right_f00">城市类别：</td>
        <td colspan="2" class="td_left"><%=CreatcityList%>
	  </td>
      </tr>
      <tr>
        <td class="td_right_f00">标题：</td>
        <td colspan="2" class="td_left"><input name="title" type="text" id="title" value="" size="59" />
	  </td>
      </tr>
       <tr>
        <td class="td_right">状态：</td>
        <td class="td_left">正常<input name="state_radio" type="radio" id="state_radio" value="1" checked="checked" onclick="return exviewimg(this.value);"/>&nbsp;&nbsp;停止<input name="state_radio" type="radio" id="state_radio" value="0" />&nbsp;&nbsp;推荐<input name="state_radio" type="radio" id="state_radio" value="2" onclick="return exviewimg(this.value);"/>
        &nbsp;&nbsp;图片推荐<input name="state_radio" type="radio" id="state_radio" value="3" onclick="return exviewimg(this.value);"/><div id="viewimgarea" style="display:none"><iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=viewimg" scrolling="no" width="255" height="20" frameborder="0"></iframe><input name="viewimg" type="text" id="viewimg" disabled="disabled" />92*68</div></td>
      </tr>
       <tr>
        <td class="td_right">作者：</td>
        <td class="td_left"><input name="author" type="text" id="author" value="<%=Session(cachename&"AdminRealName")%>" /></td>
      </tr>
      <tr>
        <td class="td_right">排序：</td>
        <td class="td_left"><input name="order" type="text" id="order" value="0" /></td>
      </tr>
      <tr>
        <td class="td_right">内容：</td>
        <td class="td_left">
<script id="scriptarea"></script><iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&ED=content" scrolling="no" width="255" height="20" frameborder="0"></iframe><input type="button" value="浏览服务器" onclick="BrowseServer();" id="btnBrowse"><br />
<%Dim oFCKeditor
Set oFCKeditor = New FCKeditor
oFCKeditor.BasePath = "../../module/FCKeditor/"
oFCKeditor.Width = "762"
oFCKeditor.Height = "401"
oFCKeditor.Value = ""
oFCKeditor.Create "content"
Set oFCKeditor=nothing
%></td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left"><input name="submit" type="submit" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'" id="submit" value="提交" />
          <input type="reset" name="reset_button" value="清除" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'">
          <input type="button" name="backbutton" id="backbutton" onClick="history.back(1);" value="返回" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'"/></td>
      </tr>
    </form>
    </table>
  </div>
</div>
<%
End Sub

Sub Mod_Artical()
	Dim Rs,Id,ClassID,Content
	Id=FU.CheckNumeric(Request("Id"))
	Set Rs = DB.Execute("SELECT * FROM ZN_"&ModuleName&" where Article_id ="&Id)
	If Not Rs.Eof then
	OutputContentToFormByJavascript "|content|","Article",Rs
	ClassID=Rs("Article_ClassID")
	Content=Rs("Article_Content")&" "
	End If
	Rs.Close:Set Rs=Nothing
%>
<div id="main">
  <div class="main_box">
    <h2>修改文章</h2><form name="modform" method="post" action="?action=do_mod" id="modform">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
    
      <tr>
        <td width="100" class="td_right_f00">所属类别：</td>
        <td class="td_left">
<select name="ClassID" id="ClassID">
<%Admin_ShowClass_Option ClassID,"ZN_"&ModuleName&"_Class",2%>
</select>
</td>
      </tr>
            <tr>
        <td class="td_right_f00">城市类别：</td>
        <td colspan="2" class="td_left"><%=CreatcityList%>
	  </td>
      </tr>
      <tr>
        <td class="td_right_f00">标题：</td>
        <td colspan="2" class="td_left"><input name="title" type="text" id="title" value="" size="59" />
	  </td>
      </tr>
      <tr>
        <td class="td_right">状态：</td>
        <td class="td_left">正常<input name="state_radio" type="radio" id="state_radio" value="1" checked="checked" onclick="return exviewimg(this.value);" />&nbsp;&nbsp;停止<input name="state_radio" type="radio" id="state_radio" value="0" onclick="return exviewimg(this.value);" />&nbsp;&nbsp;推荐<input name="state_radio" type="radio" id="state_radio" value="2" onclick="return exviewimg(this.value);" />&nbsp;&nbsp;图片推荐<input name="state_radio" type="radio" id="state_radio" value="3"  onclick="return exviewimg(this.value);"/><div id="viewimgarea" style="display:none"><iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=viewimg" scrolling="no" width="255" height="20" frameborder="0"></iframe><input name="viewimg" type="text" id="viewimg" disabled="disabled" />92*68</div></td>
      </tr>
      <tr>
        <td class="td_right">作者：</td>
        <td class="td_left"><input name="author" type="text" id="author" value="" /></td>
      </tr>
      <tr>
        <td class="td_right">排序：</td>
        <td class="td_left"><input name="order" type="text" id="order" value="" /></td>
      </tr>
      <tr>
        <td class="td_right">内容：</td>
        <td class="td_left"><script id="scriptarea"></script><iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&ED=content" scrolling="no" width="255" height="20" frameborder="0"></iframe><input type="button" value="浏览服务器" onclick="BrowseServer();" id="btnBrowse"><br />
<%Dim oFCKeditor
Set oFCKeditor = New FCKeditor
oFCKeditor.BasePath = "../../module/FCKeditor/"
oFCKeditor.Width = "762"
oFCKeditor.Height = "401"
oFCKeditor.Value = Replace(Content,"[ZN_IMAGE_PATH]","../../../")
oFCKeditor.Create "content"
Set oFCKeditor=nothing
%></td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
          <input type="hidden" name="id" value="" />
          <input name="submit" type="submit" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'" id="submit" value="提交" />
          <input type="reset" name="reset_button" value="清除" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'">
          <input type="button" name="backbutton" id="backbutton" onClick="history.back(1);" value="返回" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'"/></td>
      </tr>
    
    </table></form>
  </div>
</div>
<%
End Sub


Sub Do_Add_Artical()
	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"标题不能为空。"
	If Request("ClassID")="" Then CheckErr=True:MsgStr=MsgStr+"类别不能为空。"
	If Not CheckErr Then
		Dim Rs,SQL,TextContent,i
		
		SQL = "SELECT * FROM ZN_"&ModuleName&" where Article_id is null"
		Set Rs = DB.Recordset(SQL,1,3)
		Rs.addnew
		InputDatabase "|submit|content|","Article",Rs	'//调用InputDatabase()函数将表单写入数据库
		Rs("Article_Content")=Replace(FU.CheckHtmlCode(Request.Form("content")),"../../../","[ZN_IMAGE_PATH]")
		Rs.update
		Rs.Close:Set Rs=Nothing
		MsgStr=("../Msg.asp?title="&ec("已添加成功！")&"&msg="&ec("相关操作：")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("进入管理")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=Add"">"&ec("继续添加")&"</a>")
	End If
End Sub


Sub Do_Mod_Artical()
	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"标题不能为空。"

	If Not CheckErr Then
		Dim Rs,SQL,Id,content
		Id=FU.CheckNumeric(Request("Id"))
		SQL = "SELECT * FROM ZN_"&ModuleName&" where Article_id="&Id
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
		InputDatabase "|submit|id|content|","Article",Rs	'//调用InputDatabase()函数将表单写入数据库
		Rs("Article_Content")=Replace(FU.CheckHtmlCode(Request.Form("content")),"../../../","[ZN_IMAGE_PATH]")
		Rs.update
		End If
		Rs.Close:Set Rs=Nothing
		'//数据修改成功
		MsgStr=("../Msg.asp?title="&ec("修改成功！")&"&msg="&ec("相关操作：")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("进入管理")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=mod%26id="&Id&""">"&ec("继续修改")&"</a>")
	End If
End Sub


Sub Del_Artical()
	Dim Rs,SQL,Id
	Id=FU.CheckBadstr(Request("Id"))
	If Id="" Then CheckErr=True:MsgStr=MsgStr+"没有选择内容。"
	If Not CheckErr Then
		SQL = "SELECT * FROM ZN_"&ModuleName&" where Article_id in ("&Id&")"
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			do while not Rs.eof
			Rs.delete
			Rs.movenext
			loop
		End If	
		Rs.Close:Set Rs=Nothing
		'//数据删除成功
		MsgStr=(request.ServerVariables("SCRIPT_NAME"))
	End If
End Sub

Function GetFlagName(id)
	If Id = "" Or Isnumeric(Id)=False Then Exit Function
	Select Case Id
	Case 0:GetFlagName="<span style=""color:#00f;"">锁定</span>"
	Case 1:GetFlagName="<span >网站编辑</span>"
	Case 2:GetFlagName="<span style=""color:#f60;"">管理员</span>"
	Case 3:GetFlagName="<span style=""color:red;"">超级管理员</span>"
	End Select
End Function

Function Getviewimgvalue(id)
	If Id=0 Then Exit Function
	Dim Rs
	Set Rs=DB.Execute("Select Article_State_Radio From ZN_"&ModuleName&" Where Article_Id="&id)
	If Not Rs.eof Then
		Getviewimgvalue=Rs(0)
	End If
	Rs.Close:Set Rs=Nothing
End Function

Function CreatcityList()
	dim apiUrl,xml,root,creathlisturl,objNodes,strs,i
	apiUrl=doserver&"city.asp?u="&agent_id&"&m="&agent_md
	apiUrl=apiUrl&"&domain="&domain&"&Copyright="&Copyright&"&doname="&server.URLEncode(doname)&""
	creathlisturl=webpath&"DataBase/XML/city/"&replace(webpath,"/","")&"_getCity_all.xml"
	set xml=GetXml(apiUrl,creathlisturl)
	if xml.xml<>"" then
		set root=xml.documentElement
		Set objNodes = root.childNodes
		If objNodes.Length>0 Then
			strs="<select name=""cityid_select""><option value='0'>无城市类别</option>"&vbCrlf
			For i=0 to objNodes.Length-1
			'  <city ID="97" name="珠海" HotelNum="71" suoxie="ZH" /> 
				strs=strs&"<option value='"&objNodes.item(i).getAttribute("ID")&"'>"&objNodes.item(i).getAttribute("suoxie")&chr(13)&objNodes.item(i).getAttribute("name")&"</option>"&vbCrlf
			Next
			strs=strs&"</select>"
		End If
		CreatcityList=strs
	else
		CreatcityList=""
	end if
	set xml=nothing
End Function
%>
<script>
var Width = "762";
var Height = "401";
var BasePath=document.location.protocol+'//'+document.location.host+'<%=webpath%>';
var ImageBrowserURL =BasePath+'module/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Image&Connector=' + encodeURIComponent('../../connectors/asp/connector.asp') ;
function BrowseServer()
{
	OpenServerBrowser(
		'Image',
		ImageBrowserURL,
		Width,
		Height) ;
}
function OpenServerBrowser( type, url, width, height )
{
	OpenFileBrowser( url, width, height ) ;
}
function OpenFileBrowser( url, width, height )
{

	var iLeft = ( window.ScreenWidth  - width ) / 2 ;
	var iTop  = ( window.ScreenHeight - height ) / 2 ;

	var sOptions = "toolbar=no,status=no,resizable=yes,dependent=yes,scrollbars=yes" ;
	sOptions += ",width=" + width ;
	sOptions += ",height=" + height ;
	sOptions += ",left=" + iLeft ;
	sOptions += ",top=" + iTop ;

	window.open( url, 'FCKBrowseWindow', sOptions ) ;
}
var urlbak;
function SetUrl(url)
{
	if(urlbak!=url){
	document.getElementById('scriptarea').src='../../module/fckeditor/fckeditor.js';
	FCKeditorAPI.GetInstance('content').InsertHtml('<img border="0" src="'+url+'" />');
	urlbak=url;
	}
}
function exviewimg(val)
{
	if(val==3){
		document.getElementById("viewimgarea").style.display="";
		document.getElementById("viewimg").disabled=false;
	}
	else
	{document.getElementById("viewimgarea").style.display="none";
	document.getElementById("viewimg").disabled=true;}
}
</script>