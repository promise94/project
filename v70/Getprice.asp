<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim hid,tm1,tm2,dn,apiUrl,xml
Response.CodePage=936
Response.Charset="gb2312"
Response.ContentType="text/html"
hid=request("hid")
tm1=request("tm1")
if tm1<>"" then session("tm1")=tm1
tm2=request("tm2")
if tm2<>"" then session("tm2")=tm2
if tm1="" then tm1=date():session("tm1")=tm1
if tm2="" then tm2=tm1+3:session("tm2")=tm2
dn=DateDiff("d",tm1,tm2)
if dn>=21 then dn=21:tm2=DateAdd("d",21,tm1):session("tm2")=tm2	
Function getchday(id)
select case id
case 1:getchday=ec("日")
case 2:getchday=ec("一")
case 3:getchday=ec("二")
case 4:getchday=ec("三")
case 5:getchday=ec("四")
case 6:getchday=ec("五")
case 7:getchday=ec("六")
End select
End Function
if hid="" or tm1="" or tm2="" then response.End()
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="xiang_table">
        <tr>
          <td width="25%"><%=ec("客房类型")%></td>
          <td width="15%"><%=ec("床型")%></td>
          <td width="12%"><%=ec("早餐")%></td>
          <td width="12%"><%=ec("宽带")%></td>
          <td width="12%"><%=ec("门市价")%></td>
          <td width="12%"><%=ec("均价")%></td>
          <td width="12%"><%=ec("预订")%></td>
        </tr><%
        apiUrl=doserver&"room.asp?u="&agent_id&"&m="&agent_md&"&hid="&hid&"&tm1="&tm1&"&tm2="&tm2&""
				dim Rst,rid,title,Menshi,zaocan,adsl,Bed,jiangjin,Prices,ri,fi,iz,i,fangjia
                set xml=GetXml(apiUrl,"")

				if xml.xml<>"" then
                                'hotel.room 
                                Set Rst=xml.documentElement.childNodes		
                                For i=0 To (Rst.Length-1)
                                    with Rst(i) 
									'结点<room rid="25551" title="标准间" Menshi="560" zaocan="无" adsl="有" Bed="双床" jiangjin="32"> 
                                        rid		 =.getAttribute("rid")
                                        title	 =.getAttribute("title")
                                        Menshi	 =.getAttribute("Menshi")
                                        zaocan	 =.getAttribute("zaocan")
                                        adsl	 =.getAttribute("adsl")
                                        Bed	 	 =.getAttribute("Bed")
                                        jiangjin =.getAttribute("jiangjin")
                                        Prices	 =.text			
                                    end with
                                    '根据Prices返回的天数添加<td>
                                    Prices=split(Prices,",")
%>
        <tr>
          <td><a href="javascript:void(0);" style="border-bottom:1px  dotted rgb(211,87,20);" onclick="return _rm(this,<%=rid%>)" title="<%=ec("点击房型信息更详细")%>"><%=ec(title)%></a></td>
          <td><%=ec(Bed)%></td>
          <td><%=ec(zaocan)%></td>
          <td><%=ec(adsl)%></td>
          <td style="font-style:italic;text-decoration:line-through;"><%=ec(Menshi)%><%=ec("元")%></td>
          <td style="font-family:Arial, Helvetica, sans-serif; color:#F30; font-size:12px;">
<div style="position:relative">
<a onmouseout="return resetarea(document.getElementById('show'+'<%=rid%>'));" onmouseover="return moveordrog(document.getElementById('show'+'<%=rid%>'));" style="border-bottom: 1px dashed rgb(211,87,20);cursor: pointer;color:rgb(211,87,20);">&nbsp;
<b><%dim rooms2,countnum,datenum,tdlong,datenums,rii,x,checkfull
rooms2=0
countnum=0
checkfull=0
for ri=0 to (dn-1)
fangjia=""
fangjia=Prices(ri)
%>
<%
if fangjia<>"×" then
countnum=countnum+1
rooms2=rooms2+fangjia
end if
%>
<%next
if rooms2<>0 then
response.Write(fix(rooms2/countnum)&ec("元"))
else
response.Write(ec("满房"))
end if%></b>&nbsp;</a>
<%
if (dn mod 7 = 0) then
datenum=fix(dn/7)
else
datenum=fix(dn/7)+1
end if

if dn>7 then
tdlong=7
else
tdlong=dn
end if
%>
<div onmouseout="return resetarea(this);" onclick="return settop(this);" ondblclick="return resetarea(this);" onmouseover="return moveordrog(this,'<%=ec(title)%>');" style="border: 2px solid rgb(255, 102, 0); background: none repeat scroll 0% 0% white;right:55px!important;right:57px;top:0px;position: absolute; display:none; z-index: 999;-webkit-box-shadow:3px 3px 3px #333333;-moz-box-shadow:3px 3px 3px #333333;" id="show<%=rid%>" class="showtips" title="双击关闭,双击空白关闭全部"><table border="0" cellspacing="0" cellpadding="0"  class="xiang_table" style="width:<%=60*tdlong%>px;">
<tr><%
for rii=0 to 6
if rii>=tdlong then exit for
%>
<td><b><%=ec("周")&getchday(weekday(Dateadd("d",rii,tm1)))%></b></td>
<%
next%></tr>
<%datenums=0
for ri=0 to (datenum-1)
%><tr>
<%
for rii=0 to 6
if datenums>=dn then
	if tdlong>6 then
		for x=0 to (6-rii)
		response.Write("<td></td>")
		next
	end if
	exit for
end if
fangjia=""
fangjia=Prices(datenums)
%>
<td><div><%=month(DateAdd("d",(ri*7+rii),tm1))%><%=ec("月")%><%=day(DateAdd("d",(ri*7+rii),tm1))%><%=ec("日")%></div><div style=" color:#000"><%if fangjia="×" then response.Write(ec("满房")):checkfull=1 else response.Write(fangjia&ec("元"))%></div></td>
<%datenums=datenums+1
next%>
</tr>  <%next%>
</table></div>
</div>
          </td>
          <td><%if checkfull<>1 then%><input type="button" name="button" id="button" value="<%=ec("预订")%>" class="butt3" onClick="ebook('<%=rid%>');"/><%Else%><input type="button" name="button" id="button" value="<%=ec("满房")%>" class="butt3-1" onClick="ebook('<%=rid%>');" disabled="disabled"/><%End If%></td>
</tr>
<%
Next
End if
Set Xml=Nothing
%>
</table>
<%Destroy%>
