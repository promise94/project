<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../../module/YeatPage/Zhuna_vbsPage.asp"-->
<!--#INCLUDE FILE="../../inc/Md5.asp"-->
<%
Dim Action,ModuleName,CheckErr,MsgStr

ModuleName=D("Manage")

CheckAdminLogin 3
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "add":   header(""):Call Add_Manage()
Case "mod":   header("loadform();"):Call Mod_Manage()
Case "do_add":header(""):Call Do_Add_Manage()
Case "do_mod":header(""):Call Do_Mod_Manage()
Case "del":   header(""):Call Del_Manage()
Case Else:	  header(""):Call Manage()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy

Sub Manage()
%>
<div id="main">
  <div class="main_box">
    <h2>����Ա����</h2>
    <form action="" method="post" name="delform" id="delform">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
      <tr>
          <th width="61"></th>
        <th width="91">���</th>
        <th width="198" class="td_left">�û���</th>
        <th width="349" class="td_left">��ʵ����</th>
        <th width="259" class="td_left">����</th>
        <th width="203" class="td_left">ע��ʱ��</th>
        <th colspan="2">����</th>
      </tr>
<%Dim orss,Rs,NullMSG:NullMSG=False
Set orss=new Zhuna_vbsPage
Set orss.Conn=DB.OutConn
With orss
	.PageSize=15
	.PageName="Pages"
	.DbType="AC"
	.RecType=-1
	.JsUrl="../../module/YeatPage/"	
	.Pkey="Manage_ID"	
	.Field="Manage_ID,Manage_UserName,Manage_Name,Manage_Adminflag_select,Manage_Adddate"
	.Table="ZN_"&ModuleName
	.Condition=""
	.OrderBy="Manage_ID desc"
End With
Rs=orss.ResultSet()
If IsNull(Rs) Then
NullMSG=True
Else
Dim Cols,iCount,i,j
cols=1
icount=ubound(Rs,2)
if icount mod cols = 0 then icount=icount+1
for i=0 to icount step cols
%><tr onMouseOver="this.style.background='#f6f9fd'" onMouseOut="this.style.background='#fff'">
<%
for j=0 to cols-1
if (i+j)<=ubound(rs,2) then
%>
<td width="61"><%If rs(0,i+j)<>1 Then Response.Write("<input type=checkbox name=id value=" & rs(0,i+j) & ">")%></td>
<td width="91"><%=rs(0,i+j)%></td>
<td width="198" class="td_left"><%=rs(1,i+j)%></td>
<td class="td_left"><%=rs(2,i+j)%></td>
<td class="td_left"><%=GetFlagName(rs(3,i+j))%></td>
<td class="td_left"><%=rs(4,i+j)%></td>
<td width="233"><a href="?action=mod&id=<%=rs(0,i+j)%>">����</a> | <%If rs(0,i+j)<>1 Then%><a href="?action=del&id=<%=rs(0,i+j)%>">ɾ��</a><%End If%></td>
<%
end if
next%>
</tr>
<%
next
End If
%>
 <tr style="background:#f8f8f8;">
          <td ><input type="checkbox" onclick="CheckBoxCheckAll('id',this);" /></td>
          <td colspan="7" class="td_left"><input name="Submit" type="submit" value="ɾ����ѡ" class="btn02"  onclick="return confirm('ȷ��Ҫִ����β�����')" />
            <input name="action" type="hidden" value="del" /></td>
</tr>
</table></FORM>
<%orss.ShowPage()%>
<%If NullMSG Then Response.Write("<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" class=""t_list""><tr><td style=""color:#f00; padding:10px 0;"">�Բ���!Ŀǰ��û�з�����Ϣ! </td></tr></table>")%>
</div>
</div>
<%
End Sub

Sub Add_Manage()
%>
<div id="main">
  <div class="main_box">
    <h2>��ӹ���Ա</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
     <form name="addform" method="post" action="?action=do_add">
      <tr>
        <td width="100" class="td_right">��¼����</td>
        <td class="td_left"><input name="UserName" type="text" id="UserName" value="" />
         </td>
      </tr>
      <tr>
        <td class="td_right">��ʵ������</td>
        <td class="td_left"><input name="Name" type="text" id="Name" value="" /></td>
      </tr>
      <tr>
        <td class="td_right">���룺</td>
        <td class="td_left"><input name="password" type="password" id="password" value="" />
          </td>
      </tr>
      <tr>
        <td class="td_right">Ȩ�ޣ�</td>
        <td class="td_left"><select name="adminflag_select" id="adminflag_select">
            <option style="color:#f60;" value="2">����Ա</option>
            <option value="1">��վ�༭</option>
            <option style="color:#00f;" value="0" >����</option>
          </select></td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left"><input name="submit" type="submit" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" id="submit" value="�ύ" />
          <input type="reset" name="reset_button2" value="���" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'"/>
          <input type="button" name="backbutton2" id="backbutton2" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" onClick="history.back(1);" value="����" /></td>
      </tr>
    </form>
    </table>
  </div>
</div>
<%
End Sub


Sub Mod_Manage()
	Dim Rs,Id
	Id=FU.CheckNumeric(Request("Id"))
	Set Rs = DB.Execute("SELECT * FROM ZN_"&ModuleName&" where Manage_id ="&Id)
	If Not Rs.Eof then
	OutputContentToFormByJavascript "|password|","Manage",Rs
	End If
	Rs.Close:Set Rs=Nothing
%>
<div id="main">
  <div class="main_box">
    <h2>�޸Ĺ���Ա</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
      <form name="modform" method="post" action="?action=do_mod">
        <tr>
          <td width="100" class="td_right">��¼����</td>
          <td class="td_left"><input name="username" type="text" id="username" value="" /></td>
        </tr>
        <tr>
          <td class="td_right">��ʵ������</td>
          <td class="td_left"><input name="name" type="text" id="name" value="" /></td>
        </tr>
        <tr>
          <td class="td_right">���룺</td>
          <td class="td_left"><input name="password" type="password" id="password" value="" />
          ���޸ľ�����</td>
        </tr>
        <tr>
          <td class="td_right">Ȩ�ޣ�</td>
          <td class="td_left">
          <select name="adminflag_select" id="adminflag_select">
            <option style="color:#f60;" value="2">����Ա</option>
            <option value="1">��վ�༭</option>
            <option style="color:#00f;" value="0" >����</option>
          </select></td>
        </tr>
        <tr>
          <td class="td_right">&nbsp;</td>
          <td class="td_left">
          <input type="hidden" name="id" value="" />
          <input name="submit" type="submit" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" id="submit" value="�ύ" />
            <input type="reset" name="reset_button" value="���" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" />
            <input type="button" name="backbutton" id="backbutton" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" onClick="history.back(1);" value="����" /></td>
        </tr>
      </form>
    </table>
  </div>
</div>
<%
End Sub


Sub Do_Add_Manage()
	
	If Request("username")="" Then CheckErr=True:MsgStr=MsgStr+"�û�������Ϊ�ա�"
	If Request("name")="" Then CheckErr=True:MsgStr=MsgStr+"��ʵ��������Ϊ�ա�"
	If Len(Request("password"))<6 Then CheckErr=True:MsgStr=MsgStr+"���벻��Ϊ�ա��Ҵ���6λ��"
	If Request("adminflag_select")="" Then CheckErr=True:MsgStr=MsgStr+"�û�����ȼ�����Ϊ�ա�"
	
	If Not CheckErr Then
		Dim Rs,SQL,Username,Password
		Username=FU.CheckBadstr(Request("username"))
		password=FU.CheckBadstr(Request("password"))
		SQL = "SELECT * FROM ZN_"&ModuleName&" where Manage_UserName='"&username&"'"
		Set Rs = DB.Recordset(SQL,1,3)
		If Rs.Eof And Rs.Bof Then
			Rs.addnew
			InputDatabase "|submit|password|","Manage",Rs	'//����InputDatabase()��������д�����ݿ�
			Rs("Manage_ChangeIp")=FU.GetIP()
			Rs("Manage_Modifydate")=Now()
			Rs("Manage_PassWord")=lcase(md5(password,16))
			Rs.update
			MsgStr="../Msg.asp?title="&ec("����ӳɹ���")&"&msg="&ec("��ز�����")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("�������")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=Add"">"&ec("�������")&"</a>"
		Else
			CheckErr=True
			MsgStr="��������û����Ѿ����ڣ��뻻һ���û�����"
		End IF
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Do_Mod_Manage()

	If Request("username")="" Then CheckErr=True:MsgStr=MsgStr+"�û�������Ϊ�ա�"
	If Request("name")="" Then CheckErr=True:MsgStr=MsgStr+"��ʵ��������Ϊ�ա�"
	If Request("adminflag_select")="" Then CheckErr=True:MsgStr=MsgStr+"�û�����ȼ�����Ϊ�ա�"
	If Request("password")<>"" Then
		If Len(Request("password"))<6 Then CheckErr=True:MsgStr=MsgStr+"���벻��Ϊ�ա��Ҵ���6λ��"
	End If
	
	If Not CheckErr Then
		Dim Rs,SQL,Id,password,username
		Id=FU.CheckNumeric(Request("Id"))
		username=FU.CheckBadStr(Request("username"))
		password=FU.CheckBadStr(Request("password"))
		SQL = "SELECT * FROM ZN_"&ModuleName&" where Manage_id="&Id
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			If Rs("Manage_UserName")<>username Then
				DIm Rss
				Set Rss=DB.Execute("SELECT Manage_Username From ZN_"&ModuleName&" Where Manage_UserName='"&username&"'")
				If Not Rss.Eof And Not Rss.Bof Then
					CheckErr=True
					MsgStr="��������û����Ѿ����ڣ��뻻һ���û�����"
				End If
				Rss.Close:Set Rss=Nothing
			End If
			If Not CheckErr Then
			  Dim special
			  If Id=1 Then special="adminflag_select|"
			  InputDatabase "|submit|id|password|"&special,"Manage",Rs	'//����InputDatabase()��������д�����ݿ�
			  If PassWord<>"" Then
			  	Rs("Manage_PassWord")=lcase(md5(password,16))
			  End If
			  Rs("Manage_ChangeIp")=FU.GetIP()
			  Rs("Manage_Modifydate")=Now()
			  Rs.update
			  MsgStr=("../Msg.asp?title="&ec("�޸ĳɹ���")&"&msg="&ec("��ز�����")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("�������")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=mod%26id="&Id&""">"&ec("�����޸�")&"</a>")
			End If
		End If
		Rs.Close:Set Rs=Nothing

	End If
End Sub


Sub Del_Manage()
	Dim Rs,SQL,Id
	Id=FU.CheckBadstr(Request("Id"))
	If Id="" Then CheckErr=True:MsgStr=MsgStr+"û��ѡ�����ݡ�"
		
		SQL = "SELECT * FROM ZN_"&ModuleName&" where Manage_id in ("&Id&")"
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			do while not Rs.eof
			If Rs("Manage_Id")<>1 Then
				Rs.delete
			End If
			Rs.movenext
			loop
		End If	
		Rs.Close:Set Rs=Nothing
		'//����ɾ���ɹ�
		MsgStr=(request.ServerVariables("SCRIPT_NAME"))
End Sub

Function GetFlagName(id)
	If Id = "" Or Isnumeric(Id)=False Then Exit Function
	Select Case Id
	Case 0:GetFlagName="<span >����</span>"
	Case 1:GetFlagName="<span style=""color:#f6f;"">��վ�༭</span>"
	Case 2:GetFlagName="<span style=""color:#f60;"">����Ա</span>"
	Case 3:GetFlagName="<span style=""color:red;"">��������Ա</span>"
	End Select
End Function
%>