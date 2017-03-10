<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>输出</title>
    <link rel="stylesheet" href="">
</head>
<body>
    <?php
    $a = '锄禾日当午';
    //echo只能输出数字、字符串<br>
    echo $a;
    //var_dump 输出变量的类型和变量的值
    //如果输出的是数组，包括键、值、值的类型
    var_dump($a);
    //print_r  输出数组的键、值
    echo "<hr>";
    echo "10aa"+'20bb'.'<br>';
    $b = 5;
    echo $b++;
    echo $b
    // echo ++$b;
     ?>
</body>
</html>
