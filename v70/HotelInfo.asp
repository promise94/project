<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
'以下为接受参数部分 需要放在页面顶部
dim hotelid,tm1,tm2,dn,apiUrl,rurl,cityid,action
hotelid=FU.CheckRequest("hotelid",0)
cityid=FU.CheckRequest("cityid",0)
action=FU.CheckRequest("action",1)
tm1=request("tm1")
if tm1<>"" then session("tm1")=tm1
tm2=request("tm2")
if tm2<>"" then session("tm2")=tm2
tm1=session("tm1")
tm2=session("tm2")
if tm1="" then tm1=date():session("tm1")=tm1
if tm2="" then tm2=tm1+3:session("tm2")=tm2	
dn=DateDiff("d",tm1,tm2)
if dn>=21 then dn=21:tm2=DateAdd("d",21,tm1):session("tm2")=tm2	

dim http,backXml,xml,root,HotelName,xingji,cityname,Address,mapbz,shangyequ,shangyequid,liansuo,yulesheshi,Traffic,Service,creathlisturl,Traffic_zhinan,Titles
dim Canyin,Card,Content,hpicmin,hpictxt,Rst
apiUrl=doserver&"hotelinfo.asp?u="&agent_id&"&m="&agent_md&"&hid="&hotelid&"&cityid="&cityid&""
apiUrl=apiUrl&"&domain="&domain&"&Copyright="&Copyright&"&doname="&server.URLEncode(doname)&""
creathlisturl=webpath&"Database/XML/hotel/"&replace(webpath,"/","")&"_get-hotel-info_"&cityid&"_"&hotelid&".xml"

		set xml=GetXml(apiUrl,creathlisturl)
		if xml.xml<>"" then
			set root=xml.documentElement
			HotelName=root.getAttribute("HotelName")
			xingji=root.getAttribute("xingji")
			cityname=root.getAttribute("cityname")
			Address=root.getElementsByTagName("Address").item(0).getAttribute("v")
			mapbz=root.getElementsByTagName("mapbz").item(0).getAttribute("v")
			shangyequ=root.getElementsByTagName("shangyequ").item(0).getAttribute("v")
			shangyequid=root.getElementsByTagName("shangyequid").item(0).getAttribute("v")
			liansuo=root.getElementsByTagName("liansuo").item(0).getAttribute("v")
			yulesheshi=root.getElementsByTagName("Yulejianshen").item(0).text
			Traffic=root.getElementsByTagName("Traffic").item(0).text
			Service=root.getElementsByTagName("Service").item(0).text
			Canyin=root.getElementsByTagName("Canyin").item(0).text
			Card=root.getElementsByTagName("Card").item(0).text
			Content=root.getElementsByTagName("Content").item(0).text
			hpicmin=root.getElementsByTagName("Picture").item(0).getAttribute("hpicmin")
			hpictxt=root.getElementsByTagName("Picture").item(0).getAttribute("hpictxt")
			Set Traffic_zhinan=root.selectSingleNode("Traffic_zhinan")
		End if
		Set Xml=Nothing

'增加访问酒店
call cookiehotel(cityid,hotelid,hotelname)

'替换HotelName中的()
HotelName=replace(HotelName&"","（","-")
HotelName=replace(HotelName&"","）","")
HotelName=replace(HotelName&"","(","-")
HotelName=replace(HotelName&"",")","")

'酒店图片显示
Function hpicshow(pnum)
	dim picnum,ipi
	hpicmin=split(hpicmin,","):hpictxt=split(hpictxt&",",",")
	picnum=ubound(hpicmin)-1
	if picnum>=pnum then picnum=(pnum-1)
	'hpicshow=hpicshow&"var counts ="&picnum&";"&vbnewline
	for ipi=0 to picnum
		hpicshow=hpicshow&"<li><a href='"
			If Hotel(7) Then
				hpicshow=hpicshow&webpath&rehotel&"-"&cityid&"-"&hotelid&".html?action=6#info"
			Else
				hpicshow=hpicshow&"?action=6&hotelid="&hotelid&"&cityid="&cityid&"#info"
			End If
		hpicshow=hpicshow&"' title='"&hpictxt(ipi)&"'><img src='"&hpicmin(ipi)&"' border='0' />"&vbnewline
		hpicshow=hpicshow&hpictxt(ipi)&vbnewline
		hpicshow=hpicshow&"</a></li>"&vbnewline
	next
End Function

select case action
  case "1":Titles=""
  case "2":Titles="点评、评论"
  case "3":Titles="问答、提问"
  case "4":Titles="地图"
  case "5":Titles="附近酒店宾馆"
  case "6":Titles="图片"
  case "7":Titles="促销活动"
  case else:Titles=""
End Select
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=HotelName%><%=Titles%>_<%=shangyequ%>酒店预订_<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="module/nyroModal/styles/nyroModal.css" type="text/css" media="screen" />
<script language="javascript">var webpath='<%=webpath%>';</script>
<script language="javascript" src="<%=webpath%>inc/calendar.js"></script>
<script language="javascript" src="javascript/drag_show.js"></script>
<script type="text/javascript" src="module/nyroModal/js/jquery.min.1.4.2.js"></script>
<script type="text/javascript" src="module/nyroModal/js/jquery.nyroModal-1.6.2.pack.js"></script>
<script type="text/javascript">
//<![CDATA[
function _rm(thisval,id){
var img=new Image();img.src ="images/load.gif";thisval.parentNode.insertBefore(img,thisval);var ptd=thisval.parentNode;var tr=thisval.parentNode.parentNode;var tb=tr.parentNode; //table
var nid='aj_'+id;if(_g(nid)){_g(nid).parentNode.removeChild(_g(nid));ptd.removeChild(ptd.getElementsByTagName('img')[0]);return;}xmlHttp('getRoominfo.asp?r='+id,				  function(e){var _tr=tb.insertRow(parseInt(idx(tb,tr))+1);_tr.setAttribute("id",nid);var td=_tr.insertCell(-1);td.colSpan=7;td.className='room_info';td.innerHTML=unescape(e);ptd.removeChild(ptd.getElementsByTagName('img')[0]);});};
function idx(tb,tr){for(n in tb.rows){if(tb.rows[n]==tr)return n}return n;}
function chg(s,e,divid,hotelid){xmlHttp('getprice.asp?hid='+hotelid+'&tm1='+s+'&tm2='+e+'&r='+Math.random( )+'',function(e){ _g(divid).innerHTML=unescape(e);});}
$(function(){chg('<%=tm1%>','<%=tm2%>','getprice','<%=hotelid%>');$('#mapshow').nyroModal({bgColor: '#D5E6ED'});$('#rou_hotel a').nyroModal({'blocker':'#rou_hotel',bgColor:'#D5E6ED'});});
window.onload=function(){if(_g('iframemap')){_g('iframemap').innerHTML="<iframe src='HotelMap.asp?MapBz=<%=mapbz%>&MapZm=11&hotelname=<%=ec(hotelname)%>&W=685&h=250&iToolTipStyle=3' width='685' height='250' border='0' marginwidth='0' marginheight='0' framespacing='0' frameborder='0' scrolling='no'></iframe>";
}_g('SearchID').src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=cityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top<%=rurl%>&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>";}
//]]>
</script>
</head>
<body>
<div id="container">
  <!--#INCLUDE FILE="INC/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
      <div class="lian_up">
        <h2><%=cityname%>酒店搜索</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src=""></iframe>
      </div>
      <div class="lian_up"><h2>附近三公里内酒店</h2>
      	<ul>
 <%=gethotellist("",10,cityid,hotelid,"1","",2,11,3)%>                 
        </ul>
      </div>
      <div class="lian_up"><h2><%=cityname%>特价酒店</h2>
      	<ul>
<%=gethotellist("",6,cityid,0,"1","",2,13,2)%>                        
        </ul>
      </div>
      <div class="lian_up">
        <h2><%=cityname%>热点资讯</h2>
       <ul><%response.Write(NewsList("Select top 10 Article_ID,Article_ClassID,Article_Title From ZN_"&D("Article")&" Where Article_State_Radio>0 And Article_CityID_select="&cityid&" Order By Article_ViewNum desc,Article_Order desc,Article_ID desc",30,1,0))%></ul>
      </div>
      <div class="lian_up"><h2>最近访问酒店</h2>
      <ul>
        <%=newhotel(6)%>
      </ul>
    </div>
    </div>     
    <div class="list_con">
   	  <div class="xiang_tit">
<%If Hotel(7) Then%>
当前位置: <a href="<%=webpath%>">首页</a> >> <a href="<%=webpath%>index/<%=cityID%>.html"><%=cityname%>酒店首页</a> >> <a href="<%response.Write(""&webpath&""&relist&"-c"&cityID&"-x0---a0-e1.html")%>"><%=cityname%>酒店列表</a> >> <%=hotelname%>
<%Else%>    
    当前位置: <a href="<%=webpath%>">首页</a> >> <a href="<%=webpath%>city/?cityid=<%=cityid%>"><%=cityname%>酒店首页</a> >> <a href="<%response.Write(""&webpath&"hotellist.asp?cityid="&cityID&"")%>"><%=cityname%>酒店列表</a> >> <%=hotelname%>
<%End If%>       
     </div>
      <div class="xiang_tit2"><h2><span><img src="images/zhuang2.gif" /></span><%=hotelname%></h2></div>
      <div class="xiang_news"><h2>酒店信息</h2>      	
        <div class="xn_con">
   	    <dl>
          <dt><div style="width:184px;height:138px;overflow:hidden;padding-left:5px;"><a id="mapshow" href="AjaxHotelMap.asp?MapBz=<%=mapbz%>&MapZm=11&hotelname=<%=ec(hotelname)%>&W=685&h=550&iToolTipStyle=3" title="查看酒店地图"><img width="200" height="166" border="0" alt="<%=hotelname&"地图"%>" src="http://www.zhuna.cn/map/200x166/<%=hotelid%>.jpg" /></a></div></dt>
                <dd>
                	<ul>
                      <li><span>酒店星级</span>：<img src="images/star/<%=xingji%>.gif" width="103" height="19"/></li>
                      <%If Hotel(7) Then%>
                      <li><span>商业区域</span>：<a href='<%response.Write(""&webpath&""&relist&"-c"&cityID&"-x0---a0-e1.html?bid="&shangyequid&"")%>' title='查看<%=shangyequ%>的酒店'><%=shangyequ%></a></li>
                      <li><span>酒店地址</span>：<%=address%></li>
                      <li><span>酒店地图</span>：<a href='map.html?hotelname=<%=(hotelname)%>&latlon=<%=mapbz%>&cityid=<%=cityid%>' target="_blank">查看酒店在&ldquo;<%=cityname%>地图&rdquo;上的位置 [查询到酒店的公交线路]</a></li>
                      <%Else%>
                      <li><span>商业区域</span>：<a href='<%response.Write(""&webpath&"hotellist.asp?cityid="&cityID&"&bid="&shangyequid&"")%>'><%=shangyequ%></a></li>
                      <li><span>酒店地址</span>：<%=address%></li>
                      <li><span>酒店地图</span>：<a href='map.asp?hotelname=<%=(hotelname)%>&latlon=<%=mapbz%>&cityid=<%=cityid%>' target="_blank">查看酒店在&ldquo;<%=cityname%>地图&rdquo;上的位置 [查询到酒店的公交线路]</a></li>
                      <%End If%>
                      <li class="list_te">收藏酒店</span>：<a onClick="window.external.AddFavorite('http://<%=domain%><%=webpath%>hotelinfo.asp?cityid=<%=cityid%>&hotelid=<%=hotelid%>', '<%=hotelname%>')" href="javascript:void(0);" target="_self">将&ldquo;<%=hotelname%>&rdquo;保存到我的电脑</a></li>
                    </ul>
                </dd>
          </dl>
        </div>        
        <div class="xnt"><%=replace(content&"","<br/>","")%></div>
      </div>
      <div class="xiangns"><a name="info"></a>
        <div class="room_title">
            <span>入住日期：
            <input name="txtComeDate" type="text" value="<%=session("tm1")%>" id="txtComeDate" class="nmain_hotelin" onClick="javascript:javascript:event.cancelBubble=true;showCalendar('txtComeDate',false,'txtComeDate','txtOutDate','txtOutDate','<%=date()%>','','','','','text','')" style="width:120px;height:13px;" /> 
            <img src="<%=webpath%>images/calendar.gif" width="16" height="19" align="absmiddle" id="btnComeDate" style="CURSOR: hand" border="0" onClick="javascript:event.cancelBubble=true;showCalendar('txtComeDate',false,'txtComeDate','txtOutDate','txtOutDate','<%=date()%>','','','','','text','')" />
				 离店日期：
                 <input name="txtOutDate" type="text" value="<%=session("tm2")%>" id="txtOutDate" class="nmain_hotelin" onClick="javascript:event.cancelBubble=true;showCalendar('txtOutDate',false,'txtOutDate','','','<%=date()%>','','','','','text','')" style="width:120px;height:13px;" /> 
                 <img src="<%=webpath%>images/calendar.gif" width="16" height="19" align="absmiddle" id="btnOutDate" style="CURSOR: hand" border="0" onClick="javascript:event.cancelBubble=true;showCalendar('txtOutDate',false,'txtOutDate','','','<%=date()%>','','','','','text','')" />
                 <input name="ebooking" type="button" value=" " onClick="setdate('<%=cityid%>','<%=hotelid%>','getprice');" class="butt" style="background:url(images/but.gif) no-repeat; border:none; width:55px; height:22px;"/>
            </span>
            <h2>酒店房型与价格</h2>
        </div>
<div id="getprice" style="text-align:center;"><img src='Images/loader.gif'>请稍后,价格查询中...</div>
      </div>
      
<div class="xiang_news">
       <h2>酒店图片</h2>
        <div id="demo">
             <div id="indemo">
                <div id="demo1"><ul><%=hpicshow(10)%></ul></div>
                <div id="demo2"></div>
            </div>
        </div>
</div>
     <div class="sev">
      <ul>
      <%If Hotel(7) Then%>
        <li<%If action="1" Then%> class="chu"<%End If%>><a href="<%response.Write(webpath&rehotel&"-"&cityid&"-"&hotelid)%>.html?action=1#info">基本信息</a></li>
        <li<%If action="2" Then%> class="chu"<%End If%>><a href="<%response.Write(webpath&rehotel&"-"&cityid&"-"&hotelid)%>.html?action=2#info">客人评价</a></li>
        <li<%If action="3" Then%> class="chu"<%End If%>><a href="<%response.Write(webpath&rehotel&"-"&cityid&"-"&hotelid)%>.html?action=3#info">客人提问</a></li>
        <li<%If action="4" Then%> class="chu"<%End If%>><a href="<%response.Write(webpath&rehotel&"-"&cityid&"-"&hotelid)%>.html?action=4#info">酒店地图</a></li>
        <li<%If action="5" Then%> class="chu"<%End If%>><a href="<%response.Write(webpath&rehotel&"-"&cityid&"-"&hotelid)%>.html?action=5#info">附近酒店</a></li>
        <li<%If action="6" Then%> class="chu"<%End If%>><a href="<%response.Write(webpath&rehotel&"-"&cityid&"-"&hotelid)%>.html?action=6#info">酒店图片</a></li>
        <li<%If action="7" Then%> class="chu"<%End If%>><a href="<%response.Write(webpath&rehotel&"-"&cityid&"-"&hotelid)%>.html?action=7#info">促销活动</a></li>
      <%Else%>
        <li<%If action="1" Then%> class="chu"<%End If%>><a href="?action=1&hotelid=<%=hotelid%>&cityid=<%=cityid%>#info">基本信息</a></li>
        <li<%If action="2" Then%> class="chu"<%End If%>><a href="?action=2&hotelid=<%=hotelid%>&cityid=<%=cityid%>#info">客人评价</a></li>
        <li<%If action="3" Then%> class="chu"<%End If%>><a href="?action=3&hotelid=<%=hotelid%>&cityid=<%=cityid%>#info">客人提问</a></li>
        <li<%If action="4" Then%> class="chu"<%End If%>><a href="?action=4&hotelid=<%=hotelid%>&cityid=<%=cityid%>#info">酒店地图</a></li>
        <li<%If action="5" Then%> class="chu"<%End If%>><a href="?action=5&hotelid=<%=hotelid%>&cityid=<%=cityid%>#info">附近酒店</a></li>
        <li<%If action="6" Then%> class="chu"<%End If%>><a href="?action=6&hotelid=<%=hotelid%>&cityid=<%=cityid%>#info">酒店图片</a></li>
        <li<%If action="7" Then%> class="chu"<%End If%>><a href="?action=7&hotelid=<%=hotelid%>&cityid=<%=cityid%>#info">促销活动</a></li>
      <%End If%>
      </ul>
	 </div>
      <div class="scon">
           <%
		   select case action
		   case "1":defaultshow
		   case "2":pinglunshow
		   case "3":wendashow
		   case "4":aroundshow
		   case "5":hotelpiclistshow
		   case "6":hotelpicsshow
		   case "7":hotelonsale
		   case else:defaultshow
		   End Select
		   %>
      </div>
  </div><div class="foot_line"></div>    
  <!--#INCLUDE FILE="INC/Footer.asp"--></div></div>
</body>
</html>
<%Destroy%>
<script>
<!--
var speed=30; //数字越大速度越慢
var tab=document.getElementById("demo");
var tab1=document.getElementById("demo1");
var tab2=document.getElementById("demo2");
tab2.innerHTML=tab1.innerHTML;
function Marquee(){
if(tab2.offsetWidth-tab.scrollLeft<=0)
tab.scrollLeft-=tab1.offsetWidth
else{
tab.scrollLeft++;
}
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() {clearInterval(MyMar)};
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
-->
</script>
<%
Sub defaultshow()
%>
              <%if Traffic<>"" then%><div class="hot_Intro"><h5>交通距离</h5><%=replace(Traffic&"",","," ")%></div><%end if%>
              <%If Not Traffic_zhinan Is Nothing Then%><div class="hot_Intro"><h5>乘车指南</h5><%=replace(Traffic_zhinan.text&"",","," ")%></div><%End If%>
              <%if Service<>"" then%><div class="hot_Intro"><h5>服务设施</h5><%=replace(Service&"",","," ")%></div><%end if%>
              <%if Canyin<>"" then%><div class="hot_Intro"><h5>餐饮设施</h5><%=replace(Canyin&"",","," ")%></div><%end if%>
              <%if Card<>"" then%><div class="hot_Intro"><h5>支持卡类</h5><%=replace(Card&"",","," ")%></div><%end if%>
              <%if yulesheshi<>"" then%><div class="hot_Intro"><h5>娱乐设施</h5><%=replace(yulesheshi&"",","," ")%></div><%end if%>
<%
End Sub
Sub pinglunshow()
            dim addtime,i_commnet
            apiUrl=doserver&"pinglun.asp?u="&agent_id&"&m="&agent_md&"&hid="&hotelid&""
			creathlisturl=webpath&"Database/XML/pinglun/"&replace(webpath,"/","")&"_get-pinglun_"&hotelid&".xml"
			set xml=GetXml(apiUrl,creathlisturl)
			if xml.xml<>"" then
                            Set Rst=xml.documentElement.childNodes
                            for i_commnet=0 to (Rst.Length-1)
                                Response.Write "<div class=""hot_Intro""><h5>"&Rst(i_commnet).getAttribute("yonghu")&" 于 "&Rst(i_commnet).getAttribute("addtime")&" 评价说：</h5>"
                                Response.Write "<div style='color:#333;'>"&Rst(i_commnet).text&"</div>"
                                Response.Write "</div>"
                            next
             End if
             Set Xml=Nothing
End Sub
Sub wendashow()
            dim i_wenda
            apiUrl=doserver&"wenda.asp?u="&agent_id&"&m="&agent_md&"&hid="&hotelid&"&doname="&doname&""
            creathlisturl=webpath&"Database/XML/wenda/"&replace(webpath,"/","")&"_get-wenda_"&hotelid&".xml"
			set xml=GetXml(apiUrl,creathlisturl)
			if xml.xml<>"" then
				Set Rst=xml.documentElement.childNodes
				for i_wenda=0 to (Rst.Length-1)
					Response.Write "<div class=""hot_Intro""><h5>"&Rst(i_wenda).getAttribute("yonghu")&" 于 "&Rst(i_wenda).getAttribute("addtime")&" 提问到：</h5>"
					Response.Write "<font color=#666666>"&split(Rst(i_wenda).text&"{un}","{un}")(0)&"</font>"
					Response.Write "<hr color='#666666' style=' height:1px;'><font style='color:#5e2613;'>回答："&split(Rst(i_wenda).text&"{un}","{un}")(1)&"</font>"
					Response.Write "</div>"
				next
             End if
             Set Xml=Nothing
End Sub
Sub aroundshow()
%>
<div style="border:#CCC 1px solid; text-align:center" id="iframemap">
            <img src='Images/loader.gif' align="absmiddle">请稍后,地图载入中...
            </div>
   <table width="100%" border="0" cellspacing="1" cellpadding="2">
                <tr>
       <%
		dim a_key,a_juli,ik
        apiUrl=doserver&"around.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&hid="&hotelid&""
        creathlisturl=webpath&"Database/XML/around/"&replace(webpath,"/","")&"_get-around_"&cityid&"_"&hotelid&".xml"
		set xml=GetXml(apiUrl,creathlisturl)
		if xml.xml<>"" then
				Set Rst=xml.documentElement.childNodes%>
                </tr>
                <tr>
                  <%For ik=0 To Rst.Length-1
								with Rst(ik)
								a_key=.getAttribute("key")
								a_juli=.getAttribute("juli")
								end with
							%>
                  <td style='border-bottom:1px #CCC dashed;'>约<strong><%=a_juli%></strong>公里至 <%If Hotel(7) Then%><a href='<%response.Write(""&webpath&""&relist&"-c"&cityID&"-x0--"&server.URLEncode(a_key)&"-a0-e1.html")%>'><%Else%><a href='<%response.Write(""&webpath&"hotellist.asp?cityid="&cityID&"&key="&server.URLEncode(a_key)&"")%>'><%=FU.CutStr(a_key,20)%><%End If%></a></td>
                  <%if (ik+1) mod 3=0 then response.Write("</tr><tr>")%>
                  <%Next
					end if
			Set Xml=Nothing
			%>
                </tr>
              </table>
<%
End Sub
Sub hotelpiclistshow()
%>
<div class="rou_hotel"><%=hotelpiclist(10,Cityid,hotelid,2)%></div>
<%
End Sub
Sub hotelpicsshow()
%>
 <div class="info_p">
        <h2>酒店图片</h2>
        <ul>
		<%dim i
        for i=0 to ubound(hpicmin)-1
        %>
        <li><img src="<%=hpicmin(i)%>" width="122" height="91" /><%=hpictxt(i)%></li>
        <%next%>
        </ul> 	
        </div>
    <%If hotel(12)=1 Then
		Dim picnum,hpicmax
        apiUrl=doserver&"hotelphoto.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&hid="&hotelid&""
        creathlisturl=webpath&"Database/XML/hotelphotos/"&replace(webpath,"/","")&"_get-hotelphoto_"&cityid&"_"&hotelid&".xml"
		set xml=GetXml(apiUrl,creathlisturl)

		if xml.xml<>"" then
		Set Rst=xml.documentElement.getElementsByTagName("Picture")
		If not Rst is Nothing Then
		picnum=Rst(0).getAttribute("hpicnum")
		hpicmin=split(Rst(0).getAttribute("hpicmin"),",")
		hpicmax=split(Rst(0).getAttribute("hpicmax"),",")
		hpictxt=split(Rst(0).getAttribute("hpictxt"),",")
		if picnum<>"" Then%>
         <div class="info_p">
         <h2>客人实拍酒店图片</h2>  
          	<div id="rou_hotel">
            <ul>
        <%
		for i=0 To picnum-1%>
            <li><a href="<%=hpicmax(i)%>" rel="gal"><img src="<%=hpicmin(i)%>" width="122" height="91" /><%=hpictxt(i)%></a></li>
        <%Next%>
		</ul>
            </div></div>
		<%
		End If
		End If
		Set Rst=Nothing
		End If
		Set Xml=Nothing
		End If%>
<%
End Sub
Sub hotelonsale()
%>
<div class="rou_hotel">
 <%
		dim cuxiao_title,ik,cuxiao_content,cuxiao_hotelname,cuxiao_cityid,cuxiao_time1
		dim cuxiao_time2,apiUrl,http,backXml,xml,Rst,cuxiaohotelid,root,totalpage,creathlisturl
        apiUrl=doserver&"cuxiao.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&pagesize=10&pg=1&hid="&hotelid
        creathlisturl=webpath&"Database/XML/cuxiao/"&replace(webpath,"/","")&"_cuxiao_"&cityid&"_1_"&hotelid&".xml"
		set xml=GetXml(apiUrl,creathlisturl)
		if xml.xml<>"" then
							set root=xml.documentElement
							Set Rst=xml.documentElement.childNodes
							If Rst.Length>0 Then
								For ik=0 To Rst.Length-1
									with Rst(ik)
										cuxiao_title=.getAttribute("title")
										cuxiao_hotelname=.getAttribute("hotelname")
										cuxiao_cityid=.getAttribute("cityid")
										cuxiao_time1=.getAttribute("kaishi")
										cuxiao_time2=.getAttribute("jieshu")
										cuxiaohotelid=.getAttribute("hotelid")
										cuxiao_content=.text
									end with%>
          <div class="activ"><h4><%=cuxiao_title%></h4>
          	<ul>
            	<li class="dat_f">促销日期：<%=cuxiao_time1%> 至 <%=cuxiao_time2%></li>
                <li class="dat_con"><%=cuxiao_content%> </li>
            </ul>
          </div>
			<%Next
			Else
			response.Write("&nbsp;&nbsp;&nbsp;&nbsp;对不起！"&HotelName&"暂无促销信息！")
			End If
			End if
			Set Xml=Nothing
			%>
</div>
<%
End Sub
%>