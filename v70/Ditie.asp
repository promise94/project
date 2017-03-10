<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim cityid,cityname%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>北京、上海等城市地铁附近宾馆酒店预订-<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>.cit_ss table tr td img{ border:1px #CCC solid; padding:3px;}</style>
<script type="text/javascript" src="http://un.zhuna.cn/javascript/Search.js"></script>
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
	<div class="side_list">
       <div class="lian_up">
        <h2><%=cityname%>酒店搜索</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=uncityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_h">
        <h2><%=cityname%>连锁酒店</h2>
    	 <ul><%=getchain(uncityid,9)%></ul>
      </div>
    </div>
    <div class="list_con">
        <div class="news1"><a href="<%=webpath%>">首页</a> >> <%If Hotel(7) Then%><a href="<%=webpath%>ditie.html"><%Else%><a href="<%=webpath%>ditie.asp">全国地铁站路线以及站点附近酒店</a><%End If%></div>
         <div class="news2">
            <h2>全国地铁站附近酒店快速搜索</h2>
                <div class="new3">
                 <form action="<%=webpath%>s/" method="get" name="school" target="_blank">
              <select id="pid">
          <option value="" selected="selected">请选省</option>
        </select> 
            <select name="cid" id="cid" >
            <option value="" selected="selected">选择市</option>
        </select> 
            <input name="k1" type="text" id="k1" title="酒店位置 例如：长安街" value="王府井地铁站" onfocus="this.value=''"/>
            <input type="submit" value="搜地铁" class="butt3"/>
            </form></div>
          </div>
          <div class="news2">
            <h2>全国地铁城市大全</h2>     
            <div class="new4">
         <table width="100%" border="0" cellspacing="0" cellpadding="4">
			  <tr>
			    <td align="center"><a href="<%=webpath%>special/ditie/beijing.asp" target="_blank"><img src="special/ditie/images/bjditie_1.gif" width="320" height="168" /></a></td>
			    <td align="center"><a href="<%=webpath%>special/ditie/shanghai.asp" target="_blank"><img src="special/ditie/images/mainbgsh_1.gif" width="320" height="168" /></a></td>
		      </tr>
			  <tr>
			    <td align="center"><a href="<%=webpath%>special/ditie/guangzhou.asp" target="_blank"><img src="special/ditie/images/mainbggz_1.gif" width="320" height="168" /></a></td>
			    <td align="center"><a href="<%=webpath%>special/ditie/shenzhen.asp" target="_blank"><img src="special/ditie/images/mainbgsz_1.gif" width="320" height="168" /></a></td>
		      </tr>
			  <tr>
			    <td align="center"><a href="<%=webpath%>special/ditie/tianjin.asp" target="_blank"><img src="special/ditie/images/mainbgtj_1.gif" width="320" height="168" /></a></td>
			    <td align="center"><a href="<%=webpath%>special/ditie/nanjing.asp" target="_blank"><img src="special/ditie/images/mainbgnj_1.gif" width="320" height="168" /></a></td>
		      </tr>
		    </table>
      </div>  
    </div>
    </div>
  </div>
  <!--#INCLUDE FILE="INC/Footer.asp"-->
<script language="javascript">loadCity('pid','cid',<%=uncityid%>);</script>
</div>
</body>
</html>
<%Destroy%>