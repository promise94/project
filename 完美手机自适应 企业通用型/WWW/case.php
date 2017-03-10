<?php require_once(dirname(__FILE__).'/include/config.inc.php'); 
$cid = empty($cid) ? 1 : intval($cid);
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
 <div id="dangqian" style="display:none">case</div>
<!-- header-->
<?php require('header.php'); ?>
<!-- /header-->
<div class="banner text-center">
<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=13");
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
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=1 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="case.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?> 
</ul>
</div>
<ol class="breadcrumb">
<li><?php echo GetPosStr($cid); ?></li>
</ol>
</div>
</div>

<div class="neirong">
<article class="container">
<div class="biaoti-sousuo row">
<div class="col-xs-12 col-sm-7 col-md-8 col-lg-9">
<h3 class="ny-bt"><?php echo GetCatName($cid); ?></h3>
</div>

</div>
<div class="case-fl">
<p><strong>行业分类：</strong> <?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=1 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<a href="case.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a>/
<?php } ?> 
</p>
</div>
<div class="tj-case row"> </div>
<div class="case">
<section class="text-center">
<div class="row"> 
<?php
			$sql = "SELECT * FROM `#@__infoimg` WHERE (classid=$cid OR parentstr LIKE '%,$cid,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC";
		    $dopage->GetPage($sql,6);
				while($row = $dosql->GetArray())
				{
				$clid=$row['classid'];
			if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'caseshow.php?cid='.$row['classid'].'&id='.$row['id'];
					else if($cfg_isreurl=='Y') $gourl = 'caseshow-'.$row['classid'].'-'.$row['id'].'-1.html';
					else $gourl = $row['linkurl'];
			?>   
<figure class="col-xs-12 col-sm-6 col-md-4 col-lg-4"><a href="<?php echo $gourl; ?>" title="<?php echo $row['title']; ?>" target="_blank" class="pic-link"><span class="case-hover"><span class="hover-link"></span></span><img src="<?php echo $row['picurl']; ?>" class="ylw-img-responsive3" alt="<?php echo $row['title']; ?>"></a>
<?php $row2 = $dosql->GetOne("SELECT * FROM `#@__infoclass` WHERE id=$clid"); ?>
<h3><a href="<?php echo $gourl; ?>" title="<?php echo $row['title']; ?>" target="_blank"><?php echo $row['title']; ?></a><br>
<small><?php echo GetDateMk($row['posttime']); ?> / 目录：<a href="<?php echo $gourl; ?>"><?php echo $row2['classname']; ?></a></small></h3>
</figure>
<?php
			}
			?>
</div>
</section>
</div>
<div class="fanye text-center">
<ul class="pagination pagination-lg">
<li><a href="index.php">首页</a></li>
<?php echo $dopage->GetList(); ?>
</ul>
</div>
</article>
</div>
 
<?php require('footer.php'); ?>
 
</body>
</html>
