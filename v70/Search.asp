<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim rurl,cityid,cityname%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ȫ���Ƶ�����_ȫ���ؼ۾Ƶ�Ԥ��_<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
<div class="main_content2">
      <h2>���ͼ�Ԥ��ȫ��4,000��Ҿ����;Ƶ�</h2>
      <div class="search">
        <p><iframe id="SearchID" width="700" height="190" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=700&uid=<%=agent_id%>&border=1&bColor=cccccc&title=%u9152%u5E97%u9AD8%u7EA7%u67E5%u8BE2&tColor=f1f1f1&cid=<%=uncityid%>&box=1,2,3,4&order=2&searchurl=<%=domain%>&target=_top<%=rurl%>&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe></p>
        <p><span><font color="#666666">������ͨ�����������ѯ��Ҫ�ľƵ� ���磺���ұ����찲�Ÿ�����7�������Ƶ� �����ر�&ldquo;<a href='hotellist.asp?cityid=53&key=�찲��'>�찲��</a>&rdquo; �ؼ���&ldquo;<a href='hotellist.asp?cityid=53&hn=7��'>7��</a>&rdquo;</font></span></p></div>
    </div>
  </div>   
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>