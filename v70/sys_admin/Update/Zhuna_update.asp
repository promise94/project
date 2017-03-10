<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<div id="main">
  <div class="main_box">
    <h2>网站更新</h2>
    <div style="padding:10px;">
<%Dim Action,CheckErr,MsgStr
CheckAdminLogin 3
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "doupdate":header(""):Call doupdate()
Case "testspeed":Call testspeed()
Case Else:	  header(""):Call showversion()
End Select
response.Write("<br><br><br>遇到手动更新时，切忌跨版本升级！一次只更新一个手动版本！网络情况会直接影响更新结果,请选择网络情况良好时进行更新!")
If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy
%></div>
</div></div>
<%
Function CheckFSO()
On Error Resume Next
Dim tfile,TestObj,te:te=true
	Set TestObj = Server.CreateObject("Scripting.FileSystemObject")
	if err<>0 Then te=false:response.Write("<font color=red>您的空间不支持FSO组件</font>。<br>"):response.end():err=0
	if TestObj.FileExists(server.MapPath("deletest.asp")) then TestObj.DeleteFile(server.MapPath("deletest.asp"))
	if err<>0 Then te=false:response.Write("<font color=red>FSO删除文件失败</font>。<br>"):err=0
	set tfile=TestObj.CreateTextFile(server.MapPath("deletest.asp"),True,True)
		tfile.WriteLine("测试")
		tfile.close
	set tfile=nothing
	if err<>0 Then 	response.Write(Err.Number&vbcrlf&_
						   Err.Source&vbcrlf&_
						   Err.Description)
	if err<>0 Then te=false:response.Write("<font color=red>FSO写入文件失败</font>。<br>"):err=0
	TestObj.DeleteFile(server.MapPath("deletest.asp"))
	if err<>0 Then te=false:response.Write("<font color=red>FSO删除文件失败</font>。<br>"):err=0
	if TestObj.FileExists(server.MapPath("delettest.txt")) then TestObj.DeleteFile(server.MapPath("delettest.txt"))
	if err<>0 Then te=false:response.Write("<font color=red>FSO删除FTP上传文件失败</font><br>"):err=0
	Set TestObj=Nothing
	err.clear
	CheckFSO=te
End Function

Sub showversion()
If Not CheckFSO Then
	response.Write("<br>您的空间不支持FSO组件或者FSO部分功能，您不能使用更新功能！请联系空间提供商或者修改服务器权限！")
	response.End()
End If
Dim xml,apiUrl,xml2,versionXML,versionXML2,j,fstr,lastversion,nowversion,modes,modesbak,updatever
	apiUrl=updateserver&"update.xml"
	set xml=GetXml(apiUrl,"")
	set xml2=ExSavedXML("../../inc/version.xml")
	set versionXML=xml.documentElement.SelectNodes("item")
	set versionXML2=xml2.documentElement.selectSingleNode("item/version")
	lastversion=versionXML2.text
	nowversion=versionXML2.text
		For j=0 to versionXML.length-1
			If versionXML(j).getElementsByTagName("version").item(0).text>versionXML2.text Then
			if modesbak="" Then modesbak=versionXML(j).getElementsByTagName("mode").item(0).text:updatever=versionXML(j).getElementsByTagName("version").item(0).text
				lastversion=versionXML(j).getElementsByTagName("version").item(0).text
				If versionXML(j).getElementsByTagName("mode").item(0).text="manual" Then
					modes="<font color=red>手动</font>"
				Else
					modes="<font color=green>自动</font>"
				End If
				response.Write("["&modes&"]有新版本"&versionXML(j).getElementsByTagName("version").item(0).text&"，版本更新："&versionXML(j).getElementsByTagName("intro").item(0).text&"<br />")
				If modesbak="manual" Then Exit for
			End If
		Next
	set xml=nothing:set xml2=nothing:set versionXML=nothing:set versionXML2=nothing
	fstr="<font color=green>不需要</font>"
	if lastversion>nowversion Then fstr="<font color=red>需要</font>"
	response.Write("您当前的版本为："&nowversion&"；官网最新版本为："&lastversion&"；您"&fstr&"更新！")

	If modesbak="manual" Then
		response.Write("<br><br>有版本需要手动更新，您需要先去<a href=""http://un.zhuna.cn"" target=""_blank"">un.zhuna.cn</a>更新"&updatever&"！")
	Else
		response.Write("<br><a href=""?action=doupdate""><b>我要更新>></b></a>")
	End If
End Sub

Sub DoUpdate()
If Not CheckFSO Then
	response.Write("<br>您的空间不支持FSO组件或者FSO部分功能，您不能使用更新功能！请联系空间提供商或者修改服务器权限！")
	response.End()
End If
	Dim xml,apiUrl,xml2,versionXML,versionXML2,files,i,backfile,j,fxml,lastversion,nowversion
	apiUrl=updateserver&"update.xml"
	set xml=GetXml(apiUrl,"")
	set xml2=ExSavedXML("../../inc/version.xml")
	set versionXML=xml.documentElement.SelectNodes("item")
	set versionXML2=xml2.documentElement.selectSingleNode("item/version")
	response.Write("您现在的版本为:"&versionXML2.text&"<br>")
	lastversion=versionXML2.text
	nowversion=versionXML2.text
			If (not versionXML is nothing) and (not versionXML2 is nothing) Then 
				For j=0 to versionXML.length-1
					If versionXML(j).getElementsByTagName("version").item(0).text>versionXML2.text Then
						If versionXML(j).getElementsByTagName("mode").item(0).text="manual" Then CheckErr=true:MsgStr="有版本需要手动更新，您需要先去un.zhuna.cn更新"&versionXML(j).getElementsByTagName("version").item(0).text&"！":Exit For:Exit Sub
						response.Write("更新新版本"&versionXML(j).getElementsByTagName("version").item(0).text&"<br />")
						response.Flush()
						apiUrl=updateserver&versionXML(j).getElementsByTagName("xmllist").item(0).text
						Err.clear
						set xml=GetXml(apiUrl,"")
							set files=xml.documentElement.SelectNodes("File/item")
							If files.length>0 Then 
								For i=0 to files.length-1
									If checkfiletype(files(i).getAttribute("type")) Then
										backfile=GetBackfiles(updateserver&xml.documentElement.selectSingleNode("vesion").text&"/"&files(i).text,0)
										if backfile<>"" Then
											Call CreatFile("Temp/"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type"),backfile)
										Else
											err=1
										end if
									Else
										backfile=GetBackfiles(updateserver&xml.documentElement.selectSingleNode("vesion").text&"/"&files(i).text,1)
										if not isnull(backfile) Then
											Call SaveFiles("Temp/"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type"),backfile)
										Else
											err=1
										end if
									End If
								Next
							End If
							If Err=0 Then
								If CheckFiles(xml) Then
									If MoveFiles(xml) Then
										lastversion=versionXML(j).getElementsByTagName("version").item(0).text
										response.Write("<b style='color:white;background:green'>更新新版本"&versionXML(j).getElementsByTagName("version").item(0).text&"成功</b><br /><br />")
										response.Flush()
									End If
								End If
							Else
								response.Write("<b style='color:white;background:red'>更新新版本"&versionXML(j).getElementsByTagName("version").item(0).text&"失败</b><br /><br />")
								response.Flush()
							End If
							set files=Nothing
							Call deleteFolder("Temp")
					End If
				Next
			End if
	If nowversion<>lastversion Then
		set fxml=xml2.documentElement.selectSingleNode("item")
		fxml.getElementsByTagName("version").item(0).text=lastversion
		fxml.getElementsByTagName("date").item(0).text=now
		xml2.save(server.MapPath("../../inc/version.xml"))
		set fxml=Nothing
	End If
	Set versionXML2=Nothing
	Set versionXML=Nothing
	Set xml2=Nothing
	Set xml=Nothing
End Sub


Function checkfiletype(types)
	dim ty,i,isnotimg
	isnotimg=true
	ty=array("gif","jpg","bmp","jpeg","png","swf")
	for i=0 to ubound(ty)-1
		if lcase(types)=lcase(ty(i)) then
			isnotimg=false
		end if
	Next
	checkfiletype=isnotimg
End Function

Function CheckFiles(xml)
	Dim files,i,backfile,fso,fileitem
	Set fso=Server.CreateObject("Scripting.FileSystemObject")
	set files=xml.documentElement.SelectNodes("File/item")
	If files.length>0 Then 
		For i=0 to files.length-1
			if fso.FileExists(server.MapPath("Temp/"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type"))) then
				Set fileitem=fso.GetFile(server.MapPath("Temp/"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type")))
				If fileitem.size<7 Then
					err=1
				End If
				Set fileitem=Nothing
			Else
				err=1
			end if
		Next
	End If
	If Err=0 Then
		CheckFiles=true
	Else
		CheckFiles=false
	End If
	set files=Nothing
	Set fso=Nothing
End Function

Function MoveFiles(xml)
Dim files,backfile,i
	set files=xml.documentElement.SelectNodes("File/item")
	If files.length>0 Then 
		For i=0 to files.length-1
			If checkfiletype(files(i).getAttribute("type")) Then
				backfile=getfilestream("Temp/"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type"),0)
				if backfile<>"" Then
					Call CreatFile(ItemPath&split(files(i).text,".")(0)&"."&files(i).getAttribute("type"),backfile)
					response.Write("&nbsp;&nbsp;&nbsp;&nbsp;<font color=green>更新"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type")&"文件成功</font><br>")
					response.Flush()
				Else
					response.Write("&nbsp;&nbsp;&nbsp;&nbsp;<font color=red>更新"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type")&"文件失败</font><br>")
					response.Flush()
					err=1				
				End if
			Else
				backfile=getfilestream("Temp/"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type"),1)

				if not isnull(backfile) Then
					Call SaveFiles(ItemPath&split(files(i).text,".")(0)&"."&files(i).getAttribute("type"),backfile)
					response.Write("&nbsp;&nbsp;&nbsp;&nbsp;<font color=green>更新"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type")&"文件成功</font><br>")
					response.Flush()
				Else
					response.Write("&nbsp;&nbsp;&nbsp;&nbsp;<font color=red>更新"&split(files(i).text,".")(0)&"."&files(i).getAttribute("type")&"文件失败</font><br>")
					response.Flush()
					err=1				
				End if
			End If
		Next
	End If
	
	If Err=0 Then
		MoveFiles=true
	Else
		MoveFiles=false
	End If
	Set Files=Nothing
End Function

Function getfilestream(src,types)
	Dim MyFile
	Set MyFile = Server.CreateObject("Adodb.Stream")
	If types Then
		  With MyFile
			.Type = 1
			.Open
			.LOADFROMFILE server.MapPath(src)
			getfilestream = .Read 
			.Cancel()
			.Close()
		  End With
	 Else
	 	With MyFile
			.Type = 1
			.Mode =3
			.Open
			.LOADFROMFILE server.MapPath(src)
			.Position = 0
			.Type = 2
			.Charset = "GB2312"
			getfilestream = .ReadText
			.Close
		end with
	End If
	Set MyFile=nothing
End Function
	
Function GetBackfiles(url,types)
dim http
		Set http=Server.CreateObject(mshttp)
			http.SetTimeOuts 10000,10000,120000,60000
			http.Open "GET",url,False
			http.send
			If http.status=200 Then
				If types Then
					GetBackfiles=Http.responseBody
				Else
					GetBackfiles=bytesToBSTR(Http.responseBody,"GB2312")
				End If
			Else
				GetBackfiles=""
			End If
		Set Http=Nothing
End Function

'==================================================
'函数名：BytesToBstr
'作 用：将获取的源码转换为中文
'参 数：Body ------要转换的变量
'参 数：Cset ------要转换的类型
'==================================================
Function BytesToBstr(Body,Cset)
Dim Objstream
Set Objstream = Server.CreateObject("adodb.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write body
objstream.Position = 0
objstream.Type = 2
objstream.Charset = Cset
BytesToBstr = objstream.ReadText 
objstream.Close
set objstream = nothing
End Function
%>
