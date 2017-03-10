<?php
$host="localhost";//mysql主机地址
$user="root"; //mysql 登录账户
$pwd="1994"; //mysql登录密码
//连接数据库
$conn = mysqli_connect($host,$user,$pwd);
//判断
if (!$conn) {
    die('连接数据库失败: ' . mysqli_error());
}else{
    echo "mysql 连接成功！";
}
