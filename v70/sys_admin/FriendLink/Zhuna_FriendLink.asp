<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../../module/YeatPage/Zhuna_vbsPage.asp"-->
<%
Dim Action,ModuleName,CheckErr,MsgStr

ModuleName=D("FriendLink")

CheckAdminLogin 3
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "add":   header(""):Call Add_FriendLink()
Case "mod":   header("typechange("&GetTypevalue(FU.CheckNumeric(Request("Id")))&");statechange("&Getstatevalue(FU.CheckNumeric(Request("Id")))&");loadform();"):Call Mod_FriendLink()
Case "do_add":header(""):Call Do_Add_FriendLink()
Case "do_mod":header(""):Call Do_Mod_FriendLink()
Case "del":   header(""):Call Del_FriendLink()
Case Else:	  header(""):Call FriendLink()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy

Sub FriendLink()
%>
<div id="main">
  <div class="main_box">
    <h2>�������ӹ���</h2>
    <form action="" method="post" name="delform" id="delform">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
        <tr> 
        <th width="71"></th>
          <th width="106">���</th>
          <th width="245" class="td_left">��������</th>
          <th width="317" class="td_left">���ӵ�ַ</th>
          <th width="130" class="td_left">״̬</th>
          <th width="121" class="td_left">����</th>
          <th width="190" class="td_left">�������</th>
          <th colspan="2">����</th>
        </tr>
<%Dim orss,Rs,NullMSG:NullMSG=False
Set orss=new Zhuna_vbsPage
Set orss.Conn=DB.OutConn
With orss
	.PageSize=20
	.PageName="Pages"
	.DbType="AC"
	.RecType=-1
	.JsUrl="../../module/YeatPage/"
	.Pkey="FriendLink_ID"	
	.Field="FriendLink_ID,FriendLink_Title,FriendLink_Link,FriendLink_State_radio,FriendLink_type_radio,FriendLink_AddDate"
	.Table="ZN_"&ModuleName
	.Condition=""
	.OrderBy="FriendLink_Order desc,FriendLink_ID desc"
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
%>
        <tr onmouseover="this.style.background='#f6f9fd'" onmouseout="this.style.background='#fff'">
          <%
for j=0 to cols-1
if (i+j)<=ubound(rs,2) then
%>
          <td width="71"><%Response.Write("<input type=checkbox name=id value=" & rs(0,i+j) & ">")%></td>
          <td width="106"><%=rs(0,i+j)%></td>
          <td width="245" class="td_left"><%=rs(1,i+j)%></td>
          <td class="td_left"><%=rs(2,i+j)%></td>
          <td class="td_left"><%=GetStateName(rs(3,i+j))%></td>
          <td class="td_left"><%=GetTypeName(rs(4,i+j))%></td>
          <td class="td_left"><%=rs(5,i+j)%></td>
          <td width="214"><a href="?action=mod&id=<%=rs(0,i+j)%>">�޸�</a> | <a href="?action=del&id=<%=rs(0,i+j)%>">ɾ��</a></td>
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
      </table>
    </FORM>
<%orss.ShowPage()%>
<%If NullMSG Then Response.Write("<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" class=""t_list""><tr><td style=""color:#f00; padding:10px 0;"">�Բ���!Ŀǰ��û�з�����Ϣ! </td></tr></table>")%>
</div>
</div>
<%
End Sub

Sub Add_FriendLink()
%>
<div id="main">
  <div class="main_box">
    <h2>�����������</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
     <form name="addform" method="post" action="?action=do_add">
      <tr>
        <td width="100" class="td_right">���⣺</td>
        <td class="td_left"><input name="title" type="text" id="title" value="" size="40" />
         </td>
      </tr>
       <tr>
        <td width="100" class="td_right">���ӣ�</td>
        <td class="td_left"><input name="link" type="text" id="link" value="http://" size="40" />
         </td>
      </tr>
      <tr>
        <td class="td_right">���ͣ�</td>
        <td class="td_left">����<input name="type_radio" type="radio" id="type_radio" value="1" checked="checked" onclick="typechange(1);" />&nbsp;&nbsp;�ϴ�ͼƬ<input name="type_radio" type="radio" id="type_radio" value="2"  onclick="typechange(2);"/>&nbsp;&nbsp;�ⲿͼƬ����<input name="type_radio" type="radio" id="type_radio" value="3" onclick="typechange(3);"/>
        &nbsp;&nbsp;ͼƬ���88*31
        <div id="changetype2" style="display:none">
        <iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=UploadFile2" scrolling="no" width="255" height="20" frameborder="0"></iframe> 
             <br>
             <input name="uploadfile" type="text" id="UploadFile2" size="30" disabled>
        </div>        
        <div id="changetype3" style="display:none">���ӵ�ַ��<input name="externallinks" type="text" id="UploadFile3" value="" size="60"/></div>
        </td>
      </tr>
      <tr>
        <td class="td_right">����</td>
        <td class="td_left"><input name="order" type="text" id="order" value="0" />
          </td>
      </tr>
      <tr>
        <td class="td_right">���ޣ�</td>
        <td class="td_left">
        <script language="javascript">var webpath='../../';</script>
		<script language="javascript" src="../../inc/calendar.js"></script>
        ����<input name="state_radio" type="radio" id="state_radio" value="1" checked="checked" onclick="statechange(1);" />&nbsp;&nbsp;����<input name="state_radio" type="radio" id="state_radio" value="2"  onclick="statechange(2);"/>&nbsp;&nbsp;ֹͣ<input name="state_radio" type="radio" id="state_radio" value="3" onclick="statechange(3);"/>

        <div id="changestate">
        ��ʼ���ڣ�<input name="begintime" type="text" value="" id="begintime" onclick="javascript:javascript:event.cancelBubble=true;showCalendar('begintime',false,'begintime','endtime','endtime','<%=date()%>','','','','','text','')" style="width:120px;" />
        <img src="../../images/calendar.gif" width="16" height="19" align="absmiddle" style="CURSOR: hand" border="0" onclick="javascript:event.cancelBubble=true;showCalendar('begintime',false,'begintime','endtime','endtime','<%=date()%>','','','','','text','')" />&nbsp;&nbsp;&nbsp;�������ڣ�
        <input name="endtime" type="text" value="" id="endtime" onclick="javascript:event.cancelBubble=true;showCalendar('endtime',false,'endtime','','','<%=date()%>','','','','','text','')" style="width:120px;" />
        <img src="../../images/calendar.gif" width="16" height="19" align="absmiddle" style="CURSOR: hand" border="0" onclick="javascript:event.cancelBubble=true;showCalendar('endtime',false,'endtime','','','<%=date()%>','','','','','text','')" />&nbsp;&nbsp;
        </div>
        </td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left"><input name="submit" type="submit" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'" id="submit" value="�ύ" />
          <input type="reset" name="reset_button" value="���" class="btn05" />
          <input type="button" name="backbutton" id="backbutton" class="btn05"  onclick="history.back(1);" value="����" /></td>
      </tr>
    </form>
    </table>
  </div>
</div>
<%
End Sub


Sub Mod_FriendLink()
	Dim Rs,Id
	Id=FU.CheckNumeric(Request("Id"))
	Set Rs = DB.Execute("SELECT * FROM ZN_"&ModuleName&" where FriendLink_id ="&Id)
	If Not Rs.Eof then
	OutputContentToFormByJavascript "|password|","FriendLink",Rs
	End If
	Rs.Close:Set Rs=Nothing
%>
<div id="main">
  <div class="main_box">
    <h2>�޸���������</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
     <form name="modform" method="post" action="?action=do_mod">
      <tr>
        <td width="100" class="td_right">���⣺</td>
        <td class="td_left"><input name="title" type="text" id="title" value="" size="40" />
         </td>
      </tr>
       <tr>
        <td width="100" class="td_right">���ӣ�</td>
        <td class="td_left"><input name="link" type="text" id="link" value="http://" size="40" />
         </td>
      </tr>
      <tr>
        <td class="td_right">���ͣ�</td>
        <td class="td_left">����<input name="type_radio" type="radio" id="type_radio" value="1" checked="checked" onclick="typechange(1);" />&nbsp;&nbsp;�ϴ�ͼƬ<input name="type_radio" type="radio" id="type_radio" value="2"  onclick="typechange(2);"/>&nbsp;&nbsp;�ⲿͼƬ����<input name="type_radio" type="radio" id="type_radio" value="3" onclick="typechange(3);"/>&nbsp;&nbsp;
        <div id="changetype2" style="display:none">
        <iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=UploadFile2" scrolling="no" width="255" height="20" frameborder="0"></iframe> 
             <br>
             <input name="uploadfile" type="text" id="UploadFile2" size="30" disabled>
        </div>        
        <div id="changetype3" style="display:none">���ӵ�ַ��<input name="externallinks" type="text" id="UploadFile3" value="" disabled size="60"/></div>
        &nbsp;ͼƬ���88*31
       </td>
      </tr>
      <tr>
        <td class="td_right">����</td>
        <td class="td_left"><input name="order" type="text" id="order" value="0" />
          </td>
      </tr>
      <tr>
        <td class="td_right">���ޣ�</td>
        <td class="td_left">
        <script language="javascript">var webpath='../../';</script>
		<script language="javascript" src="../../inc/calendar.js"></script>
        ����<input name="state_radio" type="radio" id="state_radio" value="1" checked="checked" onclick="statechange(1);" />&nbsp;&nbsp;����<input name="state_radio" type="radio" id="state_radio" value="2"  onclick="statechange(2);"/>&nbsp;&nbsp;ֹͣ<input name="state_radio" type="radio" id="state_radio" value="3" onclick="statechange(3);"/>

        <div id="changestate">
        ��ʼ���ڣ�<input name="begintime" type="text" value="" id="begintime" onclick="javascript:event.cancelBubble=true;showCalendar('begintime',false,'begintime','endtime','endtime','<%=date()%>','','','','','text','')" style="width:120px;" />
        <img src="../../images/calendar.gif" width="16" height="19" align="absmiddle" style="CURSOR: hand" border="0" onclick="javascript:event.cancelBubble=true;showCalendar('begintime',false,'begintime','endtime','endtime','<%=date()%>','','','','','text','')" />&nbsp;&nbsp;&nbsp;�������ڣ�
        <input name="endtime" type="text" value="" id="endtime" onclick="javascript:event.cancelBubble=true;showCalendar('endtime',false,'endtime','','','<%=date()%>','','','','','text','')" style="width:120px;" />
        <img src="../../images/calendar.gif" width="16" height="19" align="absmiddle" style="CURSOR: hand" border="0" onclick="javascript:event.cancelBubble=true;showCalendar('endtime',false,'endtime','','','<%=date()%>','','','','','text','')" />&nbsp;&nbsp;
        </div>
        </td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left"><input type="hidden" name="id" value="" />
        <input name="submit" type="submit" class="btn05" onmouseover="this.className='btn06'" onmouseout="this.className='btn05'" id="submit" value="�ύ" />
          <input type="reset" name="reset_button" value="���" class="btn05" />
          <input type="button" name="backbutton" id="backbutton" class="btn05"  onclick="history.back(1);" value="����" /></td>
      </tr>
    </form>
    </table>
  </div>
</div>
<%
End Sub


Sub Do_Add_FriendLink()
	
	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"���ⲻ��Ϊ�ա�"
	If Request("link")="" Then CheckErr=True:MsgStr=MsgStr+"���Ӳ���Ϊ�ա�"
	
	If Not CheckErr Then
		Dim Rs,SQL
		SQL = "SELECT * FROM ZN_"&ModuleName&" where FriendLink_ID Is Null"
		Set Rs = DB.Recordset(SQL,1,3)
			Rs.addnew
			InputDatabase "|submit|","FriendLink",Rs	'//����InputDatabase()��������д�����ݿ�
			Rs("FriendLink_Adddate")=Now()
			Rs("FriendLink_AddUserName")=Session(cachename&"AdminName")
			Rs.update
			MsgStr="../Msg.asp?title="&ec("����ӳɹ���")&"&msg="&ec("��ز�����")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("�������")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=Add"">"&ec("�������")&"</a>"
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Do_Mod_FriendLink()

	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"���ⲻ��Ϊ�ա�"
	If Request("link")="" Then CheckErr=True:MsgStr=MsgStr+"���Ӳ���Ϊ�ա�"
	
	If Not CheckErr Then
		Dim Rs,SQL,Id
		Id=FU.CheckNumeric(Request("Id"))
		SQL = "SELECT * FROM ZN_"&ModuleName&" where FriendLink_id="&Id
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			  InputDatabase "|submit|id|","FriendLink",Rs	'//����InputDatabase()��������д�����ݿ�
			  Rs.update
			  MsgStr=("../Msg.asp?title="&ec("�޸ĳɹ���")&"&msg="&ec("��ز�����")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("�������")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=mod%26id="&Id&""">"&ec("�����޸�")&"</a>")
		End If
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Del_FriendLink()
	Dim Rs,SQL,Id
	Id=FU.CheckBadstr(Request("Id"))
	If Id="" Then CheckErr=True:MsgStr=MsgStr+"û��ѡ�����ݡ�"
	
	If Not CheckErr Then
		SQL = "SELECT * FROM ZN_"&ModuleName&" where FriendLink_id in ("&Id&")"
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			do while not Rs.eof
				Rs.delete
			Rs.movenext
			loop
		End If	
		Rs.Close:Set Rs=Nothing
		'//����ɾ���ɹ�
		MsgStr=(request.ServerVariables("SCRIPT_NAME"))
	End If
End Sub

Function GetTypeName(id)
	If Id = "" Or Isnumeric(Id)=False Then Exit Function
	Select Case Id
	Case 1:GetTypeName="<span >����</span>"
	Case 2:GetTypeName="<span style=""color:#f60;"">�ϴ�ͼƬ</span>"
	Case 3:GetTypeName="<span style=""color:red;"">�ⲿͼƬ����</span>"
	End Select
End Function

Function GetStateName(id)
	If Id = "" Or Isnumeric(Id)=False Then Exit Function
	Select Case Id
	Case 1:GetStateName="<span >����</span>"
	Case 2:GetStateName="<span style=""color:#f60;"">����</span>"
	Case 3:GetStateName="<span style=""color:red;"">ֹͣ</span>"
	End Select
End Function

Function GetTypevalue(id)
	If Id=0 Then Exit Function
	Dim Rs
	Set Rs=DB.Execute("Select FriendLink_Type_radio From ZN_"&ModuleName&" Where FriendLink_Id="&id)
	If Not Rs.eof Then
		GetTypevalue=Rs(0)
	End If
	Rs.Close:Set Rs=Nothing
End Function

Function Getstatevalue(id)
	If Id=0 Then Exit Function
	Dim Rs
	Set Rs=DB.Execute("Select FriendLink_State_radio From ZN_"&ModuleName&" Where FriendLink_Id="&id)
	If Not Rs.eof Then
		Getstatevalue=Rs(0)
	End If
	Rs.Close:Set Rs=Nothing
End Function
%>
<script>
function typechange(val)
{
	if(val==1){
	$("changetype2").style.display="none";
	$("changetype3").style.display="none";
	$("UploadFile2").disabled=true;
	$("UploadFile3").disabled=true;
	}
	else if(val==2){
	$("changetype2").style.display="";
	$("changetype3").style.display="none";
	$("UploadFile2").disabled=false;
	$("UploadFile3").disabled=true;
	}
	else if(val==3){
	$("changetype2").style.display="none";
	$("changetype3").style.display="";
	$("UploadFile2").disabled=true;
	$("UploadFile3").disabled=false;
	}
}
function statechange(val)
{
	if(val==1){
	$("changestate").style.display="";
	$("begintime").disabled=false;
	$("endtime").disabled=false;
	}
	else{
	$("changestate").style.display="none";
	$("begintime").disabled=true;
	$("endtime").disabled=true;
	}
}
</script>