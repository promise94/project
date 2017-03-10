<!--#include file="ZN_UpLoad.asp"--><%
Function ExtendExecute(Ret)
  AF=Cint(Request.QueryString("AF"))
  FA=Request.QueryString("FA")
  ED=Request.QueryString("ED")
  if AF=0 then	'iframe调用
	  RetHtml="<script language=""javascript"">"
	  if FA<>"" then RetHtml=RetHtml&"parent.document.getElementById('"&FA&"').value='"&replace(Result(2),"../../","")&Result(1)&Result(0)&"';"
	  if ED<>"" then RetHtml=RetHtml&"parent.SetUrl('../"&Result(2)&Result(1)&Result(0)&"');"
	  RetHtml=RetHtml&"</script>"
  end if
  response.write RetHtml
End Function
%>
<html>
<head>
<title>文件上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-size:12px;
}
input {
	FONT-SIZE: 9pt;
	WIDTH: auto;
	COLOR: #000000;
	background-color:#DBE7F2;
	HEIGHT: auto;
	border: 1px solid #6C88AD;
}
-->
</style></head>
<body>
<form name="FormZNUP" id="FormZNUP" method="post" enctype="multipart/form-data">
  <input type="file" name="ZNFile" />
  <input type="submit" name="Submit" value=" 上传 " />
</form>
<%response.Write(UpLoad.UpLoadFormHiddenPara()):Set UpLoad=Nothing%>
</body>
</html>