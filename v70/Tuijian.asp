<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
dim cid,cname
cid=request("cid")
cname=request("cname")
%>
		<div class="ht_pic">
        	<ul>
            <%=gethotellist("",10,cid,0,"1","",1,10,1)%>
           </ul>
        </div>
  <!--begin-->   
        <div class="ht">
       	  <div class="ht_tex"><h4><span><%If Hotel(7) Then%><a href='<%=webpath&relist%>-c<%=cid%>-x0---a2-e1.html?minprice=1&maxprice=200'><%Else%><a href='<%=webpath%>hotellist.asp?cityid=<%=cid%>&minprice=1&maxprice=200&px=2'><%End If%>更多>></a></span><%=cname%>200元以下酒店预订</h4>
                <ul><%=gethotellist("",5,cid,0,"1","200",2,20,2)%></ul>
       	  </div>
            <div class="ht_tex"><h4><span><%If Hotel(7) Then%><a href='<%=webpath&relist%>-c<%=cid%>-x0---a2-e1.html?minprice=200&maxprice=400'><%Else%><a href='<%=webpath%>hotellist.asp?cityid=<%=cid%>&minprice=200&maxprice=400&px=2'><%End If%>更多>></a>></span><%=cname%>200-400元以下酒店预订</h4>
                 <ul><%=gethotellist("",5,cid,0,"200","400",2,20,2)%></ul>          
       	  </div>
            <div class="ht_tex"><h4><span><%If Hotel(7) Then%><a href='<%=webpath&relist%>-c<%=cid%>-x3---a2-e1.html'><%Else%><a href='<%=webpath%>hotellist.asp?cityid=<%=cid%>&rank=3'><%End If%>更多>></a></span><%=cname%>三星级酒店预订</h4>
                   <ul><%=gethotellist("",5,cid,"rank_3","","",1,20,2)%></ul>         
        	</div>
            <div class="ht_tex"><h4><span><%If Hotel(7) Then%><a href='<%=webpath&relist%>-c<%=cid%>-x2---a2-e1.html'><%Else%><a href='<%=webpath%>hotellist.asp?cityid=<%=cid%>&rank=2'><%End If%>更多>></a></span><%=cname%>经济型酒店预订</h4>
                    <ul><%=gethotellist("",5,cid,"rank_2","","",1,20,2)%></ul>         
        	</div>
           <%=cbd_hotellist(cid,2,0)%>
        </div>
<!--End-->
<%Destroy%>