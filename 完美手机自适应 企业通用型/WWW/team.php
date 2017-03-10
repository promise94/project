<?php require_once(dirname(__FILE__).'/include/config.inc.php'); 
$cid = empty($cid) ? 34 : intval($cid);
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
 
<!-- header-->
<?php require('header.php'); ?>
<!-- /header-->
<div class="banner text-center">
<div class="box hba" style="background-image:url(img/1.jpg)"> </div>
</div>

<div class="crumbs">
<div class="container">
<div class="btn-group pull-right hidden-xs">
<button type="button" class="btn btn-menu btn-default dropdown-toggle" data-toggle="dropdown">更多菜单 Menu <span class="caret"></span></button>
<ul class="dropdown-menu" role="menu">
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=34 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="team.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
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
<div class="team">
<section class="text-center">
<div class="row"> 
<?php
			$sql = "SELECT * FROM `#@__infoimg` WHERE (classid=$cid OR parentstr LIKE '%,$cid,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC";
		    $dopage->GetPage($sql,8);
				while($row = $dosql->GetArray())
				{
				$clid=$row['classid'];
			if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'caseshow.php?cid='.$row['classid'].'&id='.$row['id'];
					else if($cfg_isreurl=='Y') $gourl = 'caseshow-'.$row['classid'].'-'.$row['id'].'-1.html';
					else $gourl = $row['linkurl'];
			?>  
<figure class="col-xs-12 col-sm-6 col-md-3 col-lg-3"><a href="<?php echo $gourl; ?>" title="<?php echo $row['title']; ?>" target="_blank" class="pic-link"><span class="hover-jia"></span><img src="<?php echo $row['picurl']; ?>" class="img-circle ylw-img-responsive" alt="<?php echo $row['title']; ?>"></a>
<h3><a href="<?php echo $gourl; ?>"><?php echo $row['title']; ?></a><br>
<small><?php echo ReStrLen($row['description'],20); ?></small></h3>
</figure>
<?php
			}
			?>
</div>
</section>
</div>
</article>
<div class="fanye text-center">
<ul class="pagination pagination-lg">
<?php echo $dopage->GetList(); ?>
</ul>
</div>
</div>
 
<?php require('footer.php'); ?>
 
</body>
</html>
