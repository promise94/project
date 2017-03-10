<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%Dim mobile,oname
mobile=trim(request("mobile"))
oname=trim(request("oname"))
if mobile="" then response.Write("手机号不能为空!"):response.end
if oname="" then response.Write("预订人不能为空!"):response.end
if len(mobile)<>11then response.Write("手机号格式不对!"):response.end
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查询我的订单(手机号：<%=mobile%>)-<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
<div class="main_content2">
      <h2>查询我的订单(手机号：<%=mobile%>)</h2>
      <div class="search">
        <table width="100%" border="0" cellspacing="1" cellpadding="4" bgcolor="#CCCCCC">
          <tr>
            <th bgcolor="#FFFFFF">酒店名称</th>
            <th width="80" bgcolor="#FFFFFF">房型</th>
            <th width="80" bgcolor="#FFFFFF">入住人</th>
            <th width="160" align="center" bgcolor="#FFFFFF">入住时间</th>
            <th width="50" align="center" bgcolor="#FFFFFF">状态</th>
            <th width="80" align="center" bgcolor="#FFFFFF">备注</th>
          </tr>
    <%
	dim apiUrl,http,backXml,xml,rst,hotelName,fangxing,zongjia,daodian,lidian,ruzhuren,zhuangtai,bak,i
	apiUrl=doserver&"orderinfo.asp?u="&agent_id&"&m="&agent_md&"&mobile="&mobile&"&oname="&server.URLEncode(oname)&""
	set xml=GetXml(apiUrl,"")
		if xml.xml<>"" then
			  Set Rst=xml.documentElement.childNodes
			  For i=0 To (Rst.Length-1)
				  with Rst(i)
					hotelName=.getAttribute("hotelName")
					fangxing=.getAttribute("fangxing")
					zongjia=.getAttribute("zongjia")
					daodian=.getAttribute("daodian")
					lidian=.getAttribute("lidian")
					ruzhuren=.getAttribute("ruzhuren")
					zhuangtai=.getAttribute("zhuangtai")
					bak=.getAttribute("bak")
				  end with
		  %>
          <tr>
            <td bgcolor="#FFFFFF"><%=hotelName%></td>
            <td bgcolor="#FFFFFF"><%=fangxing%></td>
            <td bgcolor="#FFFFFF"><%=ruzhuren%></td>
            <td align="center" bgcolor="#FFFFFF"><%=daodian%>&nbsp;至 <%=lidian%></td>
            <td align="center" bgcolor="#FFFFFF"><%=zhuangtai%></td>
            <td align="center" bgcolor="#FFFFFF"><%=bak%></td>
          </tr><%
				  Next
				End if
			Set Xml=Nothing
			if hotelName="" then
		  %>
          <tr>
            <td colspan="6" bgcolor="#FFFFFF">抱歉没有查询到您的订单,请确认您提供的信息是否准确.</td>
          </tr><%end if%>
        </table>
        </div>
    </div>
  </div>   
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>