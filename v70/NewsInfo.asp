<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<!--#INCLUDE FILE="module/YeatPage/Zhuna_vbsPage.asp"-->
<%
GetClassDict

dim classid,classname,ModuleName,id,SQL,Rs
dim title,content,author,AddDate,ViewNum
ModuleName=D("Article")
classid=FU.CheckRequest("classid",0)
id=FU.CheckRequest("id",0)
If classid="" And id="" Then response.Write("ȱ�ٲ�����"):Response.End()
If classid>0 then
classname=D("Class_"&classid)
End If

SQL="Select Article_ID,Article_ClassID,Article_Title,Article_content,Article_Author,Article_Order,Article_State_Radio,Article_AddDate,Article_ViewNum From ZN_"&ModuleName&" Where Article_ID="&id&" And Article_State_Radio>0"
Set Rs=DB.Recordset(SQL,1,3)
If Rs.Eof Or Rs.Bof Then
	response.Write("�����鿴�����²����ڻ����Ѿ���ɾ����")
	response.End()
Else
	title=Rs("Article_Title")
	content=Rs("Article_content")
	author=Rs("Article_Author")
	AddDate=Rs("Article_AddDate")
	ViewNum=Rs("Article_ViewNum")+1
	Rs("Article_ViewNum")=Rs("Article_ViewNum")+1
	Rs.update
End If
Rs.Close:Set Rs=Nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=title%>-<%=classname%>��Ѷ - <%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
     <%ShowAD 1,"advertise"%>
     <div class="lian_up">
        <h2>�Ƶ�����</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=uncityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_up">
        <h2>�ȵ�<%=classname%></h2>
       	<ul><%response.Write(NewsList("Select top 10 Article_ID,Article_ClassID,Article_Title From ZN_"&D("Article")&" Where Article_State_Radio>0 And Article_ClassID="&classid&" Order By Article_ViewNum desc,Article_Order desc,Article_ID desc",30,0,0))%></ul>
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
    </div>
    <div class="list_con">
        <div class="news1"><a href="<%=webpath%>">��ҳ</a> >> <%if Hotel(7) Then%><a href="<%=webpath%>News.html">��Ѷ</a>>><a href="<%=webpath%>News-<%=Classid%>.html"><%=classname%></a><%Else%><a href="<%=webpath%>News.asp">��Ѷ</a>>><a href="<%=webpath%>News.asp?classid=<%=Classid%>"><%=classname%></a><%End If%>>><%=title%></div>
		<div class="news2">
    		<h2><%=classname%></h2>     
            <div class="new4">
            <h1><%=title%></h1>
            <h6><%=AddDate%>��</h6>
            <h3>���ߣ�<span><%=author%>&nbsp;&nbsp;���������<%=ViewNum%></span></h3>
            <div class="newinc"><%=Replace(content&" ","[ZN_IMAGE_PATH]",ItemPath)%></div>
            </div></div>
    </div>
  </div>
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>