<?php require_once(dirname(__FILE__).'/include/config.inc.php'); ?>
<?php
//留言内容处理
if(isset($action) and $action=='add')
{


	$r = $dosql->GetOne("SELECT Max(orderid) AS orderid FROM `#@__message`");
	$orderid  = (empty($r['orderid']) ? 1 : ($r['orderid'] + 1));
	$name = htmlspecialchars($username);
	$phone  = "";
	$email  = htmlspecialchars($email);
	$comments  = "";
	$posttime = GetMkTime(time());
	$ip       = gethostbyname($_SERVER['REMOTE_ADDR']);


	$sql = "INSERT INTO `#@__message` (siteid, nickname, contact, content, orderid, posttime, htop, rtop, checkinfo, ip) VALUES (1, '$name', '$email', '$comments', '$orderid', '$posttime', '', '', 'false', '$ip')";
	if($dosql->ExecNoneQuery($sql))
	{
		ShowMsg('留言成功，感谢您的宝贵意见！','index.php');
		exit();
	}
}

?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
   <?php echo GetHeader(); ?>
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
 <div id="dangqian" style="display:none">index</div>
<!-- header-->
<?php require('header.php'); ?>
<!-- /header-->
 
<div class="banner text-center">
<div class="slider">
<ul class="slides">
 <?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE (id=2 or id=3 or id=4 or id=5)");
		while($row = $dosql->GetArray())
		{
		?>
<li class="slide">
<div class="box" style="background-image:url(<?php echo $row['picurl']; ?>)"><a href="<?php echo $row['linkurl']; ?>"><img src="img/2014101479790393.png" class="ylw-img-responsive" alt="<?php echo $row['title']; ?>" title="<?php echo $row['title']; ?>"/></a></div>
</li>
<?php } ?> 
</ul>
</div>
</div>
 
 <?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=6");
		while($row = $dosql->GetArray())
		{
		?>
<div class="about">
<article class="container text-center">
<h2 class="h-h2"><?php echo $row['title1']; ?></h2>
<div class="m-shu"><?php echo $row['title2']; ?></div>
<div class="about-us"> <p><?php echo $row['content']; ?></p></strong> </div>
<p><a href="<?php echo $row['linkurl']; ?>" class="btn btn-success" target="_blank">查看更多 MORE &rarr;</a> </p>
</article>
</div>
 <?php
			}
			?>
			<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=18");
		while($row = $dosql->GetArray())
		{
		?>
 <style>
 .fuwu-bg {
	background-image: url(<?php echo $row['picurl']; ?>)
}
 </style>
<div class="fuwu fuwu-bg">
<section class="container text-center">
<h2 class="h-h2"><?php echo $row['title1']; ?></h2>
<div class="m-shu"><?php echo $row['title2']; ?></div>
 <?php
			}
			?>
<div class="row">
<?php
			$sql = "SELECT * FROM `#@__infoimg` WHERE (classid=22 OR parentstr LIKE '%,22,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC";
		    $dopage->GetPage($sql,4);
			
				while($row = $dosql->GetArray())
				{
				$clid=$row['classid'];
			if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'caseshow.php?cid='.$row['classid'].'&id='.$row['id'];
					else if($cfg_isreurl=='Y') $gourl = 'caseshow-'.$row['classid'].'-'.$row['id'].'-1.html';
					else $gourl = $row['linkurl'];
			?>  
<figure class="col-xs-12 col-sm-6 col-md-3 col-lg-3"><a href="<?php echo $gourl; ?>" class="pic1"><img src="<?php echo $row['picurl']; ?>"></a>
<h3><a href="<?php echo $gourl; ?>"><?php echo $row['title']; ?>
</a></h3>
<p><?php echo ReStrLen($row['description'],30); ?></p>
</figure>
<?php
			}
			?>
</div>
</section>
</div>
 
  <?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=10");
		while($row = $dosql->GetArray())
		{
		?>
<div class="huanjing">
<section class="container text-center">
<h2 class="h-h2"><?php echo $row['title1']; ?></h2>
<div class="m-shu"><?php echo $row['title2']; ?></div>
<div class="tab-content">
<figure class="fudong-bg tab-pane fade in active" id="huanjing1"> <img src="<?php echo $row['picurl']; ?>" alt="<?php echo $row['title3']; ?>" title="<?php echo $row['title3']; ?>" class="ylw-img-responsive"/>
<div class="fudong">
<h3><?php echo $row['title3']; ?></h3>
<p><?php echo $row['content']; ?></p>
<p><a href="<?php echo $row['linkurl']; ?>" class="btn btn-success" target="_blank">查看详情 MORE &rarr;</a></p>
</div>
</figure>

</div>

</section>
</div>
 				<?php
		}
		?>
 
<div class="kehu kehu-bg">
<section class="container text-center">
 <?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=19");
		while($row = $dosql->GetArray())
		{
		?>
<h2 class="h-h2"><?php echo $row['title1']; ?></h2>
<div class="m-shu"><?php echo $row['title2']; ?></div>
 				<?php
		}
		?>
<div class="row xg">
<?php
			$sql = "SELECT * FROM `#@__infoimg` WHERE (classid=41 OR parentstr LIKE '%,41,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC";
		    $dopage->GetPage($sql,10);
				while($row = $dosql->GetArray())
				{
				$clid=$row['classid'];
			if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'caseshow.php?cid='.$row['classid'].'&id='.$row['id'];
					else if($cfg_isreurl=='Y') $gourl = 'caseshow-'.$row['classid'].'-'.$row['id'].'-1.html';
					else $gourl = $row['linkurl'];
			?>   
<figure class="col-xs-6 col-sm-4 col-md-3 col-lg-20"><a href="<?php echo $gourl; ?>" target="_blank" title="<?php echo $row['title']; ?>"><img src="<?php echo $row['picurl']; ?>" class="ylw-img-responsive" alt="<?php echo $row['title']; ?>"/>
<p><?php echo $row['title']; ?></p>
</a></figure>
<?php
			}
			?>
</div>
</section>
</div>
 
 
<div class="case">
<section class="container text-center">
<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=20");
		while($row = $dosql->GetArray())
		{
		?>
<h2 class="h-h2"><?php echo $row['title1']; ?></h2>
<div class="m-shu"><?php echo $row['title2']; ?>
<?php
			}
			?>
<p> <?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=1 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<a href="case.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a>/
<?php } ?>
<a href="case.php">查看更多>></a> </p>
</div>
<div class="row"> 
<?php
			$sql = "SELECT * FROM `#@__infoimg` WHERE (classid=1 OR parentstr LIKE '%,1,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC";
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
<p><a href="case.php" class="btn btn-success" target="_blank">查看更多 MORE &rarr;</a> </p>
</section>
</div>
 
 
 
 
<div class="youshi">
<section class="container text-center">
<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=21");
		while($row = $dosql->GetArray())
		{
		?>
<h2 class="h-h2"><?php echo $row['title1']; ?></h2>
<div class="m-shu"><?php echo $row['title2']; ?></div>
<?php
			}
			?>
<div class="row">
<?php
			$sql = "SELECT * FROM `#@__infoimg` WHERE (classid=42 OR parentstr LIKE '%,42,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC";
		    $dopage->GetPage($sql,10);
				while($row = $dosql->GetArray())
				{
				$clid=$row['classid'];
			if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'caseshow.php?cid='.$row['classid'].'&id='.$row['id'];
					else if($cfg_isreurl=='Y') $gourl = 'caseshow-'.$row['classid'].'-'.$row['id'].'-1.html';
					else $gourl = $row['linkurl'];
			?>  
<figure class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><img src="<?php echo $row['picurl']; ?>" class="ylw-img-responsive" alt="<?php echo $row['title']; ?>">
<h3><a href="<?php echo $gourl; ?>" target="_blank"><?php echo $row['title']; ?></a></h3>
<p><a href="<?php echo $gourl; ?>" target="_blank"><?php echo $row['title']; ?></a><small><?php echo ReStrLen($row['description'],15); ?></small></p>
</figure>
<?php
			}
			?>
</div>
<p><a href="about.php?cid=32" class="btn btn-success" target="_blank">查看更多 MORE &rarr;</a><a href="about.php?cid=23" class="btn btn-success" target="_blank">关于我们 About &rarr;</a></p>
</section>
</div>
 
 
<div class="news">
<article class="container">
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-3 col-lg-13">
<h3><?php echo GetCatName(2); ?> News</h3>
<div class="tab-content">
<ul class="list-unstyled clearfix tab-pane active" id="news1">
<?php

				$dopage->GetPage("SELECT * FROM `#@__infolist` WHERE (classid=2 OR parentstr LIKE '%,2,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC",5);
				while($row = $dosql->GetArray())
				{
	if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'show.php?cid='.$row['classid'].'&id='.$row['id'];
	else if($cfg_isreurl=='Y') $gourl = 'show-'.$row['classid'].'-'.$row['id'].'-1.html';
	else $gourl = $row['linkurl'];
?> 	
<li><a href="<?php echo $gourl; ?>" title="<?php echo $row['title']; ?>" target="_blank"><?php echo $row['title']; ?></a><small class="pull-right"><?php echo GetDateMk($row['posttime']); ?></small></li>
<?php } ?>
</ul>

</div>
<p><a href="news.php">查看更多 MORE &rarr;</a> </p>
</div>
<div class="col-xs-12 col-sm-6 col-md-3 col-lg-13 zaz">
<h3><?php echo GetCatName(20); ?> Article</h3>
<div class="tab-content">
<ul class="list-unstyled clearfix tab-pane active" id="article1">
<?php

				$dopage->GetPage("SELECT * FROM `#@__infolist` WHERE (classid=20 OR parentstr LIKE '%,20,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC",5);
				while($row = $dosql->GetArray())
				{
	if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'show.php?cid='.$row['classid'].'&id='.$row['id'];
	else if($cfg_isreurl=='Y') $gourl = 'show-'.$row['classid'].'-'.$row['id'].'-1.html';
	else $gourl = $row['linkurl'];
?> 	
<li><a href="<?php echo $gourl; ?>" title="<?php echo $row['title']; ?>" target="_blank"><?php echo $row['title']; ?></a><small class="pull-right"><?php echo GetDateMk($row['posttime']); ?></small></li>
<?php } ?>
</ul>
</div>
<p><a href="news.php?cid=20">查看更多 MORE &rarr;</a></p>
</div>
<div class="col-xs-12 col-sm-6 col-md-3 col-lg-13" style="float:right">
<h3><?php echo GetCatName(21); ?> Article<small class="pull-right"><a href="/xinwenzixun/meitibaodao/" title="媒体报道"> 更多</a></small></h3>
<div class="tab-content">
<ul class="list-unstyled clearfix tab-pane active" id="links1">
<?php

				$dopage->GetPage("SELECT * FROM `#@__infolist` WHERE (classid=21 OR parentstr LIKE '%,21,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC",5);
				while($row = $dosql->GetArray())
				{
	if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'show.php?cid='.$row['classid'].'&id='.$row['id'];
	else if($cfg_isreurl=='Y') $gourl = 'show-'.$row['classid'].'-'.$row['id'].'-1.html';
	else $gourl = $row['linkurl'];
?> 	
<li><a href="<?php echo $gourl; ?>" title="<?php echo $row['title']; ?>" target="_blank"><?php echo $row['title']; ?></a><small class="pull-right"><?php echo GetDateMk($row['posttime']); ?></small></li>
<?php } ?>
</ul>
</div>
<p><a href="news.php?cid=21">查看更多 MORE &rarr;</a></p>
</div>
</div>
</article>
</div>
 
<?php require('footer.php'); ?>
 
</body>
</html>
