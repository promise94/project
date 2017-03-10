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
			response.write "其它上传组件"
		end if
		
		dim Ret(3)
		Ret(0)=UploadFileName
		Ret(1)=DatePath
		Ret(2)=ZN_Config(4)

		Start=Ret
	End Function

'	使用风声无组件上传类
	Private Function UpLoadFonshen()
		'建立上传对象
		set request2=new UpLoadClass
		
		'大图/文件上传路径
		UpLoadPath=ZN_Config(4)&DatePath

		if (CreateMultiFolder(UpLoadPath))=False then	'创建目录
			Msg("文件上传失败：目标目录创建失败！")
			response.end
		end if

		'设置文件允许的附件类型为gif/jpg/rar/zip
		request2.FileType=ZN_Config(2)
		'上传路径
		request2.SavePath=UpLoadPath
		'上传大小限制
		request2.MaxSize=ZN_Config(3)
		'设置为手动保存模式
		request2.AutoSave=2
		'打开对象
		request2.Open()
		'上传文件
		if not request2.Save(FormFileName,0) then
			select case request2.Form(FormFileName&"_Err")
				case -1
					Msg("请选择要上传的文件 <a href=""javascript:history.go(-1)"">[返回]</a>")
				case 1
					Msg("文件大小超出上限 <a href=""javascript:history.go(-1)"">[返回]</a>")
				case 2
					Msg("请上传规定类型内的文件 <a href=""javascript:history.go(-1)"">[返回]</a>")
				case 3
					Msg("文件类型及文件大小不正确 <a href=""javascript:history.go(-1)"">[返回]</a>")
				case else 
					Msg("文件上传失败：系统错误 <a href=""javascript:history.go(-1)"">[返回]</a>")
			end select
			response.end
		end if
		
		UpLoadFonshen=request2.Form(FormFileName)
		
		set request2=nothing
	End Function	

	
	'判断上传文件是否为图片
	Private Function IsImage(tpFileExt)
		if instr("|"&PicExt&"|","|"&tpFileExt&"|") then
			IsImage=True
		else
			IsImage=False
		end if
	End Function
	
	'得到文件扩展名
	function fileExec(fileName)
		fileExec=lcase(mid(fileName,instr(fileName,".")+1,len(fileName)-instr(fileName,".")))
	end function
	
	'对字符串进行格式补位操作
	'str：要补位的字串
	'stb：补位格式：如：00000000
	'f：补位位置：0：补左, 1：补右
	Private function FormatStr_001(str,stb,f)
		cont=len(stb)-len(str)
		if f=0 then
			str=left(stb,cont)&str
		elseif f=1 then
			str=str&left(stb,cont)
		end if
		FormatStr_001=str
	end function
	
	'显示运行信息
	Private Function Msg(Infos)
		response.write "<div style=""color:red;font-size:12px;top:2px;position:absolute;"">"&Infos&"</div>"
		response.flush
	End Function

	'创建多级目录
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

	'读取上传配置
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
			Msg("文件上传失败：上传配置丢失！")
			response.end
		end if
		ZN_Config=split(ReadTextLineByNumber,"|")
	End Function
	
	
	'在上传表单中添加并接收必要参数
	Public Function UpLoadFormHiddenPara()
	
		RetHTML=""
		
		ConfigID=Request.QueryString("ConfigID")'配置ID
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
			RetHTML=RetHTML&"document.write('缺少必要参数：配置ID');"
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