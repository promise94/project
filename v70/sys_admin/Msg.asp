<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Option explicit
Response.CodePage=936
Response.Charset="GB2312"
Response.ContentType="text/html"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="msg">
  <h2>&nbsp;</h2>
  <ul>
    <li><%=request("title")%></li>
    <li><%=request("msg")%></li>
  </ul>
</div>
</body>
</html>