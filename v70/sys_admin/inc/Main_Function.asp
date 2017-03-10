<%

'////////////////////////////////////////////////////////////////////
'//SqlServer2005 nt:3 varchar(MAX):201 text:201 varchar(Num):200 money:6 float:5 datetime:135 bit:11
'//Access nt:3 varchar(MAX):201 text:201 varchar(Num):200 money:6 float:5 datetime:7 bit:11
Function InputDatabase(out,pre,rs)
	dim item
	for each item in Request.Form
		if instr(lcase(out),"|"&lcase(item)&"|")<=0 then
			'response.write item&"="&request.form(item)&"<br>"
			'response.write item&"-"&rs(pre&"_"&item).type&"<br>"
			if (rs(pre&"_"&item).type=4 or rs(pre&"_"&item).type=6 or rs(pre&"_"&item).type=5 or rs(pre&"_"&item).type=11) and request.Form(item)="" then
				rs(pre&"_"&item)=0
			elseif rs(pre&"_"&item).type=7 then
				rs(pre&"_"&item)=FU.Formatime(request.Form(item))
			elseif rs(pre&"_"&item).type=3 or rs(pre&"_"&item).type=2 then
				rs(pre&"_"&item)=FU.CheckNumeric(request.Form(item))
			elseif rs(pre&"_"&item).type=202 then
				rs(pre&"_"&item)=FU.RequestForm(request.Form(item),255)
			end if
		end if
	next
End Function


'/////////////////////////////////////////////////////////////////////////
function OutputContentToFormByJavascript(out,pre,rs)
Dim Field,ewebeditor_str
	response.write "<script language=""javascript"">"&chr(13)
	response.write "function loadform(){"&chr(13)
	response.Write "var modform=document.modform;"&chr(13)
	for each Field in rs.fields
		if instr(lcase(out),"|"&lcase(replace(field.name,pre&"_",""))&"|")<=0 then
			if rs(field.name)<>"" then
		
			response.write "	if(modform."&lcase(replace(field.name,pre&"_",""))&"!=undefined){"&chr(13)
	
			if instr(lcase(field.name),"_ewebeditor")<>0 then	
				ewebeditor_str=rs(field.name)
				ewebeditor_str=replace(ewebeditor_str,"'","\'")
				ewebeditor_str=replace(ewebeditor_str,"<script","<'+'script",1,-1,1)
				ewebeditor_str=replace(ewebeditor_str,"</script","</'+'script",1,-1,1)
				ewebeditor_str=replace(ewebeditor_str,chr(13)&chr(10),"\n")
				ewebeditor_str=replace(ewebeditor_str,chr(10),"\n")
				ewebeditor_str=replace(ewebeditor_str,chr(13),"\n")
				response.write "		"&lcase(replace(field.name,pre&"_",""))&".innerHTML='"&ewebeditor_str&"';"&chr(13)
			elseif instr(lcase(field.name),"_select")<>0 then
				response.write "		for(var i=0;i<modform."&lcase(replace(field.name,pre&"_",""))&".length;i++){"&chr(13)
				response.write "			if(modform."&lcase(replace(field.name,pre&"_",""))&".options[i].value=='"&rs(field.name)&"'){"&chr(13)
				response.write "				modform."&lcase(replace(field.name,pre&"_",""))&".options[i].selected=true;"&chr(13)
				response.write "			}"&chr(13)
				response.write "		}"&chr(13)
			
			elseif instr(lcase(field.name),"_checkbox")<>0 then	
				if rs(field.name) then
				response.write "		modform."&lcase(replace(field.name,pre&"_",""))&".checked=true;"&chr(13)
				else
				response.write "		modform."&lcase(replace(field.name,pre&"_",""))&".checked=false;"&chr(13)
				end if
			elseif instr(lcase(field.name),"_radio")<>0 then
			
				response.write "		for(var i=0;i<modform."&lcase(replace(field.name,pre&"_",""))&".length;i++){"&chr(13)
				response.write "			if(modform."&lcase(replace(field.name,pre&"_",""))&"[i].value=='"&rs(field.name)&"'){"&chr(13)
				response.write "				modform."&lcase(replace(field.name,pre&"_",""))&"[i].checked=true;"&chr(13)
				response.write "			}"&chr(13)
				response.write "		}"&chr(13)	
			else
				ewebeditor_str=rs(field.name)
				ewebeditor_str=replace(ewebeditor_str,"'","\'")
				ewebeditor_str=replace(ewebeditor_str,"<script","<'+'script")
				ewebeditor_str=replace(ewebeditor_str,"</script","</'+'script")
				ewebeditor_str=replace(ewebeditor_str,chr(13)&chr(10),"\n")
				ewebeditor_str=replace(ewebeditor_str,chr(10),"\n")
				ewebeditor_str=replace(ewebeditor_str,chr(13),"\n")
				response.write "		modform."&lcase(replace(field.name,pre&"_",""))&".value='"&ewebeditor_str&"';"&chr(13)
			end if
			response.write "	}"&chr(13)
		end if
		end if
	next
	response.write "}</script>"&chr(13)
end function


sub Admin_ShowClass_Option(CurrentID,sClassTable,iDepthMax)
	dim rsClass,sqlClass,strTemp,tmpDepth,i
	dim arrShowLine(20)
	for i=0 to ubound(arrShowLine)
		arrShowLine(i)=False
	next

	sqlClass="Select * From "&sClassTable&" where Depth<"&iDepthMax&" order by RootID,OrderID"
	set rsClass=DB.Recordset(sqlClass,1,1)
	if rsClass.bof and rsClass.bof then
		response.write "<option value=''>请您添加类别</option>"&chr(13)
	else
		do while not rsClass.eof
			tmpDepth=rsClass("Depth")
			if rsClass("NextID")>0 then
				arrShowLine(tmpDepth)=True
			else
				arrShowLine(tmpDepth)=False
			end if
				strTemp="<option value='" & rsClass("ClassID") & "'"
			if rsClass("ClassID")=CurrentID then
				 strTemp=strTemp & " selected"
			end if
			strTemp=strTemp & ">"
			if tmpDepth>0 then
				for i=1 to tmpDepth
					strTemp=strTemp & "&nbsp;&nbsp;"
					if i=tmpDepth then
						if rsClass("NextID")>0 then
							strTemp=strTemp & "&nbsp;"
						else
							strTemp=strTemp & "&nbsp;"
						end if
					else
						if arrShowLine(i)=True then
							strTemp=strTemp & ""
						else
							strTemp=strTemp & "&nbsp;"
						end if
					end if
				next
			end if
			strTemp=strTemp & rsClass("ClassName")
			strTemp=strTemp & "</option>"&chr(13)
			response.write strTemp
			rsClass.movenext
		loop
	end if
	rsClass.close
	set rsClass=nothing
end sub

Function CheckAdminLogin(Flag)
	Dim AdminName, AdminPass, AdminID
	AdminName = FU.CheckBadstr(Session(cachename & "AdminName"))	
	AdminPass = FU.CheckBadstr(Session(cachename & "AdminPass"))	
	AdminID = FU.CheckNumeric(Session(cachename & "AdminID"))			

	Dim SQL, Rs
	SQL ="SELECT Manage_ID,Manage_AdminFlag_select FROM ZN_"&D("Manage")&" WHERE Manage_UserName='" & AdminName & "' And Manage_Password='" & AdminPass & "' And Manage_ID="& AdminID
	Set Rs = DB.Execute(SQL)
	If Rs.BOF And Rs.EOF Then
		Session.Abandon
		Rs.Close:set Rs = Nothing
		Response.Write("<script>window.top.location='"&left(ItemPath,len(ItemPath)-3)&"Zhuna_Login.asp'</script>")
		Response.End
	Else
		If (Rs(1)+1)<Flag Then
			Rs.Close:set Rs = Nothing
			Response.Write("<script>alert('您没有此权限！');history.back();</script>")
			Response.End
		End If
	End If
	Rs.Close:Set Rs = Nothing
End Function

Sub header(val)
	Response.Write "<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">" & vbCrLf&_
	 "<html xmlns=""http://www.w3.org/1999/xhtml"">" & vbCrLf&_
	 "<head>" & vbCrLf&_
	 "<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312""/>" & vbCrLf&_
	 "<title>管理后台</title>" & vbCrLf&_
	 "<link href=""../css/layout.css"" type=""text/css"" rel=""stylesheet""/>" & vbCrLf&_
	 "<script language=""javascript"" type=""text/javascript"" src=""../JavaScript/main.js""></script>" & vbCrLf&_
	 "<script language=""javascript"" type=""text/javascript"">window.onload=function(){closeload();"&val&"}</script>" & vbCrLf&_
	 "</head>" & vbCrLf&_
	 "<body>" & vbCrLf&_
	 "<div id=""loading"" style=""z-index:1;right:20px;top:30px;color:#fff;position: absolute;""><img src=""../../images/loader.gif""></div>" & vbCrLf
End Sub

Sub footer()
	'Dim Endtime
'	Endtime = Timer()
'	Response.Write "<br>" & FormatNumber((Endtime-startime),5, -1)
'	Response.Write "</body></html>"
End Sub
%>