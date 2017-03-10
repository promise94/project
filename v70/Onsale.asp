<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
dim cityname,cityid,page,hotelid
cityid=request("cityid")*1
hotelid=request("hotelid")*1
if cityid>=1 then cityname=getcityname(cityid)
page=request("pg")*1
if page=0 then page=1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=cityname%>促销活动 <%=month(date())%>月份促销酒店预订 - <%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://un.zhuna.cn/javascript/Search.js"></script>
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
	<div class="news1"><a href="<%=webpath%>">首页</a> >> <%if Hotel(7) Then%>
    <a href="<%=webpath%>Onsale.html">促销活动</a>
	<%if cityid<>0 then%>
    >> <a href="<%=webpath%>Onsale_<%=cityid%>.html"><%=cityname%></a>
	<%End If
	Else%>
    <a href="<%=webpath%>Onsale.asp">促销活动</a>
	<%if cityid<>0 then%>
    >> <a href="<%=webpath%>Onsale.asp?cityid=<%=cityid%>"><%=cityname%></a>
	<%End If
	End If%></div>
   	  <div class="news2">
   	    <h2>按照城市查找:</h2>
      <div class="new3">
       <select id="pid">
          <option value="" selected="selected">请选省</option>
        </select> 
       <select name="cityid" id="CityID" onChange="city1_change('CityID','HuoDID');">
            <option value="" selected="selected">选择市</option>
        </select> 
       <select style="width: 260px;" id="HuoDID" name="HuoDID">
        <option value="" selected="selected">请选择酒店</option>
        </select>
        <input name="button" class="btn04" id="button" value="查找" onClick="sohuodong();" type="submit">
      </div>  
   	  </div>
   	  <div class="news2">
            <h2><%=cityname%>近期举行的促销活动</h2>     

        <%
		dim cuxiao_title,ik,cuxiao_content,cuxiao_hotelname,cuxiao_cityid,cuxiao_time1
		dim cuxiao_time2,apiUrl,http,backXml,xml,Rst,cuxiaohotelid,root,totalpage,creathlisturl
        apiUrl=doserver&"cuxiao.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&pagesize=10&pg="&page&"&hid="&hotelid
		If hotelid=0 Then
        	creathlisturl=webpath&"Database/XML/cuxiao/"&replace(webpath,"/","")&"_cuxiao_"&cityid&"_"&page&".xml"
		Else
			creathlisturl=webpath&"Database/XML/cuxiao/"&replace(webpath,"/","")&"_cuxiao_"&cityid&"_"&page&"_"&hotelid&".xml"
		End If
		set xml=GetXml(apiUrl,creathlisturl)
		if xml.xml<>"" then
							set root=xml.documentElement
								totalput=root.getAttribute("total")
								totalpage=root.getAttribute("maxPage")
							Set Rst=xml.documentElement.childNodes
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
            	<li class="dat_t">促销酒店：<%If Hotel(7) Then%><a href="<%=webpath%><%=rehotel%>-<%=cuxiao_cityid%>-<%=cuxiaohotelid%>.html" target="_blank"><%Else%><a href="<%=webpath%>hotelinfo.asp?cityid=<%=cuxiao_cityid%>&hotelid=<%=cuxiaohotelid%>" target="_blank"><%End If%><%=cuxiao_hotelname%></a></li>
            	<li class="dat_f">促销日期：<%=cuxiao_time1%> 至 <%=cuxiao_time2%></li>
                <li class="dat_con"><%=cuxiao_content%><span><%If Hotel(7) Then%><a href="<%=webpath%><%=rehotel%>-<%=cuxiao_cityid%>-<%=cuxiaohotelid%>.html" target="_blank"><%Else%><a href="<%=webpath%>hotelinfo.asp?cityid=<%=cuxiao_cityid%>&hotelid=<%=cuxiaohotelid%>" target="_blank"><%End If%>我要预订</a></span> </li>
            </ul>
          </div>
			<%Next
			End if
			Set Xml=Nothing
			%>
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
				vpage=""&webpath&"onsale-"&cityid&"-"&hotelid&"-"&page&".html"
			Else
                vpage=""&webpath&"onsale.asp?cityid="&cityid&"&pg="&page&"&hotelid="&hotelid
            End If
			end function
            %>
      </div>  
    </div>
  </div>  
  </div>
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<script language="javascript">
function city(s1,s2,s3)
{
	xmlHttp('getonsalehotel.asp?cityId='+s1,function(v1){sfs(v1,s2,s3)});	
}
function sfs(v1,s2,s3){
	var s2=document.getElementById(s2);
	var s3=s3
	s2.length=0;
	var sA1=v1.split("|");
	for(i=0;i<sA1.length;i++)
	{
	  var sA2=sA1[i].split(",");
		if(sA2[0]==s3){
		s2.options.add(new Option(sA2[1],sA2[0]));
		s2.options[i].selected = true;
		}
		else{
		s2.options.add(new Option(sA2[1],sA2[0]));
		}
	}
}
function getSelectValue(id)
{
	var oSel = document.getElementById(id);
	return oSel.options[oSel.selectedIndex].value;
}
function city1_change(cc1,cc2)
{
	city(getSelectValue(cc1),cc2);
}
function sohuodong(){
	var ccid=_g("CityID").value;chid=_g("HuoDID").value;
	if(ccid==''){ccid=0};
	if(chid==''){chid=0};
	<%If hotel(7) Then%>
	window.location='Onsale-'+ccid+'-'+chid+'-0.html';
	<%Else%>
	window.location='Onsale.asp?cityid='+ccid+'&hotelid='+chid+'';
	<%End If%>
}
loadCity('pid','CityID',<%if cityid<>"" then response.Write cityid else response.Write("0")%>);
</script>
<%If hotelid<>"" and cityid<>"" Then%>
<script language="JavaScript" defer="defer">
city(<%=cityid%>,"HuoDID",<%=hotelid%>);
</script>
<%End If%>
<%Destroy%>