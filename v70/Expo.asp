<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
dim cityname,cityid,page
cityid=request("cityid")*1
if cityid>=1 then cityname=getcityname(cityid)
page=request("pg")*1
if page=0 then page=1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=cityname%>会展信息 <%=month(date())%>月份会展酒店预订 - <%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
      <div class="lian_up">
        <h2><%=cityname%>酒店搜索</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=235&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=cityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_h">
        <h2><%=cityname%>连锁酒店</h2>
        	<ul><%=getchain(cityid,15)%></ul>
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
	<div class="news1"><a href="<%=webpath%>">首页</a> >> <%if Hotel(7) Then%><a href="<%=webpath%>expo.html">会展信息</a><%Else%><a href="<%=webpath%>expo.asp">会展信息</a><%End If%></div>
   	  <div class="news2">
   	    <h2>按城市分类</h2>
            <div class="new3"><%=getexpocity(91)%></div>  
   	  </div>
   	  <div class="news2">
            <h2>近期举行的会展信息</h2>     
            <div class="new4">
            <ul>
        <%
		dim expo_title,expo_place,ik,expo_placeid,expo_cityname,expo_cityid,expo_time1
		dim expo_time2,apiUrl,http,backXml,xml,Rst,expoid,root,totalpage,creathlisturl
        apiUrl=doserver&"expo.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&pg="&page&""
        creathlisturl=webpath&"Database/XML/expo/"&replace(webpath,"/","")&"_getexpolist_"&cityid&"_"&page&".xml"
		set xml=GetXml(apiUrl,creathlisturl)
		if xml.xml<>"" then
							set root=xml.documentElement
								totalput=root.getAttribute("num")
								totalpage=root.getAttribute("maxPage")
							Set Rst=xml.documentElement.childNodes
								For ik=0 To Rst.Length-1
									with Rst(ik)
										expo_title=.getAttribute("title")
										expo_place=.getAttribute("place")
										expo_placeid=.getAttribute("placeid")
										expo_cityname=.getAttribute("city")
										expo_cityid=.getAttribute("cityid")
										expo_time1=.getAttribute("tm1")
										expo_time2=.getAttribute("tm2")
										expoid=.getAttribute("ID")
									end with%>
              <li><span><%=expo_time1%> 至 <%=expo_time2%></span><%If Hotel(7) Then%><a href="<%=webpath%>expocity-<%=expo_cityid%>-1.html">[<%=expo_cityname%>]</a>&nbsp;<a href="<%=webpath%>expoinfo-<%=expo_cityid%>-<%=expoid%>.html"><%=expo_title%></a><%Else%><a href="expo.asp?cityid=<%=expo_cityid%>">[<%=expo_cityname%>]</a>&nbsp;<a href="expoinfo.asp?id=<%=expoid%>&cityid=<%=expo_cityid%>"><%=expo_title%></a><%End If%> </li>
			<%Next
			End if
			Set Xml=Nothing
			%>
            </ul>
            <div class="lis_page2">总共 <strong><%=totalput%></strong> 条信息 当前是第 <strong><%=page%></strong> 页 
			<%
			dim totalput
            response.Write("<a href='"&vpage(1)&"'>首页</a>&nbsp;")
            if page>=2 then
                response.Write("<a href='"&vpage(page-1)&"'>上一页</a>&nbsp;")
            else
                response.Write("上一页&nbsp;")
            end if
            if totalpage>=0 and totalpage-page>0 then
                response.Write("<a href='"&vpage(page+1)&"'>下一页</a>&nbsp;")
            else
                response.Write("下一页&nbsp;")
            end if
            if totalpage-page>-1 then response.Write("<a href='"&vpage(totalpage)&"'>尾页</a>&nbsp;")
            
            function vpage(page)
			If Hotel(7) Then
				vpage=""&webpath&"expocity-"&cityid&"-pg="&page&".html"
			Else
                vpage=""&webpath&"expo.asp?cityid="&cityid&"&pg="&page&""
            End If
			end function
            %>
          </div>
      </div>  
    </div>
  </div>  
  </div>
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>