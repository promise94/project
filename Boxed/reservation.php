<?php
$reservationstep = $_GET['reservationstep'];

if($reservationstep == "one"){
	$dpd1 = $_POST['dpd1'];
	$dpd2 = $_POST['dpd2'];
	$rooms	= $_POST['rooms'];
	$adult	= $_POST['adult'];
	$children = $_POST['children'];

	echo "<form action=\"#\" method=\"post\" id=\"ajax-reservation-send\">";
	echo "<ul class=\"clearfix\">";
	echo "<input type=\"hidden\" name=\"dpd1\" value=\"$dpd1\" /><input type=\"hidden\" name=\"dpd2\" value=\"$dpd2\" /><input type=\"hidden\" name=\"rooms\" value=\"$rooms\" /><input type=\"hidden\" name=\"adult\" value=\"$adult\" /><input type=\"hidden\" name=\"children\" value=\"$children\" />";
	echo "<li class=\"li-input sec-input\"><label>NAME</label><input type=\"text\" name=\"name\" /></li>";
	echo "<li class=\"li-input sec-input\"><label>SURNAME</label><input type=\"text\" name=\"surname\" /></li>";
	echo "<li class=\"li-input sec-input\"><label>PHONE</label><input type=\"text\" name=\"phone\" /></li>";
	echo "<li class=\"li-input sec-input\"><label>E-MAIL</label><input type=\"text\" name=\"mail\" /></li>";
	echo "<li><div class=\"button-style-1 margint40\"><a id=\"res-send\" href=\"#\"><i class=\"fa fa-search\"></i>SEND</a></div></li>";
	echo "</ul>";
	echo "</form>";					
}elseif($reservationstep == "two"){
	$dpd1 = $_POST['dpd1'];
	$dpd2 = $_POST['dpd2'];
	$rooms	= $_POST['rooms'];
	$adult	= $_POST['adult'];
	$children = $_POST['children'];
	$name = $_POST['name'];
	$surname = $_POST['surname'];
	$phone = $_POST['phone'];
	$mail = $_POST['mail'];

	$mainemail = "theme-shared@themelock.com";//Change this mail address.

	$mailinfo  = "MIME-Version: 1.0\r\n";
	$mailinfo .= "Content-type: text/html; charset=utf-8\n";
	$mailinfo .= "From: luxen@2035themes.com \r\n";
	$mailinfo .= "Reply-To: $name <$mail>\r\n";
	$sms  = "Name : ".$name." ".$surname."<br />E-Mail : ".$mail."<br />Phone : ".$phone."<br />Arrival : ".$dpd1."<br />Departure : ".$dpd2."<br />Rooms : ".$rooms."<br />Adult : ".$adult."<br />Children : ".$children;

	$mail = mail($mainemail, $name ,stripslashes($sms), $mailinfo);
	if($mail){
		echo "<p class=\"reservation-confirm\">Thanks for your request for a reservation. We're checking availability and we'll get back to you as soon as possible.</p>";
	}
	else{
		echo "<p class=\"reservation-confirm\">Error! Please try again.</p>";
	}
}else{
	echo "Error!";
}
?>