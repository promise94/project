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
<title><%=cityname%>��չ��Ϣ <%=month(date())%>�·ݻ�չ�Ƶ�Ԥ�� - <%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
      <div class="lian_up">
        <h2><%=cityname%>�Ƶ�����</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=235&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=cityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_h">
        <h2><%=cityname%>�����Ƶ�</h2>
        	<ul><%=getchain(cityid,15)%></ul>
      </div>
      <div class="lian_up"><h2>Ԥ����������</h2>
        <ul class="jiudian">
        <%If hotel(7) Then%>
            <li><a href="help.html">����Ԥ���б�����</a></li>
            <li><a href="help.html">����Ԥ����ʲô�ô���</a></li>
            <li><a href="help.html">���������Ԥ����</a></li>
            <li><a href="help.html">Ϊʲô����Ԥ���۸�Ҫ���ˣ�</a></li>
            <li><a href="help.html">ע���Ԥ��ʱΪʲôҪ��д�ֻ��ţ�</a></li>
            <li><a href="help.html">���г��б仯��Ԥ���ľƵ���ô�죿</a></li>
        <%Else%>    
            <li><a href="help.asp">����Ԥ���б�����</a></li>
            <li><a href="help.asp">����Ԥ����ʲô�ô���</a></li>
            <li><a href="help.asp">���������Ԥ����</a></li>
            <li><a href="help.asp">Ϊʲô����Ԥ���۸�Ҫ���ˣ�</a></li>
            <li><a href="help.asp">ע���Ԥ��ʱΪʲôҪ��д�ֻ��ţ�</a></li>
            <li><a href="help.asp">���г��б仯��Ԥ���ľƵ���ô�죿</a></li>
        <%End If%>
        </ul>
      </div>
    </div>
    <div class="list_con">
	<div class="news1"><a href="<%=webpath%>">��ҳ</a> >> <%if Hotel(7) Then%><a href="<%=webpath%>expo.html">��չ��Ϣ</a><%Else%><a href="<%=webpath%>expo.asp">��չ��Ϣ</a><%End If%></div>
   	  <div class="news2">
   	    <h2>�����з���</h2>
            <div class="new3"><%=getexpocity(91)%></div>  
   	  </div>
   	  <div class="news2">
            <h2>���ھ��еĻ�չ��Ϣ</h2>     
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
              <li><span><%=expo_time1%> �� <%=expo_time2%></span><%If Hotel(7) Then%><a href="<%=webpath%>expocity-<%=expo_cityid%>-1.html">[<%=expo_cityname%>]</a>&nbsp;<a href="<%=webpath%>expoinfo-<%=expo_cityid%>-<%=expoid%>.html"><%=expo_title%></a><%Else%><a href="expo.asp?cityid=<%=expo_cityid%>">[<%=expo_cityname%>]</a>&nbsp;<a href="expoinfo.asp?id=<%=expoid%>&cityid=<%=expo_cityid%>"><%=expo_title%></a><%End If%> </li>
			<%Next
			End if
			Set Xml=Nothing
			%>
            </ul>
            <div class="lis_page2">�ܹ� <strong><%=totalput%></strong> ����Ϣ ��ǰ�ǵ� <strong><%=page%></strong> ҳ 
			<%
			dim totalput
            response.Write("<a href='"&vpage(1)&"'>��ҳ</a>&nbsp;")
            if page>=2 then
                response.Write("<a href='"&vpage(page-1)&"'>��һҳ</a>&nbsp;")
            else
                response.Write("��һҳ&nbsp;")
            end if
            if totalpage>=0 and totalpage-page>0 then
                response.Write("<a href='"&vpage(page+1)&"'>��һҳ</a>&nbsp;")
            else
                response.Write("��һҳ&nbsp;")
            end if
            if totalpage-page>-1 then response.Write("<a href='"&vpage(totalpage)&"'>βҳ</a>&nbsp;")
            
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