<!--#INCLUDE FILE="../inc/Conn.asp"-->
<%Const ItemPath="../"%>
<!--#INCLUDE FIlE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="inc/Main_Function.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<style>
body { background:url(images/left_bg.gif) 0 0 repeat-y;}
</style>
</head>

<body>
<div id="menu">
<%If Session(cachename & "Adminflag")>2 Then%>
  <h4>��Ѷ����</h4>
  <ul>
    <li><a href="Article/Zhuna_Article.asp" target="main">��Ѷ�б�</a> | <a href="Article/Zhuna_Article.asp?Action=Add" target="main">���</a></li>
    <li><a href="Article/Zhuna_Article_Class.asp" target="main">��Ѷ���</a> | <a href="Article/Zhuna_Article_Class.asp?action=add" target="main">���</a></li>
  </ul>
<%End If%>
  <h4>��������</h4>
  <ul>
    <li><a href="AD/Zhuna_AD.asp" target="main">������</a> </li>
    <li><a href="Special/Zhuna_Special.asp" target="main">ר�����</a> </li>
    <li><a href="FriendLink/Zhuna_FriendLink.asp" target="main">��������</a> | <a href="FriendLink/Zhuna_FriendLink.asp?Action=Add" target="main">���</a></li>
    <li><a href="ADFlash/Zhuna_ADFlash.asp" target="main">��ҳFlash</a> | <a href="ADFlash/Zhuna_ADFlash.asp?Action=Add" target="main">���</a></li>
  </ul>
  <h4>վ������</h4>
  <ul>
  	<li><a href="update/Zhuna_update.asp" target="main">��վ����</a></li>
    <li><a href="Config/Zhuna_Config.asp" target="main">��վ����</a></li>
    <li><a href="Manage/Zhuna_Manage.asp" target="main">����Ա����</a> | <a href="Manage/Zhuna_Manage.asp?Action=Add" target="main">���</a></li>
    <li><a href="Zhuna_login.asp?action=login_out" target="_top">�˳�ϵͳ</a></li>
  </ul>
  
</div>
</body>
</html>