<?php require_once(dirname(__FILE__).'/include/config.inc.php'); 
$cid = empty($cid) ? 23 : intval($cid);
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
 <?php echo GetHeader(1,$cid); ?>
<meta name="author" content="order by dede58.com"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/shake.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico"/>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
<link href="css/ie8.css" rel="stylesheet">
<![endif]-->
<!--[if lte IE 6]>
<meta http-equiv="refresh" content="0;url=/no-ie6.html" />
<![endif]-->
<!--[if lte IE 7]>
<meta http-equiv="refresh" content="0;url=/no-ie6.html" />
<![endif]-->
</head>
<body>
 <div id="dangqian" style="display:none">about</div>
<!-- header-->
<?php require('header.php'); ?>
<!-- /header-->
<div class="banner text-center">
 <?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=11");
		while($row = $dosql->GetArray())
		{
		?>
<div class="box hba" style="background-image:url(<?php echo $row['picurl']; ?>)"> </div>
 				<?php
		}
		?>
</div>

<div class="crumbs">
<div class="container">
<div class="btn-group pull-right hidden-xs">
<button type="button" class="btn btn-menu btn-default dropdown-toggle" data-toggle="dropdown">更多菜单 Menu <span class="caret"></span></button>
<ul class="dropdown-menu" role="menu">
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=17 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="about.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?>  
</ul>
</div>
<ol class="breadcrumb">
<li><?php echo GetPosStr($cid); ?></li>
</ol>
</div>
</div>

<div class="neirong"> <article class="container">
<div class="text-center">
<h3 class="h3">
<?php echo GetCatName($cid); ?></h3>
</div>
<hr class="m-sx-50">

<p>
<?php echo Info($cid); ?></p>

<hr class="m-sx-50">
</article>
</div>

<div class="kj-link text-center">
<article class="container">
<div class="row">
<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=8");
		while($row = $dosql->GetArray())
		{
		?>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<h3><?php echo $row['title1']; ?></h3>
<p><?php echo $row['content']; ?></p>
<p><a href="<?php echo $row['linkurl']; ?>">立即前往 Now Go →</a> </p>
</div>
 <?php
			}
			?>
			<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=9");
		while($row = $dosql->GetArray())
		{
		?>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<h3><?php echo $row['title1']; ?></h3>
<p><?php echo $row['content']; ?></p>
<p><a href="<?php echo $row['linkurl']; ?>">立即前往 Now Go →</a> </p>
</div>
 <?php
			}
			?>
</div>
</article>
</div>
 
<?php require('footer.php'); ?>
 
</body>
</html>
