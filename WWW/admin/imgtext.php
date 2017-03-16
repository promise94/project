<?php require_once(dirname(__FILE__).'/inc/config.inc.php');IsModelPriv('message'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图文替换管理</title>
<link href="templates/style/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="templates/js/jquery.min.js"></script>
<script type="text/javascript" src="templates/js/forms.func.js"></script>
</head>
<body>
<div class="topToolbar"> <span class="title">图文替换管理</span> <a href="javascript:location.reload();" class="reload">刷新</a></div>
<form name="form" id="form" method="post" action="message_save.php">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="dataTable">
		<tr align="left" class="head">
			<td width="5%" height="36" class="firstCol">id</td>
			<td width="20%">位置说明</td>
			<td width="20%">缩略图</td>
			<td width="10%">跳转链接</td>
			<td width="30%">内容</td>
			<td width="15%" class="endCol">操作</td>
		</tr>
		<?php

		$sql="SELECT * FROM `#@__imgtext`";
		$dopage->GetPage($sql,100);
		while($row = $dosql->GetArray())
		{
		?>
		<tr align="left" class="dataTr">
			<td height="36" class="firstCol"><?php echo $row['id']; ?></td>
			<td><?php echo $row['title']; ?></td>
			<td><?php if($row['picurl']){ ?><img src="../<?php echo $row['picurl']; ?>" width="100" height="50"><?php } ?></td>
			<td><?php echo $row['linkurl']; ?></td>
			<td><?php echo $row['content']; ?></td>
			<td class="action endCol"><span></span> | <span><a href="imgtext_update.php?id=<?php echo $row['id']; ?>">修改</a></span> | <span class="nb" style="display:none" ><a href="imgtext_save.php?ac=del&id=<?php echo $row['id']; ?>" onclick="return ConfDel(0);">删除</a></span></td>
		</tr>
		<?php
		}
		?>
	</table>
</form>
<?php

//判断无记录样式
if($dosql->GetTotalRow() == 0)
{
	echo '<div class="dataEmpty">暂时没有相关的记录</div>';
}
?>
<div class="bottomToolbar" style="display:none" > <a href="imgtext_add.php" class="dataBtn">添加新留言</a> </div>
<div class="page"> <?php echo $dopage->GetList(); ?> </div>

</body>
</html>