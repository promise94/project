<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
dim http,backXml,xml,root,apiUrl
dim eid,cityid,title,expo_time1,expo_time2,cityname,content,expo_place,expo_placeid,classname,address,creathlisturl
cityid=request("cityid")*1
eid=request("id")*1
apiUrl=doserver&"expo.asp?u="&agent_id&"&m="&agent_md&"&eid="&eid&"&cityid="&cityid&""
apiUrl=apiUrl&"&domain="&domain&"&Copyright="&Copyright&"&doname="&server.URLEncode(doname)&""
creathlisturl=webpath&"DataBase/XML/expo/"&replace(webpath,"/","")&"_get-expo-info_"&cityid&"_"&eid&".xml"

set xml=GetXml(apiUrl,creathlisturl)
		if xml.xml<>"" then
			set root=xml.documentElement.firstChild
			If not Root is nothing Then
			title=root.getAttribute("title")
			expo_time1=root.getAttribute("tm1")
			expo_time2=root.getAttribute("tm2")
			expo_place=root.getAttribute("place")
			expo_placeid=root.getAttribute("placeid")
			cityname=root.getAttribute("city")
			classname=root.getAttribute("classname")
			address=root.getAttribute("Address")
			content=root.text
			End If
		end if
Set Xml=Nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=title%>-<%=cityname%>��չ�Ƶ�Ԥ�� - <%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
      <div class="lian_up">
        <h2><%=cityname%>�Ƶ�����</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=cityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
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
	<div class="news1"><a href="<%=webpath%>">��ҳ</a> >> <%if Hotel(7) Then%><a href="<%=webpath%>expo.html">��չ��Ϣ</a><%Else%><a href="<%=webpath%>expo.asp">��չ��Ϣ</a><%End If%> >> <%=title%></div>
   	  <div class="news2">
   	   <table width="95%" border="0" align="center" cellpadding="4" cellspacing="0">
      	  <tr class="ne_tit">
      	    <td height="70" align="center"><h1 style="margin-top:20px;"><%=title%></h1></td>
   	      </tr>
      	  <tr>
      	    <td><table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#CCCCCC">
      	      <tr>
      	        <td width="70" align="center" bgcolor="#FFFFFF"><strong>���ڳ��У�</strong></td>
      	        <td width="210" bgcolor="#FFFFFF"><%If Hotel(7) Then%><a href='<%=webpath%>expocity-<%=cityid%>-1.html'><%Else%><a href='expo.asp?cityid=<%=cityid%>'><%End If%><%=cityname%></a></td>
      	        <td width="70" align="center" bgcolor="#FFFFFF"><strong>�ٰ쳡����</strong></td>
      	        <td bgcolor="#FFFFFF" title="Ԥ��<%=expo_place%>�����Ƶ�"><%If Hotel(7) Then%><a href='<%response.Write(""&webpath&""&relist&"-c"&cityid&"-x0---a0-e1.html?hid=-"&eid&"")%>'><%Else%><a href='hotellist.asp?cityid=<%=cityid%>&hid=-<%=eid%>'><%End If%><%=expo_place%></a></td>
   	          </tr>
      	      <tr>
      	        <td align="center" bgcolor="#FFFFFF"><strong>��ʼ���ڣ�</strong></td>
      	        <td bgcolor="#FFFFFF"><%=expo_time1%></td>
      	        <td align="center" bgcolor="#FFFFFF"><strong>�������ڣ�</strong></td>
      	        <td bgcolor="#FFFFFF"><%=expo_time2%></td>
   	          </tr>
      	      <tr>
      	        <td align="center" bgcolor="#FFFFFF"><strong>������ҵ��</strong></td>
      	        <td bgcolor="#FFFFFF"><%=classname%></td>
      	        <td align="center" bgcolor="#FFFFFF"><strong>չ�ݵ�ַ��</strong></td>
      	        <td bgcolor="#FFFFFF"><%=address%></td>
   	          </tr>
   	        </table></td>
   	      </tr>
      	  <tr>
      	    <td style="font-size:12px; line-height:180%; color:#333" class="expo_h3">
            <h3>��չ��ϸ��Ϣ</h3>
			<span><%=content%></span>
            <h3>���鳡�ݸ����Ƶ�(<%=expo_place%>)</h3>
            <ul class="sli1"><%=gethotellist("",10,cityid,-eid,"1","",2,20,3)%></ul>
            </td>
   	      </tr>
   	    </table>
   	  </div>
   	  <div class="news2">
            <h2>���ھ��еĻ�չ��Ϣ</h2>     
            <div class="new4">
<ul>
            <%
		dim expo_title,ik,expo_cityname,expo_cityid
		dim Rst,expoid,totalpage
        apiUrl=doserver&"expo.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&ps=5"
		creathlisturl=webpath&"Database/XML/expo/"&replace(webpath,"/","")&"_get-expo-nearlist_"&cityid&"_5.xml"

		set xml=GetXml(apiUrl,creathlisturl)
		if xml.xml<>"" then
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
              <li><span><%=expo_time1%> �� <%=expo_time1%></span><%If Hotel(7) Then%><a href="<%=webpath%>expocity-<%=expo_cityid%>-1.html">[<%=expo_cityname%>]</a>&nbsp;<a href="<%=webpath%>expoinfo-<%=expo_cityid%>-<%=expoid%>.html"><%=expo_title%></a><%Else%><a href="expo.asp?cityid=<%=expo_cityid%>">[<%=expo_cityname%>]</a>&nbsp;<a href="expoinfo.asp?id=<%=expoid%>&cityid=<%=expo_cityid%>"><%=expo_title%></a><%End If%> </li>
			  <%Next
			End if
			Set Xml=Nothing
			%>
            </ul>
        </div>  
    </div>
  </div>  
  </div>
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>