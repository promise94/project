<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<!--#INCLUDE FILE="module/YeatPage/Zhuna_vbsPage.asp"-->
<%
GetClassDict

dim classid,classname,ModuleName,Where
ModuleName=D("Article")
classid=FU.CheckRequest("classid",0)
Where=" Article_State_Radio>0"
If classid>0 then
classname=D("Class_"&classid)
Where=Where&" And Article_ClassID="&classid
End If
if classname="" Then classname="ȫ����Ѷ"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=classname%> - <%=doname%></title>
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
        <h2><%=classname%></h2>
        	<ul><%response.Write(NewsList("Select top 10 Article_ID,Article_ClassID,Article_Title From ZN_"&D("Article")&" Where "&Where&" Order By Article_ViewNum desc,Article_Order desc,Article_ID desc",30,1,0))%></ul>
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
	<div class="news1"><a href="<%=webpath%>">��ҳ</a> >> <%if Hotel(7) Then%><a href="<%=webpath%>News.html">��Ѷ</a><%Else%><a href="<%=webpath%>News.asp">��Ѷ</a><%End If%><%If classname<>"" Then%>>><%=classname%><%End If%></div>
   	  <div class="news2">
   	    <h2>��Ѷ</h2>
            <div class="new3 news_zixun">
			<%Dim Str,ho
			Str=Application(cachename&"Class_str")
			If Str<>"" Then
				Str=Split(Str,",")
				If ubound(Str)>0 Then
					For Each Ho In Str
						If Hotel(7) Then
							response.Write("<a href=""News-"&split(ho,"|")(0)&".html"" title="""&split(ho,"|")(1)&""">["&split(ho,"|")(1)&"]</a>")
						Else
							response.Write("<a href=""?Classid="&split(ho,"|")(0)&""" title="""&split(ho,"|")(1)&""">["&split(ho,"|")(1)&"]</a>")
						End If
					Next
				Else
					If Hotel(7) Then
						response.Write("<a href=""News-"&split(Str(0),"|")(0)&".html"" title="""&split(Str(0),"|")(1)&""">["&split(Str(0),"|")(1)&"]</a>")
					Else
						response.Write("<a href=""?Classid="&split(Str(0),"|")(0)&""" title="""&split(Str(0),"|")(1)&""">["&split(Str(0),"|")(1)&"]</a>")
					End If
				End If
			End If%>
            </div>  
   	  </div>
      <div class="news2">
   	    <h2>ͼƬ��Ѷ</h2>
            <div class="new2 news_zixun"><ul>
			<%response.Write(NewsList("Select top 12 Article_ID,Article_ClassID,Article_Title,Article_ViewImg From ZN_"&D("Article")&" Where Article_State_Radio=3 Order By Article_Order desc,Article_ID desc",32,1,1))%></ul>
            </div>
   	  </div>
   	  <div class="news2">
            <h2><%=classname%></h2>     
            <div class="new4">
            <ul>
<%Dim orss,Rs,NullMSG:NullMSG=False
Set orss=new Zhuna_vbsPage
Set orss.Conn=DB.OutConn
With orss
	.PageSize=20
	.PageName="Pages"
	.DbType="AC"
	.RecType=-1
	.JsUrl="module/YeatPage/"
	.Pkey="Article_ID"	
	.Field="Article_ID,Article_ClassID,Article_Title,Article_Order,Article_State_Radio,Article_Adddate"
	.Table="ZN_"&ModuleName
	.Condition=Where
	.OrderBy="Article_Order desc,Article_ID desc"
End With
Rs=orss.ResultSet()
If IsNull(Rs) Then
NullMSG=True
Else
Dim Cols,iCount,i,j
cols=1
icount=ubound(Rs,2)
if icount mod cols = 0 then icount=icount+1
for i=0 to icount step cols
for j=0 to cols-1
if (i+j)<=ubound(rs,2) then
%>          
<li><span><%=rs(5,i+j)%></span>
<%If Hotel(7) Then%>
<a href="<%=webpath%>News-<%=rs(1,i+j)%>.html">[<%=D("Class_"&rs(1,i+j))%>]</a>&nbsp;<a href="<%=webpath%>NewsInfo-<%=rs(0,i+j)%>-<%=rs(1,i+j)%>.html"><%=rs(2,i+j)%></a>
<%Else%>
<a href="News.asp?classid=<%=rs(1,i+j)%>">[<%=D("Class_"&rs(1,i+j))%>]</a>&nbsp;<a href="NewsInfo.asp?id=<%=rs(0,i+j)%>&classid=<%=rs(1,i+j)%>"><%=rs(2,i+j)%></a>
<%End If%>
</li>

<%
end if
next
next
End If
%>
            </ul>
          </div>
          <%orss.ShowPage()%>
      </div>  
    </div>
  </div>  

<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>