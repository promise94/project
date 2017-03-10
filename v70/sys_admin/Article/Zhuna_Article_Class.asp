<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<%header("")
%>
<div id="main">
  <div class="main_box">
    <h2><a href="Zhuna_Article_Class.asp" style="color:deeppink">分类管理首页</a>|<a href="Zhuna_Article_Class.asp?action=add">新建分类</a>|<a href="?action=orderid">分类排序</a> </h2>
<%Dim Action,ModuleName

ModuleName=D("Article")

CheckAdminLogin 2
Dim Conn,SucMsg
Conn=DB.OutConn
Select Case Request("action")
	Case "add"
		Call Add
	Case "edit"
		Call edit
	Case "savenew"'rewrite cache
		Call savenew
		Call ReWriteCache()
	Case "savedit"'rewrite cache
		Call savedit
		Call ReWriteCache()
	Case "del"'rewrite cache
		Call del
		Call ReWriteCache()
	Case "orderid"
		Call orderid
	Case "updatorders"'rewrite cache
		Call updateorders
		Call ReWriteCache()
	Case "boardorders"
		Call boardorders
	Case "updatboardorders"'rewrite cache
		Call updateboardorders
		Call ReWriteCache()
	Case Else
		Call SortInfo
End Select
Footer
destroy

Private Sub SortInfo()
	Response.Write " <table width=""100%"" class=""t_list"" cellspacing=""1"" cellpadding=""2"" align=center>"
	Response.Write " <tr>"
	Response.Write " <th width=""25%""><strong>分类</strong> </th>"
	Response.Write " <th><strong>操作</strong> </th>"
	Response.Write "</tr>"
	Dim SQL,Rs,i,SQLs,Rss
	SQL = "select * from ZN_"&ModuleName&"_Class where Depth<2  order by rootid,orderid"
	Set Rs = DB.Recordset(SQL,1,1)
	i = 1
	Do While Not Rs.EOF
		Response.Write " <tr>"
		Response.Write " <td width=25% >"
		Response.Write " "
		If Rs("depth") = 1 Then Response.Write "&nbsp;&nbsp;<font color=""#666666"">├</font>"
		If Rs("depth") > 1 Then
			For i = 2 To Rs("depth")
				Response.Write "&nbsp;&nbsp;<font color=""#666666"">│</font>"
			Next
			Response.Write "&nbsp;&nbsp;<font color=""#666666"">├</font> "
		End If
		If Rs("parentid") = 0 Then Response.Write ("<b>")
		Response.Write Rs("ClassName")
		if rs("Depth")=2 then	
		response.Write("["&DB.Execute("select ClassName from ZN_"&ModuleName&"_Class where ClassId="&rs("ParentID"))(0)&"]")
		end if
		
		If Rs("child") > 0 Then Response.Write "(" & Rs("child") & ")"
		Response.Write " </td>"
		
		Response.Write " <td width=65%  align=right>"
		Response.Write "<a href=""Zhuna_Article_Class.asp?action=edit&editid="
		Response.Write Rs("ClassID")
		Response.Write """>修改</a> |"
	
		If Rs("child") > 0 Then	
			Response.Write " |"
			Response.Write " "
			Response.Write "<a href=""#"" onclick=""{if(confirm('该分类含有下属分类，必须先删除其下属分类方能删除本分类！')){return true;}return false;}"">"
			Response.Write " 删除</a>"
			Response.Write " "
		Else
			Response.Write " <a href=""Zhuna_Article_Class.asp?action=del&editid="
			Response.Write Rs("ClassID")
			Response.Write """ onclick=""{if(confirm('删除将包括该分类的所有信息，确定删除吗?')){return true;}return false;}"">删除"
			Response.Write " "
		End If
		Response.Write " </td>"
		Response.Write "</tr>"
	

if rs("Depth")=1 then
SQLs = "select * from ZN_"&ModuleName&"_Class where ParentID="&rs("ClassID")&" order by rootid,orderid"
	Set Rss = DB.Recordset(SQL,1,1)
do while not rss.eof
		Response.Write " <tr bgcolor='F4F5FF' onMouseOver=this.style.backgroundColor='D8DAFE' onmouseout=this.style.backgroundColor='F4F5FF'>"
		Response.Write " <td width=35% >"
		Response.Write "&nbsp;&nbsp;<font color=""#666666"">&nbsp;&nbsp;&nbsp;&nbsp;├</font> "
		Response.Write Rss("ClassName")
		If Rss("child") > 0 Then Response.Write "(" & Rss("child") & ")"
		Response.Write " </td>"
		Response.Write " <td width=65%  align=right><a href=""Zhuna_Article_Class.asp?action=add&editid="
		Response.Write Rss("ClassID")
		Response.Write """>添加分类</a>"
		Response.Write " | <a href=""Zhuna_Article_Class.asp?action=edit&editid="
		Response.Write Rss("ClassID")
		Response.Write """>分类设置</a>"
		Response.Write " |"
		Response.Write " "
		If Rss("child") = 0 Then
			Response.Write " <a href=""Zhuna_Article_Class.asp?action=del&editid="
			Response.Write Rss("ClassID")
			Response.Write """ onclick=""{if(confirm('删除将包括该分类的所有信息，确定删除吗?')){return true;}return false;}"">删除"
			Response.Write " "
		Else
			Response.Write "<a href=""#"" onclick=""{if(confirm('该分类含有下属分类，必须先删除其下属分类方能删除本分类！')){return true;}return false;}"">"
			Response.Write " 删除</a>"
			Response.Write " "
		End If
		Response.Write " </td>"
		Response.Write "</tr>"

rss.movenext
loop
end if
		
	Rs.movenext
	i = i + 1
	Loop
	Rs.Close
	Set Rs = Nothing
	Response.Write "</table>"
End Sub


Private Sub Add()
	Dim SortNum,Rs,SQL
	SQL = "select Max(ClassID) from ZN_"&ModuleName&"_Class "
	Set Rs = DB.Recordset(SQL,1,1)
	If Rs.bof And Rs.EOF Then
		SortNum = 1
	Else
		SortNum = Rs(0) + 1
	End If
	If IsNull(SortNum) Then SortNum = 1
	Rs.Close
	Response.Write "<form action =""Zhuna_Article_Class.asp?action=savenew"" method=post>"
	Response.Write "<input type=""hidden"" name=""newClassID"" value="""
	Response.Write SortNum
	Response.Write """>"
	Response.Write " <table width=""100%"" border=""0"" cellspacing=""1"" cellpadding=""3"" align=center class=""t_list"">"
	Response.Write " <tr>"
	Response.Write " <th colspan=2>添加新分类</th>"
	Response.Write "</tr>"
	Response.Write " <tr >"
	Response.Write " <td width=""30%""  height=30>分类名称</td>"
	Response.Write " <td width=""70%"" >"
	Response.Write " <input type=""text"" name=""sortname"" size=""35"">"
	Response.Write "</td>"
	Response.Write "</tr>"
	Response.Write " <tr style=""display:none"">"
	Response.Write " <td height=24 ><U>分类说明</U></td>"
	Response.Write " <td >"
	Response.Write " <textarea name=""Readme"" cols=""50"" rows=""3"">无</textarea>"
	Response.Write "</td>"
	Response.Write "</tr>"
	Response.Write " <tr style=""display:none"">"
	Response.Write " <td height=30 ><U>所属类别</U></td>"
	Response.Write " <td >"
	Response.Write " <select name=""classo"">"
	Response.Write "<option value=""0"">做为分类</option>"
	SQL = "select * from ZN_"&ModuleName&"_Class order by rootid,orderid"
	Rs.Open SQL, Conn, 1, 1
	Do While Not Rs.EOF
		If Request("editid") <> "" And CLng(Request("editid")) = Rs("ClassID") Then Response.Write "<option value=""" & Rs("ClassID") & """ selected>"
		Response.Write Rs("ClassName") & "</option>" & vbCrLf
		Rs.movenext
	Loop
	Rs.Close
	Response.Write "</select>"
	Response.Write "</td>"
	Response.Write " <tr>"
	Response.Write " <td height=24 >&nbsp;</td>"
	Response.Write " <td >"
	Response.Write " <input type=""submit"" name=""Submit"" class=btn02 value=""添加分类"">"
	Response.Write "</td>"
	Response.Write "</tr>"
	Response.Write "</table>"
	Response.Write "</form>"
	Set Rs = Nothing
End Sub

Private Sub savenew()
	Dim ClassID
	Dim rootid
	Dim ParentID
	Dim depth
	Dim orderid
	Dim Maxrootid
	Dim parentstr
	Dim neworders,Rs,SQL,SucMsg,ErrMsg
	If Request("sortname") = "" Then
		ErrMsg = ErrMsg + "<br>" + "<li>请输入分类名称。"
		response.Write(ErrMsg)
	'	Founderr = True
		Exit Sub
	End If
	If Request("classo") = "" Then
		ErrMsg = ErrMsg + "<br>" + "<li>请选择分类。"
	    response.Write(ErrMsg)
	'	Founderr = True
		Exit Sub
	End If
	If Request("readme") = "" Then
		ErrMsg = ErrMsg + "<br>" + "<li>请输入分类说明。"
	    response.Write(ErrMsg)
	'	Founderr = True
		Exit Sub
	End If

	If Request("classo") <> "0" Then
		SQL = "select rootid,ClassID,depth,orderid,parentstr from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("classo"))
		Set Rs = DB.Recordset(SQL,1,1)
		rootid = Rs(0)
		ParentID = Rs(1)
		depth = Rs(2)
		orderid = Rs(3)
		If depth + 1 > 20 Then
			ErrMsg = "<li>本系统限制最多只能有20级子分类</li>"
			response.Write(ErrMsg)
			'Founderr = True
			Exit Sub
		End If
		parentstr = Rs(4)
		Rs.Close
		neworders = orderid
		SQL = "select max(orderid) from ZN_"&ModuleName&"_Class where ParentID=" & FU.CheckNumeric(Request("classo"))
		Rs.Open SQL, Conn, 1, 1
		If Not (Rs.bof And Rs.EOF) Then
			neworders = Rs(0)
		End If
		If IsNull(neworders) Then neworders = orderid
		Rs.Close
		DB.Execute ("update  ZN_"&ModuleName&"_Class set orderid=orderid+1 where orderid>" & CInt(neworders) & "")
	Else
		SQL = "select max(rootid) from ZN_"&ModuleName&"_Class "
		Set Rs = DB.Recordset(SQL,1,1)
		Maxrootid = Rs(0) + 1
		If IsNull(Maxrootid) Then Maxrootid = 1
		Rs.Close
	End If
	SQL = "select ClassID from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("newClassID"))
	Set Rs = DB.Recordset(SQL,1,1)
	If Not (Rs.EOF And Rs.bof) Then
		ErrMsg = "<li>您不能指定和别的分类一样的序号。</li>"
	    Response.Write(ErrMsg)
	'	Founderr = True
		Exit Sub
	Else
		ClassID = Request("newClassID")
	End If
	Rs.Close
	SQL = "select * from ZN_"&ModuleName&"_Class "
	Set Rs = DB.Recordset(SQL,1,3)
	Rs.addnew
	If Request("classo") <> "0" Then
		Rs("depth") = depth + 1
		Rs("rootid") = rootid
		Rs("orderid") = neworders + 1
		Rs("parentid") = FU.CheckNumeric(Request.Form("classo"))
		If parentstr = "0" Then
			Rs("parentstr") = FU.CheckNumeric(Request.Form("classo"))
		Else
			Rs("parentstr") = parentstr & "," & FU.CheckNumeric(Request.Form("classo"))
		End If
	Else
		Rs("depth") = 0
		Rs("rootid") = Maxrootid
		Rs("orderid") = 0
		Rs("parentid") = 0
		Rs("parentstr") = 0
	End If
	Rs("child") = 0
	Rs("ClassID") = FU.CheckNumeric(Request.Form("newClassID"))
	Rs("ClassName") = Server.HTMLEncode(FU.CheckBadStr(Request.Form("sortname")))
	Rs("readme") = FU.CheckBadStr(Request.Form("readme"))
'	Rs("skinid") = Request.Form("skinid")
'	Rs("isUpdate") = 1
	Rs.Update
	Rs.Close
	If Request("classo") <> "0" Then
		If depth > 0 Then DB.Execute ("update  ZN_"&ModuleName&"_Class set child=child+1 where ClassID in (" & parentstr & ")")
		DB.Execute ("update  ZN_"&ModuleName&"_Class set child=child+1 where ClassID=" & FU.CheckNumeric(Request("classo")))
	End If
response.Write "<script language=javascript>alert('分类添加成功！');location.href='?';</script>"
	SucMsg = "<li>分类添加成功！</li>"
     Response.write SucMsg
	Set Rs = Nothing
End Sub


Private Sub edit()
	Dim Rs_e,Rs,SQL
	
	SQL = "select * from ZN_"&ModuleName&"_Class where ClassID=" & Request("editid")
	Set Rs_e = DB.Execute(SQL)
	Response.Write "<form action =""Zhuna_Article_Class.asp?action=savedit"" method=post>"
	Response.Write "<input type=""hidden"" name=editid value="""
	Response.Write Request("editid")
	Response.Write """>"
	Response.Write " <table width=""100%"" border=""0"" cellspacing=""1"" cellpadding=""3"" align=center class=""t_list"">"
	Response.Write " <tr>"
	Response.Write " <th height=24 colspan=2>编辑分类："
	Response.Write Rs_e("ClassName")
	Response.Write "</th>"
	Response.Write " </tr>"
	Response.Write " <tr >"
	Response.Write " <td width=""30%"" height=30 >分类名称</td>"
	Response.Write " <td width=""70%"" >"
	Response.Write " <input type=""text"" name=""sortname"" size=""35"" value="""
	Response.Write Rs_e("ClassName")
	Response.Write """>"
	Response.Write " </td>"
	Response.Write " </tr>"
	
	Response.Write " <tr style=""display:none"">"
	Response.Write " <td height=24 >&nbsp;</td>"
	Response.Write " <td >"
	Response.Write "<input name=""indexIMG"" type=""text"" class=""INPUT_text"" id=""indexIMG"" size=""30"" value='"
	Response.Write Rs_e("indexIMG")
	Response.Write "' >"
	if Rs_e("indexIMG")<>"" then
	Response.Write "<img width=""80px"" src=""../"&Rs_e("indexIMG")&""">"
	end if
	Response.Write "</td>"
	Response.Write "</tr>"
	
	Response.Write " <tr style=""display:none"">"
	Response.Write " <td height=24><U>分类说明</U><BR>"
	Response.Write " 可以使用HTML代码</td>"
	Response.Write " <td >"
	Response.Write " <textarea name=""Readme"" cols=""50"" rows=""3"">"
	Response.Write Rs_e("readme")
	Response.Write "</textarea>"
	Response.Write " </td>"
	Response.Write " </tr>"
	Response.Write " <tr style=""display:none"">"
	Response.Write " <td height=30 ><U>所属类别</U></td>"
	Response.Write " <td >"
	Response.Write " <select name=""classo"">"
	Response.Write " <option value=""0"">做为分类</option>"
	Response.Write " "
	SQL = "select * from ZN_"&ModuleName&"_Class order by rootid,orderid"
	Set Rs = DB.Recordset(SQL,1,1)
	Do While Not Rs.EOF
		Response.Write ""
		If Rs_e("parentid") = Rs("ClassID") Then Response.Write "<option value=""" & Rs("ClassID") & """ selected>"
		Response.Write ""
'		If Rs("depth") = 1 Then Response.Write "&nbsp;&nbsp;├ "
'		If Rs("depth") > 1 Then
'			For i = 2 To Rs("depth")
'				Response.Write "&nbsp;&nbsp;│"
'			Next
'			Response.Write "&nbsp;&nbsp;├ "
'		End If
		Response.Write Rs("ClassName") & "</option>" & vbCrLf
		Rs.movenext
	Loop
	Rs.Close
	Response.Write " </select> </td>"
	Response.Write " </tr>"
	Response.Write " <tr>"
	Response.Write " <td height=24>&nbsp; </td>"
	Response.Write " <td >"
	Response.Write " <input type=""submit"" name=""Submit"" class=btn02 value=""保存修改"">"
	Response.Write " </td>"
	Response.Write " </tr>"
	Response.Write " </table>"
	Response.Write "</form>"
	Set Rs = Nothing
	Set Rs_e = Nothing
End Sub

Private Sub savedit()
	Dim newClassID
	Dim Maxrootid
	Dim ParentID
	Dim depth
	Dim Child
	Dim ParentStr
	Dim rootid
	Dim iparentid
	Dim iParentStr
	Dim trs
	Dim brs
	Dim mrs
	Dim k
	Dim nParentStr
	Dim mParentStr
	Dim ParentSql
	Dim boardcount,Rs,SQL
	If CLng(Request("editid")) = CLng(Request("classo")) Then
		ErrMsg = "<li>所属分类不能指定自己</li>"
		Founderr = True
		Exit Sub
	End If
	SQL = "select * from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("editid"))
	Set Rs = DB.Recordset(SQL,1,3)
	newClassID = Rs("ClassID")
	ParentID = Rs("parentid")
	iparentid = Rs("parentid")
	ParentStr = Rs("ParentStr")
	depth = Rs("depth")
	Child = Rs("child")
	rootid = Rs("rootid")

	If ParentID = 0 Then
		If CLng(Request("classo")) <> 0 Then
			Set trs = DB.Execute("select rootid from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("classo")))
			If rootid = trs(0) Then
				ErrMsg = "<li>您不能指定该分类的下属分类作为所属分类</li>"
				Founderr = True
				Exit Sub
				Response.End
			End If
		End If
	Else
		Set trs = DB.Execute("select ClassID from ZN_"&ModuleName&"_Class where ParentStr like '%" & ParentStr & "%' and ClassID=" & FU.CheckNumEric(Request("classo")))
		If Not (trs.EOF And trs.bof) Then
			ErrMsg = "<li>您不能指定该分类的下属分类作为所属分类</li>"
			Founderr = True
			Exit Sub
			Response.End
		End If
	End If
	If ParentID = 0 Then
		ParentID = Rs("ClassID")
		iparentid = 0
	End If
	Rs("ClassName") = Server.HTMLEncode(FU.CheckBadStr(Request.Form("sortname")))
	Rs("indexIMG") = FU.CheckBadStr(Request("indexIMG"))
	Rs("readme") = FU.CheckBadStr(Request("readme"))
	Rs.Update
	Rs.Close
	Set Rs = Nothing
	Set mrs = DB.Execute("select max(rootid) from ZN_"&ModuleName&"_Class ")
	Maxrootid = mrs(0) + 1

	If CLng(ParentID) <> CLng(Request("classo")) And Not (iparentid = 0 And CInt(Request("classo")) = 0) Then
		If iparentid > 0 And CInt(Request("classo")) = 0 Then
			DB.Execute ("update  ZN_"&ModuleName&"_Class set depth=0,orderid=0,rootid=" & Maxrootid & ",parentid=0,ParentStr='0' where ClassID=" & newClassID)
			ParentStr = ParentStr & ","
			Set Rs = DB.Execute("select count(*) from ZN_"&ModuleName&"_Class where ParentStr like '%" & ParentStr & "%'")
			boardcount = Rs(0)
			If IsNull(boardcount) Then
				boardcount = 1
			Else
				boardcount = boardcount + 1
			End If
			DB.Execute ("update  ZN_"&ModuleName&"_Class set child=child-" & boardcount & " where ClassID=" & iparentid)
			For i = 1 To depth
				Set Rs = DB.Execute("select parentid from ZN_"&ModuleName&"_Class where ClassID=" & iparentid)
				If Not (Rs.EOF And Rs.bof) Then
					iparentid = Rs(0)
					DB.Execute ("update  ZN_"&ModuleName&"_Class set child=child-" & boardcount & " where ClassID=" & iparentid)
				End If
			Next
			If Child > 0 Then
				i = 0
				Set Rs = DB.Execute("select * from ZN_"&ModuleName&"_Class where ParentStr like '%" & ParentStr & "%'")
				Do While Not Rs.EOF
					i = i + 1
					mParentStr = Replace(Rs("ParentStr"), ParentStr, "")
					DB.Execute ("update  ZN_"&ModuleName&"_Class set depth=depth-" & depth & ",rootid=" & Maxrootid & ",ParentStr='" & mParentStr & "' where ClassID=" & Rs("ClassID"))
					Rs.movenext
				Loop
			End If
		ElseIf iparentid > 0 And CInt(Request("classo")) > 0 Then
			Set trs = DB.Execute("select * from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("classo")))
			ParentStr = ParentStr & ","
			Set Rs = DB.Execute("select count(*) from ZN_"&ModuleName&"_Class where ParentStr like '%" & ParentStr & "%'")
			boardcount = Rs(0)
			If IsNull(boardcount) Then boardcount = 1
			DB.Execute ("update  ZN_"&ModuleName&"_Class set orderid=orderid + " & boardcount & " + 1 where rootid=" & trs("rootid") & " and orderid>" & trs("orderid") & "")
			DB.Execute ("update  ZN_"&ModuleName&"_Class set depth=" & trs("depth") & "+1,orderid=" & trs("orderid") & "+1,rootid=" & trs("rootid") & ",ParentID=" & Request("classo") & ",ParentStr='" & trs("ParentStr") & "," & trs("ClassID") & "' where ClassID=" & newClassID)
			i = 1
			Set Rs = DB.Execute("select * from ZN_"&ModuleName&"_Class where ParentStr like '%" & ParentStr & "%' order by orderid")
			Do While Not Rs.EOF
				i = i + 1
				iParentStr = trs("ParentStr") & "," & trs("ClassID") & "," & Replace(Rs("ParentStr"), ParentStr, "")
				DB.Execute ("update  ZN_"&ModuleName&"_Class set depth=depth+" & trs("depth") & "-" & depth & "+1,orderid=" & trs("orderid") & "+" & i & ",rootid=" & trs("rootid") & ",ParentStr='" & iParentStr & "' where ClassID=" & Rs("ClassID"))
				Rs.movenext
			Loop
			ParentID = FU.CheckNumeric(Request("classo"))
			If rootid = trs("rootid") Then

				DB.Execute ("update  ZN_"&ModuleName&"_Class set child=child+" & i & " where (not ParentID=0) and ClassID=" & ParentID)
				For k = 1 To trs("depth")
					Set Rs = DB.Execute("select parentid from ZN_"&ModuleName&"_Class where (not ParentID=0) and ClassID=" & ParentID)
					If Not (Rs.EOF And Rs.bof) Then
						ParentID = Rs(0)
						DB.Execute ("update ZN_"&ModuleName&"_Class set child=child+" & i & " where (not ParentID=0) and  ClassID=" & ParentID)
					End If
				Next
				DB.Execute ("update ZN_"&ModuleName&"_Class set child=child-" & i & " where (not ParentID=0) and ClassID=" & iparentid)
				For k = 1 To depth
					Set Rs = DB.Execute("select parentid from ZN_"&ModuleName&"_Class where (not ParentID=0) and ClassID=" & iparentid)
					If Not (Rs.EOF And Rs.bof) Then
						iparentid = Rs(0)
						DB.Execute ("update ZN_"&ModuleName&"_Class set child=child-" & i & " where (not ParentID=0) and  ClassID=" & iparentid)
					End If
				Next
			Else
				DB.Execute ("update ZN_"&ModuleName&"_Class set child=child+" & i & " where ClassID=" & ParentID)
				For k = 1 To trs("depth")
					Set Rs = DB.Execute("select parentid from ZN_"&ModuleName&"_Class where ClassID=" & ParentID)
					If Not (Rs.EOF And Rs.bof) Then
						ParentID = Rs(0)
						DB.Execute ("update ZN_"&ModuleName&"_Class set child=child+" & i & " where ClassID=" & ParentID)
					End If
				Next
				DB.Execute ("update ZN_"&ModuleName&"_Class set child=child-" & i & " where ClassID=" & iparentid)
				For k = 1 To depth
					Set Rs = DB.Execute("select parentid from ZN_"&ModuleName&"_Class where ClassID=" & iparentid)
					If Not (Rs.EOF And Rs.bof) Then
						iparentid = Rs(0)
						DB.Execute ("update ZN_"&ModuleName&"_Class set child=child-" & i & " where ClassID=" & iparentid)
					End If
				Next
			End If
		Else

			Set trs = DB.Execute("select * from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("classo")))
			Set Rs = DB.Execute("select count(*) from ZN_"&ModuleName&"_Class where rootid=" & rootid)
			boardcount = Rs(0)
			ParentID = FU.CheckNumeric(Request("classo"))
			DB.Execute ("update ZN_"&ModuleName&"_Class set child=child+" & boardcount & " where ClassID=" & ParentID)
			For k = 1 To trs("depth")
				Set Rs = DB.Execute("select parentid from ZN_"&ModuleName&"_Class where ClassID=" & ParentID)
				If Not (Rs.EOF And Rs.bof) Then
					ParentID = Rs(0)
					DB.Execute ("update ZN_"&ModuleName&"_Class set child=child+" & boardcount & " where ClassID=" & ParentID)
				End If
			Next
			DB.Execute ("update ZN_"&ModuleName&"_Class set orderid=orderid + " & boardcount & " + 1 where rootid=" & trs("rootid") & " and orderid>" & trs("orderid") & "")
			i = 0
			Set Rs = DB.Execute("select * from ZN_"&ModuleName&"_Class where rootid=" & rootid & " order by orderid")
			Do While Not Rs.EOF
				i = i + 1
				If Rs("parentid") = 0 Then
					If trs("ParentStr") = "0" Then
						ParentStr = trs("ClassID")
					Else
						ParentStr = trs("ParentStr") & "," & trs("ClassID")
					End If
					DB.Execute ("update ZN_"&ModuleName&"_Class set depth=depth+" & trs("depth") & "+1,orderid=" & trs("orderid") & "+" & i & ",rootid=" & trs("rootid") & ",ParentStr='" & ParentStr & "',parentid=" & Request("classo") & " where ClassID=" & Rs("ClassID"))
				Else
					If trs("ParentStr") = "0" Then
						ParentStr = trs("ClassID") & "," & Rs("ParentStr")
					Else
						ParentStr = trs("ParentStr") & "," & trs("ClassID") & "," & Rs("ParentStr")
					End If
					DB.Execute ("update ZN_"&ModuleName&"_Class set depth=depth+" & trs("depth") & "+1,orderid=" & trs("orderid") & "+" & i & ",rootid=" & trs("rootid") & ",ParentStr='" & ParentStr & "' where ClassID=" & Rs("ClassID"))
				End If
				Rs.movenext
			Loop
		End If
	End If	'action=edit&editid="&Request("editid")&"
	response.Write "<script language=javascript>alert('分类修改成功！');location.href='?';</script>"
	SucMsg = "<li>分类修改成功！</li>"
    response.Write(SucMsg)
	Set Rs = Nothing
	Set mrs = Nothing
	Set trs = Nothing
End Sub

Private Sub del()
	Dim Rs,SQL
	Set Rs = DB.Execute("select ParentStr,child,depth from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("editid")))
	If Not (Rs.EOF And Rs.bof) Then
		If Rs(1) > 0 Then
			Response.Write "该分类含有下属分类，请删除其下属分类后再进行删除本分类的操作"
			Exit Sub
		End If
		If Rs(2) > 0 Then
			DB.Execute ("update ZN_"&ModuleName&"_Class set child=child-1 where ClassID in (" & Rs(0) & ")")
		End If
		SQL = "delete from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("editid"))
		DB.Execute (SQL)
		DB.Execute ("delete from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("editid")))
	End If

	Set Rs = Nothing
	response.Write "<script language=javascript>alert('分类删除成功！');location.href='?';</script>"
     Response.write ("分类删除成功！")
End Sub

Private Sub orderid()
	Dim Rs,SQL
	Response.Write " <table width=""100%"" border=""0"" cellspacing=""1"" cellpadding=""3"" align=center class=""t_list"">"
	Response.Write " <tr>"
	Response.Write " <th>分类一级分类重新排序修改(请在相应分类的排序表单内输入相应的排列序号) </th>"
	Response.Write " </tr>"
	Response.Write " <tr>"
	Response.Write " <td class=forumrow>"
	Response.Write "<table width=""100%"">"

	SQL = "select * from ZN_"&ModuleName&"_Class where ParentID=0 order by RootID"
	Set Rs = DB.recordset(SQL,1,1)
	If Rs.bof And Rs.EOF Then
		Response.Write "还没有相应的分类。"
	Else
		Do While Not Rs.EOF
			Response.Write "<form action=Zhuna_Article_Class.asp?action=updatorders method=post><tr><td width=""50%"">" & Rs("ClassName") & "</td>"
			Response.Write "<td width=""50%""><input type=text name=""OrderID"" size=4 value=""" & Rs("rootid") & """><input type=hidden name=""cID"" value=""" & Rs("rootid") & """>&nbsp;&nbsp;<input type=submit name=Submit class=btn02 value='修 改'></td></tr></form>"
			Rs.movenext
		Loop
		Response.Write "</table>"
	End If
	Rs.Close
	Set Rs = Nothing
	Response.Write " </td>"
	Response.Write " </tr>"
	Response.Write "</table>"
End Sub

Private Sub updateorders()
	Dim cID
	Dim OrderID
	Dim ClassName,Rs
	cID = FU.CheckNumeric(Replace(Request.Form("cID"), "'", ""))
	OrderID = FU.CheckNumeric(Replace(Request.Form("OrderID"), "'", ""))
	Set Rs = DB.Execute("select ClassID from ZN_"&ModuleName&"_Class where rootid=" & OrderID)
	If Rs.bof And Rs.EOF Then
		DB.Execute ("update ZN_"&ModuleName&"_Class set rootid=" & OrderID & " where rootid=" & cID)
		response.Write "<script language=javascript>alert('设置成功，请返回！');location.href='?action=orderid';</script>"
	Else
		response.Write "<script language=javascript>alert('请不要和其他分类设置相同的序号！');location.href='?action=orderid';</script>"
	End If
	Set Rs = Nothing
End Sub

Private Sub boardorders()
	Dim trs,Rs,SQL
	Dim uporders
	Dim doorders
	Response.Write " <table width=""100%"" border=""0"" cellspacing=""1"" cellpadding=""2"" class=""t_list"" align=center>"
	Response.Write " <tr>"
	Response.Write " <th colspan=2 >分类N级分类重新排序修改(请在相应分类的排序表单内输入相应的排列序号)"
	Response.Write " </th>"
	Response.Write " </tr>"

	SQL = "select * from ZN_"&ModuleName&"_Class order by RootID,orderid"
	Set Rs = DB.recordset(SQL,1,1)
	If Rs.bof And Rs.EOF Then
		Response.Write "还没有相应的分类。"
	Else
		Do While Not Rs.EOF
			Response.Write "<form action=Zhuna_Article_Class.asp?action=updatboardorders method=post><tr bgcolor='F4F5FF' onMouseOver=this.style.backgroundColor='D8DAFE' onmouseout=this.style.backgroundColor='F4F5FF'><td width=""50%"" class=forumrow>"
			If Rs("depth") = 1 Then Response.Write "&nbsp;&nbsp;<font color=""#666666"">├</font>"
			If Rs("depth") > 1 Then
				For i = 2 To Rs("depth")
					Response.Write "&nbsp;&nbsp;<font color=""#666666"">│</font>"
				Next
				Response.Write "&nbsp;&nbsp;<font color=""#666666"">├</font> "
			End If
			If Rs("parentid") = 0 Then Response.Write ("<b>")
			Response.Write Rs("ClassName")
			If Rs("child") > 0 Then Response.Write "(" & Rs("child") & ")"
			Response.Write "</td><td width=""50%"" class=forumrow>"
			If Rs("ParentID") > 0 Then
				Set trs = DB.Execute("select count(*) from ZN_"&ModuleName&"_Class where ParentID=" & Rs("ParentID") & " and orderid<" & Rs("orderid") & "")
				uporders = trs(0)
				If IsNull(uporders) Then uporders = 0
				Set trs = DB.Execute("select count(*) from ZN_"&ModuleName&"_Class where ParentID=" & Rs("ParentID") & " and orderid>" & Rs("orderid") & "")
				doorders = trs(0)
				If IsNull(doorders) Then doorders = 0
				If uporders > 0 Then
					Response.Write "<select name=uporders size=1><option value=0>↑</option>"
					For i = 1 To uporders
						Response.Write "<option value=" & i & ">↑" & i & "</option>"
					Next
					Response.Write "</select>"
				End If
				If doorders > 0 Then
					If uporders > 0 Then Response.Write "&nbsp;"
					Response.Write "<select name=doorders size=1><option value=0>↓</option>"
					For i = 1 To doorders
						Response.Write "<option value=" & i & ">↓" & i & "</option>"
					Next
					Response.Write "</select>"
				End If
				If doorders > 0 Or uporders > 0 Then
					Response.Write "<input type=hidden name=""editID"" value=""" & Rs("ClassID") & """>&nbsp;<input type=submit name=Submit class=button value='修 改'>"
				End If
			End If
			Response.Write "</td></tr></form>"
			uporders = 0
			doorders = 0
			Rs.movenext
		Loop
	End If
	Rs.Close
	Set Rs = Nothing
	Response.Write "</table>"

End Sub

Private Sub updateboardorders()
	Dim ParentID
	Dim orderid
	Dim ParentStr
	Dim Child
	Dim uporders
	Dim doorders
	Dim oldorders
	Dim trs
	Dim ii
	If Not IsNumeric(Request("editID")) Then
		response.Write("非法的参数！")
		Exit Sub
	End If
	If Request("uporders") <> "" And Not CInt(Request("uporders")) = 0 Then
		If Not IsNumeric(Request("uporders")) Then
			Response.Write ("非法的参数！")
			Exit Sub
		ElseIf CInt(Request("uporders")) = 0 Then
			Response.Write ("请选择要提升的数字！")
			Exit Sub
		End If
		Set Rs = DB.Execute("select ParentID,orderid,ParentStr,child from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("editID")))
		ParentID = Rs(0)
		orderid = Rs(1)
		ParentStr = Rs(2) & "," & FU.CheckNumeric(Request("editID"))
		Child = Rs(3)
		i = 0
		If Child > 0 Then
			Set Rs = DB.Execute("select count(*) from ZN_"&ModuleName&"_Class where ParentStr like '%" & ParentStr & "%'")
			oldorders = Rs(0)
		Else
			oldorders = 0
		End If
		Set Rs = DB.Execute("select ClassID,orderid,child,ParentStr from ZN_"&ModuleName&"_Class where ParentID=" & ParentID & " and orderid<" & orderid & " order by orderid desc")
		Do While Not Rs.EOF
			i = i + 1
			If CInt(Request("uporders")) >= i Then
				If Rs(2) > 0 Then
					ii = 0
					Set trs = DB.Execute("select ClassID,orderid from ZN_"&ModuleName&"_Class where ParentStr like '%" & Rs(3) & "," & Rs(0) & "%' order by orderid")
					If Not (trs.EOF And trs.bof) Then
						Do While Not trs.EOF
							ii = ii + 1
							DB.Execute ("update ZN_"&ModuleName&"_Class set orderid=" & orderid & "+" & oldorders & "+" & ii & " where ClassID=" & trs(0))
							trs.movenext
						Loop
					End If
				End If
				DB.Execute ("update ZN_"&ModuleName&"_Class set orderid=" & orderid & "+" & oldorders & " where ClassID=" & Rs(0))
				If CInt(Request("uporders")) = i Then uporders = Rs(1)
			End If
			orderid = Rs(1)
			Rs.movenext
		Loop
		DB.Execute ("update ZN_"&ModuleName&"_Class set orderid=" & uporders & " where ClassID=" & FU.CheckNumeric(Request("editID")))
		If Child > 0 Then
			i = uporders
			Set Rs = DB.Execute("select ClassID from ZN_"&ModuleName&"_Class where ParentStr like '%" & ParentStr & "%' order by orderid")
			Do While Not Rs.EOF
				i = i + 1
				DB.Execute ("update ZN_"&ModuleName&"_Class set orderid=" & i & " where ClassID=" & Rs(0))
				Rs.movenext
			Loop
		End If
		Set Rs = Nothing
		Set trs = Nothing
	ElseIf Request("doorders") <> "" Then
		If Not IsNumeric(Request("doorders")) Then
			response.Write ("非法的参数！")
			Exit Sub
		ElseIf CInt(Request("doorders")) = 0 Then
		    response.Write("请选择要下降的数字！")
			Exit Sub
		End If
		Set Rs = DB.Execute("select ParentID,orderid,ParentStr,child from ZN_"&ModuleName&"_Class where ClassID=" & FU.CheckNumeric(Request("editID")))
		ParentID = Rs(0)
		orderid = Rs(1)
		ParentStr = Rs(2) & "," & FU.CheckNumeric(Request("editID"))
		Child = Rs(3)
		i = 0
		If Child > 0 Then
			Set Rs = DB.Execute("select count(*) from ZN_"&ModuleName&"_Class where ParentStr like '%" & ParentStr & "%'")
			oldorders = Rs(0)
		Else
			oldorders = 0
		End If
		Set Rs = DB.Execute("select ClassID,orderid,child,ParentStr from ZN_"&ModuleName&"_Class where ParentID=" & ParentID & " and orderid>" & orderid & " order by orderid")
		Do While Not Rs.EOF
			i = i + 1
			If CInt(Request("doorders")) >= i Then
				If Rs(2) > 0 Then
					ii = 0
					Set trs = DB.Execute("select ClassID,orderid from ZN_"&ModuleName&"_Class where ParentStr like '%" & Rs(3) & "," & Rs(0) & "%' order by orderid")
					If Not (trs.EOF And trs.bof) Then
						Do While Not trs.EOF
							ii = ii + 1
							DB.Execute ("update ZN_"&ModuleName&"_Class set orderid=" & orderid & "+" & ii & " where ClassID=" & trs(0))
							trs.movenext
						Loop
					End If
				End If
				DB.Execute ("update ZN_"&ModuleName&"_Class set orderid=" & orderid & " where ClassID=" & Rs(0))
				If CInt(Request("doorders")) = i Then doorders = Rs(1)
			End If
			orderid = Rs(1)
			Rs.movenext
		Loop
		DB.Execute ("update ZN_"&ModuleName&"_Class set orderid=" & doorders & " where ClassID=" & FU.CheckNumeric(Request("editID")))
		If Child > 0 Then
			i = doorders
			Set Rs = DB.Execute("select ClassID from ZN_"&ModuleName&"_Class where ParentStr like '%" & ParentStr & "%' order by orderid")
			Do While Not Rs.EOF
				i = i + 1
				DB.Execute ("update ZN_"&ModuleName&"_Class set orderid=" & i & " where ClassID=" & Rs(0))
				Rs.movenext
			Loop
		End If

	End If
	Set Rs = Nothing
	Set trs = Nothing
	Response.redirect "Zhuna_Article_Class.asp?action=boardorders"
End Sub
%>