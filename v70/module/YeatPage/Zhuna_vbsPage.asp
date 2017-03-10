<%
Class Zhuna_vbsPage
	Private oConn		'连接对象
	Private iRecordCount
	Private iRecType	'RecType 取记录总数(>0为赋值或者固定值,0执行count设置存cookies,-1执行count不设置cookies)
	Private iPageSize	'页次
	Private sPageName	'地址栏页数参数名
	Private sDbType		'数据库类型,AC(access),MSSQL(SQL SERVER2000),MYSQL(mysql,sqlite),PGSQL(PostGreSql)
	Private sJsUrl		'Zhuna_jsPage.js的路径
	Private sField		'字段名
	Private sTable		'表名
	Private sCondition	'条件,不需要where
	Private sOrderBy	'排序,不需要order by,需要asc或者desc
	Private sGroupBy	'排序,不需要order by,需要asc或者desc
	Private sPKey		'主键,必写
	Private s
	Private i
	Private iPageCount
   	Private iPageCurr
	Private nums
	Private sResultSet_Sql
	Private Sub Class_Initialize
		iRecordCount=0
		iRecType=0
		iPageSize=10
		sPageName="Page"
		sDbType="AC"
		sJsUrl="/module/YeatPage/"
		sField=" * "
	End Sub

	Public Property Set Conn(ByRef o)
		Set oConn=o
	End Property

	Public Property Let RecType(ByVal i)
		iRecType=CheckNum(i,0,0,iRecType,0) 
	End Property
	
	Public Property Let PageSize(ByVal i)
		iPageSize=CheckNum(i,0,0,iPageSize,0) 
	End Property

	Public Property Let PageName(ByVal s)
		sPageName=IIf(Len(s)<1,sPageName,s)
	End Property

	Public Property Let DbType(ByVal s)
		sDbType=UCase(IIf(Len(s)<1,sDbType,s))
	End Property

	Public Property Let JsUrl(ByVal s)
		sJsUrl=IIf(Len(s)<1,sJsUrl,s)
	End Property

	Public Property Let PKey(ByVal s)
		sPKey=s
	End Property

	Public Property Let Field(ByVal s)
		sField=IIf(Len(s)<1,sField,s)
	End Property

	Public Property Let Table(ByVal s)
		sTable=s
	End Property
	Public Property Let ResultSet_Sql(ByVal s)
	    sResultSet_Sql=s
    End Property
	Public Property Let Condition(ByVal s)
		sCondition=IIf(Len(s)>2," WHERE " & s,"")
	End Property

	Public Property Let OrderBy(ByVal s)
		sOrderBy=IIf(Len(s)>4," ORDER BY " & s,"")
	End Property

	Public Property Let GroupBy(ByVal s)
		sGroupBy=IIf(Len(s)>4," Group BY " & s,"")
	End Property
	
	Public Property Get RecordCount()
		If iRecType>0 Then
			i=iRecType
		Elseif iRecType=0 Then
			i=CheckNum(Request.Cookies("ShowoPage")(sPageName),1,0,0,0)
			s=Trim(Request.Cookies("ShowoPage")("sCond"))
			IF i=0 OR sCondition<>s Then
			
				i=oConn.Execute("SELECT COUNT(" & sPKey & ") FROM " & sTable & " " & sCondition,0,1)(0)
				if sGroupBy<>"" then
				i=oConn.Execute("SELECT COUNT(" & sPKey & ") FROM " & sTable & " " & sCondition & sGroupBy,0,1)(0)
				end if
				Response.Cookies("ShowoPage")(sPageName)=i
				Response.Cookies("ShowoPage")("sCond")=sCondition
			End If
		Else
			i=oConn.Execute("SELECT COUNT(" & sPKey & ") FROM " & sTable & " " & sCondition,0,1)(0)
			'///如果有group by 那么count的条件就要加上sgroupby
			if sGroupBy<>"" then
				isa=oConn.Execute("SELECT COUNT(" & sPKey & ") FROM " & sTable & " " & sCondition & sGroupBy,0,1)
				if isnull(isa) then
				i=isa(0)
				end if
			end if
			'///end
		End If
		iRecordCount=i
		RecordCount=i
	End Property

	Public Property Get ResultSet()
		s=Null
		i=RecordCount()
		If i>0 Then
			iPageCount=(i+iPageSize-1)\iPageSize
			nums=Request.QueryString(sPageName)
			iPageCurr=CheckNum(nums,1,1,1,iPageCount)
			Select Case sDbType
				Case "MSSQL"
					Set Rs=server.CreateObject("Adodb.RecordSet")
					Set Cm=Server.CreateObject("Adodb.Command")
					Cm.CommandType=4
					Cm.ActiveConnection=oConn
					Cm.CommandText="sp_Util_Page"
					Cm.parameters(1)=i
					Cm.parameters(2)=iPageCurr
					Cm.parameters(3)=iPageSize
					Cm.parameters(4)=sPKey
					Cm.parameters(5)=sField
					Cm.parameters(6)=sTable
					Cm.parameters(7)=Replace(sCondition," WHERE ","")
					Cm.parameters(8)=Replace(sOrderBy," ORDER BY ","")
					Rs.CursorLocation=3
					Rs.LockType=1
					Rs.Open Cm
				Case "MYSQL"
					ResultSet_Sql="SELECT " & sField & " FROM " & sTable & " " & sCondition & " " & sOrderBy & " LIMIT " & (iPageCurr-1)*iPageSize & "," & iPageSize
					Set Rs=oConn.Execute(sResultSet_Sql)
				Case Else
					Dim Rs
					Set Rs = Server.CreateObject ("Adodb.RecordSet")
					ResultSet_Sql="SELECT " & sField & " FROM " & sTable & " " & sCondition & " " & sOrderBy & " " & sGroupBy
					Rs.Open sResultSet_Sql,oConn,1,1
					Rs.AbsolutePosition=(iPageCurr-1)*iPageSize+1
			End Select
			s=Rs.GetRows(iPageSize)
			Rs.close
			Set Rs=Nothing
		End If
		ResultSet=s
	End Property

	Private Sub Class_Terminate()
		If IsObject(oConn) Then oConn.Close:Set oConn=Nothing
	End Sub

	'================================================================
	' 输入:检查字符,是否有最小值,是否有最大值,最小值(默认数字),最大值
	'================================================================
	Private Function CheckNum(ByVal s,ByVal b1,ByVal b2,ByVal i1,ByVal i2)
		Dim i
		s=Left(Trim("" & s),32)
		If IsNumeric(s) Then
			i=CDbl(s)
			i=IIf(b1=1 And i<i1,i1,i)
			i=IIf(b2=1 And i>i2,i2,i)
		Else
			i=i1
		End If
		CheckNum=i
	End Function

	'================================================================
	' 输入:简化条件判断
	'================================================================
	Private Function IIf(ByVal b,ByVal s1,ByVal s2)
		IIf=s2
		If b Then IIf=s1
	End Function

	'================================================================
	' 上下页部分
	'================================================================
	Public Sub ShowPage()
		If iRecordCount>0 And iRecordCount>iPageSize Then
		Response.Write "<Script Language='JavaScript' type='text/JavaScript' src='"&sJsUrl&"Zhuna_jsPage.js'></Script>"
		Response.Write "<Script Language='JavaScript' type='text/JavaScript'>"
		Response.Write "var s= new Zhuna_jsPage("&iRecordCount&","&iPageSize&",3,'s');"
		Response.Write "s.setPageSE('"&sPageName&"=','');"
		Response.Write "s.setPageInput('"&sPageName&"');"
		Response.Write "s.setUrl('');"
		Response.Write "s.setPageFrist('<<','<<');"
		Response.Write "s.setPagePrev('<','<');"
		Response.Write "s.setPageNext('>','>');"
		Response.Write "s.setPageLast('>>','>>');"
		Response.Write "s.setPageText('{$PageNum}','{$PageNum}');"
		Response.Write "s.setPageTextF(' {$PageTextF} ',' {$PageTextF} ');"
		Response.Write "s.setPageSelect('{$PageNum}','{$PageNum}');"
		Response.Write "s.setPageCss('active','','','');"
		Response.Write "s.setHtml('<div id=""pages""><em>{$RecCount}</em>{$PageFrist} {$PagePrev} {$PageText} {$PageNext}{$PageLast}<kbd> {$PageInput} </kbd></div>');"
		Response.Write "s.Write();"
		Response.Write "</Script>"
		End If
	End Sub
End Class%>