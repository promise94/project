<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="header">
  <div id="logo"><img src="images/logo.gif" /></div>
  <div id="header_r"><a href="Http://un.zhuna.cn" target="_blank">联盟首页</a> | <a href="main.asp" target="main">管理首页</a> | <a href="javascript:void(0);" onclick="return goto();" target="main">后台操作帮助</a> | <a href="Cache/Zhuna_Cache.asp" target="main">缓存清理</a> | <a href="Zhuna_login.asp?action=login_out" target="_top">退出登录</a></div>
</div>
</body>
</html>
<script>
function goto()
{
	var s=top.frames[2].location.href;
	var v=s.substring(0,s.indexOf(".asp"));
	var l=v.split("/");
	var a=l[l.length-1].replace('Zhuna_','');
	top.frames[2].location.href="网站后台操作说明.html#"+a.toLowerCase();
}
</script>