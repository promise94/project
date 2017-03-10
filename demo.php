<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PHP</title>
    <link rel="stylesheet" href="">
</head>
<body>
<!-- PHP执行原理：客户端向服务器请求，如果请求的是一个HTML页面，服务器直接将页面发送到客户端给浏览器解析 -->
<!-- 如果请求的是PHP页面，则服务器会运行PHP页面人后生成标准的HTML页面 -->

<?php
$a = 10;
$b = $a;
$a++;
unset($a);  //销毁的是变量名
echo var_dump($a);
echo "<hr>";
echo $b;

echo "<hr>";

$a = 10;
$b = &$a;
$a++;
unset($a);
echo $b;
echo "<hr>";

//可变变量
echo "可变变量<br>";
$a = "锄禾日当午";
$b = "a";   //$b中存放的是变量名,所以$$b就是$a
echo $$b;
echo "<hr>";

function fn($type)
{
    $fu = 'imagecreatefrom'.$type;
    $fu();
}
fn('gif');
echo "<hr>";

//常量符不能用$开头
echo "<b>常量声明用define()关键字；常量符不能用'$'开头；默认情况下，区分大小写，可以通过define的第三个参数来设置是否区分大小写，true不区分，false区分</b><br>";
define('name','李白', true);
echo name;
echo "<hr>";
echo "常量不能重定义<br>";
if (!define(name)) {
    define('name', '杜甫');
}
echo name;
echo "<hr>";
echo PHP_INT_MAX;
echo "<br>";
$conn = @mysqli_connect("localhost","username","password");
echo "出错了，错误原因是：".$php_errormsg;
?>
</body>
</html>