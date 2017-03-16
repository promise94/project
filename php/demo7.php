<!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
    <?php
    //floor 向下取整
    //ceil 向上取整
    for ($i=100; $i<=999 ; $i++) { 
        // $a = floor($i/100);     //获取百位
        // $b = floor($i%100/10);      //获取十位
        // $c = $i%10;     //获取个位

        $a = substr($i, 0, 1);     //获取百位
        $b = substr($i, 1, 1);      //获取十位
        $c = substr($i, 2, 1);     //获取个位

        if (pow($a,3) + pow($b,3) + pow($c,3) == $i) {
            echo $i,'<br>';
        }
    }
    ?>
    </body>
</html>