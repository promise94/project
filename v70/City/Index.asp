<!--#include file="../inc/conn.asp" -->
<%Const ItemPath="../"%>
<!--#include file="../inc/Main_function.asp" -->
<!--#include file="../inc/function.asp" -->
<%dim cityid,cityname,rurl,city_liansuo,SQL,Rs
cityid=request.QueryString("cityid")*1
if cityid=0 then cityid=uncityid
cityname=getcityname(cityid)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=cityname%>�Ƶ�Ԥ��_<%=cityname%>���ݲ�ѯ_<%=cityname%>�����;Ƶ�Ԥ��-<%=doname%></title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="../inc/Header.asp"-->
  <div class="mainContent">
    <div class="content">
        <div class="fg">
            <div class="index2">
              <div class="c_in"><iframe id="SearchID" width="664" height="104" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=664&uid=<%=agent_id%>&cid=<%=cityid%>&box=1,2,3,4&order=3&searchurl=<%=domain%>&target=_top<%=rurl%>&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe></div>
              <div class="c_near">���ŵر꣺<%=citylatlon(cityid,10)%></div>
            </div>
          </div>
<%
city_liansuo=getchain(cityid,100)
if city_liansuo<>"" then
%>
    <div class="index2_cit">
      	<div class="index2_hot"><h2><span>
<%If Hotel(7) Then%>
<a href="<%=webpath%>school.html<%if cityid<>"" then response.Write("?cityid="&cityid&"")%>">��ѧ�����Ƶ�</a> <a href="<%=webpath%>zhanguan.html<%if cityid<>"" then response.Write("?cityid="&cityid&"")%>">չ�ݸ����Ƶ�</a> <a href="<%=webpath%>jiaotong.html?lei=2<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>">����վ�����Ƶ�</a> <a href="<%=webpath%>jiaotong.html?lei=1<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>">��վ�����Ƶ�</a> <a href="<%=webpath%>jiaotong.html?lei=3<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>">���������Ƶ�</a>
	<%if instr("����,�Ϻ�,����,����,�Ͼ�,���",cityname&"")>=1 then%>
    <a href="<%=webpath%>ditie.html">����վ�����Ƶ�</a>
    <%end if%>
<%Else%>          
        <a href="<%=webpath%>school.asp<%if cityid<>"" then response.Write("?cityid="&cityid&"")%>">��ѧ�����Ƶ�</a> <a href="<%=webpath%>zhanguan.asp<%if cityid<>"" then response.Write("?cityid="&cityid&"")%>">չ�ݸ����Ƶ�</a> <a href="<%=webpath%>jiaotong.asp?lei=2<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>">����վ�����Ƶ�</a> <a href="<%=webpath%>jiaotong.asp?lei=1<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>">��վ�����Ƶ�</a> <a href="<%=webpath%>jiaotong.asp?lei=3<%if cityid<>"" then response.Write("&cityid="&cityid&"")%>">���������Ƶ�</a>
          <%if instr("����,�Ϻ�,����,����,�Ͼ�,���",cityname&"")>=1 then%>
          <a href="<%=webpath%>ditie.asp">����վ�����Ƶ�</a>
          <%end if%>
<%End If%>
</span>
<%=cityname%>������ݾƵ�
</h2>
      
      	</div><div class="index2_lian">
      	<ul>
            <%=city_liansuo%>
        </ul>
      </div> 
      </div>
<%End If%>
      <div class="index2_cit">
      <div class="index2_hot">
        <h2><span>
        <%If Hotel(7) Then%>
        <a href="<%=webpath&relist%>-c<%=uncityid%>-x5---a2-e1.html"><%=cityname%>���Ǽ��Ƶ�</a> <a href="<%=webpath&relist%>-c<%=uncityid%>-x4---a2-e1.html"><%=cityname%>���Ǽ��Ƶ�</a> <a href="<%=webpath&relist%>-c<%=uncityid%>-x3---a2-e1.html"><%=cityname%>���Ǽ��Ƶ�</a> <a href="<%=webpath&relist%>-c<%=uncityid%>-x2---a2-e1.html"><%=cityname%>���Ǽ�/�����;Ƶ�</a>
        <%Else%>
        <a href="<%=webpath%>hotellist.asp?cityid=<%=cityid%>&rank=5"><%=cityname%>���Ǽ��Ƶ�</a> <a href="<%=webpath%>hotellist.asp?cityid=<%=cityid%>&rank=4"><%=cityname%>���Ǽ��Ƶ�</a> <a href="<%=webpath%>hotellist.asp?cityid=<%=cityid%>&rank=3"><%=cityname%>���Ǽ��Ƶ�</a> <a href="<%=webpath%>hotellist.asp?cityid=<%=cityid%>&rank=2"><%=cityname%>���Ǽ�/�����;Ƶ�</a>
        <%End If%></span><%=cityname%>�Ƽ�Ԥ���Ƶ�</h2>
      </div> 
   	  <div class="hot_hotel index2_mar">  	
		<div class="ht_pic">
        </div>         
        <div class="ht">
        <%=cbd_hotellist(cityid,6,0)%>
        </div>
      </div>
     </div>
     <div class="index_sp">
      	<div class="index_ans"><h2><%=cityname%>���¾Ƶ��ʴ�</h2>
        <ul>
 <%         dim i_wenda,creathlisturl,apiUrl,xml,rst,biaoti,w_hotelid,w_hotelname
            apiUrl="http://un1.zhuna.cn/api/gbk/wenda.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&doname="&doname&""
            creathlisturl=webpath&"Database/XML/wenda/"&replace(webpath,"/","")&"_get-wenda_0_"&cityid&".xml"
			set xml=GetXml(apiUrl,creathlisturl)
			if xml.xml<>"" then
                            Set Rst=xml.documentElement.childNodes
                            for i_wenda=0 to (Rst.Length-1)
							biaoti=split(Rst(i_wenda).text&"{un}","{un}")(0)
							w_hotelid=Rst(i_wenda).getAttribute("hid")
							w_hotelname=Rst(i_wenda).getAttribute("hotelname")
							%>
            <li title="<%=biaoti%>"><a href='<%=webpath%>hotelinfo.asp?cityid=<%=cityid%>&hotelid=<%=w_hotelid%>' style="color:#C30"><%=w_hotelname%></a>
              <%=left(biaoti,25)%>...</li>
            <%next
                end if
                Set Xml=Nothing
            %>
        </ul>	
      </div>
      <div class="index_ans"><h2><%=cityname%>���¾Ƶ�����</h2>
        <ul>
        <%
          dim addtime,i_commnet,p_hotelid,p_hotelname,p_yonghu,p_content,p_hpid,p_hpt,p_time
          apiUrl=doserver&"pinglun.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&""
          	creathlisturl=webpath&"Database/XML/pinglun/"&replace(webpath,"/","")&"_get-pinglun_0_"&cityid&".xml"
			set xml=GetXml(apiUrl,creathlisturl)
			if xml.xml<>"" then
                          Set Rst=xml.documentElement.childNodes
                          for i_commnet=0 to (Rst.Length-1)
                          	  p_hotelid=Rst(i_commnet).getAttribute("hid")
							  p_hotelname=Rst(i_commnet).getAttribute("hotelname")
							  p_yonghu=Rst(i_commnet).getAttribute("yonghu")
							  p_content=Rst(i_commnet).text
							  p_hpid=Rst(i_commnet).getAttribute("haopingid")
							  p_hpt=Rst(i_commnet).getAttribute("haoping")
							  p_time=Rst(i_commnet).getAttribute("addtime")%>
            <li title="<%=p_content%>"><a href='<%=webpath%>hotelinfo.asp?cityid=<%=cityid%>&hotelid=<%=p_hotelid%>' style="color:#C30"><%=p_hotelname%></a>
              <%=left(p_content,25)%>...</li>
            <%next
              End if
              Set Xml=Nothing%>
        </ul>	
      </div>
      </div>
      </div>
<div class="side">
	<div class="news">
      <h2><a href="<%If Hotel(7) Then%>News.html<%Else%>News.asp<%End If%>">�ȵ�����</a></h2>
   <%
	  SQL="Select top 1 Article_ID,Article_ClassID,Article_Title,Article_Content,Article_ViewImg From ZN_"&D("Article")&" Where Article_State_Radio=3 Order By Article_Order desc,Article_ID desc"
	  Set Rs=DB.Execute(SQL)
	  If Not Rs.Eof Then%>
        <dl>
       	  <dt><a href="<%=ItemPath%><%If Hotel(7) Then%>NewsInfo-<%=Rs("Article_Id")%>-<%=Rs("Article_Classid")%>.html<%Else%>NewsInfo.asp?Classid=<%=Rs("Article_Classid")%>&id=<%=Rs("Article_Id")%><%End If%>" target="_blank" title="<%=Rs("Article_Title")%>"><img src="<%=ItemPath%><%=Rs("Article_ViewImg")%>" width="90" height="66" border="0" /></a></dt>
          <dd><strong><a href="<%=ItemPath%><%If Hotel(7) Then%>NewsInfo-<%=Rs("Article_Id")%>-<%=Rs("Article_Classid")%>.html<%Else%>NewsInfo.asp?Classid=<%=Rs("Article_Classid")%>&id=<%=Rs("Article_Id")%><%End If%>" target="_blank" title="<%=Rs("Article_Title")%>"><%=FU.CutStr(Rs("Article_Title"),13)%></a></strong></dd>
          <dd><strong></strong><%=FU.CutStr(FU.RemoveHtml(Rs("Article_Content")),50)%></dd>
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
	<div class="lian_up"><h2><%=cityname%>�����Ƶ��Ƽ�</h2>
      	<ul>
          <%=gethotellist("",10,cityid,0,"1","",4,13,2)%>
        </ul>
      </div>
    <div class="lian_up"><h2><%=cityname%>������Ȧ����ҵ��</h2>
      	<ul>
         <%=getcbdlist(cityid,21)%>
        </ul>
      </div>
     <div class="lian_up"><h2><%=cityname%>200Ԫ���¾Ƶ�</h2>
      	<ul>
           <%=gethotellist("",6,cityid,0,"1","200",2,13,2)%>
        </ul>
      </div>
     <div class="lian_up"><h2><%=cityname%>200-400Ԫ�Ƶ�</h2>
      	<ul>
         <%=gethotellist("",6,cityid,0,"200","400",2,13,2)%>
        </ul>
      </div>
       <div class="lian_up"><h2><%=cityname%>400-600Ԫ�Ƶ�</h2>
      	<ul>
         <%=gethotellist("",6,cityid,0,"400","600",2,13,2)%>
        </ul>
      </div>
       <div class="lian_up"><h2>Ԥ����������</h2>
      	<ul>
        <%If Hotel(7) Then%>
          <li><a href="<%=webpath%>help.html">����Ԥ���б�����</a></li>
          <li><a href="<%=webpath%>help.html">����Ԥ����ʲô�ô���</a></li>
          <li><a href="<%=webpath%>help.html">���������Ԥ����</a></li>
          <li><a href="<%=webpath%>help.html">Ϊʲô����Ԥ���۸�Ҫ���ˣ�</a></li>
          <li><a href="<%=webpath%>help.html">ע���Ԥ��ʱΪʲôҪ��д�ֻ��ţ�</a></li>
          <li><a href="<%=webpath%>help.html">���г��б仯��Ԥ���ľƵ���ô�죿</a></li>
          <%Else%>
          <li><a href="<%=webpath%>help.asp">����Ԥ���б�����</a></li>
          <li><a href="<%=webpath%>help.asp">����Ԥ����ʲô�ô���</a></li>
          <li><a href="<%=webpath%>help.asp">���������Ԥ����</a></li>
          <li><a href="<%=webpath%>help.asp">Ϊʲô����Ԥ���۸�Ҫ���ˣ�</a></li>
          <li><a href="<%=webpath%>help.asp">ע���Ԥ��ʱΪʲôҪ��д�ֻ��ţ�</a></li>
          <li><a href="<%=webpath%>help.asp">���г��б仯��Ԥ���ľƵ���ô�죿</a></li>
          <%End If%>
        </ul>
      </div>
</div>
</div>
<div style="clear:both"></div>
<div class="fri"><h2>ȫ�����ų���</h2> 	
<ul>
    <%=getcitylist(35,3,"",2)%>
  </ul>
</div>
<!--#INCLUDE FILE="../INC/Footer.asp"-->
</div>

</body>
</html>
<%Destroy%>