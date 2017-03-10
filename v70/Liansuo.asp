<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
dim lsid,lscitylist,ls_cityID,ls_cityname,ls_name,ls_name1,lsname,apiUrl,http,backXml,xml,root,Rst,lsnum,i,creathlisturl,cityid,cityname
lsid=request("lsid")*1
if lsid>=1 then
	lscitylist=lscitylist&"<table width='100%' border='0' cellspacing='1' cellpadding='2'><tr>"
	apiUrl=doserver&"chaincity.asp?lsid="&lsid&""
	creathlisturl=webpath&"Database/XML/liansuo/"&replace(webpath,"/","")&"_get_liansuo_"&lsid&".xml"
		set xml=GetXml(apiUrl,creathlisturl)
		if xml.xml<>"" then
					set root=xml.documentElement
					lsname=root.getAttribute("name")
					Set Rst=xml.documentElement.childNodes
					For i=0 To Rst.Length-1
						with Rst(i)
						ls_cityID=.getAttribute("cityid")
						ls_cityname=.getAttribute("cityname")
						ls_name=.getAttribute("liansuo")
						end with
						ls_name1=ls_cityname&ls_name
						If Hotel(7) Then
						lscitylist=lscitylist&"<td width='140'><a href='"&webpath&""&relist&"-c"&ls_cityID&"-x0-"&server.URLEncode(ls_name)&"--a0-e1.html?lsid="&lsid&"'>·"&left(ls_name1,(len(ls_name)+2))&"</a></td>"
						Else
						lscitylist=lscitylist&"<td width='140'><a href='"&webpath&"hotellist.asp?cityid="&ls_cityID&"&hn="&server.URLEncode(ls_name)&"&lsid="&lsid&"'>·"&left(ls_name1,(len(ls_name)+2))&"</a></td>"
						End If
						if (i+1) mod 8=0 then lscitylist=lscitylist&"</tr><tr>"
					Next
		End if
	Set Xml=Nothing
	lscitylist=lscitylist&"</tr></table>"
end if
if lsname="" then lsname="全国连锁酒店"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=lsname%>|如家连锁|7天连锁|连锁快捷酒店-<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
<div class="main_content2">
      <h2><%=lsname%>预订 <%=lsname%>酒店预订 <%=lsname%>经济型酒店预订</h2>
      <div class="chain">
        <ul><%if lsid>=1 and lscitylist<>"" then response.Write(lscitylist) else response.Write getchain(0,100)%></ul>
      </div>
    </div>
  </div>  
  
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>