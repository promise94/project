<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim socityid,cityid,cityname
cityid=request("cityid")
if cityid<>"" then
	socityid=cityid
else
	socityid=uncityid
end if
if cityid<>"" then cityname=getcityname(cityid)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=cityname%>��չ���ݸ������ݾƵ�Ԥ��</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.cit_ss{ padding:5px 10px;}
.cit_ss li{height:22px; overflow:hidden; background:url(images/bg_16x16.gif) 0 -798px no-repeat; padding:0px 0 0px 24px;}
</style>
<script type="text/javascript" src="http://un.zhuna.cn/javascript/Search.js"></script>
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
	<div class="side_list">
       <div class="lian_up">
        <h2><%=cityname%>�Ƶ�����</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=socityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_h">
        <h2><%=cityname%>�����Ƶ�</h2>
    	 <ul><%=getchain(socityid,9)%></ul>
      </div>
    </div>
    <div class="list_con">
        <div class="news1"><a href="<%=webpath%>">��ҳ</a> >> <%If Hotel(7) Then%><a href="<%=webpath%>zhanguan.html"><%Else%><a href="<%=webpath%>zhanguan.asp"><%End If%>ȫ������չ�ݸ����Ƶ��ѯ</a></div>
         <div class="news2">
            <h2>�����м���</h2>
                <div class="new3">
                <%
			dim s_cityID,s_cityname,apiUrl,creathlisturl
			apiUrl=doserver&"zhanguan_city.asp?u="&agent_id&"&m="&agent_md&""
			creathlisturl=webpath&"Database/XML/zhanguan/"&replace(webpath,"/","")&"_getzhanguan.xml"
			set xml=GetXml(apiUrl,creathlisturl)
			if xml.xml<>"" then
					  Set Rst=xml.documentElement.childNodes
					  For i=0 To (Rst.Length-1)
						  with Rst(i)
							  s_cityID=.getAttribute("cityid")
							  s_cityname=.getAttribute("cityname")
						  end with
					   response.Write "<a href='"&webpath&"zhanguan.asp?cityid="&s_cityID&"'>"&s_cityname&"</a>"
				Next
				End if
			Set Xml=Nothing
			%>
                </div>  
                <div class="new3">
                <form action="<%=webpath%>s/" method="get" name="school" target="_blank">
              <select id="pid">
          <option value="" selected="selected">��ѡʡ</option>
        </select> 
            <select name="cid" id="cid" >
            <option value="" selected="selected">ѡ����</option>
        </select> 
            <input name="k1" type="text" id="k1" value="" title="�Ƶ�λ�� ���磺������"/>
            <input type="submit" value="��չ��" class="butt3"/>
            </form></div>
          </div>
          <div class="news2">
            <h2>����չ���б����������Ⱥ�</h2>     
            <div class="new4">
            <ul>
 <%
        apiUrl=doserver&"zhanguan.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&""
		'response.Write apiUrl
        dim http,backXml,xml,root,page,totalput,rst,zhanguanName,i,scityid
        	creathlisturl=webpath&"Database/XML/zhanguan/"&replace(webpath,"/","")&"_getzhanguan_"&cityid&".xml"
			set xml=GetXml(apiUrl,creathlisturl)
			if xml.xml<>"" then
					'list �����	list.hotel
					set root=xml.documentElement
					totalput=root.getAttribute("totalput")
					page=root.getAttribute("PageIdx")
					Set Rst=xml.documentElement.childNodes
					
				    For i=0 To (Rst.Length-1)
					with Rst(i) '���<hotel ID="3921" Name="������ҿ�ݾƵ꣨�����ŵ꣩" xingji="0"> 
						zhanguanName=.getAttribute("name")
						scityid=.getAttribute("cityid")
					end with
	   %>
      <li style="width:140px; float:left; display:inline; margin-left:8px;"><%If Hotel(7) Then%><a href="<%=webpath%><%=relist%>-c<%=scityid%>-x0--<%=server.URLEncode(zhanguanName)%>-a0-e1.html" target="_blank" title="<%=zhanguanName%>�����Ƶ�"><%Else%><a href="hotellist.asp?cityid=<%=scityid%>&key=<%=ec(zhanguanName)%>" target="_blank" title="<%=zhanguanName%>�����Ƶ�"><%End If%><%=FU.CutStr(zhanguanName,20)%></a></li>
		<%
		Next
		End if:Set Xml=Nothing%>
            </ul>
         
      </div>  
    </div>
    </div>
  </div>
<!--#INCLUDE FILE="INC/Footer.asp"-->
<script language="javascript">loadCity('pid','cid',<%if cityid<>"" then response.Write cityid else response.Write("0")%>);</script>
</div>
</body>
</html>
<%Destroy%>