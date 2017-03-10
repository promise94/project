<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>判断是否为润年</title>
</head>

<body>
    <form action="" method="post">
        <table>
            <tr>
                <td>年份：</td>
                <td><input name="year" type="text"></td>
            </tr>
            <tr>
                <td colspan="2"><input name="btn" type="submit" value="提交"></td>
            </tr>
        </table>
    </form>
    <?php
    if(isset($_POST['btn'])) {
        $num = $_POST['year'];
        if(is_numeric($num)) {
            $num+=0;
            if(is_int($num)) {
                if($num % 4 == 0) {
                    echo "{$num}是闰年";
                }else {
                    echo "{$num}不是闰年";
                }
            }else {
                echo "{$num}不是整数";
            }
        }else {
            echo "{$num}不是数字！";
        }
    }
    ?>
</body>

</html>