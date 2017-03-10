<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim rurl,cityid,cityname,SQL,Rs%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=doname%>-<%=webkeyword%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
  	<div class="content">
   	  <div class="fg">
          <div class="main_cha">
            <iframe id="SearchID" width="430" height="100" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=446&uid=<%=agent_id%>&cid=<%=uncityid%>&box=1,4&order=2&searchurl=<%=domain%>&target=_top<%=rurl%>&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
            <div class="c_near">
<%If Hotel(7) Then%>
      常用搜索：<a href="<%=webpath%>school.html<%if cityid<>"" then response.Write("?cityid="&cityid&"")%>"><%=cityname%>大学附近酒店</a> <a href="<%=webpath%>zhanguan.html<%if cityid<>"" then response.Write("?cityid="&cityid&"")%>"><%=cityname%>展馆附近酒店</a> <a href="<%=webpath%>jiaotong.html?lei=2<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>"><%=cityname%>汽车站附近酒店</a> <a href="<%=webpath%>jiaotong.html?lei=1<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>"><%=cityname%>火车站附近酒店</a> <a href="<%=webpath%>jiaotong.html?lei=3<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>"><%=cityname%>机场附近酒店</a><%if instr("北京,上海,广州,深圳,南京,天津",cityname&"")>=1 then%> <a href="<%=webpath%>ditie.html"><%=cityname%>地铁站附近酒店<font color="#FF3300">[新]</font></a><%end if%>
<%Else%>        
      常用搜索：<a href="<%=webpath%>school.asp<%if cityid<>"" then response.Write("?cityid="&cityid&"")%>"><%=cityname%>大学附近酒店</a> <a href="<%=webpath%>zhanguan.asp<%if cityid<>"" then response.Write("?cityid="&cityid&"")%>"><%=cityname%>展馆附近酒店</a> <a href="<%=webpath%>jiaotong.asp?lei=2<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>"><%=cityname%>汽车站附近酒店</a> <a href="<%=webpath%>jiaotong.asp?lei=1<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>"><%=cityname%>火车站附近酒店</a> <a href="<%=webpath%>jiaotong.asp?lei=3<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>"><%=cityname%>机场附近酒店</a><%if instr("北京,上海,广州,深圳,南京,天津",cityname&"")>=1 then%> <a href="<%=webpath%>ditie.asp"><%=cityname%>地铁站附近酒店<font color="#FF3300">[新]</font></a><%end if%>
<%End If%>
            </div>
          </div>
      <div class="gg_change">
      <script type="text/javascript">
		var swf_width=248
		var swf_height=200
		var files="bcastr.xml"
		document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
		document.write('<param name="movie" value="bcastr.swf"><param name="quality" value="high">');
		document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
		document.write('<param name="FlashVars" value="bcastr_xml_url='+files+'">');
		document.write('<embed src="bcastr.swf" wmode="opaque" FlashVars="bcastr_xml_url='+files+'" menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>');
	</script>
      </div></div>              
      <div class="hot_hotel">
      <div id="tags"><h2><span>
        <%
		 dim tagcityidsplit,itag,defaultCity,defaultCityName
		 tagcityidsplit=split(tagcityid,",")
		 If ubound(tagcityidsplit)>0 Then
			 for itag=0 to ubound(tagcityidsplit)
			 If itag=0 Then defaultCity=split(tagcityidsplit(itag),"|")(0):defaultCityName=split(tagcityidsplit(itag),"|")(1)
			 %>
			<a <%if itag=0 then response.Write(" class='hhtc'")%> href="javascript:void(0);" onClick="loadcs(<%=split(tagcityidsplit(itag),"|")(0)%>,'<%=split(tagcityidsplit(itag),"|")(1)%>',this)"><%=split(tagcityidsplit(itag),"|")(1)%></a>
			<%next
		Else
			defaultCity=split(tagcityid,"|")(0):defaultCityName=split(tagcityid,"|")(1)%>
        	<a class="hhtc" href="javascript:void(0);" onClick="loadcs(<%=split(tagcityid,"|")(0)%>,'<%=split(tagcityid,"|")(1)%>',this)"><%=split(tagcityid,"|")(1)%></a>
		<%End If%>
      </span>
      <img src="images/load.gif" id="loadimg" alt="正在加载酒店信息..." style="display:none"/></h2></div>
		<div id="tagcontent">
    	<div class="ht_pic">
        	<ul>
            <%=gethotellist("",10,defaultCity,0,"1","",1,10,1)%>
           </ul>
        </div>
        <!--begin-->   
        <div class="ht">
       	  <div class="ht_tex"><h4><span><%If Hotel(7) Then%><a href='<%=webpath&relist%>-c<%=defaultCity%>-x0---a2-e1.html?minprice=1&maxprice=200'><%Else%><a href='<%=webpath%>hotellist.asp?cityid=<%=defaultCity%>&minprice=1&maxprice=200&px=2'><%End If%>更多>></a></span><%=defaultCityName%>200元以下酒店预订</h4>
                <ul><%=gethotellist("",5,defaultCity,0,"1","200",2,20,2)%></ul>
       	  </div>
            <div class="ht_tex"><h4><span><%If Hotel(7) Then%><a href='<%=webpath&relist%>-c<%=defaultCity%>-x0---a2-e1.html?minprice=200&maxprice=400'><%Else%><a href='<%=webpath%>hotellist.asp?cityid=<%=defaultCity%>&minprice=200&maxprice=400&px=2'><%End If%>更多>></a></span><%=defaultCityName%>200-400元以下酒店预订</h4>
                 <ul><%=gethotellist("",5,defaultCity,0,"200","400",2,20,2)%></ul>          
       	  </div>
            <div class="ht_tex"><h4><span><%If Hotel(7) Then%><a href='<%=webpath&relist%>-c<%=defaultCity%>-x3---a2-e1.html'><%Else%><a href='<%=webpath%>hotellist.asp?cityid=<%=defaultCity%>&rank=3'><%End If%>更多>></a></span><%=defaultCityName%>三星级酒店预订</h4>
                   <ul><%=gethotellist("",5,defaultCity,"rank_3","","",1,20,2)%></ul>         
        	</div>
            <div class="ht_tex"><h4><span><%If Hotel(7) Then%><a href='<%=webpath&relist%>-c<%=defaultCity%>-x2---a2-e1.html'><%Else%><a href='<%=webpath%>hotellist.asp?cityid=<%=defaultCity%>&rank=2'><%End If%>更多>></a></span><%=defaultCityName%>经济型酒店预订</h4>
                    <ul><%=gethotellist("",5,defaultCity,"rank_2","","",1,20,2)%></ul>         
        	</div>
            <%=cbd_hotellist(defaultCity,2,0)%>
        </div>
        <!--End-->
        </div>
      </div>
  	</div>
    <div class="side">
    
   	  <div class="news">
      <h2><a href="<%If Hotel(7) Then%>News.html<%Else%>News.asp<%End If%>">最新资讯</a></h2>
   <%
	  SQL="Select top 1 Article_ID,Article_ClassID,Article_Title,Article_Content,Article_ViewImg From ZN_"&D("Article")&" Where Article_State_Radio=3 Order By Article_Order desc,Article_ID desc"
	  Set Rs=DB.Execute(SQL)
	  If Not Rs.Eof Then%>
        <dl>
       	  <dt><a href="<%If Hotel(7) Then%>NewsInfo-<%=Rs("Article_Id")%>-<%=Rs("Article_Classid")%>.html<%Else%>NewsInfo.asp?Classid=<%=Rs("Article_Classid")%>&id=<%=Rs("Article_Id")%><%End If%>" target="_blank" title="<%=Rs("Article_Title")%>"><img src="<%=Rs("Article_ViewImg")%>" width="90" height="66" border="0" /></a></dt>
          <dd class="zix_t"><strong><a href="<%If Hotel(7) Then%>NewsInfo-<%=Rs("Article_Id")%>-<%=Rs("Article_Classid")%>.html<%Else%>NewsInfo.asp?Classid=<%=Rs("Article_Classid")%>&id=<%=Rs("Article_Id")%><%End If%>" target="_blank" title="<%=Rs("Article_Title")%>"><%=FU.CutStr(Rs("Article_Title"),13)%></a></strong></dd><dd><span><%=FU.CutStr(FU.RemoveHtml(Rs("Article_Content")),50)%></span></dd>
      	</dl>
       <%End If
	   Rs.Close:Set Rs=Nothing%>
       	   <div class="new_xiang">
                <ul>
                <%SQL="Select top 5 Article_ID,Article_ClassID,Article_Title From ZN_"&D("Article")&" Where Article_State_Radio=2 Order By Article_Order desc,Article_ID desc"
				response.Write(NewsList(SQL,32,1,0))%>
               </ul>
       	</div>
      </div>   
         
      <div class="lian_h"><h2>全国著名连锁酒店</h2>
      	<ul>
         <%=getchain(0,12)%>
        </ul>
      </div>
      <div class="lian_up">
      	<h2>人气酒店推荐</h2>
      	<ul>
           <%=gethotellist("",8,uncityid,0,"1","",4,13,2)%>                  
        </ul>
      </div>
      <div class="lian_up">
      	<h2>最新上线酒店</h2>
      	<ul>
          <%=gethotellist("",7,uncityid,0,"1","",1,13,2)%>                    
        </ul>
      </div>
    </div>
  </div>  
<div style="clear:both"></div>
<div class="fri"><h2><a href="FriendLink.asp">更多>></a>友情链接</h2>
    <div class="fri_con">
<%SQL="Select Top 8 FriendLink_ID,FriendLink_Title,FriendLink_Link,FriendLink_BeginTime,FriendLink_EndTime,FriendLink_uploadfile,FriendLink_externallinks,FriendLink_Type_radio From ZN_"&D("FriendLink")&" Where FriendLink_Type_radio<>1 And FriendLink_State_radio<>3 And IIf(FriendLink_State_radio=1,(now BETWEEN FriendLink_BeginTime and FriendLink_EndTime),-1)=-1 Order By FriendLink_order Desc,FriendLink_Id Desc"
Set Rs=DB.Execute(SQL)
If Not Rs.Eof Then
	While Not Rs.Eof
		%>
		 <a href="<%=Rs("FriendLink_Link")%>" target="_blank" title="<%=Rs("FriendLink_Title")%>"><img width="88" height="31" src="<%if Rs("FriendLink_Type_radio")=2 Then
		 response.Write(Rs("FriendLink_uploadfile"))
		 Else
		 response.Write(Rs("FriendLink_externallinks"))
		 End If%>" border="0" alt="<%=Rs("FriendLink_Title")%>" /></a>
		<%
	Rs.MoveNext
	Wend
End If
Rs.Close:Set Rs=Nothing%>
   </div>
    <div class="int">
	<%SQL="Select Top 40 FriendLink_ID,FriendLink_Title,FriendLink_Link,FriendLink_BeginTime,FriendLink_EndTime From ZN_"&D("FriendLink")&" Where FriendLink_Type_radio=1 And FriendLink_State_radio<>3 And IIf(FriendLink_State_radio=1,(now BETWEEN FriendLink_BeginTime and FriendLink_EndTime),-1)=-1 Order By FriendLink_order Desc,FriendLink_Id Desc"
Set Rs=DB.Execute(SQL)
If Not Rs.Eof Then
	While Not Rs.Eof
		%>
		 <a href="<%=Rs("FriendLink_Link")%>" target="_blank" title="<%=Rs("FriendLink_Title")%>"><%=FU.CutStr(Rs("FriendLink_Title"),14)%></a>
		<%
	Rs.MoveNext
	Wend
End If
Rs.Close:Set Rs=Nothing%>
</div>
  </div>  
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>