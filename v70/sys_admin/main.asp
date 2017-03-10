<!--#INCLUDE FILE="../inc/Conn.asp"-->
<%const ItemPath="../"%>
<!--#INCLUDE FIlE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="inc/Main_Function.asp"-->
<%
CheckAdminLogin 1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="main">
  <div class="main_box">
    <h2 onClick="return openitem('fuwuqi',this)" style="cursor:pointer">系统信息&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">＋</h></h2>
<%Dim CPUS,OS
Call getOS()%>
    <table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="t_list" id="fuwuqi" style="display:none">
      <tr>
        <td width="19%">当前IIS 版本</td>
        <td width="28%"><%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
        <td width="20%">服务器IP地址</td>
        <td width="33%"><%=Request.ServerVariables("LOCAL_ADDR")%></td>
      </tr>
      <tr>
        <td>服务器操作系统</td>
        <td><%=OS%></td>
        <td>服务器CPU数量</td>
        <td><%=CPUS%> 个</td>
      </tr>
      <tr>
        <td>脚本解释引擎</td>
        <td><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
        <td>全局和会话变量</td>
        <td>Application 变量 <%=Application.Contents.count%> 个<br/>
          Session 变量 <%=Session.Contents.count%> 个</td>
      </tr>
      <tr>
        <td>服务器时间</td>
        <td><%=Now()%></td>
        <td>服务器端口</td>
        <td><%=Request.ServerVariables("SERVER_PORT")%></td>
      </tr>
      <tr>
        <td>站点物理路径</td>
        <td><%=Request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
        <td>当前服务器名</td>
        <td><%=Request.ServerVariables("SERVER_NAME")%></td>
      </tr>
      </table>
<h2 onClick="return openitem('zhujian',this)" style="cursor:pointer">组件支持&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">＋</h></h2>
<table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="t_list" id="zhujian" style="display:none">
<tr>
	<td width="19%">FSO文件读写删除[①]</td>
	<td width="28%"><%=ObjectTest("Scripting.FileSystemObject")%></td>
	<td width="20%">ADO 数据库访问对象[①]</td>
	<td width="33%"><%=ObjectTest("adodb.connection")%></td>
</tr>
<tr>
	<td>无组件上传支持[①]</td>
	<td><%=ObjectTest("Adodb.Stream")%></td>
	<td>HTTP 组件[①]</td>
	<td><%=ObjectTest("Microsoft.XMLHTTP")%></td>
</tr>
<tr>
	<td>Shell 组件(涉及安全问题)</td>
	<td><%=ObjectTest("WScript.Shell")%></td>
	<td>SoftArtisans 文件管理</td>
	<td><%=ObjectTest("SoftArtisans.FileManager")%></td></tr>
<tr>
	<td>Jmail发送邮件支持</td>
	<td><%=ObjectTest("JMail.SmtpMail")%></td>
	<td>CDONTS发送邮件支持</td>
	<td><%=ObjectTest("CDONTS.NewMail")%></td>
</tr>
<tr>
	<td>AspEmail发送邮件支持</td>
	<td><%=ObjectTest("Persits.MailSender")%></td>
	<td>CDOSYS发送邮件支持</td>
	<td><%=ObjectTest("CDO.Message")%></td>
</tr>
<tr>
	<td>AspUpload上传支持</td>
	<td><%=ObjectTest("Persits.Upload")%></td>
	<td>SA-FileUp上传支持</td>
	<td><%=ObjectTest("SoftArtisans.FileUp")%></td>
</tr>
<tr>
  <td>CreatePreviewImage生成预览图片</td>
  <td><%=ObjectTest("CreatePreviewImage.cGvbox")%></td>
  <td>AspJpeg生成预览图片</td>
  <td><%=ObjectTest("Persits.Jpeg")%></td>
</tr>
<tr>
  <td colspan="4"><h3 style="color:#F36">注：①为本程序必须支持的组件！</h3></td>
</tr>

    </table>
    <h2 onClick="return openitem('cipanceshi',this)" style="cursor:pointer">磁盘文件操作速度测试&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">＋</h></h2>
    <div style="padding:10px;display:none" id="cipanceshi"><input type="button" class="btn03" value="测试" onClick="window.location='?action=CheckFileReadspeed'"/>&nbsp;&nbsp;建议小于100 毫秒<br /><br />
    <%If request.QueryString("action")="CheckFileReadspeed" Then Call CheckFileReadspeed()%></div>
    <h2 onClick="return openitem('jiaobenceshi',this)" style="cursor:pointer">ASP脚本解释和运算速度测试&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">＋</h></h2><div style="padding:10px;display:none" id="jiaobenceshi"><input type="button" class="btn03" value="测试" onClick="window.location='?action=CheckASPspeed'"/>&nbsp;&nbsp;建议小于170；150 毫秒<br /><br />
	<%If request.QueryString("action")="CheckASPspeed" Then Call CheckASPspeed()%></div>
    <h2 onClick="return openitem('gonggao',this)" style="cursor:pointer">联盟公告&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">＋</h></h2>
    <div style="padding:5px;display:;" id="gonggao"><ul><script language="javascript" src="http://union.zhuna.cn/api/union_news.js"></script></ul></div>
    <%If hotel(14) Then
			Dim xml,apiUrl,xml2,versionXML,versionXML2,files,i,backfile,j,fxml,lastversion,nowversion,updatever,modesbak
			apiUrl=updateserver&"update.xml"
			set xml=GetXml(apiUrl,"")
			set xml2=ExSavedXML("../inc/version.xml")
			set versionXML=xml.documentElement.SelectNodes("item")
			set versionXML2=xml2.documentElement.selectSingleNode("item/version")
				For j=0 to versionXML.length-1
					If versionXML(j).getElementsByTagName("version").item(0).text>versionXML2.text Then
						if modesbak="" Then modesbak=versionXML(j).getElementsByTagName("mode").item(0).text:updatever=versionXML(j).getElementsByTagName("version").item(0).text
						If modesbak="auto" Then
							If Session(cachename&"Adminflag")>=3 Then
								response.Redirect("update/Zhuna_update.asp")
							Else
								response.Write("<div style=""font-size:15px;background-color:#FCF;height:30px;text-align:center;line-height:30px;border:1px solid #F00;"">有新版本"&versionXML(j).getElementsByTagName("version").item(0).text&",但您没有更新权限！</div>")
							End If
							set xml=nothing:set xml2=nothing:set versionXML=nothing:set versionXML2=nothing
						Else
							response.Write("<div style=""font-size:15px;background-color:#FCF;height:30px;text-align:center;line-height:30px;border:1px solid #F00;"">有版本需要手动更新，您需要先去<a href=""http://un.zhuna.cn"" target=""_blank"">un.zhuna.cn</a>更新"&versionXML(j).getElementsByTagName("version").item(0).text&"</div>")
							exit for
						End If
					End If
				Next
			set xml=nothing:set xml2=nothing:set versionXML=nothing:set versionXML2=nothing
	End If%>
  </div>
</div>
</body>
</html>
<%
Sub CheckASPspeed()
	Response.Write "<script>document.getElementById('jiaobenceshi').style.display=""""</script>整数运算测试，正在进行50万次加法运算..."
	dim lsabc,thetime,thetime2,t1,i,t2
	t1=timer
	For i=1 To 500000
		lsabc= 1 + 1
	Next
	t2=timer
	thetime=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...已完成！共耗时 <font color=red>" & thetime & " 毫秒</font><br/>"
	Response.Write "浮点运算测试，正在进行20万次开方运算..."
	t1=timer
	For i=1 To 200000
		lsabc= 2^0.5
	Next
	t2=timer
	thetime2=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...已完成！共耗时 <font color=red>" & thetime2 & " 毫秒</font><br/>"
End Sub
Sub CheckFileReadspeed()
	Response.Write "<script>document.getElementById('cipanceshi').style.display=""""</script>正在重复创建、写入和删除文本文件50次..."

	Dim thetime3,tempfile,iserr,t1,FsoObj,tempfileOBJ,t2,i
	Set FsoObj=server.CreateObject("Scripting.FileSystemObject")

	iserr=False
	t1=timer
	tempfile=Server.MapPath("test2.txt")
	For i=1 To 50
		Err.Clear

		Set tempfileOBJ = FsoObj.CreateTextFile(tempfile,true)
		If Err <> 0 Then
			Response.Write "创建文件错误！"
			iserr=True
			Err.Clear
			Exit For
		End If
		tempfileOBJ.WriteLine "Only for test. Ajiang ASPcheck"
		If Err <> 0 Then
			Response.Write "写入文件错误！"
			iserr=True
			Err.Clear
			Exit For
		End If
		tempfileOBJ.close
		Set tempfileOBJ = FsoObj.GetFile(tempfile)
		tempfileOBJ.Delete
		If Err <> 0 Then
			Response.Write "删除文件错误！"
			iserr=True
			Err.Clear
			Exit For
		End If
		Set tempfileOBJ=Nothing
	Next
	Set FsoObj=Nothing
	t2=timer
	If Not iserr Then
		thetime3=cstr(int(( (t2-t1)*10000 )+0.5)/10)
		Response.Write "...已完成！本服务器执行此操作共耗时 <font color=""red"">" & thetime3 & " 毫秒</font>"
	End If
	Response.Flush
End Sub
Function ObjectTest(strObj)
	On Error Resume Next
	Dim TestObj
	ObjectTest = False
	Err = 0
	Set TestObj = Server.CreateObject(strObj)
	If lcase(strObj)=lcase("Scripting.FileSystemObject") Then
		Dim tfile
		if TestObj.FileExists(server.MapPath("test.txt")) then TestObj.DeleteFile(server.MapPath("test.txt"))
		set tfile=TestObj.CreateTextFile(server.MapPath("test.txt"))
		tfile.WriteLine("测试")
		tfile.close
		set tfile=nothing
		TestObj.DeleteFile(server.MapPath("test.txt"))
	End If
	If 0 = Err Then
		ObjectTest = True
	End If
	Set TestObj=Nothing
	If Err.Number <> 0 Then Err.Clear
End Function
Function getOS()
	On Error Resume Next
	Dim shell
	Set shell = server.CreateObject(Chr(87)&Chr(83)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(46)&Chr(83)&Chr(104)&Chr(101)&Chr(108)&Chr(108))
	OS = shell.Environment("SYSTEM")("OS")
	CPUS = shell.Environment("SYSTEM")("NUMBER_OF_PROCESSORS")
	CPU = shell.Environment("SYSTEM")("PROCESSOR_IDENTIFIER")
	Set shell = Nothing
	If IsNull(CPUS) Then
		CPUS = Request.ServerVariables("NUMBER_OF_PROCESSORS")
	ElseIf CPUS="" Then
		CPUS = Request.ServerVariables("NUMBER_OF_PROCESSORS")
	End If
	IIS = Request.ServerVariables("SERVER_SOFTWARE")
		If Len(IIS) > 1 And Len(Request.ServerVariables("OS")) = 0 Then
		If InStr(IIS,"/5.0") > 0 Then
			OS="Windows Server 2000"
		ElseIf InStr(IIS,"/5.1") > 0 Then
			OS= "Windows XP"
		ElseIf InStr(IIS,"/6.0") > 0 Then
			OS="Windows Server 2003"
		ElseIf InStr(IIS,"/7.0") > 0 Then
			OS="Windows Server 2008"
		Else
			OS=OS & "(可能是最新版 Windows)"
		End If
	End If
	If Len(OS) = 0 Then
		OS = Request.ServerVariables("OS")
		If Len(OS) = 0 Then OS="Windows NT"
	End If
End Function
%>
<script>
function openitem(val,thisval)
{
	if(document.getElementById(val).style.display=="none"){
//	thisval.firstChild.innerHTML="—";
	document.getElementById(val).style.display="";
	}
	else{
	//thisval.firstChild.innerHTML="＋";
	document.getElementById(val).style.display="none";
	}
}
</script>