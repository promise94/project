<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数据类型</title>
    <link rel="stylesheet" href="">
</head>
<body>
<?php
$name = '李白';
echo '$name是我的名字<br>';
echo "{$name}是我的名字<br>";
echo "${name}是我的名字<br>";
// $stu = array('sd', 'sdf', 'wed', 'wcg');
$stu = array(1=>'sd', 'sdf', 'wed', 'wcg');
echo $stu[0], "<br>";
echo $stu[1], "<br>";
echo $stu[3], "<br>";
print_r($stu);
echo "<hr>";
$emp = array('name' => '李白', 'sex' => 'man', 'age' => 33);
echo $emp[name], '<br>';
echo $emp[sex], '<br>';
echo $emp[age], '<br>';
print_r($emp);

?>
</body>
</html>