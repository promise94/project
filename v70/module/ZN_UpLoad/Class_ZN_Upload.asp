<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="FonshenUpLoadClass.asp"-->
<%
Class ZN_Upload
	Private ZN_Conn,ZN_Config,FormFileName,PicExt,ZN_ConfigFile,DatePath

	Private Sub Class_Initialize
		DatePath="Image/"&year(date)&"/"&FormatStr_001(month(date),"00",0)&FormatStr_001(day(date),"00",0)&"/"
		ZN_ConfigFile="ZN_UpLoad.conf"
		FormFileName="ZNFile"
		PicExt="jpg|gif|jpeg|bmp"
	End Sub
	
	Public Function Start()
	
		if ZN_Config(1)=0 then
			UploadFileName=UpLoadFonshen()
		else
			response.write "�����ϴ����"
		end if
		
		dim Ret(3)
		Ret(0)=UploadFileName
		Ret(1)=DatePath
		Ret(2)=ZN_Config(4)

		Start=Ret
	End Function

'	ʹ�÷���������ϴ���
	Private Function UpLoadFonshen()
		'�����ϴ�����
		set request2=new UpLoadClass
		
		'��ͼ/�ļ��ϴ�·��
		UpLoadPath=ZN_Config(4)&DatePath

		if (CreateMultiFolder(UpLoadPath))=False then	'����Ŀ¼
			Msg("�ļ��ϴ�ʧ�ܣ�Ŀ��Ŀ¼����ʧ�ܣ�")
			response.end
		end if

		'�����ļ�����ĸ�������Ϊgif/jpg/rar/zip
		request2.FileType=ZN_Config(2)
		'�ϴ�·��
		request2.SavePath=UpLoadPath
		'�ϴ���С����
		request2.MaxSize=ZN_Config(3)
		'����Ϊ�ֶ�����ģʽ
		request2.AutoSave=2
		'�򿪶���
		request2.Open()
		'�ϴ��ļ�
		if not request2.Save(FormFileName,0) then
			select case request2.Form(FormFileName&"_Err")
				case -1
					Msg("��ѡ��Ҫ�ϴ����ļ� <a href=""javascript:history.go(-1)"">[����]</a>")
				case 1
					Msg("�ļ���С�������� <a href=""javascript:history.go(-1)"">[����]</a>")
				case 2
					Msg("���ϴ��涨�����ڵ��ļ� <a href=""javascript:history.go(-1)"">[����]</a>")
				case 3
					Msg("�ļ����ͼ��ļ���С����ȷ <a href=""javascript:history.go(-1)"">[����]</a>")
				case else 
					Msg("�ļ��ϴ�ʧ�ܣ�ϵͳ���� <a href=""javascript:history.go(-1)"">[����]</a>")
			end select
			response.end
		end if
		
		UpLoadFonshen=request2.Form(FormFileName)
		
		set request2=nothing
	End Function	

	
	'�ж��ϴ��ļ��Ƿ�ΪͼƬ
	Private Function IsImage(tpFileExt)
		if instr("|"&PicExt&"|","|"&tpFileExt&"|") then
			IsImage=True
		else
			IsImage=False
		end if
	End Function
	
	'�õ��ļ���չ��
	function fileExec(fileName)
		fileExec=lcase(mid(fileName,instr(fileName,".")+1,len(fileName)-instr(fileName,".")))
	end function
	
	'���ַ������и�ʽ��λ����
	'str��Ҫ��λ���ִ�
	'stb����λ��ʽ���磺00000000
	'f����λλ�ã�0������, 1������
	Private function FormatStr_001(str,stb,f)
		cont=len(stb)-len(str)
		if f=0 then
			str=left(stb,cont)&str
		elseif f=1 then
			str=str&left(stb,cont)
		end if
		FormatStr_001=str
	end function
	
	'��ʾ������Ϣ
	Private Function Msg(Infos)
		response.write "<div style=""color:red;font-size:12px;top:2px;position:absolute;"">"&Infos&"</div>"
		response.flush
	End Function

	'�����༶Ŀ¼
	Private Function CreateMultiFolder(ByVal CFolder)
		Dim objFSO,PhCreateFolder,CreateFolderArray,CreateFolder
		Dim i,ii,CreateFolderSub,PhCreateFolderSub,BlInfo
		BlInfo = False
		CreateFolder = CFolder
		On Error Resume Next
		Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
		If Err Then
			Err.Clear()
			Exit Function
		End If
		CreateFolder = Replace(CreateFolder,"\","/")
		If Left(CreateFolder,1)="/" Then
			CreateFolder = Right(CreateFolder,Len(CreateFolder)-1)
		End If
		If Right(CreateFolder,1)="/" Then
			CreateFolder = Left(CreateFolder,Len(CreateFolder)-1)
		End If
		CreateFolderArray = Split(CreateFolder,"/")
		For i = 0 to UBound(CreateFolderArray)
			CreateFolderSub = ""
			For ii = 0 to i
				CreateFolderSub = CreateFolderSub & CreateFolderArray(ii) & "/"
			Next
			PhCreateFolderSub = Server.MapPath(CreateFolderSub)
			If Not objFSO.FolderExists(PhCreateFolderSub) Then
				objFSO.CreateFolder(PhCreateFolderSub)
			End If
		Next
		If Err Then
			Err.Clear()
		Else
			BlInfo = True
		End If
		CreateMultiFolder = BlInfo
	End Function

	'��ȡ�ϴ�����
	Function GetConfig(ConfigID)
		set f=server.createobject("scripting.filesystemobject")
		Set fsoStream = f.OpenTextFile(server.MapPath(ZN_ConfigFile))
		ReadTextLineByNumber = ""
		Do While fsoStream.AtEndOfStream<>True   
			Temp=fsoStream.ReadLine
			if instr(Temp,"#"&ConfigID&"|") then
				ReadTextLineByNumber=Temp
				Exit DO
			end if
		Loop
		fsoStream.Close
		Set fsoStream = Nothing
		Set f = Nothing
		Set fso = Nothing
		if ReadTextLineByNumber="" then
			response.write ReadTextLineByNumber
			Msg("�ļ��ϴ�ʧ�ܣ��ϴ����ö�ʧ��")
			response.end
		end if
		ZN_Config=split(ReadTextLineByNumber,"|")
	End Function
	
	
	'���ϴ�������Ӳ����ձ�Ҫ����
	Public Function UpLoadFormHiddenPara()
	
		RetHTML=""
		
		ConfigID=Request.QueryString("ConfigID")'����ID
		FA=Request.QueryString("FA")
		ED=Request.QueryString("ED")
	
		RetHTML=RetHTML&_
		"<script language=""javascript"">"&_
		"	document.getElementById('FormZNUP').action='?action=add';"&_
		"	if(opener!=undefined){"&_
		"		document.getElementById('FormZNUP').action=document.getElementById('FormZNUP').action+'&AF=1';"&_
		"	}else{"&_
		"		document.getElementById('FormZNUP').action=document.getElementById('FormZNUP').action+'&AF=0';"&_
		"	}"
		
		if ConfigID="" then
			RetHTML=RetHTML&"document.write('ȱ�ٱ�Ҫ����������ID');"
		else
			RetHTML=RetHTML&"document.getElementById('FormZNUP').action=document.getElementById('FormZNUP').action+'&ConfigID="&ConfigID&"';"
		end if
		
		if FA<>"" then
			RetHTML=RetHTML&"document.getElementById('FormZNUP').action=document.getElementById('FormZNUP').action+'&FA="&FA&"';"
		end if
		
		if ED<>"" then
			RetHTML=RetHTML&"document.getElementById('FormZNUP').action=document.getElementById('FormZNUP').action+'&ED="&ED&"';"
		end if
		
		RetHTML=RetHTML&_
		"</script>"
	
	UpLoadFormHiddenPara=RetHTML
	End Function
End Class

%>