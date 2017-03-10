<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim cityid,strs,maxPage,i
cityid=request("cityid")*1
strs=",ÇëÑ¡Ôñ¾Æµê"
strs=strs&getthem(cityid,1)
If maxPage>1 Then
	for i=2 to maxPage
		strs=strs&getthem(cityid,i)
	next
End If
response.Write(strs)
Function getthem(cityid,page)
	dim apiUrl,xml,creathlisturl
	apiUrl=doserver&"cuxiao.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&pagesize=10&pg="&page
	apiUrl=apiUrl&"&domain="&domain&"&Copyright="&Copyright&"&doname="&server.URLEncode(doname)&""
	creathlisturl=webpath&"Database/XML/cuxiao/"&replace(webpath,"/","")&"_get-cuxiao_"&cityid&"_"&page&".xml"
	
	dim root,strs,Rst,i,hotelid,hotelname
	set xml=GetXml(apiUrl,creathlisturl)
	if xml.xml<>"" then
	Set root=xml.documentElement
	If Not root is Nothing Then
	maxPage=root.getAttribute("maxPage")
		Set Rst=root.childNodes
		For i=0 To Rst.Length-1
			strs=strs&"|"&Rst(i).getAttribute("hotelid")&","&Rst(i).getAttribute("hotelname")
		Next
	End If
	set root= nothing
	End If
	set xml=nothing
	getthem=strs
End Function
Destroy%>