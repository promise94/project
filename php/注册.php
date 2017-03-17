<?php
$str='qwertyuiopasdfghjklzxcvbnmQAZWSXEDCRFVTGBYHNUJMIKLOP1234567890';
for ($i=0; $i < 4 ; $i++) {
    $code .= '<span style="color: rgb('.mt_rand(0,255).', '.mt_rand(0,255).', '.mt_rand(0,255).')">'.substr($str, mt_rand(0,strlen($str)-1), 1).'</span>';
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>用户注册</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<form action="doAction.php" method="post">
    <table border="1" cellspacing="0" cellpadding="0" width="80%" bgcolor="$abcdef">
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username" placeholder="请输入用户名"><span>用户名以字母开头，长度6~10</span></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="password" placeholder="请输入密码">密码长度6~10</td>
        </tr>
        <tr>
            <td>确认密码：</td>
            <td><input type="password" name="password1"></td>
        </tr>
        <tr>
            <td>爱好：</td>
            <td>
                <input type="checkbox" name="fav[]" id="1" value="php"><lable for="1">php</lable>
                <input type="checkbox" name="fav[]" id="2" value="java"><lable for="2">java</lable>
                <input type="checkbox" name="fav[]" id="3" value="c"><lable for="3">c语言</lable>
                <input type="checkbox" name="fav[]" id="4" value="c++"><lable for="4">c++</lable>
                <input type="checkbox" name="fav[]" id="5" value="bootstrap"><lable for="5">bootstrap</lable>
                <input type="checkbox" name="fav[]" id="6" value="nodejs"><lable for="6">nodejs</lable>
                <input type="checkbox" name="fav[]" id="7" value="ionic"><lable for="7">ionic</lable>
            </td>
        </tr>
        <tr>
            <td>邮箱：</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>验证码</td>
            <td>
                <input type="text" name="verfy">
                <span style="background: #fff;"><?php echo $code ?></span>
                <input type="text" name="verfy1" hidden value="<?php echo strip_tags($code) ?>">
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="注册"></td>
            <td></td>
        </tr>
    </table>
</form>
</body>

</html>