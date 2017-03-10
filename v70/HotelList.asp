<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
'以下为接受参数部分 需要放在页面顶部
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
'webtitle 标题 根据不同条件显示不同标题
if key<>"" then
	if instr(key,webtitle)=0 then
		webtitle=webtitle&key&"附近"
	else
		webtitle=key&"附近"
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
<title><%=webtitle%>酒店预订|<%=webtitle%>宾馆预订|<%=webtitle%>旅馆预订|<%=webtitle%>连锁快捷经济酒店预订</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="javascript/drag_show.js"></script>
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="INC/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
      <div class="lian_up">
        <h2><%=cityname%>酒店搜索</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=cityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top<%=rurl%>&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_up">
        <h2><%=cityname%>商业区</h2>
       <ul><%=getcbdlist(cityid,13)%></ul>
      </div>
      <div class="lian_h">
        <h2><%=cityname%>连锁酒店</h2>
    	 <ul><%=getchain(cityid,9)%></ul>
      </div>
      <div class="lian_up">
        <h2><%=cityname%>特价酒店</h2>
        <ul><%=gethotellist("",10,cityid,0,"1","",2,13,2)%></ul>
      </div>
      <div class="lian_up">
        <h2><%=cityname%>热点资讯</h2>
       <ul><%response.Write(NewsList("Select top 10 Article_ID,Article_ClassID,Article_Title From ZN_"&D("Article")&" Where Article_State_Radio>0 And Article_CityID_select="&cityid&" Order By Article_ViewNum desc,Article_Order desc,Article_ID desc",30,1,0))%></ul>
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
      <div class="lian_up">
        <h2>最近访问酒店</h2>
  		<ul class="jiudian"><%=newhotel(6)%></ul>
      </div>
    </div>    
    
    <div class="list_con">
   	 
      <div class="uup">
<!--酒店列表循环开始 -->
      <%
        apiUrl=doserver&"search.asp?u="&agent_id&"&m="&agent_md&"&pg="&pg&"&px="&px&""&rurl&""
		'response.Write(apiurl)
        '可选参数
        '当前页 pg=1
        '排序方式 Px=0或1 默认是系统推荐排序 2按最低价格 3按照星级由小到大 4客户评分由高到低 5按照距离
        '城市ID cityid=53
        '价格范围 minjiage=0&maxprice=300
        '酒店关键词 hn=如家
        '连锁ID lsid=1
        '商业区ID bid=1
        '星级 rank=2
        dim http,backXml,xml,root,page,totalput,rst,id,HotelName,xingji,mjiage,Address,Picture,i,mapbz
		dim juli,shangyequ,shangyequid,Traffic,Service,Canyin,Card,Content,creathlisturl

		if Iscache(rurl) then
			creathlisturl=webpath&"Database/XML/Search/"&replace(webpath,"/","")&"_getHotel_list_"&cityid&"_"&rank&"_"&bid&"_"&lsid&"_"&pg&"_"&px&".xml"
			set xml=GetXml(apiUrl,creathlisturl)
		else
			set xml=GetXml(apiUrl,"")
		end if
		
		if xml.xml<>"" then
			'list 根结点	list.hotel
			set root=xml.documentElement
			totalput=root.getAttribute("totalput")
			page=root.getAttribute("PageIdx")
			Set Rst=xml.documentElement.childNodes
        %>
        <div class="l_up">
        	<div class="list_tit">
            <div class="list_tex1"><h1>选择（<%=cityname&key%>）<a href='<%If Hotel(7) Then%><%=webpath%>index/<%=cityid%>.html<%Else%><%=webpath%>city/?cityid=<%=cityid%><%End If%>'><%=cityname%>酒店首页</a></h1></div>     	
                <div class="dat">入住日期：<span><%=tm1%></span>&nbsp;&nbsp;&nbsp;离店日期：<span><%=tm2%></span>&nbsp;&nbsp;&nbsp;共&nbsp;<span><%=datediff("d",tm1,tm2)%></span>&nbsp;晚</div>            </div>
            <div class="list_zhuang"></div></div>
            <div class="l_down">
              <ul>
                <li class="ldo">排序:<%If Hotel(7) Then%>
        <a <%=getpx_style(px,1)%> href="<%=rankex(1)%>">网站推荐</a> | 
        <a <%=getpx_style(px,2)%> href="<%=rankex(2)%>">价格排序</a> | 
        <a <%=getpx_style(px,3)%> href="<%=rankex(3)%>">星级排序</a> | 
        <a <%=getpx_style(px,4)%> href="<%=rankex(4)%>">评分排序</a><%if key<>"" then%> | <a <%=getpx_style(px,5)%> href="<%=rankex(5)%>">距离排序</a><%end if%>
        <%Else%><%pxurl=""&webpath&"hotellist.asp?cityid="&cityid&"&minprice="&minprice&"&maxprice="&maxprice&"&rank="&rank&"&bid="&bid&"&hn="&server.URLEncode(hn)&"&key="&server.URLEncode(key)&"&pg="&pg&"&lsid="&lsid&""%><a <%=getpx_style(px,1)%> href="<%=pxurl%>&px=1">网站推荐</a> | <a <%=getpx_style(px,2)%> href="<%=pxurl%>&px=2">价格排序</a> | <a <%=getpx_style(px,3)%> href="<%=pxurl%>&px=3">星级排序</a> | <a <%=getpx_style(px,4)%> href="<%=pxurl%>&px=4">评分排序</a><%if key<>"" then%> | <a <%=getpx_style(px,5)%> href="<%=pxurl%>&px=5">距离排序</a><%end if%>
         <%End If%></li>
         <li class="ldt">总共<strong>&nbsp;<%=totalput%>&nbsp;</strong>家酒店 当前是第<strong>&nbsp;<%=page%>&nbsp;</strong>页
        <%
		dim totalpage
		totalpage=int(totalput/10)+1
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
		%>
        </li>                         
              </ul>
            </div>
      </div>
       <%
		  For i=0 To (Rst.Length-1)
			with Rst(i) '结点<hotel ID="3921" Name="北京如家快捷酒店（六里桥店）" xingji="0"> 
				ID=.getAttribute("ID")
				HotelName=.getAttribute("Name")
				xingji	=.getAttribute("xingji")
				mjiage  =.getAttribute("mjiage")
				
				'子结点		
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
      <font color="#FF4400" style="font-size:14px; font-weight:bold"><span class="no_find">系统没有查询到&ldquo;<%=key%>&rdquo;附近的酒店数据,您可以选择以下酒店。</span></font><%end if%>      
   	  <div class="list_cc"><h2>
 <p>最低<span><%=mjiage%>元</span>起订</p><%If Hotel(7) Then%><a href="<%=webpath%><%=rehotel%>-<%=cityid%>-<%=ID%>.html" target="_blank"><%Else%><a href="<%=webpath%>hotelinfo.asp?cityid=<%=cityid%>&hotelid=<%=ID%>" target="_blank"><%End If%><%=HotelName%></a> <img src="images/star/<%=xingji%>.gif" width="103" height="19" align="absmiddle"  style="padding-bottom:5px;"/>
     </h2>
        	<dl>
            	<dt><%If Hotel(7) Then%><a href="<%=webpath%><%=rehotel%>-<%=cityid%>-<%=ID%>.html" target="_blank"><%Else%><a href="<%=webpath%>hotelinfo.asp?cityid=<%=cityid%>&hotelid=<%=ID%>" target="_blank"><%End If%><img src="<%=Picture%>" width="155" height="115" /></a></dt>
                <dd>
                	<ul>
                      <%if juli<>"" then%><li><font color="#ff3300">该酒店距离 &ldquo;<%=key%>&rdquo; 约<strong><%=juli%></strong>公里</font></li><%end if%>
                       <li><%=left(HtmlDel(Content),80)%>...</li>
                     <%If Hotel(7) Then%>
          <li>地处：<a href='<%response.Write(""&webpath&""&relist&"-c"&cityID&"-x0---a0-e1.html?bid="&shangyequID&"")%>'><%=shangyequ%></a></li>
              <li>位于：<%=Address%></li>
              <li>地图：<a href='map.Html?hotelname=<%=(hotelname)%>&latlon=<%=mapbz%>&cityid=<%=cityid%>' target="_blank">浏览酒店电子地图</a></li>
              <li class="list_te"><a href="<%=webpath%><%=rehotel%>-<%=cityid%>-<%=ID%>.html" target="_blank" style="font-size:12px; color:#F60;"><b>最低<%=mjiage%>元起订 我要预订该酒店&nbsp;<img src="images/dow.gif" alt="单击进入预定酒店页面" border="0" align="absmiddle" /></b></a>&nbsp;&nbsp;<a href="javascript:void(0);" onClick="return inserts(this,<%=id%>);">查看此酒店房型&nbsp;<img alt="单击查看此酒店房型" src="images/dow1.gif" align="absmiddle" border="0" /></a></li>
              <%Else%>
              <li>地处：<a href='<%response.Write(""&webpath&"hotellist.asp?cityid="&cityID&"&bid="&shangyequid&"")%>'><%=shangyequ%></a></li>
              <li>位于：<%=Address%></li>
              <li>地图：<a href='map.asp?hotelname=<%=server.URLEncode(hotelname)%>&latlon=<%=mapbz%>&cityid=<%=cityid%>' target="_blank">浏览酒店电子地图</a></li>
              <li class="list_te"><a href="<%=webpath%>hotelinfo.asp?cityid=<%=cityid%>&hotelid=<%=ID%>" target="_blank" style="font-size:12px; color:#F60;"><b>最低<%=mjiage%>元起订 我要预订该酒店&nbsp;<img src="images/dow.gif" alt="单击进入预定酒店页面" border="0" align="absmiddle" /></b></a>&nbsp;&nbsp;<a href="javascript:void(0);" onClick="return inserts(this,<%=id%>);">查看此酒店房型&nbsp;<img alt="单击查看此酒店房型" src="images/dow1.gif" align="absmiddle" border="0" /></a></li>
              <%End If%>
                  </ul>
          </dd>
            </dl>
      </div>
      <%
		Next
		End if:Set Xml=Nothing%>
      <div class="lis_page" style="float:right">
        总共 <strong><%=totalput%></strong> 家酒店 当前是第 <strong><%=page%></strong> 页
        <%
		totalpage=int(totalput/10)+1
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
{var img=new Image();img.src ="images/load.gif";val.parentNode.insertBefore(img,val);val.innerHTML="关闭&nbsp;<img alt=\"单击收起\" src=\"images\/dow2.gif\" border=\"0\" align=\"absmiddle\" />";if(_g(id)){_g(id).parentNode.removeChild(_g(id));val.innerHTML="查看此酒店房型&nbsp;<img alt=\"单击进入预定酒店页面\" align=\"absmiddle\" src=\"images\/dow1.gif\" border=\"0\" />";val.parentNode.removeChild(val.parentNode.getElementsByTagName('img')[1]);return;}	var th=val.parentNode.parentNode.parentNode.parentNode.parentNode;chg('<%=tm1%>','<%=tm2%>','getprice',id,th,val);}
function chg(s,e,divid,hotelid,th,val){xmlHttp('getprice.asp?hid='+hotelid+'&tm1='+s+'&tm2='+e+'&r='+Math.random()+'',function(e){var div = document.createElement('div');div.id=hotelid;	div.style.padding="0 5px 5px 12px";div.innerHTML = unescape(e);th.appendChild(div);	val.parentNode.removeChild(val.parentNode.getElementsByTagName('img')[1]);});}
function _rm(thisval,id){var img=new Image();	img.src ="images/load.gif";thisval.parentNode.insertBefore(img,thisval);var ptd=thisval.parentNode;var tr=thisval.parentNode.parentNode;			var tb=tr.parentNode;var nid='aj_'+id;if(_g(nid)){_g(nid).parentNode.removeChild(_g(nid));ptd.removeChild(ptd.getElementsByTagName('img')[0]);return;}xmlHttp('getRoominfo.asp?r='+id,function(e){var _tr=tb.insertRow(parseInt(idx(tb,tr))+1);_tr.setAttribute("id",nid);var td=_tr.insertCell(-1);td.colSpan=7;td.className='room_info';td.innerHTML=unescape(e);ptd.removeChild(ptd.getElementsByTagName('img')[0]);});};
function idx(tb,tr){for(n in tb.rows){if(tb.rows[n]==tr)return n}return n;}
</script>