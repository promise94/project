<?php
header("Content-Type: text/html; charset=utf-8");
$username  = $_POST['username'];
$password  = $_POST['password'];
$password1 = $_POST['password1'];
$email     = $_POST['email'];
$fav       = $_POST['fav'];
$verfy     = trim($_POST['verfy']);
$verfy1    = trim($_POST['verfy1']);

$redirectUrl = '<a href="注册.php">请重新注册</a>';

//验证用户名
$charname = $username{0};
$ascname  = ord($charname);
//大写字母65~90 小写字母97~122
if (!($ascname >= 65 && $ascname <= 90 || $ascname >= 97 && $ascname <= 122)) {
    exit('用户名输入错误，' . $redirectUrl);
}
//验证用户名长度
if (strlen($username) < 6 || strlen($username) > 10) {
    exit('用户名输入错误，' . $redirectUrl);
}
//密码验证
$pwdlen = strlen($password);

if ($pwdlen == 0) {
    exit('密码不能为空，' . $redirectUrl);
}

if ($pwdlen < 6 || $pwdlen > 10) {
    exit('密码输入错误，' . $redirectUrl);
}

if (strcmp($password, $password1) !== 0) {
    exit('两次密码输入不一致，' . $redirectUrl);
}

//验证码校验
if (strcasecmp($verfy, $verfy1) !== 0) {
    exit('验证码输入不正确，' . $redirectUrl);
}

$love     = implode('.', $fav);
$password = md5(md5($password));
$userInfo = <<<"info"
<table>
    <tr>
        <td>用户名</td>
        <td>密码</td>
        <td>邮箱</td>
        <td>爱好</td>
    </tr>
    <tr>
        <td>$username</td>
        <td>$password</td>
        <td>$email</td>
        <td>$love</td>
    </tr>
</table>
info;

echo $userInfo;
