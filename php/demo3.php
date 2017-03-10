<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>test</title>
  </head>
  <body>
    <?php
    $a = 10;
    $b = "10";
    if ($a == $b) {
      # code...
      echo "相等";
      var_dump($a);
      var_dump($b);
    }else {
      echo "不相等";
    }
    echo "<br>";
    $c = 0;
    $d = "abc";
    if ($c == $d) {
      # code...
      echo "相等";
      var_dump($c);
      var_dump($d);
    }else {
      echo "不相等";
    }
    echo "<hr>";
    $e = 0;
    $f = false;
    if ($e == $f) {
      # code...
      echo "相等";
      var_dump($e);
      var_dump($f);
    }else {
      echo "不相等";
      var_dump($e);
      var_dump($f);
    }
    ?>
  </body>
</html>
