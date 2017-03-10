<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../../module/YeatPage/Zhuna_vbsPage.asp"-->
<!--#INCLUDE FILE="../../inc/Md5.asp"-->
<%
Dim Action,ModuleName,CheckErr,MsgStr

ModuleName=D("Manage")

CheckAdminLogin 3
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "add":   header(""):Call Add_Manage()
Case "mod":   header("loadform();"):Call Mod_Manage()
Case "do_add":header(""):Call Do_Add_Manage()
Case "do_mod":header(""):Call Do_Mod_Manage()
Case "del":   header(""):Call Del_Manage()
Case Else:	  header(""):Call Manage()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy

Sub Manage()
%>
<div id="main">
  <div class="main_box">
    <h2>管理员管理</h2>
    <form action="" method="post" name="delform" id="delform">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
      <tr>
          <th width="61"></th>
        <th width="91">编号</th>
        <th width="198" class="td_left">用户名</th>
        <th width="349" class="td_left">真实姓名</th>
        <th width="259" class="td_left">级别</th>
        <th width="203" class="td_left">注册时间</th>
        <th colspan="2">管理</th>
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
	.Pkey="Manage_ID"	
	.Field="Manage_ID,Manage_UserName,Manage_Name,Manage_Adminflag_select,Manage_Adddate"
	.Table="ZN_"&ModuleName
	.Condition=""
	.OrderBy="Manage_ID desc"
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
%><tr onMouseOver="this.style.background='#f6f9fd'" onMouseOut="this.style.background='#fff'">
<%
for j=0 to cols-1
if (i+j)<=ubound(rs,2) then
%>
<td width="61"><%If rs(0,i+j)<>1 Then Response.Write("<input type=checkbox name=id value=" & rs(0,i+j) & ">")%></td>
<td width="91"><%=rs(0,i+j)%></td>
<td width="198" class="td_left"><%=rs(1,i+j)%></td>
<td class="td_left"><%=rs(2,i+j)%></td>
<td class="td_left"><%=GetFlagName(rs(3,i+j))%></td>
<td class="td_left"><%=rs(4,i+j)%></td>
<td width="233"><a href="?action=mod&id=<%=rs(0,i+j)%>">管理</a> | <%If rs(0,i+j)<>1 Then%><a href="?action=del&id=<%=rs(0,i+j)%>">删除</a><%End If%></td>
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
</table></FORM>
<%orss.ShowPage()%>
<%If NullMSG Then Response.Write("<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" class=""t_list""><tr><td style=""color:#f00; padding:10px 0;"">对不起!目前还没有发布信息! </td></tr></table>")%>
</div>
</div>
<%
End Sub

Sub Add_Manage()
%>
<div id="main">
  <div class="main_box">
    <h2>添加管理员</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
     <form name="addform" method="post" action="?action=do_add">
      <tr>
        <td width="100" class="td_right">登录名：</td>
        <td class="td_left"><input name="UserName" type="text" id="UserName" value="" />
         </td>
      </tr>
      <tr>
        <td class="td_right">真实姓名：</td>
        <td class="td_left"><input name="Name" type="text" id="Name" value="" /></td>
      </tr>
      <tr>
        <td class="td_right">密码：</td>
        <td class="td_left"><input name="password" type="password" id="password" value="" />
          </td>
      </tr>
      <tr>
        <td class="td_right">权限：</td>
        <td class="td_left"><select name="adminflag_select" id="adminflag_select">
            <option style="color:#f60;" value="2">管理员</option>
            <option value="1">网站编辑</option>
            <option style="color:#00f;" value="0" >锁定</option>
          </select></td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left"><input name="submit" type="submit" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" id="submit" value="提交" />
          <input type="reset" name="reset_button2" value="清除" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'"/>
          <input type="button" name="backbutton2" id="backbutton2" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" onClick="history.back(1);" value="返回" /></td>
      </tr>
    </form>
    </table>
  </div>
</div>
<%
End Sub


Sub Mod_Manage()
	Dim Rs,Id
	Id=FU.CheckNumeric(Request("Id"))
	Set Rs = DB.Execute("SELECT * FROM ZN_"&ModuleName&" where Manage_id ="&Id)
	If Not Rs.Eof then
	OutputContentToFormByJavascript "|password|","Manage",Rs
	End If
	Rs.Close:Set Rs=Nothing
%>
<div id="main">
  <div class="main_box">
    <h2>修改管理员</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
      <form name="modform" method="post" action="?action=do_mod">
        <tr>
          <td width="100" class="td_right">登录名：</td>
          <td class="td_left"><input name="username" type="text" id="username" value="" /></td>
        </tr>
        <tr>
          <td class="td_right">真实姓名：</td>
          <td class="td_left"><input name="name" type="text" id="name" value="" /></td>
        </tr>
        <tr>
          <td class="td_right">密码：</td>
          <td class="td_left"><input name="password" type="password" id="password" value="" />
          不修改就留空</td>
        </tr>
        <tr>
          <td class="td_right">权限：</td>
          <td class="td_left">
          <select name="adminflag_select" id="adminflag_select">
            <option style="color:#f60;" value="2">管理员</option>
            <option value="1">网站编辑</option>
            <option style="color:#00f;" value="0" >锁定</option>
          </select></td>
        </tr>
        <tr>
          <td class="td_right">&nbsp;</td>
          <td class="td_left">
          <input type="hidden" name="id" value="" />
          <input name="submit" type="submit" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" id="submit" value="提交" />
            <input type="reset" name="reset_button" value="清除" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" />
            <input type="button" name="backbutton" id="backbutton" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" onClick="history.back(1);" value="返回" /></td>
        </tr>
      </form>
    </table>
  </div>
</div>
<%
End Sub


Sub Do_Add_Manage()
	
	If Request("username")="" Then CheckErr=True:MsgStr=MsgStr+"用户名不能为空。"
	If Request("name")="" Then CheckErr=True:MsgStr=MsgStr+"真实姓名不能为空。"
	If Len(Request("password"))<6 Then CheckErr=True:MsgStr=MsgStr+"密码不能为空。且大于6位！"
	If Request("adminflag_select")="" Then CheckErr=True:MsgStr=MsgStr+"用户管理等级不能为空。"
	
	If Not CheckErr Then
		Dim Rs,SQL,Username,Password
		Username=FU.CheckBadstr(Request("username"))
		password=FU.CheckBadstr(Request("password"))
		SQL = "SELECT * FROM ZN_"&ModuleName&" where Manage_UserName='"&username&"'"
		Set Rs = DB.Recordset(SQL,1,3)
		If Rs.Eof And Rs.Bof Then
			Rs.addnew
			InputDatabase "|submit|password|","Manage",Rs	'//调用InputDatabase()函数将表单写入数据库
			Rs("Manage_ChangeIp")=FU.GetIP()
			Rs("Manage_Modifydate")=Now()
			Rs("Manage_PassWord")=lcase(md5(password,16))
			Rs.update
			MsgStr="../Msg.asp?title="&ec("已添加成功！")&"&msg="&ec("相关操作：")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("进入管理")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=Add"">"&ec("继续添加")&"</a>"
		Else
			CheckErr=True
			MsgStr="您输入的用户名已经存在！请换一个用户名！"
		End IF
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Do_Mod_Manage()

	If Request("username")="" Then CheckErr=True:MsgStr=MsgStr+"用户名不能为空。"
	If Request("name")="" Then CheckErr=True:MsgStr=MsgStr+"真实姓名不能为空。"
	If Request("adminflag_select")="" Then CheckErr=True:MsgStr=MsgStr+"用户管理等级不能为空。"
	If Request("password")<>"" Then
		If Len(Request("password"))<6 Then CheckErr=True:MsgStr=MsgStr+"密码不能为空。且大于6位！"
	End If
	
	If Not CheckErr Then
		Dim Rs,SQL,Id,password,username
		Id=FU.CheckNumeric(Request("Id"))
		username=FU.CheckBadStr(Request("username"))
		password=FU.CheckBadStr(Request("password"))
		SQL = "SELECT * FROM ZN_"&ModuleName&" where Manage_id="&Id
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			If Rs("Manage_UserName")<>username Then
				DIm Rss
				Set Rss=DB.Execute("SELECT Manage_Username From ZN_"&ModuleName&" Where Manage_UserName='"&username&"'")
				If Not Rss.Eof And Not Rss.Bof Then
					CheckErr=True
					MsgStr="您输入的用户名已经存在！请换一个用户名！"
				End If
				Rss.Close:Set Rss=Nothing
			End If
			If Not CheckErr Then
			  Dim special
			  If Id=1 Then special="adminflag_select|"
			  InputDatabase "|submit|id|password|"&special,"Manage",Rs	'//调用InputDatabase()函数将表单写入数据库
			  If PassWord<>"" Then
			  	Rs("Manage_PassWord")=lcase(md5(password,16))
			  End If
			  Rs("Manage_ChangeIp")=FU.GetIP()
			  Rs("Manage_Modifydate")=Now()
			  Rs.update
			  MsgStr=("../Msg.asp?title="&ec("修改成功！")&"&msg="&ec("相关操作：")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("进入管理")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=mod%26id="&Id&""">"&ec("继续修改")&"</a>")
			End If
		End If
		Rs.Close:Set Rs=Nothing

	End If
End Sub


Sub Del_Manage()
	Dim Rs,SQL,Id
	Id=FU.CheckBadstr(Request("Id"))
	If Id="" Then CheckErr=True:MsgStr=MsgStr+"没有选择内容。"
		
		SQL = "SELECT * FROM ZN_"&ModuleName&" where Manage_id in ("&Id&")"
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			do while not Rs.eof
			If Rs("Manage_Id")<>1 Then
				Rs.delete
			End If
			Rs.movenext
			loop
		End If	
		Rs.Close:Set Rs=Nothing
		'//数据删除成功
		MsgStr=(request.ServerVariables("SCRIPT_NAME"))
End Sub

Function GetFlagName(id)
	If Id = "" Or Isnumeric(Id)=False Then Exit Function
	Select Case Id
	Case 0:GetFlagName="<span >锁定</span>"
	Case 1:GetFlagName="<span style=""color:#f6f;"">网站编辑</span>"
	Case 2:GetFlagName="<span style=""color:#f60;"">管理员</span>"
	Case 3:GetFlagName="<span style=""color:red;"">超级管理员</span>"
	End Select
End Function
%>