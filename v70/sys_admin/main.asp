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
    <h2 onClick="return openitem('fuwuqi',this)" style="cursor:pointer">ϵͳ��Ϣ&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">��</h></h2>
<%Dim CPUS,OS
Call getOS()%>
    <table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="t_list" id="fuwuqi" style="display:none">
      <tr>
        <td width="19%">��ǰIIS �汾</td>
        <td width="28%"><%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
        <td width="20%">������IP��ַ</td>
        <td width="33%"><%=Request.ServerVariables("LOCAL_ADDR")%></td>
      </tr>
      <tr>
        <td>����������ϵͳ</td>
        <td><%=OS%></td>
        <td>������CPU����</td>
        <td><%=CPUS%> ��</td>
      </tr>
      <tr>
        <td>�ű���������</td>
        <td><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
        <td>ȫ�ֺͻỰ����</td>
        <td>Application ���� <%=Application.Contents.count%> ��<br/>
          Session ���� <%=Session.Contents.count%> ��</td>
      </tr>
      <tr>
        <td>������ʱ��</td>
        <td><%=Now()%></td>
        <td>�������˿�</td>
        <td><%=Request.ServerVariables("SERVER_PORT")%></td>
      </tr>
      <tr>
        <td>վ������·��</td>
        <td><%=Request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
        <td>��ǰ��������</td>
        <td><%=Request.ServerVariables("SERVER_NAME")%></td>
      </tr>
      </table>
<h2 onClick="return openitem('zhujian',this)" style="cursor:pointer">���֧��&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">��</h></h2>
<table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="t_list" id="zhujian" style="display:none">
<tr>
	<td width="19%">FSO�ļ���дɾ��[��]</td>
	<td width="28%"><%=ObjectTest("Scripting.FileSystemObject")%></td>
	<td width="20%">ADO ���ݿ���ʶ���[��]</td>
	<td width="33%"><%=ObjectTest("adodb.connection")%></td>
</tr>
<tr>
	<td>������ϴ�֧��[��]</td>
	<td><%=ObjectTest("Adodb.Stream")%></td>
	<td>HTTP ���[��]</td>
	<td><%=ObjectTest("Microsoft.XMLHTTP")%></td>
</tr>
<tr>
	<td>Shell ���(�漰��ȫ����)</td>
	<td><%=ObjectTest("WScript.Shell")%></td>
	<td>SoftArtisans �ļ�����</td>
	<td><%=ObjectTest("SoftArtisans.FileManager")%></td></tr>
<tr>
	<td>Jmail�����ʼ�֧��</td>
	<td><%=ObjectTest("JMail.SmtpMail")%></td>
	<td>CDONTS�����ʼ�֧��</td>
	<td><%=ObjectTest("CDONTS.NewMail")%></td>
</tr>
<tr>
	<td>AspEmail�����ʼ�֧��</td>
	<td><%=ObjectTest("Persits.MailSender")%></td>
	<td>CDOSYS�����ʼ�֧��</td>
	<td><%=ObjectTest("CDO.Message")%></td>
</tr>
<tr>
	<td>AspUpload�ϴ�֧��</td>
	<td><%=ObjectTest("Persits.Upload")%></td>
	<td>SA-FileUp�ϴ�֧��</td>
	<td><%=ObjectTest("SoftArtisans.FileUp")%></td>
</tr>
<tr>
  <td>CreatePreviewImage����Ԥ��ͼƬ</td>
  <td><%=ObjectTest("CreatePreviewImage.cGvbox")%></td>
  <td>AspJpeg����Ԥ��ͼƬ</td>
  <td><%=ObjectTest("Persits.Jpeg")%></td>
</tr>
<tr>
  <td colspan="4"><h3 style="color:#F36">ע����Ϊ���������֧�ֵ������</h3></td>
</tr>

    </table>
    <h2 onClick="return openitem('cipanceshi',this)" style="cursor:pointer">�����ļ������ٶȲ���&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">��</h></h2>
    <div style="padding:10px;display:none" id="cipanceshi"><input type="button" class="btn03" value="����" onClick="window.location='?action=CheckFileReadspeed'"/>&nbsp;&nbsp;����С��100 ����<br /><br />
    <%If request.QueryString("action")="CheckFileReadspeed" Then Call CheckFileReadspeed()%></div>
    <h2 onClick="return openitem('jiaobenceshi',this)" style="cursor:pointer">ASP�ű����ͺ������ٶȲ���&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">��</h></h2><div style="padding:10px;display:none" id="jiaobenceshi"><input type="button" class="btn03" value="����" onClick="window.location='?action=CheckASPspeed'"/>&nbsp;&nbsp;����С��170��150 ����<br /><br />
	<%If request.QueryString("action")="CheckASPspeed" Then Call CheckASPspeed()%></div>
    <h2 onClick="return openitem('gonggao',this)" style="cursor:pointer">���˹���&nbsp;&nbsp;&nbsp;&nbsp;<h id="h">��</h></h2>
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
								response.Write("<div style=""font-size:15px;background-color:#FCF;height:30px;text-align:center;line-height:30px;border:1px solid #F00;"">���°汾"&versionXML(j).getElementsByTagName("version").item(0).text&",����û�и���Ȩ�ޣ�</div>")
							End If
							set xml=nothing:set xml2=nothing:set versionXML=nothing:set versionXML2=nothing
						Else
							response.Write("<div style=""font-size:15px;background-color:#FCF;height:30px;text-align:center;line-height:30px;border:1px solid #F00;"">�а汾��Ҫ�ֶ����£�����Ҫ��ȥ<a href=""http://un.zhuna.cn"" target=""_blank"">un.zhuna.cn</a>����"&versionXML(j).getElementsByTagName("version").item(0).text&"</div>")
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
	Response.Write "<script>document.getElementById('jiaobenceshi').style.display=""""</script>����������ԣ����ڽ���50��μӷ�����..."
	dim lsabc,thetime,thetime2,t1,i,t2
	t1=timer
	For i=1 To 500000
		lsabc= 1 + 1
	Next
	t2=timer
	thetime=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...����ɣ�����ʱ <font color=red>" & thetime & " ����</font><br/>"
	Response.Write "����������ԣ����ڽ���20��ο�������..."
	t1=timer
	For i=1 To 200000
		lsabc= 2^0.5
	Next
	t2=timer
	thetime2=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...����ɣ�����ʱ <font color=red>" & thetime2 & " ����</font><br/>"
End Sub
Sub CheckFileReadspeed()
	Response.Write "<script>document.getElementById('cipanceshi').style.display=""""</script>�����ظ�������д���ɾ���ı��ļ�50��..."

	Dim thetime3,tempfile,iserr,t1,FsoObj,tempfileOBJ,t2,i
	Set FsoObj=server.CreateObject("Scripting.FileSystemObject")

	iserr=False
	t1=timer
	tempfile=Server.MapPath("test2.txt")
	For i=1 To 50
		Err.Clear

		Set tempfileOBJ = FsoObj.CreateTextFile(tempfile,true)
		If Err <> 0 Then
			Response.Write "�����ļ�����"
			iserr=True
			Err.Clear
			Exit For
		End If
		tempfileOBJ.WriteLine "Only for test. Ajiang ASPcheck"
		If Err <> 0 Then
			Response.Write "д���ļ�����"
			iserr=True
			Err.Clear
			Exit For
		End If
		tempfileOBJ.close
		Set tempfileOBJ = FsoObj.GetFile(tempfile)
		tempfileOBJ.Delete
		If Err <> 0 Then
			Response.Write "ɾ���ļ�����"
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
		Response.Write "...����ɣ���������ִ�д˲�������ʱ <font color=""red"">" & thetime3 & " ����</font>"
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
		tfile.WriteLine("����")
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
			OS=OS & "(���������°� Windows)"
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
//	thisval.firstChild.innerHTML="��";
	document.getElementById(val).style.display="";
	}
	else{
	//thisval.firstChild.innerHTML="��";
	document.getElementById(val).style.display="none";
	}
}
</script>