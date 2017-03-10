<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim rurl,cityid,cityname%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>全国酒店搜索_全国特价酒店预订_<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
<div class="main_content2">
      <h2>超低价预订全国4,000多家经济型酒店</h2>
      <div class="search">
        <p><iframe id="SearchID" width="700" height="190" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=700&uid=<%=agent_id%>&border=1&bColor=cccccc&title=%u9152%u5E97%u9AD8%u7EA7%u67E5%u8BE2&tColor=f1f1f1&cid=<%=uncityid%>&box=1,2,3,4&order=2&searchurl=<%=domain%>&target=_top<%=rurl%>&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe></p>
        <p><span><font color="#666666">您可以通过组合搜索查询需要的酒店 例如：查找北京天安门附近的7天连锁酒店 附近地标&ldquo;<a href='hotellist.asp?cityid=53&key=天安门'>天安门</a>&rdquo; 关键词&ldquo;<a href='hotellist.asp?cityid=53&hn=7天'>7天</a>&rdquo;</font></span></p></div>
    </div>
  </div>   
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>