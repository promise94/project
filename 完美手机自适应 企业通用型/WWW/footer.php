 
<div class="kj-contact text-center hidden-xs">
<h4 class="h4"><a href="contact.php" target="_blank">现在致电 <?php echo $cfg_hotline; ?> OR 查看更多联系方式 &rarr;</a> </h4>
</div>
 
<div class="kj-contact text-center visible-xs">
<h4 class="h4"><a href="contact.php" rel="nofollow">现在致电 <?php echo $cfg_hotline; ?> OR 查看更多联系方式 &rarr;</a></h4>
</div>
 
 
<div class="footer" id="yy">
 
<footer class="container">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
<h3>快速预约上门 Reservation</h3>
<form action="index.php">
<ul class="list-unstyled">
<li>
<input name="username" type="text" id="mycall" placeholder="您的尊称 Name" required="required" maxlength="10">
</li>
<li>
<input name="email" type="text" id="title" placeholder="您的电话 Phone" required="required phone" maxlength="11">
</li>
<li>
<input name="button" type="submit" id="button" value="立即提交 Submit →">
</li>
</ul>
<input type="hidden" name="action" id="action" value="add" />
</form>
</div>
<div class="col-xs-12 col-sm-6 col-md-5 col-lg-6 z15">
<h3>联系我们 Contact US</h3>
<address class="address">
<ul class="list-unstyled">
<li><?php echo $cfg_dizhi; ?></li>
<li><?php echo $cfg_hotline; ?></li>
<li><?php echo $cfg_phone; ?> 24 Hours 服务</li>
<li><?php echo $cfg_email; ?></li>
</ul>
</address>
</div>
<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
<h3>快捷入口 Quick Entry</h3>
<div class="row cidaohang">
<div class="col-xs-3 col-sm-3 col-md-3 col-lg-4">
<ul class="list-unstyled">
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=17 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="about.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?>  
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=22 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="fw.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?> 
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=39 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="contact.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?>
</ul>
</div>
<div class="col-xs-3 col-sm-3 col-md-3 col-lg-4">
<ul class="list-unstyled">
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=1 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="case.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?> 
<?php 
	$dosql->Execute("SELECT * FROM `#@__infoclass` WHERE parentid=2 ORDER BY orderid ASC");
	while($row = $dosql->GetArray())
	{
		$classname = $row['classname'];
			 ?>
<li><a href="news.php?cid=<?php echo $row['id']?>"><?php echo  $classname?></a></li>
<?php } ?> 

</ul>
</div>
<div class="col-xs-6 col-sm-6 col-md-6 col-lg-4 weixin">  <?php

		$dopage->GetPage("SELECT * FROM `pmw_imgtext` WHERE id=7");
		while($row = $dosql->GetArray())
		{
		?><?php
		}
		?>	
</div>
</div>
</div>
</div>
 
 
<div class="copy">
<hr/>
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-8 col-lg-8">

<p><strong>友情链接：</strong>
<?php
	$dosql->Execute("SELECT * FROM `#@__weblink` WHERE classid=1 AND checkinfo=true ORDER BY orderid,id DESC");
	while($row = $dosql->GetArray())
	{
	?>
                      	<a target="_blank" href="<?php echo $row['linkurl']; ?>"><?php echo $row['webname']; ?></a>	<?php
	}
	?>              
  
</div>
<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 pull-right hidden-xs">
<div class="qixia">
<p class="banquan"></p>
</div>
</div>
</div>
</div>
 
</footer>
</div>
 
 
<div class="go-top text-center" id="di"><a href="#top" rel="nofollow"><?php echo $cfg_copyright; ?></a></div>
 
 
<script src="js/jquery.min.js"></script>
 
<script src="js/bootstrap.min.js"></script>
 
<script src="js/headroom.min.js"></script>
<script src="js/jquery.headroom.js"></script>
<script>$("#header").headroom();</script>
 
 
<script src="js/jquery.glide.min.js"></script>
<script src="js/jquery.glide.admin.js"></script>
 
 
<script src="js/jpuery.team.scroll.js"></script>
 
 
<div class="kefu hidden-xs">
<div><a href="contact.php" class="kefu-lx" title="联系我们" target="_blank">联系我们</a> </div>
<ul class="list-unstyled">
<li><a href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo $cfg_kfqq; ?>&site=qq&menu=yes" target="_blank" class="kf" rel="nofollow">在线客服</a></li>
<li><a href="#yy" class="kefu-yy" title="快速预约设计" rel="nofollow">快速预约</a></li>
<li><a href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo $cfg_kfqq; ?>&site=qq&menu=yes" title="网页在线咨询" target="_blank" class="kefu-zx" rel="nofollow">在线咨询</a></li>
<li><a href="#top" class="kefu-top" title="回网页顶部" rel="nofollow"></a></li>
<li><a href="#di" class="kefu-di" title="回网页底部" rel="nofollow"></a></li>
</ul>
</div>
<script>
var dangqian=document.getElementById("dangqian").innerText;//取div中的内容
    if(dangqian=="index"){
	  var parent=document.getElementById("1");
	  parent.className =parent.className +" active";
	  }  
	 else  if(dangqian=="about"){
	  var parent=document.getElementById("2");
	  parent.className =parent.className +" active";
	  } 
	   	 else  if(dangqian=="fw"){
	  var parent=document.getElementById("3");
	  parent.className =parent.className +" active";
	  } 
	  	 else  if(dangqian=="case"){
	  var parent=document.getElementById("4");
	  parent.className =parent.className +" active";
	  } 
	  	 else  if(dangqian=="news"){
	  var parent=document.getElementById("5");
	  parent.className =parent.className +" active";
	  } 
	  	 else  if(dangqian=="contact"){
	  var parent=document.getElementById("6");
	  parent.className =parent.className +" active";
	  } 
	  	
</script>
