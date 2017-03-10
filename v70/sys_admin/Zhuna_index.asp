<!--#INCLUDE FILE="../inc/Conn.asp"-->
<%const ItemPath="../"%>
<!--#INCLUDE FIlE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="inc/Main_Function.asp"-->
<%
CheckAdminLogin 1
destroy
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>酒店分销联盟管理系统</title>
</head>
<frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="header.asp" name="header" scrolling="No" noresize="noresize" id="header" />
  <frameset rows="*" cols="165,*" framespacing="0" frameborder="no" border="0">
    <frame src="menu.asp" name="menu" scrolling="No" noresize="noresize" id="menu" />
    <frame src="main.asp" name="main" id="main" scrolling="Yes" />
  </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>