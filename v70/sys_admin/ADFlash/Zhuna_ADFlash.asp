<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../../module/YeatPage/Zhuna_vbsPage.asp"-->
<%
Dim Action,ModuleName,CheckErr,MsgStr

ModuleName=D("AD")

CheckAdminLogin 2
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "add":   header(""):Call Add_ADFlash()
Case "mod":   header("loadform();"):Call Mod_ADFlash()
Case "do_add":header(""):Call Do_Add_ADFlash():Call makexml()
Case "do_mod":header(""):Call Do_Mod_ADFlash():Call makexml()
Case "del":   header(""):Call Del_ADFlash():Call makexml()
Case Else:	  header(""):Call ADFlash()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy

Sub ADFlash()
%>
<div id="main">
  <div class="main_box">
    <h2>Flash广告管理</h2>
    <form action="" method="post" name="delform" id="delform">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
        <tr> 
        <th width="71"></th>
          <th width="106">编号</th>
          <th width="245" class="td_left">名称</th>
          <th width="317" class="td_left">链接地址</th>
          <th width="190" class="td_left">添加日期</th>
          <th colspan="2">管理</th>
        </tr>
<%Dim orss,Rs,NullMSG:NullMSG=False
Set orss=new Zhuna_vbsPage
Set orss.Conn=DB.OutConn
With orss
	.PageSize=20
	.PageName="Pages"
	.DbType="AC"
	.RecType=-1
	.JsUrl="../../module/YeatPage/"
	.Pkey="ADFlash_ID"	
	.Field="ADFlash_ID,ADFlash_Title,ADFlash_Link,ADFlash_AddDate"
	.Table="ZN_"&ModuleName&"_flash"
	.Condition=""
	.OrderBy="ADFlash_Order desc,ADFlash_ID desc"
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
%>
        <tr onmouseover="this.style.background='#f6f9fd'" onmouseout="this.style.background='#fff'">
          <%
for j=0 to cols-1
if (i+j)<=ubound(rs,2) then
%>
          <td width="71"><%Response.Write("<input type=checkbox name=id value=" & rs(0,i+j) & ">")%></td>
          <td width="106"><%=rs(0,i+j)%></td>
          <td width="245" class="td_left"><%=rs(1,i+j)%></td>
          <td class="td_left"><%=rs(2,i+j)%></td>
          <td class="td_left"><%=rs(3,i+j)%></td>
          <td width="214"><a href="?action=mod&id=<%=rs(0,i+j)%>">修改</a> | <a href="?action=del&id=<%=rs(0,i+j)%>">删除</a></td>
          <%
end if
next%>
        </tr>
        <%
next
End If
%>
        <tr style="background:#f8f8f8;">
          <td ><input type="checkbox" onclick="CheckBoxCheckAll('id',this);" /></td>
          <td colspan="7" class="td_left"><input name="Submit" type="submit" value="删除所选" class="btn02"  onclick="return confirm('确定要执行这次操作吗？')" />
            <input name="action" type="hidden" value="del" /></td>
        </tr>
      </table>
    </FORM>
<%orss.ShowPage()%>
<%If NullMSG Then Response.Write("<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" class=""t_list""><tr><td style=""color:#f00; padding:10px 0;"">对不起!目前还没有发布信息! </td></tr></table>")%>
</div>
</div>
<%
End Sub

Sub Add_ADFlash()
%>
<div id="main">
  <div class="main_box">
    <h2>添加Flash广告</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
     <form name="addform" method="post" action="?action=do_add">
      <tr>
        <td width="100" class="td_right">标题：</td>
        <td class="td_left"><input name="title" type="text" id="title" value="" size="40" />
         </td>
      </tr>
       <tr>
        <td width="100" class="td_right">链接：</td>
        <td class="td_left"><input name="link" type="text" id="link" value="http://" size="40" />
         </td>
      </tr>
      <tr>
        <td class="td_right">图片上传：</td>
        <td class="td_left">
        <iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=UploadFile2" scrolling="no" width="255" height="20" frameborder="0"></iframe> 
             <br>
             <input name="uploadfile" type="text" id="UploadFile2" size="30">
             248*200
        </td>
      </tr>
      <tr>
        <td class="td_right">排序：</td>
        <td class="td_left"><input name="order" type="text" id="order" value="0" />
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


Sub Mod_ADFlash()
	Dim Rs,Id
	Id=FU.CheckNumeric(Request("Id"))
	Set Rs = DB.Execute("SELECT * FROM ZN_"&ModuleName&"_flash where ADFlash_id ="&Id)
	If Not Rs.Eof then
	OutputContentToFormByJavascript "","ADFlash",Rs
	End If
	Rs.Close:Set Rs=Nothing
%>
<div id="main">
  <div class="main_box">
    <h2>修改Flash广告</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
     <form name="modform" method="post" action="?action=do_mod">
      <tr>
        <td width="100" class="td_right">标题：</td>
        <td class="td_left"><input name="title" type="text" id="title" value="" size="40" />
         </td>
      </tr>
       <tr>
        <td width="100" class="td_right">链接：</td>
        <td class="td_left"><input name="link" type="text" id="link" value="http://" size="40" />
         </td>
      </tr>
     <tr>
        <td class="td_right">图片上传：</td>
        <td class="td_left">
        <iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=UploadFile2" scrolling="no" width="255" height="20" frameborder="0"></iframe> 
             <br>
             <input name="uploadfile" type="text" id="UploadFile2" size="30">
          248*200 </td>
      </tr>
      <tr>
        <td class="td_right">排序：</td>
        <td class="td_left"><input name="order" type="text" id="order" value="" />
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


Sub Do_Add_ADFlash()
	
	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"标题不能为空。"
	If Request("link")="" Then CheckErr=True:MsgStr=MsgStr+"链接不能为空。"
	
	If Not CheckErr Then
		Dim Rs,SQL
		SQL = "SELECT * FROM ZN_"&ModuleName&"_flash where ADFlash_ID Is Null"
		Set Rs = DB.Recordset(SQL,1,3)
			Rs.addnew
			InputDatabase "|submit|","ADFlash",Rs	'//调用InputDatabase()函数将表单写入数据库
			Rs("ADFlash_Adddate")=Now()
			Rs.update
			MsgStr="../Msg.asp?title="&ec("已添加成功！")&"&msg="&ec("相关操作：")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("进入管理")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=Add"">"&ec("继续添加")&"</a>"
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Do_Mod_ADFlash()

	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"标题不能为空。"
	If Request("link")="" Then CheckErr=True:MsgStr=MsgStr+"链接不能为空。"
	
	If Not CheckErr Then
		Dim Rs,SQL,Id
		Id=FU.CheckNumeric(Request("Id"))
		SQL = "SELECT * FROM ZN_"&ModuleName&"_flash where ADFlash_id="&Id
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			  InputDatabase "|submit|id|","ADFlash",Rs	'//调用InputDatabase()函数将表单写入数据库
			  Rs.update
			  MsgStr=("../Msg.asp?title="&ec("修改成功！")&"&msg="&ec("相关操作：")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("进入管理")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=mod%26id="&Id&""">"&ec("继续修改")&"</a>")
		End If
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Del_ADFlash()
	Dim Rs,SQL,Id
	Id=FU.CheckBadstr(Request("Id"))
	If Id="" Then CheckErr=True:MsgStr=MsgStr+"没有选择内容。"
	
	If Not CheckErr Then
		SQL = "SELECT * FROM ZN_"&ModuleName&"_flash where ADFlash_id in ("&Id&")"
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

'+++++++++++++++++Config++++++++++++
'channel.item
'图片信息，可以设置多张图片
'
'channel.itme.image
'图片地址参数，此参数是唯一必须要有的参数，其他参数都有默认参数
'
'channel.itme.link
'对应图片的连接
'
'channel.itme.tilte
'对应图片的标题
'
'设置
'
'config.roundCorner
'图片的圆角
'
'config.autoPlayTime
'图片切换时间，默认值是8，单位秒
'
'config.isHeightQuality
'图片缩小是否采用高质量的方法，默认值false
'
'config.normal
'图片的混合模式
'
'config.transDuration
'图片在切换过程中的时间，默认值1，单位秒
'
'config.windowOpen
'图片连接的打开方式，默认值”_blank”,在新窗口打开，也可以使用”_self”,使用本窗口打开
'
'config.btnSetMargin
'按钮的位置，文字的位置，用了css的margin概念，默认值”auto 5 5 auto”，四个数值代表 上 右 下 左 相对于播放器的距离，四个数值用空格分开，不需具体数值用”auto”填写 ，比如左上对齐并都有10像素的距离可以写 “10 auto auto 10″, 右下角对齐是”auto 10 10 auto”
'
'config.btnDistance
'每个按钮的距离，默认值20
'
'config.titleBgColor
'标题背景的颜色，默认0xff6600
'
'config.titleTextColor
'标题文字的颜色，默认0xffffff
'
'config.titleBgAlpha
'标题背景的透明度，默认0.75
'
'config.titleFont
'标题文字的字体，默认值”微软雅黑”
'
'config.titleMoveDuration
'标题背景动画的时间，默认值1，单位秒
'
'config.btnAlpha
'按钮的透明度，默认值0.7
'
'config.btnTextColor
'按钮文字的颜色，默认值0xffffff
'
'config.btnDefaultColor
'按钮的默认颜色，默认值0×1B3433
'
'config.btnHoverColor
'按钮的默认颜色，默认值0xff9900
'
'config.btnFocusColor
'按钮当前颜色，默认值0xff6600
'
'config.changImageMode
'切换图片的方法，默认值”click”,点击切换图片，还可以使用”hover”,鼠标悬停就切换图片
'
'config.isShowBtn
'是否显示按钮，默认值”true”
'
'config.isShowTitle
'是否显示标题，默认值”true”
'
'config.scaleMode
'图片放缩模式: 默认值是”noBorder”
'“showAll”: 可以看到全部图片,保持比例,可能上下或者左右
'“exactFil”: 放缩图片到舞台的尺寸,可能比例失调
'“noScale”: 图片的原始尺寸,无放缩
'“noBorder”: 图片充满播放器,保持比例,可能会被裁剪
'
'config.transform
'图片放缩模式: 默认值是”alpha”
'“alpha”: 透明度淡入淡出
'“blur”: 模糊淡入淡出
'“left”: 左方图片滚动
'“right”: 右方图片滚动
'“top”: 上方图片滚动
'“bottom”: 下方图片滚动
'“breathe”: 有一点点地放缩的淡入淡出
'“breatheBlur”: 有一点点地放缩的模糊淡入淡出，本页的例子就是这个
'
'config.isShowAbout
'是否显示关于信息，默认值”true”
'

sub makexml()
Dim XmlDom,xmls,xmlss,Rs,sql
Set XmlDom = Server.CreateObject("Msxml2.FreeThreadedDOMDocument")
xmls=""
xmlss=""
xmls="<?xml version=""1.0"" encoding=""utf-8""?><data><channel>"
sql="select top 15 * from ZN_"&ModuleName&"_flash order by ADFlash_Order desc,ADFlash_ID desc"
set Rs=DB.execute(sql)
if not Rs.eof then
do while not Rs.eof
xmlss=xmlss&"<item>"&_
			"<link>"&Rs("ADFlash_Link")&"</link>"&_
			"<image>"&Rs("ADFlash_UploadFile")&"</image>"&_
			"<title>"&Rs("ADFlash_Title")&"</title>"&_
		"</item>"
Rs.movenext
loop
end if
Rs.close:set Rs=nothing
xmls=xmls&xmlss&"</channel>"&_
	"<config>"&_
		"<roundCorner>0</roundCorner>"&_
		"<autoPlayTime>8</autoPlayTime>"&_
		"<isHeightQuality>true</isHeightQuality>"&_
		"<blendMode>normal</blendMode>"&_
		"<transDuration>1</transDuration>"&_
		"<windowOpen>_blank</windowOpen>"&_
		"<btnSetMargin>auto 5 5 auto</btnSetMargin>"&_
		"<btnDistance>20</btnDistance>"&_
		"<titleBgColor>0x9ACDE8</titleBgColor>"&_
		"<titleTextColor>0xffffff</titleTextColor>"&_
		"<titleBgAlpha>.75</titleBgAlpha>"&_
		"<titleMoveDuration>1</titleMoveDuration>"&_
		"<btnAlpha>.7</btnAlpha>	"&_
		"<btnTextColor>0xffffff</btnTextColor>	"&_
		"<btnDefaultColor>0x519BCA</btnDefaultColor>"&_
		"<btnHoverColor>0x126DA6</btnHoverColor>"&_
		"<btnFocusColor>0x126DA6</btnFocusColor>"&_
		"<changImageMode>hover</changImageMode>"&_
		"<isShowBtn>true</isShowBtn>"&_
		"<isShowTitle>false</isShowTitle>"&_
		"<scaleMode>noBorder</scaleMode>"&_
		"<transform>alpha</transform>"&_
		"<isShowAbout>false</isShowAbout>"&_
		"<titleFont>微软雅黑</titleFont>"&_
	"</config>"&_
"</data>"
XmlDom.LoadXml replace(xmls,"&","&amp;")
If XmlDom.parseError.errorCode <> 0 Then
	   response.Write(XmlDom.parseError.errorCode&vbcrlf&_
	   XmlDom.parseError.reason&vbcrlf&_
	   XmlDom.parseError.line)
End If
XmlDom.save server.mappath("../../bcastr.xml")
set XmlDom=nothing
end sub
%>