<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
dim socityid,cityid,provinceid,pg,cityname,lei,leititle
cityid=request("cityid")
provinceid=request("provinceid")
pg=request("pg")*1
lei=request("lei")*1
if cityid<>"" then
	socityid=cityid
else
	socityid=uncityid
end if
if cityid="" and provinceid<>"" then cityname=getcityname(provinceid)
if cityid<>"" then cityname=getcityname(cityid)
if lei=0 then leititle="���ػ�վ������վ������"
if lei=1 then leititle="��վ"
if lei=2 then leititle="����վ"
if lei=3 then leititle="����"
if lei=0 or lei>3 then lei=1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=cityname&leititle%>�����Ƶ�</title>
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
        <div class="news1"><a href="<%=webpath%>">��ҳ</a> >> <a href="<%=webpath%>jiaotong.asp"><%=cityname&leititle%>��ѯ</a></div>
         <div class="news2">
            <h2>�����м���(<a href="?lei=1">��վ</a>��<a href="?lei=2">����վ</a>��<a href="?lei=3">����</a>)</h2>
                <div class="new3">
                <a href="?provinceid=2&lei=<%=lei%>">����</a> <a href="?provinceid=3&lei=<%=lei%>">����</a> <a href="?provinceid=4&lei=<%=lei%>">����</a> <a href="?provinceid=5&lei=<%=lei%>">����</a> <a href="?provinceid=6&lei=<%=lei%>">�㶫</a> <a href="?provinceid=7&lei=<%=lei%>">����</a> <a href="?provinceid=8&lei=<%=lei%>">����</a> <a href="?provinceid=9&lei=<%=lei%>">����</a> <a href="?provinceid=10&lei=<%=lei%>">�ӱ�</a> <a href="?provinceid=11&lei=<%=lei%>">����</a> <a href="?provinceid=12&lei=<%=lei%>">������</a> <a href="?provinceid=13&lei=<%=lei%>">����</a> <a href="?provinceid=14&lei=<%=lei%>">����</a> <a href="?provinceid=15&lei=<%=lei%>">����</a> <a href="?provinceid=16&lei=<%=lei%>">����</a> <a href="?provinceid=17&lei=<%=lei%>">����</a> <a href="?provinceid=18&lei=<%=lei%>">����</a> <a href="?provinceid=19&lei=<%=lei%>">���ɹ�</a> <a href="?provinceid=20&lei=<%=lei%>">����</a> <a href="?provinceid=21&lei=<%=lei%>">�ຣ</a> <a href="?provinceid=22&lei=<%=lei%>">ɽ��</a> <a href="?provinceid=23&lei=<%=lei%>">ɽ��</a> <a href="?provinceid=24&lei=<%=lei%>">����</a> <a href="?provinceid=25&lei=<%=lei%>">�Ϻ�</a> <a href="?provinceid=26&lei=<%=lei%>">�Ĵ�</a> <a href="?provinceid=27&lei=<%=lei%>">���</a> <a href="?provinceid=28&lei=<%=lei%>">����</a> <a href="?provinceid=29&lei=<%=lei%>">�½�</a> <a href="?provinceid=30&lei=<%=lei%>">����</a> <a href="?provinceid=31&lei=<%=lei%>">�㽭</a> <a href="?provinceid=32&lei=<%=lei%>">����</a>
                </div>  
                <div class="new3">
    <%
			if provinceid<>"" then
			dim s_cityID,s_cityname,apiUrl,creathlisturl
			apiUrl=doserver&"city.asp?u="&agent_id&"&m="&agent_md&"&px=3&cityid="&provinceid&"&lei=province"
			creathlisturl=webpath&"Database/XML/jiaotong/"&replace(webpath,"/","")&"_get-jiaotong_"&provinceid&".xml"
			set xml=GetXml(apiUrl,creathlisturl)
			if xml.xml<>"" then
					  Set Rst=xml.documentElement.childNodes
					  For i=0 To (Rst.Length-1)
						  with Rst(i)
							  s_cityID=.getAttribute("ID")
							  s_cityname=.getAttribute("name")
						  end with
					   response.Write "<a href='"&webpath&"jiaotong.asp?provinceid="&provinceid&"&cityid="&s_cityID&"' style='color:#f30'>"&s_cityname&"</a> "
				Next
				End if
			Set Xml=Nothing
			end if
			%>
              <form action="<%=webpath%>s/" method="get" name="school" target="_blank">
              <select id="pid">
          <option value="" selected="selected">��ѡʡ</option>
        </select> 
            <select name="cid" id="cid" >
            <option value="" selected="selected">ѡ����</option>
        </select> 
            <input name="k1" type="text" id="k1" value="" title="�Ƶ�λ�� ���磺������"/>
            <input type="submit" value="�ѳ�վ" class="butt3"/>
            </form></div>
          </div>
          <div class="news2">
            <h2>��ǰ����<%=leititle%>�б����������Ⱥ�</h2>     
            <div class="new4">
            <ul>
 <%
        apiUrl="http://un1.zhuna.cn/api/gbk/jiaotong.asp?u="&agent_id&"&m="&agent_md&"&pg="&pg&"&provinceid="&provinceid&"&cityid="&cityid&"&lei="&lei&""
		'response.Write apiUrl
        dim http,backXml,xml,root,page,totalput,rst,SchoolName,i,scityid
        creathlisturl=webpath&"Database/XML/jiaotong/"&replace(webpath,"/","")&"_get-jiaotong-info_"&provinceid&"_"&pg&"_"&cityid&"_"&lei&".xml"
			set xml=GetXml(apiUrl,creathlisturl)
			if xml.xml<>"" then
					'list �����	list.hotel
					set root=xml.documentElement
					totalput=root.getAttribute("totalput")
					page=root.getAttribute("PageIdx")
					Set Rst=xml.documentElement.childNodes
					
				    For i=0 To (Rst.Length-1)
					with Rst(i) '���<hotel ID="3921" Name="������ҿ�ݾƵ꣨�����ŵ꣩" xingji="0"> 
						SchoolName=.getAttribute("name")
						scityid=.getAttribute("cityid")
					end with
	   %>
      <li style="width:140px; float:left; display:inline; margin-left:8px;"><%If Hotel(7) Then%><a href="<%=webpath%><%=relist%>-c<%=scityid%>-x0--<%=server.URLEncode(SchoolName)%>-a0-e1.html" target="_blank" title="<%=SchoolName%>�����Ƶ�"><%Else%><a href="hotellist.asp?cityid=<%=scityid%>&key=<%=ec(SchoolName)%>" target="_blank" title="<%=SchoolName%>�����Ƶ�"><%End If%><%=FU.CutStr(SchoolName,20)%></a></li>
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