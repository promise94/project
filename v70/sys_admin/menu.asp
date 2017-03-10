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
  <h4>资讯管理</h4>
  <ul>
    <li><a href="Article/Zhuna_Article.asp" target="main">资讯列表</a> | <a href="Article/Zhuna_Article.asp?Action=Add" target="main">添加</a></li>
    <li><a href="Article/Zhuna_Article_Class.asp" target="main">资讯类别</a> | <a href="Article/Zhuna_Article_Class.asp?action=add" target="main">添加</a></li>
  </ul>
<%End If%>
  <h4>辅助功能</h4>
  <ul>
    <li><a href="AD/Zhuna_AD.asp" target="main">广告管理</a> </li>
    <li><a href="Special/Zhuna_Special.asp" target="main">专题管理</a> </li>
    <li><a href="FriendLink/Zhuna_FriendLink.asp" target="main">友情链接</a> | <a href="FriendLink/Zhuna_FriendLink.asp?Action=Add" target="main">添加</a></li>
    <li><a href="ADFlash/Zhuna_ADFlash.asp" target="main">首页Flash</a> | <a href="ADFlash/Zhuna_ADFlash.asp?Action=Add" target="main">添加</a></li>
  </ul>
  <h4>站点设置</h4>
  <ul>
  	<li><a href="update/Zhuna_update.asp" target="main">网站更新</a></li>
    <li><a href="Config/Zhuna_Config.asp" target="main">网站设置</a></li>
    <li><a href="Manage/Zhuna_Manage.asp" target="main">管理员管理</a> | <a href="Manage/Zhuna_Manage.asp?Action=Add" target="main">添加</a></li>
    <li><a href="Zhuna_login.asp?action=login_out" target="_top">退出系统</a></li>
  </ul>
  
</div>
</body>
</html>