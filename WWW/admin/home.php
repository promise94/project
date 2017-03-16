<?php	require_once(dirname(__FILE__).'/inc/config.inc.php'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台首页</title>
<link href="templates/style/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="templates/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//控制便签
	$("#homeNote").focus(function(){
		$(".notearea").addClass("borderOn");
		if($.trim($(this).val()) == "点击输入便签内容..."){
			$(this).val("");
		}
	}).blur(function(){
		$(".notearea").removeClass("borderOn");
		if($.trim($(this).val()) == ""){
			$.ajax({
				url : "ajax_do.php",
				type:'post',
				data:{"action":"deladminnotes"},
				dataType:'html',
				success:function(data){	
				}
			});
			$(this).val("点击输入便签内容...");
		}else{
			$.ajax({
				url : "ajax_do.php",
				type:'post',
				data:{"action":"adminnotes", "body":$.trim($(this).val())},
				dataType:'html',
				success:function(data){
				}
			});
		}
	});

	$("#showad").html('<iframe src="showad.php" width="100%" height="25" scrolling="no" frameborder="0" allowtransparency="true"></iframe>');
});
</script>
</head>
<body>
<div class="homeCont">
	<div class="leftArea">
		<div class="site">
			<h2 class="title">系统</h2>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="33" colspan="2">软件版本号： <span title="<?php echo $cfg_vertime; ?>"><?php echo $cfg_vernum; ?></span></td>
				</tr>
				<tr>
					<td width="50%" height="33">服务器版本： <span title="<?php echo $_SERVER['SERVER_SOFTWARE']; ?>"><?php echo ReStrLen($_SERVER['SERVER_SOFTWARE'],7,''); ?></span></td>
					<td width="50%">操作系统： <?php echo PHP_OS; ?></td>
				</tr>
				<tr>
					<td height="33">PHP版本号： <?php echo PHP_VERSION; ?></td>
					<td>GDLibrary： <?php echo ShowResult(function_exists('imageline')); ?></td>
				</tr>
				<tr>
					<td height="33">MySql版本： <?php echo $dosql->GetVersion(); ?></td>
					<td height="28">ZEND支持： <?php echo ShowResult(function_exists('zend_version')); ?></td>
				</tr>
				<tr class="nb">
					<td height="33" colspan="2">支持上传的最大文件：<?php echo ini_get('upload_max_filesize'); ?></td>
				</tr>
			</table>
		</div>
	</div>
	 </div>
<?php
function ShowResult($revalue)
{
	if($revalue == 1)
		return '<span class="ture">支持</span>';
	else
		return '<span class="flase">不支持</span>';
}
?>
</body>
</html>