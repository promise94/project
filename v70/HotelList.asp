<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
'����Ϊ���ܲ������� ��Ҫ����ҳ�涥��
dim tm1,tm2,dn,pg,px,minprice,maxprice,rank,bid,lsid,hn,key,cityname,rurl,pxurl,apiUrl,cityid,webtitle,hid,gurl
tm1=session("tm1")
tm2=session("tm2")
if tm1="" then tm1=date():session("tm1")=tm1
if tm2="" then tm2=tm1+3:session("tm2")=tm2	
dn=DateDiff("d",tm1,tm2)

pg=request("pg")*1
px=request("px")*1

cityid=request("cityid")*1
if cityid>=1 then rurl=rurl&"&cityid="&cityid&"":else:rurl=rurl&"&cityid="&uncityid:cityid=uncityid:end if
rank=request("rank")
if rank<>"" then rurl=rurl&"&rank="&rank&"":else:rurl=rurl&"&rank=0":end if
minprice=request("minprice")
if minprice<>"" then rurl=rurl&"&minprice="&minprice&""
maxprice=request("maxprice")
if maxprice<>"" then rurl=rurl&"&maxprice="&maxprice&""
bid=request("bid")*1
if bid<>"" then rurl=rurl&"&bid="&bid&""
lsid=request("lsid")*1
if lsid<>"" then rurl=rurl&"&lsid="&lsid&""
hn=request("hn")
if hn<>"" then rurl=rurl&"&hn="&ec(hn)&""
key=request("key")
if key<>"" then rurl=rurl&"&key="&ec(key)&""
if key<>"" and px=0 Then px=5
if px=0 then px=1
hid=request("hid")*1
if hid<>"" then rurl=rurl&"&hid="&hid&""

cityname=getcityname(cityid)
webtitle=cityname
'webtitle ���� ���ݲ�ͬ������ʾ��ͬ����
if key<>"" then
	if instr(key,webtitle)=0 then
		webtitle=webtitle&key&"����"
	else
		webtitle=key&"����"
	end if
end if
if hn<>""  then webtitle=webtitle&hn

function getpx_style(px,pxed)
	if px=pxed then getpx_style="style='color:#ff3300;text-decoration:underline;'"
end function

function rankex(px)
	rankex=""&webpath&""&relist&"-c"&cityid&"-x"&rank&"-"&server.URLEncode(hn)&"-"&server.URLEncode(key)&"-a"&px&"-e"&pg&".html"&gurl&""
end function

function vpage(page)
If Hotel(7) Then
vpage=""&webpath&""&relist&"-c"&cityID&"-x"&rank&"-"&server.URLEncode(hn)&"-"&server.URLEncode(key)&"-a"&px&"-e"&page&".html"&gurl&""
Else
vpage=""&webpath&"hotellist.asp?cityid="&cityid&"&minprice="&minprice&"&maxprice="&maxprice&"&rank="&rank&"&bid="&bid&"&hn="&server.URLEncode(hn)&"&key="&server.URLEncode(key)&"&px="&px&"&pg="&page&"&lsid="&lsid&""
End If
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=webtitle%>�Ƶ�Ԥ��|<%=webtitle%>����Ԥ��|<%=webtitle%>�ù�Ԥ��|<%=webtitle%>������ݾ��þƵ�Ԥ��</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="javascript/drag_show.js"></script>
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="INC/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
      <div class="lian_up">
        <h2><%=cityname%>�Ƶ�����</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=cityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top<%=rurl%>&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_up">
        <h2><%=cityname%>��ҵ��</h2>
       <ul><%=getcbdlist(cityid,13)%></ul>
      </div>
      <div class="lian_h">
        <h2><%=cityname%>�����Ƶ�</h2>
    	 <ul><%=getchain(cityid,9)%></ul>
      </div>
      <div class="lian_up">
        <h2><%=cityname%>�ؼ۾Ƶ�</h2>
        <ul><%=gethotellist("",10,cityid,0,"1","",2,13,2)%></ul>
      </div>
      <div class="lian_up">
        <h2><%=cityname%>�ȵ���Ѷ</h2>
       <ul><%response.Write(NewsList("Select top 10 Article_ID,Article_ClassID,Article_Title From ZN_"&D("Article")&" Where Article_State_Radio>0 And Article_CityID_select="&cityid&" Order By Article_ViewNum desc,Article_Order desc,Article_ID desc",30,1,0))%></ul>
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
      <div class="lian_up">
        <h2>������ʾƵ�</h2>
  		<ul class="jiudian"><%=newhotel(6)%></ul>
      </div>
    </div>    
    
    <div class="list_con">
   	 
      <div class="uup">
<!--�Ƶ��б�ѭ����ʼ -->
      <%
        apiUrl=doserver&"search.asp?u="&agent_id&"&m="&agent_md&"&pg="&pg&"&px="&px&""&rurl&""
		'response.Write(apiurl)
        '��ѡ����
        '��ǰҳ pg=1
        '����ʽ Px=0��1 Ĭ����ϵͳ�Ƽ����� 2����ͼ۸� 3�����Ǽ���С���� 4�ͻ������ɸߵ��� 5���վ���
        '����ID cityid=53
        '�۸�Χ minjiage=0&maxprice=300
        '�Ƶ�ؼ��� hn=���
        '����ID lsid=1
        '��ҵ��ID bid=1
        '�Ǽ� rank=2
        dim http,backXml,xml,root,page,totalput,rst,id,HotelName,xingji,mjiage,Address,Picture,i,mapbz
		dim juli,shangyequ,shangyequid,Traffic,Service,Canyin,Card,Content,creathlisturl

		if Iscache(rurl) then
			creathlisturl=webpath&"Database/XML/Search/"&replace(webpath,"/","")&"_getHotel_list_"&cityid&"_"&rank&"_"&bid&"_"&lsid&"_"&pg&"_"&px&".xml"
			set xml=GetXml(apiUrl,creathlisturl)
		else
			set xml=GetXml(apiUrl,"")
		end if
		
		if xml.xml<>"" then
			'list �����	list.hotel
			set root=xml.documentElement
			totalput=root.getAttribute("totalput")
			page=root.getAttribute("PageIdx")
			Set Rst=xml.documentElement.childNodes
        %>
        <div class="l_up">
        	<div class="list_tit">
            <div class="list_tex1"><h1>ѡ��<%=cityname&key%>��<a href='<%If Hotel(7) Then%><%=webpath%>index/<%=cityid%>.html<%Else%><%=webpath%>city/?cityid=<%=cityid%><%End If%>'><%=cityname%>�Ƶ���ҳ</a></h1></div>     	
                <div class="dat">��ס���ڣ�<span><%=tm1%></span>&nbsp;&nbsp;&nbsp;������ڣ�<span><%=tm2%></span>&nbsp;&nbsp;&nbsp;��&nbsp;<span><%=datediff("d",tm1,tm2)%></span>&nbsp;��</div>            </div>
            <div class="list_zhuang"></div></div>
            <div class="l_down">
              <ul>
                <li class="ldo">����:<%If Hotel(7) Then%>
        <a <%=getpx_style(px,1)%> href="<%=rankex(1)%>">��վ�Ƽ�</a> | 
        <a <%=getpx_style(px,2)%> href="<%=rankex(2)%>">�۸�����</a> | 
        <a <%=getpx_style(px,3)%> href="<%=rankex(3)%>">�Ǽ�����</a> | 
        <a <%=getpx_style(px,4)%> href="<%=rankex(4)%>">��������</a><%if key<>"" then%> | <a <%=getpx_style(px,5)%> href="<%=rankex(5)%>">��������</a><%end if%>
        <%Else%><%pxurl=""&webpath&"hotellist.asp?cityid="&cityid&"&minprice="&minprice&"&maxprice="&maxprice&"&rank="&rank&"&bid="&bid&"&hn="&server.URLEncode(hn)&"&key="&server.URLEncode(key)&"&pg="&pg&"&lsid="&lsid&""%><a <%=getpx_style(px,1)%> href="<%=pxurl%>&px=1">��վ�Ƽ�</a> | <a <%=getpx_style(px,2)%> href="<%=pxurl%>&px=2">�۸�����</a> | <a <%=getpx_style(px,3)%> href="<%=pxurl%>&px=3">�Ǽ�����</a> | <a <%=getpx_style(px,4)%> href="<%=pxurl%>&px=4">��������</a><%if key<>"" then%> | <a <%=getpx_style(px,5)%> href="<%=pxurl%>&px=5">��������</a><%end if%>
         <%End If%></li>
         <li class="ldt">�ܹ�<strong>&nbsp;<%=totalput%>&nbsp;</strong>�ҾƵ� ��ǰ�ǵ�<strong>&nbsp;<%=page%>&nbsp;</strong>ҳ
        <%
		dim totalpage
		totalpage=int(totalput/10)+1
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
		%>
        </li>                         
              </ul>
            </div>
      </div>
       <%
		  For i=0 To (Rst.Length-1)
			with Rst(i) '���<hotel ID="3921" Name="������ҿ�ݾƵ꣨�����ŵ꣩" xingji="0"> 
				ID=.getAttribute("ID")
				HotelName=.getAttribute("Name")
				xingji	=.getAttribute("xingji")
				mjiage  =.getAttribute("mjiage")
				
				'�ӽ��		
				Address	=.firstChild.getAttribute("v")
				Picture	=.getElementsByTagName("Picture").item(0).getAttribute("v")
				juli	=.getElementsByTagName("JuLi").item(0).getAttribute("v")
				mapbz	=.getElementsByTagName("mapbz").item(0).getAttribute("v")
				shangyequ =.getElementsByTagName("shangyequ").item(0).getAttribute("v")
				shangyequid =.getElementsByTagName("shangyequid").item(0).getAttribute("v")
				key		=.getElementsByTagName("JuLi").item(0).getAttribute("vname")
				Traffic	=.getElementsByTagName("Traffic").item(0).text
				Service	=.getElementsByTagName("Service").item(0).text
				Canyin	=.getElementsByTagName("Canyin").item(0).text
				Card	=.getElementsByTagName("Card").item(0).text
				Content	=.getElementsByTagName("Content").item(0).text
			end with
        %>
        <%if key<>"" and juli="" and i=0 then%>
      <font color="#FF4400" style="font-size:14px; font-weight:bold"><span class="no_find">ϵͳû�в�ѯ��&ldquo;<%=key%>&rdquo;�����ľƵ�����,������ѡ�����¾Ƶꡣ</span></font><%end if%>      
   	  <div class="list_cc"><h2>
 <p>���<span><%=mjiage%>Ԫ</span>��</p><%If Hotel(7) Then%><a href="<%=webpath%><%=rehotel%>-<%=cityid%>-<%=ID%>.html" target="_blank"><%Else%><a href="<%=webpath%>hotelinfo.asp?cityid=<%=cityid%>&hotelid=<%=ID%>" target="_blank"><%End If%><%=HotelName%></a> <img src="images/star/<%=xingji%>.gif" width="103" height="19" align="absmiddle"  style="padding-bottom:5px;"/>
     </h2>
        	<dl>
            	<dt><%If Hotel(7) Then%><a href="<%=webpath%><%=rehotel%>-<%=cityid%>-<%=ID%>.html" target="_blank"><%Else%><a href="<%=webpath%>hotelinfo.asp?cityid=<%=cityid%>&hotelid=<%=ID%>" target="_blank"><%End If%><img src="<%=Picture%>" width="155" height="115" /></a></dt>
                <dd>
                	<ul>
                      <%if juli<>"" then%><li><font color="#ff3300">�þƵ���� &ldquo;<%=key%>&rdquo; Լ<strong><%=juli%></strong>����</font></li><%end if%>
                       <li><%=left(HtmlDel(Content),80)%>...</li>
                     <%If Hotel(7) Then%>
          <li>�ش���<a href='<%response.Write(""&webpath&""&relist&"-c"&cityID&"-x0---a0-e1.html?bid="&shangyequID&"")%>'><%=shangyequ%></a></li>
              <li>λ�ڣ�<%=Address%></li>
              <li>��ͼ��<a href='map.Html?hotelname=<%=(hotelname)%>&latlon=<%=mapbz%>&cityid=<%=cityid%>' target="_blank">����Ƶ���ӵ�ͼ</a></li>
              <li class="list_te"><a href="<%=webpath%><%=rehotel%>-<%=cityid%>-<%=ID%>.html" target="_blank" style="font-size:12px; color:#F60;"><b>���<%=mjiage%>Ԫ�� ��ҪԤ���þƵ�&nbsp;<img src="images/dow.gif" alt="��������Ԥ���Ƶ�ҳ��" border="0" align="absmiddle" /></b></a>&nbsp;&nbsp;<a href="javascript:void(0);" onClick="return inserts(this,<%=id%>);">�鿴�˾Ƶ귿��&nbsp;<img alt="�����鿴�˾Ƶ귿��" src="images/dow1.gif" align="absmiddle" border="0" /></a></li>
              <%Else%>
              <li>�ش���<a href='<%response.Write(""&webpath&"hotellist.asp?cityid="&cityID&"&bid="&shangyequid&"")%>'><%=shangyequ%></a></li>
              <li>λ�ڣ�<%=Address%></li>
              <li>��ͼ��<a href='map.asp?hotelname=<%=server.URLEncode(hotelname)%>&latlon=<%=mapbz%>&cityid=<%=cityid%>' target="_blank">����Ƶ���ӵ�ͼ</a></li>
              <li class="list_te"><a href="<%=webpath%>hotelinfo.asp?cityid=<%=cityid%>&hotelid=<%=ID%>" target="_blank" style="font-size:12px; color:#F60;"><b>���<%=mjiage%>Ԫ�� ��ҪԤ���þƵ�&nbsp;<img src="images/dow.gif" alt="��������Ԥ���Ƶ�ҳ��" border="0" align="absmiddle" /></b></a>&nbsp;&nbsp;<a href="javascript:void(0);" onClick="return inserts(this,<%=id%>);">�鿴�˾Ƶ귿��&nbsp;<img alt="�����鿴�˾Ƶ귿��" src="images/dow1.gif" align="absmiddle" border="0" /></a></li>
              <%End If%>
                  </ul>
          </dd>
            </dl>
      </div>
      <%
		Next
		End if:Set Xml=Nothing%>
      <div class="lis_page" style="float:right">
        �ܹ� <strong><%=totalput%></strong> �ҾƵ� ��ǰ�ǵ� <strong><%=page%></strong> ҳ
        <%
		totalpage=int(totalput/10)+1
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
		%></div>
    </div>
    
  </div>
  <!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>
<script>
function inserts(val,id)
{var img=new Image();img.src ="images/load.gif";val.parentNode.insertBefore(img,val);val.innerHTML="�ر�&nbsp;<img alt=\"��������\" src=\"images\/dow2.gif\" border=\"0\" align=\"absmiddle\" />";if(_g(id)){_g(id).parentNode.removeChild(_g(id));val.innerHTML="�鿴�˾Ƶ귿��&nbsp;<img alt=\"��������Ԥ���Ƶ�ҳ��\" align=\"absmiddle\" src=\"images\/dow1.gif\" border=\"0\" />";val.parentNode.removeChild(val.parentNode.getElementsByTagName('img')[1]);return;}	var th=val.parentNode.parentNode.parentNode.parentNode.parentNode;chg('<%=tm1%>','<%=tm2%>','getprice',id,th,val);}
function chg(s,e,divid,hotelid,th,val){xmlHttp('getprice.asp?hid='+hotelid+'&tm1='+s+'&tm2='+e+'&r='+Math.random()+'',function(e){var div = document.createElement('div');div.id=hotelid;	div.style.padding="0 5px 5px 12px";div.innerHTML = unescape(e);th.appendChild(div);	val.parentNode.removeChild(val.parentNode.getElementsByTagName('img')[1]);});}
function _rm(thisval,id){var img=new Image();	img.src ="images/load.gif";thisval.parentNode.insertBefore(img,thisval);var ptd=thisval.parentNode;var tr=thisval.parentNode.parentNode;			var tb=tr.parentNode;var nid='aj_'+id;if(_g(nid)){_g(nid).parentNode.removeChild(_g(nid));ptd.removeChild(ptd.getElementsByTagName('img')[0]);return;}xmlHttp('getRoominfo.asp?r='+id,function(e){var _tr=tb.insertRow(parseInt(idx(tb,tr))+1);_tr.setAttribute("id",nid);var td=_tr.insertCell(-1);td.colSpan=7;td.className='room_info';td.innerHTML=unescape(e);ptd.removeChild(ptd.getElementsByTagName('img')[0]);});};
function idx(tb,tr){for(n in tb.rows){if(tb.rows[n]==tr)return n}return n;}
</script>