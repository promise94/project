<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<!--#INCLUDE FILE="module/YeatPage/Zhuna_vbsPage.asp"-->
<%
GetClassDict

dim classid,classname,ModuleName,id,SQL,Rs
dim title,content,author,AddDate,ViewNum
ModuleName=D("Article")
classid=FU.CheckRequest("classid",0)
id=FU.CheckRequest("id",0)
If classid="" And id="" Then response.Write("缺少参数！"):Response.End()
If classid>0 then
classname=D("Class_"&classid)
End If

SQL="Select Article_ID,Article_ClassID,Article_Title,Article_content,Article_Author,Article_Order,Article_State_Radio,Article_AddDate,Article_ViewNum From ZN_"&ModuleName&" Where Article_ID="&id&" And Article_State_Radio>0"
Set Rs=DB.Recordset(SQL,1,3)
If Rs.Eof Or Rs.Bof Then
	response.Write("您所查看的文章不存在或者已经被删除！")
	response.End()
Else
	title=Rs("Article_Title")
	content=Rs("Article_content")
	author=Rs("Article_Author")
	AddDate=Rs("Article_AddDate")
	ViewNum=Rs("Article_ViewNum")+1
	Rs("Article_ViewNum")=Rs("Article_ViewNum")+1
	Rs.update
End If
Rs.Close:Set Rs=Nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=title%>-<%=classname%>资讯 - <%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
     <%ShowAD 1,"advertise"%>
     <div class="lian_up">
        <h2>酒店搜索</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=uncityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_up">
        <h2>热点<%=classname%></h2>
       	<ul><%response.Write(NewsList("Select top 10 Article_ID,Article_ClassID,Article_Title From ZN_"&D("Article")&" Where Article_State_Radio>0 And Article_ClassID="&classid&" Order By Article_ViewNum desc,Article_Order desc,Article_ID desc",30,0,0))%></ul>
      </div>
      
      <div class="lian_up"><h2>预订帮助中心</h2>
        <ul class="jiudian">
        <%If hotel(7) Then%>
            <li><a href="help.html">网上预订有保障吗？</a></li>
            <li><a href="help.html">网上预订有什么好处？</a></li>
            <li><a href="help.html">如何在网上预订？</a></li>
            <li><a href="help.html">为什么网上预订价格要便宜？</a></li>
            <li><a href="help.html">注册或预订时为什么要填写手机号？</a></li>
            <li><a href="help.html">我行程有变化已预订的酒店怎么办？</a></li>
        <%Else%>    
            <li><a href="help.asp">网上预订有保障吗？</a></li>
            <li><a href="help.asp">网上预订有什么好处？</a></li>
            <li><a href="help.asp">如何在网上预订？</a></li>
            <li><a href="help.asp">为什么网上预订价格要便宜？</a></li>
            <li><a href="help.asp">注册或预订时为什么要填写手机号？</a></li>
            <li><a href="help.asp">我行程有变化已预订的酒店怎么办？</a></li>
        <%End If%>
        </ul>
      </div>
    </div>
    <div class="list_con">
        <div class="news1"><a href="<%=webpath%>">首页</a> >> <%if Hotel(7) Then%><a href="<%=webpath%>News.html">资讯</a>>><a href="<%=webpath%>News-<%=Classid%>.html"><%=classname%></a><%Else%><a href="<%=webpath%>News.asp">资讯</a>>><a href="<%=webpath%>News.asp?classid=<%=Classid%>"><%=classname%></a><%End If%>>><%=title%></div>
		<div class="news2">
    		<h2><%=classname%></h2>     
            <div class="new4">
            <h1><%=title%></h1>
            <h6><%=AddDate%>　</h6>
            <h3>作者：<span><%=author%>&nbsp;&nbsp;浏览次数：<%=ViewNum%></span></h3>
            <div class="newinc"><%=Replace(content&" ","[ZN_IMAGE_PATH]",ItemPath)%></div>
            </div></div>
    </div>
  </div>
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>