<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
dim latlon,hotelname,hotelname1,cityid,cityname
latlon=request("latlon")
hotelname=request("hotelname")
cityid=request("cityid")*1
if cityid=0 then cityid=uncityid
if hotelname<>"" then hotelname1=ec(hotelname)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=hotelname%>地图查询-<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent map">
  <iframe src="http://un.zhuna.cn/api/map/api.asp?p1=<%=latlon%>&k1=<%=hotelname1%>&cid=<%=cityid%>&url=http://<%=domain%>&qz=<%=rehotel%>" name="apifName" id="apifName" width="950" height="517" scrolling="no" frameborder="0"></iframe>
  </div>
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>