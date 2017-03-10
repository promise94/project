<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim hid,apiUrl,xml,creathlisturl
hid=request("r")*1
apiUrl=doserver&"roominfo.asp?u="&agent_id&"&m="&agent_md&"&rid="&hid
apiUrl=apiUrl&"&domain="&domain&"&Copyright="&Copyright&"&doname="&server.URLEncode(doname)&""
creathlisturl=webpath&"Database/XML/roominfo/"&replace(webpath,"/","")&"_get-roominfo_"&hid&".xml"

dim Rst,content
set xml=GetXml(apiUrl,creathlisturl)
if xml.xml<>"" then
Set Rst=xml.documentElement.selectSingleNode("Content")
If Not Rst is Nothing Then
response.Write(ec(Rst.text))
End If
set rst= nothing
End If
set xml=nothing
Destroy%>