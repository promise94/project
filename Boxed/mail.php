<?php
error_reporting(0);
$mainemail = "luxen@2035themes.com";//Change this mail address.

$name		= $_POST['name'];
$email  	= $_POST['email'];
$subject	= $_POST['subject'];
$message	= $_POST['message'];

$mailinfo  = "MIME-Version: 1.0\r\n";
$mailinfo .= "Content-type: text/html; charset=utf-8\n";
$mailinfo .= "From: luxen@2035themes.com \r\n";//Change this mail address.
$mailinfo .= "Reply-To: $name <$email>\r\n";
$sms  = "Name : ".$name."<br />E-Mail : ".$email."<br />Subject : ".$subject."<br />Message : ";
$sms .= $subject;

$mail = mail($mainemail, $subject ,stripslashes($sms), $mailinfo);
if($mail){
echo "<span>Your mail has been send.</span>";
}
else{
echo "<span>Error! Please try again.</span>";
}
?>