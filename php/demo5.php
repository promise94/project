<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>判断奇偶</title>
</head>
<body>
<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2017/3/7 0007
 * Time: 21:39
 */
if (isset($_POST['button'])) {
    $num = $_POST['num'];
    if (is_numeric($num)) {
        $num+=0;
        if (is_int($num)) {
    if ($num%2 == 0){
    echo "{$num}是偶数！";
            }else {
                echo "{$num}是奇数！";
            }
        }else {
            echo "{$num}不是整数";
        }
    }else {
        echo "{$num}不是数字";
    }
}
?>
<form action="" method="post" name="form1">
    <table>
        <tr>
            <td colspan="2">请输入一个数</td>
        </tr>
        <tr>
            <td>请输入一个数</td>
            <td><input type="text" name="num" id="num"></td>
        </tr>
        <tr>
            <td colspan="2"><input name="button" type="submit" value="提交"></td>
        </tr>
    </table>
</form>
</body>
</html>
