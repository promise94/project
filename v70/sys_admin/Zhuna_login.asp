<!--#INCLUDE FILE="../inc/Conn.asp"-->
<%const ItemPath="../"%>
<!--#INCLUDE FIlE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Md5.asp"-->
<%Dim ModuleName
ModuleName=D("Manage")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>后台登录</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<style>
body { background:url(images/login_bg.gif) 0 0 repeat-x;}
</style>
<script language="javascript">
function CheckPost(){
  if(document.myform.username.value==""){
  alert("请输入用户名");
  document.myform.username.style.color="#FF0000"
  document.myform.username.focus();
  return false;
 }
 if(document.myform.password.value==""){
  alert("请输入密码");
  document.myform.password.style.color="#FF0000"
  document.myform.password.focus();
  return false;
 }
}
</script>
</head>

<body onLoad="document.myform.username.select();">
<%
Dim Action,CheckErr,MsgStr

Action=LCase(Request.QueryString("Action"))
CheckErr = False

Select Case Action
Case "do_login": Call Do_Login()
Case "login_out":   Call Do_Login_Out()
Case Else:Call Login()
End Select

If CheckErr = True Then
	Response.Write("<script>alert('"&MsgStr&"');history.back(1);</script>")
	Response.End()
End If
destroy

Sub Login()%>
<div id="login">
  <form id="myform" name="myform" method="post" action="?action=do_login" onSubmit="return CheckPost();">
    用户名
    <input name="username" type="text" class="login_input" id="username" />
    　密码
    <input name="password" type="password" class="login_input" id="password" />
    <input name="submit" type="submit" class="btn_login" id="submit" value=" " />
  </form>
</div>
<%End Sub

Sub Do_Login()
	Dim Rs,SQL
	Dim username, password
	username = FU.CheckBadstr(Request.Form("username"))
	password = md5(FU.CheckBadstr(Request.Form("password")),16)

	If FU.ChkPost = False Then
		MsgStr = MsgStr + "请不要从外部提交登陆!"
		CheckErr = True
	End If
	If Len(username) = 0 Then
		MsgStr = MsgStr + "用户名不能为空!"
		CheckErr = True
	End If
	If Len(Request.Form("password")) = 0 Then
		MsgStr = MsgStr + "用户密码不能为空!"
		CheckErr = True
	End If
	If CheckErr = True Then Exit Sub
	SQL = "SELECT * FROM ZN_"&ModuleName&" WHERE Manage_password='" & password & "' And Manage_username='" & username & "'"
	Set Rs = DB.Recordset(SQL,1,3)
	If Rs.BOF And Rs.EOF Then
		CheckErr = True
		MsgStr = MsgStr + "您输入的用户名和密码不正确或者您不是系统管理员。！"
		Exit Sub
	Else
		Rs("Manage_LoginTime") = Now()
		Rs("Manage_Loginip") = FU.getIP()
		Rs.Update
		If CheckErr = False Then
			Session(cachename&"AdminName") = Rs("Manage_username")
			Session(cachename&"AdminPass") = Rs("Manage_password")
			Session(cachename&"Adminflag") = Rs("Manage_Adminflag_select")
			Session(cachename&"AdminID")   = Rs("Manage_id")
			Session(cachename&"AdminRealName") = Rs("Manage_Name")
			Session.Timeout=45
		End If
	End If
	Rs.Close:Set Rs = Nothing
	Response.Redirect("Zhuna_index.asp")
End Sub

Sub Do_Login_Out()
	Session(cachename & "AdminName")		= Empty
	Session(cachename & "AdminPass")		= Empty
	Session(cachename & "Adminflag")		= Empty
	Session(cachename & "AdminID")		= Empty
	Session(cachename&"AdminRealName")  = Empty
	Response.Redirect ("../")
End Sub%>
</body>
</html>