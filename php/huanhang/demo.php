<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <style>
                table {
                    margin: 0 auto;
                }
        </style>
    </head>
    <body>
    <table>
        <tr>
            <?php
            for($i=1; $i < 73; $i++) {
                echo '<td><img src="img/img'.$i.'.jpg"></td>';
                if($i % 4 == 0) {
                    echo'</tr><tr>';
                }
            }
            ?>
        </tr>
    </table>
    </body>
</html>