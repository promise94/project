<!--#include file="../inc/conn.asp" -->
<%Const ItemPath="../"%>
<!--#include file="../inc/Main_function.asp" -->
<!--#include file="../inc/function.asp" -->
<%
'此处是为了和http://un.zhuna.cn/user/codesearch.asp 做接口用的
'自己建设的网站中只需要在原有的参数后面带上&searchurl=域名&target=_top 即可搜索该API演示站
'这样就会提交到 http://www.xxx.com/s/
dim tm1,tm2,dn,pg,px,minprice,maxprice,xj,bid,hn,key,rurl,cityid,purl
tm1=request("tm1")
if tm1<>"" then session("tm1")=tm1
tm2=request("tm2")
if tm2<>"" then session("tm2")=tm2

cityid=request("cid")*1
If hotel(7) Then
	if cityid=0 then cityid=53
	minprice=request("minprice")
	maxprice=request("maxprice")
	xj=request("xj")
	bid=request("bid")*1
	hn=request("k2")
	key=request("k1")
	purl=request("purl")
	if minprice<>"" then rurl=rurl&"minprice="&minprice&"&"
	if maxprice<>"" then rurl=rurl&"maxprice="&maxprice&"&"
	if bid>=1 then rurl=rurl&"bid="&bid&"&"
	if rurl<>"" then rurl="?"&rurl
	
	response.Redirect(""&webpath&""&relist&"-c"&cityid&"-x"&xj&"-"&hn&"-"&key&"-a0-e1.html"&rurl&"")
Else
	if cityid>=1 then rurl=rurl&"cityid="&cityid&"":else:rurl=rurl&"cityid=53":end if
	minprice=request("minprice")
	if minprice<>"" then rurl=rurl&"&minprice="&minprice&""
	maxprice=request("maxprice")
	if maxprice<>"" then rurl=rurl&"&maxprice="&maxprice&""
	xj=request("xj")
	if xj<>"" then rurl=rurl&"&rank="&xj&"":else:rurl=rurl&"&rank=0":end if
	bid=request("bid")*1
	hn=request("k2")
	if hn<>"" then rurl=rurl&"&hn="&ec(hn)&""
	key=request("k1")
	if key<>"" then rurl=rurl&"&key="&ec(key)&""
	if rurl<>"" then rurl="?"&rurl
	response.redirect(""&webpath&"hotellist.asp"&rurl&"")
End If
%>