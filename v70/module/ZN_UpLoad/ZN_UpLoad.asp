<!--#include file="Class_ZN_Upload.asp"-->
<%Dim D%>
<!--#include file="../../inc/Setup.asp"-->
<%
Dim ConfigIsEnabled,defaultSessionName
defaultSessionName=D("Cachename")
if Session(defaultSessionName & "AdminName")<>"" and Session(defaultSessionName & "AdminPass")<>"" and Session(defaultSessionName & "AdminID")<>"" then

else
response.End()
end if
Set UpLoad=new ZN_Upload

if Request.QueryString("action")="add" then
	dim Result
	UpLoad.GetConfig(Request.QueryString("ConfigID"))
	Result=UpLoad.Start()
	ExtendExecute(Result)
end if
%>