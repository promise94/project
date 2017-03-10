<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../../module/YeatPage/Zhuna_vbsPage.asp"-->
<%
Dim Action,ModuleName,CheckErr,MsgStr,AllFileSize,AllFile
AllFileSize=0
AllFile=0

CheckAdminLogin 3
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case Else:	   header(""):Call Show_Cache()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy

Sub Show_Cache()%>
<div id="main">
  <div class="main_box">
    <h2>缓存清理</h2>
    <div style="padding:10px;">
<%
GetFolders ItemPath&"DataBase/XML" 
GetFiles ItemPath&"DataBase","html" 
AllFileSize=round(AllFileSize/1024/1024,3)
If AllFileSize<1 and AllFileSize<>0 Then
	AllFileSize="0"&AllFileSize
End If
response.Write("<span style=""background:#666;color:#fff"">缓存文件总数：<b>"&AllFile&"个</b>，缓存文件所占空间大小<b>"&AllFileSize&"MB</b></span>")
%></div>
</div></div>
<%
End Sub

Sub Del_Cache(currentFolder)
	Dim folder,j
	Dim sServerDir
	Dim oFSO, oCurrentFolder, oFolders, oFolder,allfiles,uploadfolder,sFileSize,i,getfile,fileitem
	folder=Request.QueryString("folder")
	j=Request.QueryString("inum")
	If j="" Or j=0 Then CheckErr=True:MsgStr="没有缓存文件！"
	If Folder="" Then CheckErr=True:MsgStr="缺少参数！"

	sServerDir = Server.MapPath(currentFolder&"/"&folder)

	Set oFSO = Server.CreateObject( "Scripting.FileSystemObject" )
	if not oFSO.FolderExists(sServerDir) then
		CheckErr=True:MsgStr="没有缓存文件！"
		Set oFSO = Nothing
		exit sub
	end if

response.Write("<script>document.getElementById('"&folder&"-1').style.display='';document.getElementById('"&folder&"').style.display='';document.getElementById('"&folder&"').style.width='0%';</script>")
	If Not CheckErr Then
		Dim w,ww
		w=100/(j+1)
		Set uploadfolder = oFSO.GetFolder(sServerDir)
		set allfiles = uploadfolder.Files
			for each fileitem in allfiles
				oFSO.DeleteFile(fileitem)
				response.Write("<script>document.getElementById('"&folder&"').style.width='"&round(ww)&"%';document.getElementById('"&folder&"').innerHTML='"&round(ww)&"%';</script>")
				response.Flush()
				ww=ww+w
			next
		Set uploadfolder = Nothing
		set allfiles = Nothing
		'//数据删除成功
	response.Write("<script>window.location='?'</script>")
	End If
End Sub

Sub GetFolders( currentFolder )
	Dim sServerDir
	sServerDir = Server.MapPath(currentFolder)

	Dim oFSO, oCurrentFolder, oFolders, oFolder
	Set oFSO = Server.CreateObject( "Scripting.FileSystemObject" )
	if not (oFSO.FolderExists( sServerDir ) ) then
		Set oFSO = Nothing
		exit sub
	end if

	Set oCurrentFolder = oFSO.GetFolder(sServerDir)
	Set oFolders = oCurrentFolder.SubFolders
	For Each oFolder in oFolders
		Call GetFiles(currentFolder,oFolder.name)
	Next
	Set oCurrentFolder=Nothing
	Set oFolders = Nothing
	Set oFSO = Nothing
End Sub

  
Sub GetFiles(currentFolder,oFoldername)
	Dim sFileSize,uploadfolder,allfiles,sServerDir,AllFileSize_TEMP,AllFile_TEMP,FileSize
	sServerDir = Server.MapPath(currentFolder&"/"&oFoldername)

	Dim oFSOSUB
	Set oFSOSUB = Server.CreateObject( "Scripting.FileSystemObject" )
	if not (oFSOSUB.FolderExists( sServerDir ) ) then
		Set oFSOSUB = Nothing
		exit sub
	end if
	
	Set uploadfolder = oFSOSUB.GetFolder(sServerDir)
	set allfiles = uploadfolder.Files
		AllFileSize_TEMP=uploadfolder.size
		AllFile_TEMP=allfiles.count
		FileSize=round(uploadfolder.size/1024/1024,3)
		If FileSize<1 and FileSize<>0 Then
			FileSize="0"&FileSize
		End If
		Response.Write  "<li>缓存路径："&Replace( "DataBase/"&oFoldername, "&", "&amp;" )&":"
		response.Write" <b>文件总数:"&AllFile_TEMP&"&nbsp;&nbsp;文件总大小: "&FileSize&"MB</b><div class='outdiv' id='"&oFoldername&"-1'><div style='margin:1px;background:#F0FBEB;border:1px solid #9BDF70;display:none;' id='"&oFoldername&"'> </div></div>"
		Dim input,ooFolders
		ooFolders=Request.QueryString("folder")
		if AllFile_TEMP>0 Then
			If AllFile_TEMP>1000 Then
			input="<input type=""button"" style=""margin-left:25px;"" value=""清理"" class=""btn02"" onClick=""if(confirm('确实要删除吗?缓存文件比较多，需要一段时间！'))changval('"&server.URLEncode(oFoldername)&"',"&AllFile_TEMP&",this.form);"" >"
			Else
			input="<input type=""button"" style=""margin-left:25px;"" value=""清理"" class=""btn02"" onClick=""changval('"&server.URLEncode(oFoldername)&"',"&AllFile_TEMP&",this.form);"">"
			End If
		response.Write(input)
		End If
		response.Write("</li>")

		If ooFolders=oFoldername Then Del_Cache(currentFolder)
	set uploadfolder=Nothing
	set allfiles=Nothing
	Set oFSOSUB=Nothing
	AllFileSize=AllFileSize+AllFileSize_TEMP
	AllFile=AllFile+AllFile_TEMP
End Sub
%>
<style>
li{ list-style:none; height:40px;}
.outdiv{border:1px solid #9BDF70;padding:1px; display:none}
</style>
<script>
function changval(val,nums,forms)
{
	window.location="?action=do_del&folder="+val+"&inum="+nums;
}
</script>