<?php require_once(dirname(__FILE__).'/include/config.inc.php'); 
$cid = empty($cid) ? 1 : intval($cid);
$id  = empty($id)  ? 1 : intval($id);
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<?php echo GetHeader(1,$cid,$id); ?>
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
<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=16");
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

<ol class="breadcrumb">
<li><?php echo GetPosStr($cid); ?></li>
</ol>
</div>
</div>
<?php

			//检测文档正确性
			$r = $dosql->GetOne("SELECT * FROM `#@__infolist` WHERE id=$id");
			if(@$r)
			{
			//增加一次点击量
			$dosql->ExecNoneQuery("UPDATE `#@__infolist` SET hits=hits+1 WHERE id=$id");
			$row = $dosql->GetOne("SELECT * FROM `#@__infolist` WHERE id=$id");
			?>
<div class="neirong">
<article class="container">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
<article class="ny-shuoming text-center">
<h2><?php echo $row['title']; ?></h2>
<p>日期：<?php echo GetDateTime($row['posttime']); ?> / 人气：<?php echo $row['hits']; ?>
 </p>
</article>
<article class="info">
<div class="bd"> <div>
<?php
				if($row['content'] != '')
					echo GetContPage($row['content']);
				else
					echo '网站资料更新中...';
				?></div>
</div>
<p align="center" class="pageLink"></p>
<p class="text-right">作者：<?php echo $row['author']; ?></p>
</article>
<hr class="m-sx-40">
<div class="text-center">
 <?php

				//获取上一篇信息
				$r = $dosql->GetOne("SELECT * FROM `#@__infolist` WHERE classid=".$row['classid']." AND orderid<".$row['orderid']." AND delstate='' AND checkinfo=true ORDER BY orderid DESC");
				if($r < 1)
				{
					echo '<a class="btn btn-success mb-none m-x-20">上一篇：已经没有了</a>';
				}
				else
				{
					if($cfg_isreurl != 'Y')
						$gourl = 'show.php?cid='.$r['classid'].'&id='.$r['id'];
					else
						$gourl = 'show-'.$r['classid'].'-'.$r['id'].'-1.html';

					echo '<a class="btn btn-success mb-none m-x-20" href="'.$gourl.'">←上一篇'.$r['title'].'</a>';
				}
				
				//获取下一篇信息
				$r = $dosql->GetOne("SELECT * FROM `#@__infolist` WHERE classid=".$row['classid']." AND orderid>".$row['orderid']." AND delstate='' AND checkinfo=true ORDER BY orderid ASC");
				if($r < 1)
				{
					echo '<a class="btn btn-success mb-none m-x-20">下一篇：已经没有了</a>';
				}
				else
				{
					if($cfg_isreurl != 'Y')
						$gourl = 'show.php?cid='.$r['classid'].'&id='.$r['id'];
					else
						$gourl = 'show-'.$r['classid'].'-'.$r['id'].'-1.html';

					echo '<a class="btn btn-success mb-none m-x-20" href="'.$gourl.'">下一篇→'.$r['title'].'</a>';
				}
				?>

</div>
</div>
		<?php
		}
		?>	
<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
<div class="ny-right">

<div class="row">
<div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
<h4 class="ny-h4">新闻资讯 <small>News</small></h4>
<ul class="list-unstyled clearfix">
<?php
			$sql = "SELECT * FROM `#@__infolist` WHERE (classid=2 OR parentstr LIKE '%,2,%') AND delstate='' AND checkinfo=true ORDER BY orderid DESC";
		    $dopage->GetPage($sql,4);
				while($row = $dosql->GetArray())
				{
				$clid=$row['classid'];
			if($row['linkurl']=='' and $cfg_isreurl!='Y') $gourl = 'show.php?cid='.$row['classid'].'&id='.$row['id'];
					else if($cfg_isreurl=='Y') $gourl = 'show-'.$row['classid'].'-'.$row['id'].'-1.html';
					else $gourl = $row['linkurl'];
			?>  

<li><a href="<?php echo $gourl; ?>" title="<?php echo $row['title']; ?>"><?php echo ReStrLen($row['title'],15); ?></a><small class="pull-right"><?php echo MyDate('m', $row['posttime']); ?>-<?php echo MyDate('d', $row['posttime']); ?></small>
<?php } ?>

</li>
</ul>
</div>
<div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
<h4 class="ny-h4">案例展示 <small>Case</small></h4>
<ul class="list-unstyled clearfix">
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

<li><a href="<?php echo $gourl; ?>" title="<?php echo $row['title']; ?>"><?php echo ReStrLen($row['title'],15); ?></a><small class="pull-right"><?php echo MyDate('m', $row['posttime']); ?>-<?php echo MyDate('d', $row['posttime']); ?></small>
<?php } ?></ul>
</div>
</div>
</div>
</div>
</div>
</article>
</div>
 
<?php require('footer.php'); ?>
 
</body>
</html>
