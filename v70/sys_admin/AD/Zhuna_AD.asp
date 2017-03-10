<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../../module/YeatPage/Zhuna_vbsPage.asp"-->
<%
Dim Action,ModuleName,CheckErr,MsgStr

ModuleName=D("AD")
CheckAdminLogin 3
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "add":   header(""):Call Add_AD()
Case "mod":   header("typechange("&GetTypevalue(FU.CheckNumeric(Request("Id")))&");statechange("&Getstatevalue(FU.CheckNumeric(Request("Id")))&");loadform();"):Call Mod_AD()
Case "do_add":header(""):Call Do_Add_AD()
Case "do_mod":header(""):Call Do_Mod_AD()
Case "del":   header(""):Call Del_AD()
Case Else:	  header(""):Call AD()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy

Sub AD()
%>
<div id="main">
  <div class="main_box">
    <h2>广告管理</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
      <tr>
        <th width="70">编号</th>
        <th width="122" class="td_left">位置</th>
        <th width="215" class="td_left">链接名称</th>
        <th width="244" class="td_left">链接地址</th>
        <th width="150" class="td_left">状态</th>
        <th width="192" class="td_left">类型</th>
        <th width="187" class="td_left">添加日期</th>
        <th >管理</th>
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
	.Pkey="AD_ID"	
	.Field="AD_ID,AD_Title,AD_Link,AD_State_radio,AD_type_radio,AD_AddDate,AD_area"
	.Table="ZN_"&ModuleName
	.Condition=""
	.OrderBy="AD_Order desc,AD_ID desc"
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
<td width="70"><%=rs(0,i+j)%></td>
<td width="122" class="td_left"><%=rs(6,i+j)%></td>
<td width="215" class="td_left"><%=rs(1,i+j)%></td>
<td class="td_left"><%=rs(2,i+j)%></td>
<td class="td_left"><%=GetStateName(rs(3,i+j))%></td>
<td class="td_left"><%=GetTypeName(rs(4,i+j))%></td>
<td class="td_left"><%=rs(5,i+j)%></td>
<td width="214"><a href="?action=mod&id=<%=rs(0,i+j)%>">管理</a></td>
<%
end if
next%>
</tr>
<%
next
End If
%>

</table>
<%orss.ShowPage()%>
<%If NullMSG Then Response.Write("<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" class=""t_list""><tr><td style=""color:#f00; padding:10px 0;"">对不起!目前还没有发布信息! </td></tr></table>")%>
</div>
</div>
<%
End Sub

Sub Add_AD()
%>
<div id="main">
  <div class="main_box">
    <h2>添加广告</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
     <form name="addform" method="post" action="?action=do_add">
     <tr>
        <td width="100" class="td_right">位置：</td>
        <td class="td_left"><input name="area" type="text" id="area" value="" size="40" />
         </td>
      </tr>
      <tr>
        <td width="100" class="td_right">标题：</td>
        <td class="td_left"><input name="title" type="text" id="title" value="" size="40" />
         </td>
      </tr>
       <tr>
        <td width="100" class="td_right">广告大小：</td>
        <td class="td_left">宽：<input name="sizewidth" type="text" id="sizewidth" value="" size="10" />高：<input name="sizeheight" type="text" id="sizeheight" value="" size="10" />
         </td>
      </tr>
       <tr>
        <td width="100" class="td_right">链接：</td>
        <td class="td_left"><input name="link" type="text" id="link" value="http://" size="40" />
         </td>
      </tr>
      <tr>
        <td class="td_right">类型：</td>
        <td class="td_left">文字<input name="type_radio" type="radio" id="type_radio" value="1" checked="checked" onclick="typechange(1);" />&nbsp;&nbsp;上传图片<input name="type_radio" type="radio" id="type_radio" value="2"  onclick="typechange(2);"/>&nbsp;&nbsp;Google百度等广告代码<input name="type_radio" type="radio" id="type_radio" value="3" onclick="typechange(3);"/>&nbsp;&nbsp;
        <div id="changetype2" style="display:none">
        <iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=UploadFile2" scrolling="no" width="255" height="20" frameborder="0"></iframe> 
             <br>
             <input name="uploadfile" type="text" id="UploadFile2" size="30" disabled>
        </div>        
        <div id="changetype3" style="display:none">广告代码：<textarea name="externallinks" rows="5"  cols="60" id="UploadFile3"></textarea>当您的密码泄露时此处可能被挂马！
        </div>
        </td>
      </tr>
      <tr>
        <td class="td_right">排序：</td>
        <td class="td_left"><input name="order" type="text" id="order" value="0" />
          </td>
      </tr>
      <tr>
        <td class="td_right">期限：</td>
        <td class="td_left">
        <script language="javascript">var webpath='../../';</script>
		<script language="javascript" src="../../inc/calendar.js"></script>
        正常<input name="state_radio" type="radio" id="state_radio" value="1" checked="checked" onclick="statechange(1);" />&nbsp;&nbsp;永久<input name="state_radio" type="radio" id="state_radio" value="2"  onclick="statechange(2);"/>&nbsp;&nbsp;停止<input name="state_radio" type="radio" id="state_radio" value="3" onclick="statechange(3);"/>

        <div id="changestate">
        开始日期：<input name="begintime" type="text" value="" id="begintime" onclick="javascript:javascript:event.cancelBubble=true;showCalendar('begintime',false,'begintime','endtime','endtime','<%=date()%>','','','','','text','')" style="width:120px;" />
        <img src="../../images/calendar.gif" width="16" height="19" align="absmiddle" style="CURSOR: hand" border="0" onclick="javascript:event.cancelBubble=true;showCalendar('begintime',false,'begintime','endtime','endtime','<%=date()%>','','','','','text','')" />&nbsp;&nbsp;&nbsp;结束日期：
        <input name="endtime" type="text" value="" id="endtime" onclick="javascript:event.cancelBubble=true;showCalendar('endtime',false,'endtime','','','<%=date()%>','','','','','text','')" style="width:120px;" />
        <img src="../../images/calendar.gif" width="16" height="19" align="absmiddle" style="CURSOR: hand" border="0" onclick="javascript:event.cancelBubble=true;showCalendar('endtime',false,'endtime','','','<%=date()%>','','','','','text','')" />&nbsp;&nbsp;
        </div>
        </td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left"><input name="submit" type="submit" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'" id="submit" value="提交" />
          <input type="reset" name="reset_button" value="清除" class="btn05" />
          <input type="button" name="backbutton" id="backbutton" class="btn05"  onclick="history.back(1);" value="返回" /></td>
      </tr>
    </form>
    </table>
  </div>
</div>
<%
End Sub


Sub Mod_AD()
	Dim Rs,Id
	Id=FU.CheckNumeric(Request("Id"))
	Set Rs = DB.Execute("SELECT * FROM ZN_"&ModuleName&" where AD_id ="&Id)
	If Not Rs.Eof then
	OutputContentToFormByJavascript "|password|","AD",Rs
	End If
	Rs.Close:Set Rs=Nothing
%>
<div id="main">
  <div class="main_box">
    <h2>修改广告</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
     <form name="modform" method="post" action="?action=do_mod">
       <tr>
        <td width="100" class="td_right">位置：</td>
        <td class="td_left"><input name="area" type="text" id="area" value="" size="40" />
         </td>
      </tr>
      <tr>
        <td width="100" class="td_right">标题：</td>
        <td class="td_left"><input name="title" type="text" id="title" value="" size="40" />
         </td>
      </tr>
        <tr>
        <td width="100" class="td_right">广告大小：</td>
        <td class="td_left">宽：<input name="sizewidth" type="text" id="sizewidth" value="" size="10" />高：<input name="sizeheight" type="text" id="sizeheight" value="" size="10" />
         </td>
      </tr>
       <tr>
        <td width="100" class="td_right">链接：</td>
        <td class="td_left"><input name="link" type="text" id="link" value="http://" size="40" />
         </td>
      </tr>
      <tr>
        <td class="td_right">类型：</td>
        <td class="td_left">文字<input name="type_radio" type="radio" id="type_radio" value="1" checked="checked" onclick="typechange(1);" />&nbsp;&nbsp;上传图片<input name="type_radio" type="radio" id="type_radio" value="2"  onclick="typechange(2);"/>&nbsp;&nbsp;Google百度等广告代码
        <input name="type_radio" type="radio" id="type_radio" value="3" onclick="typechange(3);"/>&nbsp;&nbsp;
        <div id="changetype2" style="display:none">
        <iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=UploadFile2" scrolling="no" width="255" height="20" frameborder="0"></iframe> 
             <br>
             <input name="uploadfile" type="text" id="UploadFile2" size="30" disabled>
        </div>        
        <div id="changetype3" style="display:none">广告代码：<textarea name="externallinks" cols="60" rows="5" id="UploadFile3" disabled ></textarea>当您的密码泄露时此处可能被挂马！</div>
        </td>
      </tr>
      <tr>
        <td class="td_right">排序：</td>
        <td class="td_left"><input name="order" type="text" id="order" value="0" />
          </td>
      </tr>
      <tr>
        <td class="td_right">期限：</td>
        <td class="td_left">
        <script language="javascript">var webpath='../../';</script>
		<script language="javascript" src="../../inc/calendar.js"></script>
        正常<input name="state_radio" type="radio" id="state_radio" value="1" checked="checked" onclick="statechange(1);" />&nbsp;&nbsp;永久<input name="state_radio" type="radio" id="state_radio" value="2"  onclick="statechange(2);"/>&nbsp;&nbsp;停止<input name="state_radio" type="radio" id="state_radio" value="3" onclick="statechange(3);"/>

        <div id="changestate">
        开始日期：<input name="begintime" type="text" value="" id="begintime" onclick="javascript:event.cancelBubble=true;showCalendar('begintime',false,'begintime','endtime','endtime','<%=date()%>','','','','','text','')" style="width:120px;" />
        <img src="../../images/calendar.gif" width="16" height="19" align="absmiddle" style="CURSOR: hand" border="0" onclick="javascript:event.cancelBubble=true;showCalendar('begintime',false,'begintime','endtime','endtime','<%=date()%>','','','','','text','')" />&nbsp;&nbsp;&nbsp;结束日期：
        <input name="endtime" type="text" value="" id="endtime" onclick="javascript:event.cancelBubble=true;showCalendar('endtime',false,'endtime','','','<%=date()%>','','','','','text','')" style="width:120px;" />
        <img src="../../images/calendar.gif" width="16" height="19" align="absmiddle" style="CURSOR: hand" border="0" onclick="javascript:event.cancelBubble=true;showCalendar('endtime',false,'endtime','','','<%=date()%>','','','','','text','')" />&nbsp;&nbsp;
        </div>
        </td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left"><input type="hidden" name="id" value="" />
        <input name="submit" type="submit" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'" id="submit" value="提交" />
          <input type="reset" name="reset_button" value="清除" class="btn05" />
          <input type="button" name="backbutton" id="backbutton" class="btn05"  onclick="history.back(1);" value="返回" /></td>
      </tr>
    </form>
    </table>
  </div>
</div>
<%
End Sub


Sub Do_Add_AD()
	
	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"标题不能为空。"
	If Request("link")="" Then CheckErr=True:MsgStr=MsgStr+"链接不能为空。"
	If Request("sizewidth")="" or Request("sizeheight")="" Then CheckErr=True:MsgStr=MsgStr+"广告宽高不能为空。"
	
	If Not CheckErr Then
		Dim Rs,SQL
		SQL = "SELECT * FROM ZN_"&ModuleName&" where AD_ID Is Null"
		Set Rs = DB.Recordset(SQL,1,3)
			Rs.addnew
			InputDatabase "|submit|Externallinks|","AD",Rs	'//调用InputDatabase()函数将表单写入数据库
			Rs("AD_Adddate")=Now()
			Rs("AD_AddUserName")=Session(cachename&"AdminName")
			Rs("AD_Externallinks")=Request.Form("Externallinks")
			Rs.update
			MsgStr="../Msg.asp?title="&ec("已添加成功！")&"&msg="&ec("相关操作：")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("进入管理")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=Add"">"&ec("继续添加")&"</a>"
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Do_Mod_AD()

	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"标题不能为空。"
	If Request("link")="" Then CheckErr=True:MsgStr=MsgStr+"链接不能为空。"
	If Request("sizewidth")="" or Request("sizeheight")="" Then CheckErr=True:MsgStr=MsgStr+"广告宽高不能为空。"
	
	If Not CheckErr Then
		Dim Rs,SQL,Id
		Id=FU.CheckNumeric(Request("Id"))
		SQL = "SELECT * FROM ZN_"&ModuleName&" where AD_id="&Id
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			  InputDatabase "|submit|id|Externallinks|","AD",Rs	'//调用InputDatabase()函数将表单写入数据库
			  Rs("AD_Externallinks")=Request.Form("Externallinks")
			  Rs.update
			  MsgStr=("../Msg.asp?title="&ec("修改成功！")&"&msg="&ec("相关操作：")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("进入管理")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=mod%26id="&Id&""">"&ec("继续修改")&"</a>")
		End If
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Del_AD()
	Dim Rs,SQL,Id
	Id=FU.CheckBadstr(Request("Id"))
	If Id="" Then CheckErr=True:MsgStr=MsgStr+"没有选择内容。"
	
	If Not CheckErr Then
		SQL = "SELECT * FROM ZN_"&ModuleName&" where AD_id in ("&Id&")"
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			do while not Rs.eof
			If Rs("AD_Id")<>1 Then
				Rs.delete
			End If
			Rs.movenext
			loop
		End If	
		Rs.Close:Set Rs=Nothing
		'//数据删除成功
		MsgStr=(request.ServerVariables("SCRIPT_NAME"))
	End If
End Sub

Function GetTypeName(id)
	If Id = "" Or Isnumeric(Id)=False Then Exit Function
	Select Case Id
	Case 1:GetTypeName="<span >文字</span>"
	Case 2:GetTypeName="<span style=""color:#f60;"">上传图片</span>"
	Case 3:GetTypeName="<span style=""color:red;"">Google百度等广告代码</span>"
	End Select
End Function

Function GetStateName(id)
	If Id = "" Or Isnumeric(Id)=False Then Exit Function
	Select Case Id
	Case 1:GetStateName="<span >正常</span>"
	Case 2:GetStateName="<span style=""color:#f60;"">永久</span>"
	Case 3:GetStateName="<span style=""color:red;"">停止</span>"
	End Select
End Function

Function GetTypevalue(id)
	If Id=0 Then Exit Function
	Dim Rs
	Set Rs=DB.Execute("Select AD_Type_radio From ZN_"&ModuleName&" Where AD_Id="&id)
	If Not Rs.eof Then
		GetTypevalue=Rs(0)
	End If
	Rs.Close:Set Rs=Nothing
End Function

Function Getstatevalue(id)
	If Id=0 Then Exit Function
	Dim Rs
	Set Rs=DB.Execute("Select AD_State_radio From ZN_"&ModuleName&" Where AD_Id="&id)
	If Not Rs.eof Then
		Getstatevalue=Rs(0)
	End If
	Rs.Close:Set Rs=Nothing
End Function
%>
<script>
function typechange(val)
{
	if(val==1){
	$("changetype2").style.display="none";
	$("changetype3").style.display="none";
	$("UploadFile2").disabled=true;
	$("UploadFile3").disabled=true;
	}
	else if(val==2){
	$("changetype2").style.display="";
	$("changetype3").style.display="none";
	$("UploadFile2").disabled=false;
	$("UploadFile3").disabled=true;
	}
	else if(val==3){
	$("changetype2").style.display="none";
	$("changetype3").style.display="";
	$("UploadFile2").disabled=true;
	$("UploadFile3").disabled=false;
	}
}
function statechange(val)
{
	if(val==1){
	$("changestate").style.display="";
	$("begintime").disabled=false;
	$("endtime").disabled=false;
	}
	else{
	$("changestate").style.display="none";
	$("begintime").disabled=true;
	$("endtime").disabled=true;
	}
}
</script>