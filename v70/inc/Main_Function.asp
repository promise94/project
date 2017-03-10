<%
'�������Ŀ¼
Function AutoCreateFolder(strPath) ' As Boolean 
	On Error Resume Next 
	Dim astrPath,ulngPath,i,strTmpPath 
	Dim objFSO 
	
	If InStr(strPath,"/")<=0 Then 
		AutoCreateFolder=False 
		Exit Function
	End If
	
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject") 
	If objFSO.FolderExists(server.mappath(strPath))=True Then 
		AutoCreateFolder=True 
		Exit Function
	End If 
	'response.Write "1"
	astrPath=Split(strPath,"/") 
	ulngPath=UBound(astrPath) 
	strTmpPath="" 
	For i=0 To ulngPath 
		strTmpPath=strTmpPath&astrPath(i)&"/"
		'response.Write strTmpPath
		If Not objFSO.FolderExists(server.mappath(strTmpPath)) Then 
			objFSO.Createfolder(server.mappath(strTmpPath))
		End If 
	Next 
	Set objFSO=Nothing 
	If Err=0 Then 
		AutoCreateFolder=True 
	Else 
		AutoCreateFolder=False 
	End If 
End Function 

'�����ļ�
Function CreatFile(FilePath,Content)
If instr(lcase(FilePath),"database/html")>0 Then
	If oiscache=0 Then Exit Function
End If
	dim MyFile,objStream,strPath,Filspli
	Set MyFile=Server.CreateObject("Scripting.FileSystemObject")
	Filspli=split(FilePath,"/")
	strPath=replace(FilePath,Filspli(ubound(Filspli)),"")
	call AutoCreateFolder(strPath)
		Set objStream = Server.CreateObject("ADODB.Stream")
		With objStream
			.Open
			.Charset = "GB2312" '���������վ����ʽΪGB2312 ���޸Ĵ˴�
			.Position = objStream.Size
			.WriteText=Content
			.SaveToFile server.mappath(FilePath),2
			.Close
		End With
		Set objStream = Nothing
	set MyFile=nothing
	  if err then err.clear
End Function

'�����ļ�,�κθ�ʽ.
Function SaveFiles(FilePath,Content)
dim MyFile,objStream,strPath,Filspli
	Set MyFile=Server.CreateObject("Scripting.FileSystemObject")
	Filspli=split(FilePath,"/")
	strPath=replace(FilePath,Filspli(ubound(Filspli)),"")
	call AutoCreateFolder(strPath)
	
Set MyFile = Server.CreateObject("Adodb.Stream")
  With MyFile
    .Type = 1
    .Open
    .Write Content
    .SaveToFile server.MapPath(FilePath),2
    .Cancel()
    .Close()
  End With
  Set MyFile=nothing
  if err then err.clear
End Function

'�ļ��н���
Function CreatFolder(FolderPath)
	Set fso = CreateObject("Scripting.FileSystemObject")
		if fso.FolderExists(server.mappath(FolderPath))=false then
			Fso.Createfolder(server.mappath(FolderPath))
		Set fso = nothing
	end if
End Function

'�����ļ���
Function fldrename(nowfld,newfld)
nowfld=server.mappath(nowfld)
newfld=server.mappath(newfld)
dim fso
Set fso = CreateObject("Scripting.FileSystemObject")
if not fso.FolderExists(nowfld) then
    fldrename="��Ҫ�޸ĵ��ļ���·������ȷ���ļ��������������"
else
    if fso.FolderExists(newfld) then
        fldrename="�����������ļ��������Ѿ�����"
    else
        fso.CopyFolder nowfld,newfld
        fso.DeleteFolder(nowfld)
		fldrename="�ɹ�"
    end if
end if
set fso=nothing
	If Err Then
			If odebug Then
			response.Write(DBPath&"<br>")
			response.Write(Err.Number&vbcrlf&_
						   Err.Source&vbcrlf&_
						   Err.Description)
				Response.Write "�����ļ���ʧ�ܣ�"
				Response.End
			End If
		Err.Clear
	End If
End Function

'�����ļ�
Function filrename(nowfld,newfld)
      Dim fso
      nowfld=server.mappath(nowfld)
	  newfld=server.mappath(newfld)
      Set fso=Server.CreateObject("Scripting.FileSystemObject")  
        If fso.FileExists(nowfld) Then  
            fso.MoveFile nowfld,newfld
        	filrename="�ɹ�"  
        Else  
            filrename="�����ڣ��޷������ƶ���������"  
        End If  
      Set fso = Nothing
	  If Err Then
			If odebug Then
			response.Write(DBPath&"<br>")
			response.Write(Err.Number&vbcrlf&_
						   Err.Source&vbcrlf&_
						   Err.Description)
				Response.Write "�����ļ�ʧ�ܣ�"
				Response.End
			End If
		Err.Clear
	End If
End Function

'�������ļ������ļ���
Function RenameFolderOrFile(ByVal strFolderPath, ByVal strNewName,ByVal boo)
Dim objFileSystem
Set objFileSystem=Server.CreateObject("Scripting.FileSystemObject")
strFolderPath=Server.MapPath(strFolderPath)
Dim objFolder
If boo=1 Then
	Set objFolder=objFileSystem.GetFolder(strFolderPath)
else
	Set objFolder=objFileSystem.GetFile(strFolderPath)
end if

objFolder.Name=strNewName
Set objFolder=nothing
Set objFileSystem=nothing
End Function

'��ȡ�ļ��Ƿ����
function IsFile(FilePath)
	dim fso
	set Fso=createobject("scripting.filesystemobject")
	if Fso.FileExists(server.mappath(FilePath))=false then
		IsFile=False
	Else
		IsFile=True
	End if
	Set fso = nothing
end function

'��FSO��ȡ�ļ�
Function ReadFile(filename)
	if Instr(filename,"/") then filename=replace(filename,"/","\")
	if IsFile(filename)=True then
		Dim str,stm
		Set stm = server.CreateObject("adodb.stream")
		stm.Type = 2 'adTypeBinary=1 adTypeText=2
		stm.Mode = 3 'adModeRead=1 adModeWrite=2 adModeReadWrite=3
		stm.Charset =  "GB2312" '���������վ����ʽΪGB2312 ���޸Ĵ˴�
		stm.Open
		stm.loadfromfile Server.MapPath(filename)
		str = stm.readtext
		stm.Close
		Set stm = Nothing
		ReadFile = str
	End if
	if ReadFile="" then call deletefiles(filename)
End Function

'ɾ���ļ�
function deletefiles(filepath)
On Error Resume Next
	dim fs
	dim getfile,oError
	Err.Clear
	filepath=server.mappath(filepath)
	set fs=createobject("scripting.filesystemobject")
	if fs.fileexists(filepath) then 
		oError=fs.DeleteFile(filepath)
	end if
	set fs=nothing
	If Err Then
			response.Write(Err.Number&vbcrlf&_
						   Err.Source&vbcrlf&_
						   Err.Description)
				Response.Write "deletefilesʧ�ܣ�"
		Err.Clear
	End If
end function

'ɾ���ļ���
function deleteFolder(filepath)
On Error Resume Next
	dim fs
	dim getfile,oError
	Err.Clear
	filepath=server.mappath(filepath)
	set fs=createobject("scripting.filesystemobject")
	if fs.FolderExists(filepath) then 
		oError=fs.DeleteFolder(filepath,true)
	end if
	set fs=nothing
	If Err Then
			response.Write(Err.Number&vbcrlf&_
						   Err.Source&vbcrlf&_
						   Err.Description)
				Response.Write "deleteFolderʧ�ܣ�"
		Err.Clear
	End If
end function
'**************************************************
'��������ReplaceTag
'��  �ã����������е�HTML�ַ�
'**************************************************
Function ReplaceTag(strHTML)
	if strHTML="" then exit Function
	Dim objRegExp, Match, Matches 
	Set objRegExp = New Regexp
	
	objRegExp.IgnoreCase = True
	objRegExp.Global = True
	'ȡ�պϵ�<>
	objRegExp.Pattern = "<.+?>"
	'����ƥ��
	Set Matches = objRegExp.Execute(strHTML)
	
	' ����ƥ�伯�ϣ����滻��ƥ�����Ŀ
	For Each Match in Matches 
	strHtml=Replace(strHTML,Match.Value,"")
	Next
	ReplaceTag=strHTML
	Set objRegExp = Nothing
End Function

'��ʽ��HTML ȥ��text�еĿո� HTML����
Function HtmlDel(HtmlContent) 
	 if HtmlContent="" or isnull(HtmlContent) then exit function
	 HtmlContent=ReplaceTag(HtmlContent)
		 if len(HtmlContent)>=1 then
			 HtmlContent=replace(HtmlContent,""&Chr(13)+Chr(10)&"","")
			 HtmlContent=replace(HtmlContent,""&Chr(9)&"","")
			 HtmlContent=replace(HtmlContent,""&Chr(10)&"","")
			 HtmlContent=replace(HtmlContent,""&Chr(13)&"","")
			 HtmlContent=replace(HtmlContent,""&Chr(10)+Chr(13)&"","")
			 HtmlContent=replace(HtmlContent," ","")
			 HtmlContent=replace(HtmlContent,"��","")
			 HtmlContent=replace(HtmlContent,"&nbsp;","")
		 End if
	 HtmlDel=HtmlContent
End Function


'==================
'���������ȡ��Ϣ
'url apiUrl�ӿڵ�ַ	
'����˵��	'10000   '����DNS���ֵĳ�ʱʱ��,10��
			'10000   ' ����Winsock���ӵĳ�ʱʱ��,10��
			'120000  ' �������ݵĳ�ʱʱ��,120��
			'60000   ' ����response�ĳ�ʱʱ��,60��
			'http.ReadyState
			'0 �� ��δ��ʼ������û�е���send()����
			'1 �� �����룩�ѵ���send()���������ڷ�������
			'2 �� ��������ɣ�send()����ִ����ɣ��Ѿ����յ�ȫ����Ӧ����
			'3 �� �����������ڽ�����Ӧ����
			'4 �� ����ɣ���Ӧ���ݽ�����ɣ������ڿͻ��˵�����
Function GetBackXml(url)
dim http
		Set http=Server.CreateObject(mshttp)
			http.SetTimeOuts 10000,10000,120000,60000
			http.Open "GET",url,False
			http.send
		set GetBackXml=http.ResponseXML
		Set Http=Nothing	
End Function

'=================
'ִ�л�ȡ��xml��Ϣ���ұ���
'xmls ��Ҫִ�е�xml��Ϣ,urls�����·��
'����XML����
Function ExXML(xmls,urls)
dim xml,Filspli,strPath
if isnull(xmls) or isempty(xmls) then exit function
Set xml=Server.CreateObject("Microsoft.XMLDOM")
	xml.Async=true
	xml.ValidateOnParse=False
	if xml.Load(xmls) then'����xml
		If xml.ReadyState>2 Then
			if xml.parseError.errorCode = 0 then
				if urls<>"" And cbool(oiscache) then
					Filspli=split(urls,"/")
					strPath=replace(urls,Filspli(ubound(Filspli)),"")
					call AutoCreateFolder(strPath)
					xml.save(server.MapPath(urls))
				end if
			set ExXML=xml
			end if
		End if
	else
		set ExXML=xml
	end if
	If odebug Then
		If xml.parseError.errorCode <> 0 Then
		   response.Write(xml.parseError.errorCode&vbcrlf&_
		   xml.parseError.reason&vbcrlf&_
		   xml.parseError.line)
		End If
	End If
Set xml=Nothing
End Function

'=================
'��ȡ�Ѿ������xml��Ϣ
'urls�����·��
'����XML����
Function ExSavedXML(urls)
dim xml
if isnull(urls) or isempty(urls) then exit function
Set xml=Server.CreateObject("Microsoft.XMLDOM")
	xml.Async=true
	xml.ValidateOnParse=False
	if xml.Load(server.MapPath(urls)) then'����xml
		If xml.ReadyState>2 Then
			if xml.parseError.errorCode = 0 then
			set ExSavedXML=xml
			end if
		End if
	else
		set ExSavedXML=xml
	end if
	If xml.parseError.errorCode <> 0 Then
	   response.Write(xml.parseError.errorCode&vbcrlf&_
	   xml.parseError.reason&vbcrlf&_
	   xml.parseError.line)
	End If
Set xml=Nothing
End Function

'=================
'��ȡ�ļ��Ƿ���ڲ��ҷ�������
'FilePath:�ļ�·��
'����ֵ:bool,bool
function IsFileDATE(FilePath)
	dim fso,Fdate(2)
	set Fso=createobject("scripting.filesystemobject")
	if Fso.FileExists(server.mappath(FilePath))=False then
		Fdate(0)=False
		Fdate(1)=False
	Else
		Fdate(0)=True
		if datediff("d",Fso.GetFile(server.mappath(FilePath)).DateLastModified,now)>flietime then
		Fdate(1)=False
		else
		Fdate(1)=True
		end if
	End if
	Set fso = nothing
	IsFileDATE=Fdate
end function


'==================================================
'����	��ȡxml����
'����	apiUrl:api��ַ 
'		creathlisturl:xml����·��
'����ֵ ����xml����
Function GetXml(apiUrl,xml_url)
if apiUrl="" then exit function
dim iscreat,backXml
	If Not cbool(oiscache) Then xml_url=""
	if xml_url<>"" then
		iscreat=IsFileDATE(xml_url)
		if iscreat(0)<>True or iscreat(1)<>True then
			set backXml=GetBackXml(apiUrl)
			set GetXml=ExXML(backXml,xml_url)
			set backXml=nothing
		else
			set GetXml=ExSavedXML(xml_url)
		end if
	else
		set backXml=GetBackXml(apiUrl)
		set GetXml=ExXML(backXml,"")
		set backXml=nothing
	end if
End Function


'==================================================
'����	�ж��Ƿ���Ҫ����
'����	strs:���Ӳ��� 
'����ֵ true or false
Function Iscache(strs)
if strs="" then exit function
dim ho,strr
	for each ho in split(strs,"&")
		if (instr(ho,"cityid")=0) and (instr(ho,"rank")=0) and (instr(ho,"bid")=0) and (instr(ho,"lsid")=0) and (instr(ho,"hid")=0) then
			strr=strr&ho
		end if
	next
	if strr="" then
		Iscache=true
	else
		Iscache=false
	end if
End Function



'=====================================
'����	���ݿ������ַ���
'����	TP�����ж������ĸ����ݿ�
'����	��

Class DB_Connection
Private Tp,DBPath,temPath,Conn

	Private Sub Class_Initialize()
	'��ʼ��
		Tp=1
		temPath=Cstr(D("DBPath")&"Database/"&D("DBName")&".asa")
		DBPath=server.MapPath(temPath)
	End Sub
	
	Private Sub Class_Terminate()
		Call ReleaseMe
	End Sub
	
	Private Sub ReleaseMe()
		If Isobject(Conn) Then
			If Conn.State <> 0 Then Conn.Close
			Set Conn = Nothing
		End If
	End Sub
	
	Public Property Let SetTp(ByVal i)
		Tp=i
	End Property
	
	
	Private Sub ConnectionDatabase(Tp)
		Dim DbConnectStr
		Set Conn = Server.CreateObject("ADODB.Connection")
		If Tp = 1 Then
			DbConnectStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath
		ElseIf Tp = 2 Then
			DbConnectStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath
		Else
			Response.Write "���ݿ����ӳ������conn.asp�ļ���������ַ�����"
			Response.End
		End If
	
		Conn.Open DbConnectStr
		If Err Then
			If odebug Then
			response.Write(DBPath&"<br>")
			response.Write(Err.Number&vbcrlf&_
						   Err.Source&vbcrlf&_
						   Err.Description)
				
				Set Conn = Nothing
				Response.Write "���ݿ����ӳ������conn.asp�ļ���������ַ�����"
				Response.End
			End If
		Err.Clear
		End If
	End Sub
	
	Public Property Get OutConn()
		If not Isobject(Conn) then ConnectionDatabase(Tp)
		Set OutConn=Conn
	End Property
	
	Public Property Get Execute(strCommand)
		If not Isobject(Conn) then ConnectionDatabase(Tp)
'		Dim ExecuteCmd
'		Set ExecuteCmd = Server.CreateObject("ADODB.Command")
'		With ExecuteCmd
'			.ActiveConnection = Conn
'			.CommandType = 8
'			.CommandText = strCommand
'			.Execute
'		End With
		Set Execute = Conn.execute(strCommand)
		'Set ExecuteCmd = Nothing
	End Property
	
	Public Function Recordset(strCommand,adOpen,adLock)
		Dim Rs
		If not Isobject(Conn) then ConnectionDatabase(Tp)
		Set Rs = Server.CreateObject("ADODB.Recordset")
		Rs.Open strCommand,Conn,adOpen,adLock
		Set Recordset=Rs
		'Rs.Close:Set Rs=nothing
	End Function
	
	Public Function GetClassName(SQL)
		Dim Rs
		If not Isobject(Conn) then ConnectionDatabase(Tp)
		Set Rs=Conn.Execute(SQL)
		If Not Rs.Eof Then
		GetClassName=Rs(0)
		Else
		GetClassName=""
		End IF
		Rs.Close:Set Rs=Nothing
	End Function
	
End Class

Class Main_Function

	Private Sub Class_Initialize()
	'��ʼ��
	End Sub
	Private Sub Class_Terminate()
	'�ͷ�
	End Sub
	
	Public Function ChkPost()
		Dim server_v1,server_v2
		Chkpost=False
		server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
		server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
		If Mid(server_v1,8,len(server_v2))=server_v2 Then Chkpost=True
	End Function
	
	Public Function CheckBadstr(str)
		If IsNull(str) Then
			CheckBadstr = vbNullString
			Exit Function
		End If
		str = Replace(str, Chr(0), vbNullString) : str = Replace(str, Chr(34), vbNullString)
		str = Replace(str, Chr(9), vbNullString) : str = Replace(str, Chr(255), vbNullString)'����ʱchr(255)Ϊ��ȷ��ֵ
		str = Replace(str, "+", "��") : str = Replace(str, ")", "��")
		str = Replace(str, "(", "��") : str = Replace(str, "%", "��")
		str = Replace(str, "$", "��") : str = Replace(str, "'", "''")
		str = Replace(str, ";", "��") : str = Replace(str, "*", "��")
		str = Replace(str, "<", "��") : str = Replace(str, ">", "��")
		str = Replace(str, "@", "��") : str = Replace(str, "--", "����")
		CheckBadstr = Trim(str)
	End Function
	
	Public Function RequestForm(ByVal strRequest,Byval strLen)
		Dim m_strRequest
		If IsNull(strRequest) Or Len(strRequest) = 0 Then
			RequestForm = ""
			Exit Function
		End If
		m_strRequest = Trim(strRequest)
		m_strRequest = Replace(m_strRequest, Chr(0), "")
		m_strRequest = Replace(m_strRequest, Chr(255), "")
		m_strRequest = Replace(m_strRequest, "'", "&#39;")
		m_strRequest = Replace(m_strRequest, Chr(34), "&quot;")
		m_strRequest = Replace(m_strRequest, ">", "&gt;")
		m_strRequest = Replace(m_strRequest, "<", "&lt;")
		m_strRequest = Replace(m_strRequest, "&#62;", "&gt;")
		m_strRequest = Replace(m_strRequest, "&#60;", "&lt;")
		m_strRequest = Replace(m_strRequest, "--", "����")
		m_strRequest = Replace(m_strRequest, "'", "''")
		If Len(m_strRequest) > 0 And strLen > 0 Then
			RequestForm = Left(m_strRequest,strLen)
		Else
			RequestForm = m_strRequest
		End If
	End Function

	Public Function Formatime(datime)
		datime = Trim(Replace(Trim(datime), vbNewLine, ""))
		If Not IsDate(datime) Then
			Formatime = Now()
			Exit Function
		End If
		If Len(datime) < 11 Then
			Formatime = CDate(datime & " " & FormatDateTime(Now, 3))
		Else
			Formatime = CDate(datime)
		End If
		Exit Function
	End Function

	Public Function getIP()
		On Error Resume Next
		Dim strIPAddr,actforip
		If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" Or InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then
			strIPAddr = Request.ServerVariables("REMOTE_ADDR")
		ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then
			strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1)
			actforip = Request.ServerVariables("REMOTE_ADDR")
		ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then
			strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1)
			actforip = Request.ServerVariables("REMOTE_ADDR")
		Else
			strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
			actforip = Request.ServerVariables("REMOTE_ADDR")
		End If
		getIP = Replace(Trim(Mid(strIPAddr, 1, 30)), "'", "")
	End Function
	
	
	'////////////////////////////////////////////////////////////////////
	'//����	�������
	'//����	CHECK_ID����ֵ
	'//����	����0���ߺϸ�����
	Public Function CheckNumeric(ByVal CHECK_ID)
		If CHECK_ID <> "" And IsNumeric(CHECK_ID) Then
			If CHECK_ID > 922337203685477 Then CHECK_ID = 0
			If CHECK_ID < -922337203685477 Then CHECK_ID = 0
			CHECK_ID = ccur(CHECK_ID)
		Else
			CHECK_ID = 0
		End If
		CheckNumeric = CHECK_ID
	End Function
	
	'////////////////////////////////////////////////////////////////////
	'//����	��鳤��������
	'//����	CHECK_ID����ֵ
	'//����	����0���ߺϸ�����
	Public Function CheckClngNumeric(ByVal CHECK_ID)
		If CHECK_ID <> "" And IsNumeric(CHECK_ID) Then
			If CHECK_ID > 2147483647 Then CHECK_ID = 0
			If CHECK_ID < -2147483647 Then CHECK_ID = 0
			CHECK_ID = clng(CHECK_ID)
		Else
			CHECK_ID = 0
		End If
		CheckClngNumeric = CHECK_ID
	End Function
	
	'//////////////
	'����	��ȫ���ܲ���
	'����	str ��Ҫ���ܵ��ַ�����boo �������� 0���ֻ���1�ַ���
	'����	�������Ĳ���
	Public Function CheckRequest(ByVal Str,ByVal Boo)
		Dim oStr
		If Str="" Then CheckRequest="":Exit Function
		Str=Request(Str)
		If Boo Then
			oStr=CheckBadstr(Str)
			If oStr<>Str Then
				Response.Write("<script>alert(""�벻Ҫ���ԷǷ�������\n���IP:"&getIP&"�ѱ���¼��"");history.back();</script>")
				Response.End()
			Else
				CheckRequest=oStr
			End If
		Else
			oStr=Isnumeric(Str)
			If Not oStr Then
				Response.Write("<script>alert(""�벻Ҫ���ԷǷ�������\n���IP:"&getIP&"�ѱ���¼��"");history.back();</script>")
				Response.End()
			Else
				CheckRequest=CheckNumeric(Str)
			End If
		End If
	End Function
	
	Public Function HTMLEncodes(ByVal fString)
		If Not IsNull(fString) Then
			'fString = Replace(fString, "&", "&amp;")
			fString = Replace(fString, "'", "&#39;")
			fString = Replace(fString, ">", "&gt;")
			fString = Replace(fString, "<", "&lt;")
			fString = Replace(fString, Chr(32), " ")
			fString = Replace(fString, Chr(9), " ")
			fString = Replace(fString, Chr(34), "&quot;")
			fString = Replace(fString, Chr(39), "&#39;")
			fString = Replace(fString, Chr(13), "")
			fString = Replace(fString, " ", "&nbsp;")
			fString = Replace(fString, Chr(10), "<br />")
			HTMLEncodes = ChkBadWords(fString)
		End If
	End Function
	
	Public Function ChkBadWords(str)
		If IsNull(str) Then Exit Function
		Dim Badwordlist,i,BadworArry
		Badwordlist=Split(Badwords,"|")
		For i=0 To UBound(Badwordlist)
			If Badwordlist(i)<>"" Then
				BadworArry=Split(Badwordlist(i), "=")
				If UBound(BadworArry)>0 Then
					If BadworArry(0)<>"" Then
						If BadworArry(1)<>"" Then
							str=Replace(str,BadworArry(0),BadworArry(1))
						Else
							str=Replace(str,BadworArry(0),String(Len(BadworArry(0)), "*"))
						End If
					End If
				Else
					str=Replace(str,BadworArry(0),String(Len(BadworArry(0)), "*"))
				End If
			End If
		Next
		BadworArry=Null
		Badwordlist=Null
		ChkBadWords = str
	End Function
	
	Public Function CheckHtmlCode(str)
	If Str<>"" And Not IsNull(str) Then
		Dim re
		Set re=new RegExp
		re.IgnoreCase =True
		re.Global=True
		re.Pattern="[\x00\x1c\x1d\x1e\x1f]" : str=re.Replace(str,"")
		re.Pattern="(on(load|click|dbclick|mouseover|mouseout|mousedown|mouseup|mousewheel|keydown|submit|change|focus)=""[^""]+"")"
		str = re.Replace(str, "")
		re.Pattern="((name|id|class)=""[^""]+"")"
		str = re.Replace(str, "")
		re.Pattern = "(<s+cript[^>]*?>([\w\W]*?)<\/s+cript>)"
		str = re.Replace(str, "")
		re.Pattern = "(<iframe[^>]*?>([\w\W]*?)<\/iframe>)"
		str = re.Replace(str, "")
		re.Pattern = "(<p>&nbsp;<\/p>)"
		str = re.Replace(str, "")
		Set re=Nothing
		CheckHtmlCode = str
	Else
		CheckHtmlCode = ""
	End If
	End Function
	
	Public Function CutStr(ByVal str,ByVal strlen)
		Dim i,l,t,c
		l=len(str)
		strlen=CLng(strlen)
		If strlen<1 Then
			cutStr=str
		Else
			t=0
			For i=1 To l
				c=Asc(Mid(str,i,1))
				If c<2 Then
					t=t+2
				Else
					t=t+1
				End If
				If t>=strlen Then
					cutStr=left(str,i)&"..."
					Exit for
				Else
					cutStr=str
				End If
			Next
		End If
		CutStr=Replace(cutStr,Chr(10),"")
	End Function
	
	Public Function RemoveHtml(ByVal str)
		On Error Resume Next
		Dim re:Set re=new RegExp
		re.IgnoreCase=True
		re.Global=True
		re.Pattern="<(.[^>]*)>"
		str=re.Replace(str, "")
		Set re=Nothing
		RemoveHtml=str
	End Function
End Class


Class ApplicationClass
Private IExpires

	Private Sub Class_initialize()
	End Sub
	
	Private Sub Class_Terminate()
	End Sub
	
	Public Default Property Get Contents(ByVal Value)
		Contents = Values(Value)
	End Property

	Public Property Let Expires(ByVal Value)
		IExpires = DateAdd("d", Value, Now)
	End Property

	Public Property Get Expires()
		Expires = IExpires
	End Property

	Public Sub Lock()
		Application.Lock()
	End Sub
	
	Public Sub UnLock()
		Application.UnLock()
	End Sub

	Public Sub Add(ByVal Key, ByVal Value, ByVal Expire)
		Expires = Expire
		Lock
		Application(Key) = Value
		Application(Key & "Expires") = Expires
		UnLock
	End Sub

	Public Sub Remove(ByVal Key)
		Lock
		Application.Contents.Remove(Key)
		Application.Contents.Remove(Key & "Expires")
		UnLock
	End Sub

	Public Sub RemoveAll()
		Clear()
	End Sub

	Public Sub Clear()
		Application.Contents.RemoveAll()
	End Sub

	Public Function Values(ByVal Key)
	Dim Expire : Expire = Application(Key & "Expires")
		If IsNull(Expire) Or IsEmpty(Expire) Then
			Values = ""
		Else
			If IsDate(Expire) And CDate(Expire) > Now Then
			Values = Application(Key)
			Else
			Call Remove(Key)
			Values = ""
			End If
		End If
	End Function

	Public Function Compare(ByVal Key1, ByVal Key2)
	Dim Cache1 : Cache1 = Values(Key1)
	Dim Cache2 : Cache2 = Values(Key2)
		If TypeName(Cache1) <> TypeName(Cache2) Then
		Compare = True
		Else
			If TypeName(Cache1)="Object" Then
			Compare = (Cache1 Is Cache2)
			Else
				If TypeName(Cache1) = "Variant()" Then
				Compare = (Join(Cache1, "^") = Join(Cache2, "^"))
				Else
				Compare = (Cache1 = Cache2)
				End If
			End If
		End If
	End Function
End Class


Sub Destroy
	set DB=Nothing
	set FU=Nothing
	set D=nothing
	CloseConn
End Sub
%>
<script Language="JScript" runat="server">
function CloseConn(){
	try{
		Conn.close();
		Conn = null;
	}catch(e){}
}
</script>
<script language="javascript" runat="server">function ec(s){return escape(s);}</script>