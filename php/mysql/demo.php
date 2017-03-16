<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<table>
    <tr>
        <th>编号</th>
        <th>地区编号</th>
        <th>省份</th>
    </tr>

    <?php
    // 连接数据库1
    // $link = mysqli_connect('localhost','root','1994a');
    // if($link) { //在php中，有值为true，NULL为空
    //     echo '连接成功';
    // }else {
        // echo '连接失败<br>';
    // }

    //数据库连接2
    // $link = mysqli_connect('localhost','root','1994') or die('连接失败');

    $servername = 'localhost';
    $username = 'root';
    $password = '1994';
    $dbname = 'data';

    // //创建连接(面向对象)
    // $link = new mysqli($servername, $username, $password);
    // var_dump($link);
    // //检查连接
    // if ($link->connect_error) {
        // die("连接失败: " . $link->connect_error);
    // } 
    // echo "连接成功";
    
    //面向过程
     $conn = mysqli_connect($servername, $username, $password, $dbname);
    // 检测连接
    // if (!$conn) {
    //     echo "Connection failed: " . mysqli_connect_error();
    // }else {        
    //     echo "连接成功<br>";
    // }
    // $rs = mysqli_query('select * from provinces');
    // var_dump($rs);

    // 创建连接
//    $conn = new mysqli($servername, $username, $password, $dbname);
    // 检测连接
    if ($conn->connect_error) {
        die("连接失败: " . $conn->connect_error);
    }
    //预设翻页参数
    $page = 2;
    $pagesize = 2;
    //在这里构建分页查询
    $start = ($page - 1) * $pagesize;
    $sql = "SELECT * FROM provinces";
    $sql2 = "select * from areas limit $start,$pagesize";
    // $result = $conn->query($sql);
    $result = mysqli_query($conn,$sql2);
    // var_dump($result);
    $data = array();
    while ($rows = mysqli_fetch_assoc($result)) {
       $data[] = $rows;
    }
    // $rows = mysqli_fetch_row($result);
    // echo $rows[2].'<br>';
    echo '<pre>';
    print_r($data);
    echo '</pre>';
      

    $conn->close();
    ?>
    </table>
</body>

</html>