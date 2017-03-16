<?php require_once(dirname(__FILE__).'/include/config.inc.php'); 
$cid = empty($cid) ? 22 : intval($cid);
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
 <div id="dangqian" style="display:none">fw</div>
<!-- header-->
<?php require('header.php'); ?>
<!-- /header-->
<div class="banner text-center">
<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=12");
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
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=22 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="fw.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?> 
</ul>
</div>
<ol class="breadcrumb">
<li><?php echo GetPosStr($cid); ?></li>
</ol>
</div>
</div>

<div class="neirong"> <article class="container info">
<h3 class="h-h2" style="text-align:center;">
<?php echo GetCatName($cid); ?></h3>
<?php
			$sql = "SELECT * FROM `#@__infoimg` WHERE (classid=$cid OR parentstr LIKE '%,$cid,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC";
		    $dopage->GetPage($sql,10);
			
				while($row = $dosql->GetArray())
				{
				$clid=$row['classid'];
			if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'caseshow.php?cid='.$row['classid'].'&id='.$row['id'];
					else if($cfg_isreurl=='Y') $gourl = 'caseshow-'.$row['classid'].'-'.$row['id'].'-1.html';
					else $gourl = $row['linkurl'];
			?>   
<hr class="m-sx-40">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-3 col-lg-2 visible-lg visible-md">
<p class="m-s-10">
<a href="<?php echo $gourl; ?>"><img alt="<?php echo $row['title']; ?>" src="<?php echo $row['picurl']; ?>" style="border-width: 0px; border-style: solid; width: 160px; height: 160px;" title="<?php echo $row['title']; ?>"></a></p>
</div>
<div class="col-xs-12 col-sm-12 col-md-9 col-lg-10">
<a href="<?php echo $gourl; ?>"><h3>
<?php echo $row['title']; ?></h3></a>
<p>
<?php echo ReStrLen($row['description'],50); ?></p>
</div>
</div>
<?php
			}
			?>
<?php echo Info($cid); ?>
<hr class="m-sx-40">
<p style="text-align:center;">
<a class="btn btn-success x-m-none" href="contact.php" target="_blank">我们已经准备好了，现在就联系我们！</a></p>
<p align="center" class="pageLink">&nbsp;
</p>
<div class="content_page">
&nbsp;</div>
</article>
</div>
 
<?php require('footer.php'); ?>
 
</body>
</html>
