<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<!--#INCLUDE FILE="module/YeatPage/Zhuna_vbsPage.asp"-->
<%
dim SQL,Rs
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�������� - <%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
     <div class="lian_up">
        <h2>�Ƶ�����</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=uncityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_up">
        <h2>�ȵ�����</h2>
        	<ul><%response.Write(NewsList("Select top 10 Article_ID,Article_ClassID,Article_Title From ZN_"&D("Article")&" Where Article_State_Radio>0 Order By Article_ViewNum desc,Article_Order desc,Article_ID desc",32,1,0))%></ul>
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
    <div class="fri_more"><h2>��������</h2>  	
    	<div class="fri_pic"><h3>ͼƬ����</h3>
        	<ul>
<%SQL="Select FriendLink_ID,FriendLink_Title,FriendLink_Link,FriendLink_BeginTime,FriendLink_EndTime,FriendLink_uploadfile,FriendLink_externallinks,FriendLink_Type_radio From ZN_"&D("FriendLink")&" Where FriendLink_Type_radio<>1 And FriendLink_State_radio<>3 And IIf(FriendLink_State_radio=1,(now BETWEEN FriendLink_BeginTime and FriendLink_EndTime),-1)=-1 Order By FriendLink_order Desc,FriendLink_Id Desc"
Set Rs=DB.Execute(SQL)
If Not Rs.Eof Then
	While Not Rs.Eof
		%>
		 <li><a href="<%=Rs("FriendLink_Link")%>" target="_blank" title="<%=Rs("FriendLink_Title")%>"><img width="88" height="31" src="<%if Rs("FriendLink_Type_radio")=2 Then
		 response.Write(Rs("FriendLink_uploadfile"))
		 Else
		 response.Write(Rs("FriendLink_externallinks"))
		 End If%>" border="0" alt="<%=Rs("FriendLink_Title")%>" /></a></li>
		<%
	Rs.MoveNext
	Wend
End If
Rs.Close:Set Rs=Nothing%>
            </ul>
        </div>
        <div class="fri_pic"><h3>��������</h3>
        	<ul class="fri_tex">
<%SQL="Select FriendLink_ID,FriendLink_Title,FriendLink_Link,FriendLink_BeginTime,FriendLink_EndTime,FriendLink_uploadfile,FriendLink_externallinks,FriendLink_Type_radio From ZN_"&D("FriendLink")&" Where FriendLink_Type_radio=1 And FriendLink_State_radio<>3 And IIf(FriendLink_State_radio=1,(now BETWEEN FriendLink_BeginTime and FriendLink_EndTime),-1)=-1 Order By FriendLink_order Desc,FriendLink_Id Desc"
Set Rs=DB.Execute(SQL)
If Not Rs.Eof Then
	While Not Rs.Eof
		%>
		 <li> <a href="<%=Rs("FriendLink_Link")%>" target="_blank" title="<%=Rs("FriendLink_Title")%>"><%=FU.CutStr(Rs("FriendLink_Title"),14)%></a></li>
		<%
	Rs.MoveNext
	Wend
End If
Rs.Close:Set Rs=Nothing%>
            </ul>
        </div>
  </div>
  </div>  

<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>