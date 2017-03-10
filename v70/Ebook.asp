<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
dim rid,tm1,tm2,cityid,cityname
rid=request("rid")*1
tm1=session("tm1")
tm2=session("tm2")
if tm1="" then tm1=date():session("tm1")=tm1
if tm2="" then tm2=tm1+3:session("tm2")=tm2	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>填写酒店订单信息-<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#include file="INC/Header.asp" -->
  <div class="mainContent">
<iframe name="Box" width="950" marginwidth="0" height="725" marginheight="0" frameborder="0" id="Box" src="http://new.zhuna.cn/ebook/book-api.asp?u=<%=agent_id%>&m=<%=agent_md%>&uid=0&rid=<%=rid%>&Tm1=<%=tm1%>&Tm2=<%=tm2%>&webpath=http://<%=domain%>"></iframe>
</div>
<!--#include file="INC/Footer.asp" -->
</div>
</body>
</html>
<%Destroy%>