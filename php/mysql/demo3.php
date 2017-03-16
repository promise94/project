<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
    table, tr, td {
        text-align: center;
    }
    </style>
</head>
<body>
    <table>
    <tr>
        <th>编号</th>
        <th>地区编号</th>
        <th>地区</th>
        <th>所属事编号</th>
    </tr>

    <?php
    $servername = 'localhost';
    $username = 'root';
    $password = '1994';
    $dbname = 'data';

    // 创建连接
    $conn = new mysqli($servername, $username, $password, $dbname);
    // 检测连接
    if ($conn->connect_error) {
        die("连接失败: " . $conn->connect_error);
    } 

    $sql = "SELECT * FROM provinces";
    $sql2 = "select * from areas";
    // $result = $conn->query($sql);
    $result = mysqli_query($conn,$sql2);
    // var_dump($result);
    
    while ($rows = mysqli_fetch_object($result)) {
        echo '<tr>';
        echo '<td>'.$rows->id.'</td>';
        echo '<td>'.$rows->areaid.'</td>';
        echo '<td>'.$rows->area.'</td>';
        echo '<td>'.$rows->cityid.'</td>';
        echo '</tr>';
    }

    $conn->close();
    ?>
    </table>
</body>
</html>