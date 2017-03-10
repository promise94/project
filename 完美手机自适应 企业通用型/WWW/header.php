<header data-headroom id="header" class="navbar navbar-default navbar-fixed-top" role="navigation">
<div class="container">
 
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
 
<h1 class="logo"><a class="navbar-brand" href="index.php">
<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=1");
		while($row = $dosql->GetArray())
		{
		?>
<img src="<?php echo $row['picurl']; ?>" alt="logo" title="<?php echo $row['picurl']; ?>" class="ylw-img-responsive logo-hidden"/><img src="<?php echo $row['picurl']; ?>" alt="logo" title="logo" class="ylw-img-responsive logo-visible"/>

</a><small class="pull-left"><a href="index.php" class="visible-lg"><?php echo $row['title1']; ?></a></small></h1>
 				<?php
		}
		?>
		<?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=17");
		while($row = $dosql->GetArray())
		{
		?>
<ul class="list-unstyled head-lx">
<li><?php echo $row['title1']; ?><br/>
<small><?php echo $row['title2']; ?></small></li>
<li><?php echo $row['title3']; ?><br/>
<small>C<?php echo $row['content']; ?></small></li>
<li class="tel">全国服务：<?php echo $cfg_hotline; ?> / <?php echo $cfg_phone; ?></li>
<li class="oc">在线咨询： <a href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo $cfg_kfqq; ?>&site=qq&menu=yes" target="_blank"><img src="img/head-qq.png" alt="QQ咨询"></a></li>
</ul>
 				<?php
		}
		?>
</div>
 
 
<nav class="collapse navbar-right navbar-collapse" role="navigation">
<ul class="nav navbar-nav" id="nav">
<li class="dropdown " id="1"><a class="dropdown-toggle" href="index.php">网站首页<small>Home</small></a></li>
<li class="dropdown " id="2"><a class="dropdown-toggle" data-toggle="dropdown" href="about.php"><?php echo GetCatName(17); ?><small>ABOUT</small></a>
<ul class="dropdown-menu dropdown-menu-left">
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=17 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="about.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?>  
</ul>
</li>
<li class="dropdown " id="3"><a class="dropdown-toggle" data-toggle="dropdown" href="fw.php"><?php echo GetCatName(22); ?><small>Service</small></a>
<ul class="dropdown-menu dropdown-menu-left">
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=22 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="fw.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?> 
</ul>
</li>
<li class="dropdown " id="4"><a class="dropdown-toggle" data-toggle="dropdown" href="case.php"><?php echo GetCatName(1); ?><small>Cases</small></a>
<ul class="dropdown-menu dropdown-menu-left">
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=1 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="case.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?> 
</ul>
</li>
<li class="dropdown " id="5"><a class="dropdown-toggle" data-toggle="dropdown" href="news.php"><?php echo GetCatName(2); ?><small>News</small></a>
<ul class="dropdown-menu dropdown-menu-left">
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=2 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="news.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?> 
</ul>
</li><li class="dropdown " id="6"><a class="dropdown-toggle" data-toggle="dropdown" href="contact.php"><?php echo GetCatName(39); ?><small>Contact</small></a>
<ul class="dropdown-menu dropdown-menu-left">
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=39 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="contact.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?> 
</ul>
</li>
</ul>
</nav>
 
</div>
</header>
 