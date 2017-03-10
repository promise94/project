<!--#include file="../inc/conn.asp" -->
<%Const ItemPath="../"%>
<!--#include file="../inc/Main_function.asp" -->
<!--#include file="../inc/function.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>专题-<%=doname%></title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="../inc/Header.asp"-->
  <div class="mainContent">
  <div class="main_content2">
      <h2>专题</h2>
      <div class="special">
<%
dim root,fso,ho,fo,TmpNode
Dim xml,oname,oimg,oorder,ostate,olink
	Set xml = Server.CreateObject("MSXML2.DOMDocument") 
	xml.preserveWhiteSpace = true 
	xml.async = false
	
	set fso=server.CreateObject("Scripting.FileSystemObject")
	set root = fso.getfolder(server.mappath(ItemPath&"special"))
	If root.subfolders.count>0 Then

	for each ho in root.subfolders
		Set fo=fso.GetFolder(Server.MapPath(ItemPath&"special"&"/"&ho.name))
			if xml.load(Server.MapPath(ItemPath&"special/"&ho.name&"/set.xml")) Then
				Set TmpNode=XML.documentElement
					oname=TmpNode.selectSingleNode("name").text
					oimg=TmpNode.selectSingleNode("img").text
					oorder=TmpNode.selectSingleNode("order").text
					ostate=TmpNode.selectSingleNode("state").text
					olink=TmpNode.selectSingleNode("link").text
					if ostate=1 Then
						%>
		<dl>
            <dt><a href="<%=olink%>" target="_blank"><img src="<%=ho.name&"/"&oimg%>" alt="<%=oname%>" border="0" /></a></dt>
            <dd><a href="<%=olink%>" target="_blank"><%=oname%></a></dd>
    	</dl>
						<%
					end if
				set TmpNode=nothing
			end if
		Set fo=nothing
	next
	Else
		response.Write("暂无专题")
	End If
	set xml=nothing
%>      </div>
    </div>
  </div>   
<!--#INCLUDE FILE="../INC/Footer.asp"-->
</div>
</body>
</html>