<?php require_once(dirname(__FILE__).'/inc/config.inc.php'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧菜单</title>
<link href="templates/style/menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="templates/js/jquery.min.js"></script>
<script type="text/javascript" src="templates/js/tinyscrollbar.js"></script>
<script type="text/javascript" src="templates/js/leftmenu.js"></script>
</head>
<body>
<div class="quickbtn"> <span class="quickbtn_left"><a href="infolist_add.php" target="main">添加新闻</a></span> <span class="quickbtn_right"><a href="infoimg_add.php" target="main">添加案例</a></span> </div>

<div class="tGradient"></div>
<div id="scrollmenu">
	<div class="scrollbar">
		<div class="track">
			<div class="thumb">
				<div class="end"></div>
			</div>
		</div>
	</div>
	<div class="viewport">
		<div class="overview"> 
			<!--scrollbar start-->
			<div class="menubox">
				<div class="title on" id="t1" onclick="DisplayMenu('leftmenu01');" title="点击切换显示或隐藏"> 网站系统管理 </div>
				<div id="leftmenu01"> 
				<a href="web_config.php" target="main">网站信息配置</a> 
				<a href="admin.php" target="main">管理员管理</a> 
				<a href="database_backup.php" target="main">数据库管理</a> 
				<a href="upload_filemgr_sql.php" target="main">上传文件管理</a>	
				<a href="infoclass.php" target="main">信息栏目管理</a> 
				<a href="info.php" target="main">单页信息管理</a>
				<a href="infolist.php" target="main">新闻资讯管理</a>
				<a href="infoimg.php" target="main">产品案例管理</a>
				<a href="weblink.php" target="main">友情链接管理</a>
				<a href="message.php" target="main">在线预约管理</a>
				<a href="imgtext.php" target="main">图文替换管理</a> 
				 </div>
			</div>
			<!--scrollbar end--> 
		</div>
	</div>
</div>
<div class="bGradient"></div>

<div class="copyright"> <a href="h/" target="_blank"></a><br />
	 </div>
</body>
</html>