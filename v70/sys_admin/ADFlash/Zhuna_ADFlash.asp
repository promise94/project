<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../../module/YeatPage/Zhuna_vbsPage.asp"-->
<%
Dim Action,ModuleName,CheckErr,MsgStr

ModuleName=D("AD")

CheckAdminLogin 2
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "add":   header(""):Call Add_ADFlash()
Case "mod":   header("loadform();"):Call Mod_ADFlash()
Case "do_add":header(""):Call Do_Add_ADFlash():Call makexml()
Case "do_mod":header(""):Call Do_Mod_ADFlash():Call makexml()
Case "del":   header(""):Call Del_ADFlash():Call makexml()
Case Else:	  header(""):Call ADFlash()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy

Sub ADFlash()
%>
<div id="main">
  <div class="main_box">
    <h2>Flash������</h2>
    <form action="" method="post" name="delform" id="delform">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
        <tr> 
        <th width="71"></th>
          <th width="106">���</th>
          <th width="245" class="td_left">����</th>
          <th width="317" class="td_left">���ӵ�ַ</th>
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
	.Pkey="ADFlash_ID"	
	.Field="ADFlash_ID,ADFlash_Title,ADFlash_Link,ADFlash_AddDate"
	.Table="ZN_"&ModuleName&"_flash"
	.Condition=""
	.OrderBy="ADFlash_Order desc,ADFlash_ID desc"
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
          <td class="td_left"><%=rs(3,i+j)%></td>
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

Sub Add_ADFlash()
%>
<div id="main">
  <div class="main_box">
    <h2>���Flash���</h2>
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
        <td class="td_right">ͼƬ�ϴ���</td>
        <td class="td_left">
        <iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=UploadFile2" scrolling="no" width="255" height="20" frameborder="0"></iframe> 
             <br>
             <input name="uploadfile" type="text" id="UploadFile2" size="30">
             248*200
        </td>
      </tr>
      <tr>
        <td class="td_right">����</td>
        <td class="td_left"><input name="order" type="text" id="order" value="0" />
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


Sub Mod_ADFlash()
	Dim Rs,Id
	Id=FU.CheckNumeric(Request("Id"))
	Set Rs = DB.Execute("SELECT * FROM ZN_"&ModuleName&"_flash where ADFlash_id ="&Id)
	If Not Rs.Eof then
	OutputContentToFormByJavascript "","ADFlash",Rs
	End If
	Rs.Close:Set Rs=Nothing
%>
<div id="main">
  <div class="main_box">
    <h2>�޸�Flash���</h2>
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
        <td class="td_right">ͼƬ�ϴ���</td>
        <td class="td_left">
        <iframe src="../../module/ZN_UpLoad/ZN_UpLoadForm.asp?AF=0&ConfigID=1&FA=UploadFile2" scrolling="no" width="255" height="20" frameborder="0"></iframe> 
             <br>
             <input name="uploadfile" type="text" id="UploadFile2" size="30">
          248*200 </td>
      </tr>
      <tr>
        <td class="td_right">����</td>
        <td class="td_left"><input name="order" type="text" id="order" value="" />
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


Sub Do_Add_ADFlash()
	
	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"���ⲻ��Ϊ�ա�"
	If Request("link")="" Then CheckErr=True:MsgStr=MsgStr+"���Ӳ���Ϊ�ա�"
	
	If Not CheckErr Then
		Dim Rs,SQL
		SQL = "SELECT * FROM ZN_"&ModuleName&"_flash where ADFlash_ID Is Null"
		Set Rs = DB.Recordset(SQL,1,3)
			Rs.addnew
			InputDatabase "|submit|","ADFlash",Rs	'//����InputDatabase()��������д�����ݿ�
			Rs("ADFlash_Adddate")=Now()
			Rs.update
			MsgStr="../Msg.asp?title="&ec("����ӳɹ���")&"&msg="&ec("��ز�����")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("�������")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=Add"">"&ec("�������")&"</a>"
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Do_Mod_ADFlash()

	If Request("title")="" Then CheckErr=True:MsgStr=MsgStr+"���ⲻ��Ϊ�ա�"
	If Request("link")="" Then CheckErr=True:MsgStr=MsgStr+"���Ӳ���Ϊ�ա�"
	
	If Not CheckErr Then
		Dim Rs,SQL,Id
		Id=FU.CheckNumeric(Request("Id"))
		SQL = "SELECT * FROM ZN_"&ModuleName&"_flash where ADFlash_id="&Id
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			  InputDatabase "|submit|id|","ADFlash",Rs	'//����InputDatabase()��������д�����ݿ�
			  Rs.update
			  MsgStr=("../Msg.asp?title="&ec("�޸ĳɹ���")&"&msg="&ec("��ز�����")&"<br> | <a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("�������")&"</a> | <a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=mod%26id="&Id&""">"&ec("�����޸�")&"</a>")
		End If
		Rs.Close:Set Rs=Nothing
	End If
End Sub


Sub Del_ADFlash()
	Dim Rs,SQL,Id
	Id=FU.CheckBadstr(Request("Id"))
	If Id="" Then CheckErr=True:MsgStr=MsgStr+"û��ѡ�����ݡ�"
	
	If Not CheckErr Then
		SQL = "SELECT * FROM ZN_"&ModuleName&"_flash where ADFlash_id in ("&Id&")"
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

'+++++++++++++++++Config++++++++++++
'channel.item
'ͼƬ��Ϣ���������ö���ͼƬ
'
'channel.itme.image
'ͼƬ��ַ�������˲�����Ψһ����Ҫ�еĲ�����������������Ĭ�ϲ���
'
'channel.itme.link
'��ӦͼƬ������
'
'channel.itme.tilte
'��ӦͼƬ�ı���
'
'����
'
'config.roundCorner
'ͼƬ��Բ��
'
'config.autoPlayTime
'ͼƬ�л�ʱ�䣬Ĭ��ֵ��8����λ��
'
'config.isHeightQuality
'ͼƬ��С�Ƿ���ø������ķ�����Ĭ��ֵfalse
'
'config.normal
'ͼƬ�Ļ��ģʽ
'
'config.transDuration
'ͼƬ���л������е�ʱ�䣬Ĭ��ֵ1����λ��
'
'config.windowOpen
'ͼƬ���ӵĴ򿪷�ʽ��Ĭ��ֵ��_blank��,���´��ڴ򿪣�Ҳ����ʹ�á�_self��,ʹ�ñ����ڴ�
'
'config.btnSetMargin
'��ť��λ�ã����ֵ�λ�ã�����css��margin���Ĭ��ֵ��auto 5 5 auto�����ĸ���ֵ���� �� �� �� �� ����ڲ������ľ��룬�ĸ���ֵ�ÿո�ֿ������������ֵ�á�auto����д ���������϶��벢����10���صľ������д ��10 auto auto 10��, ���½Ƕ����ǡ�auto 10 10 auto��
'
'config.btnDistance
'ÿ����ť�ľ��룬Ĭ��ֵ20
'
'config.titleBgColor
'���ⱳ������ɫ��Ĭ��0xff6600
'
'config.titleTextColor
'�������ֵ���ɫ��Ĭ��0xffffff
'
'config.titleBgAlpha
'���ⱳ����͸���ȣ�Ĭ��0.75
'
'config.titleFont
'�������ֵ����壬Ĭ��ֵ��΢���źڡ�
'
'config.titleMoveDuration
'���ⱳ��������ʱ�䣬Ĭ��ֵ1����λ��
'
'config.btnAlpha
'��ť��͸���ȣ�Ĭ��ֵ0.7
'
'config.btnTextColor
'��ť���ֵ���ɫ��Ĭ��ֵ0xffffff
'
'config.btnDefaultColor
'��ť��Ĭ����ɫ��Ĭ��ֵ0��1B3433
'
'config.btnHoverColor
'��ť��Ĭ����ɫ��Ĭ��ֵ0xff9900
'
'config.btnFocusColor
'��ť��ǰ��ɫ��Ĭ��ֵ0xff6600
'
'config.changImageMode
'�л�ͼƬ�ķ�����Ĭ��ֵ��click��,����л�ͼƬ��������ʹ�á�hover��,�����ͣ���л�ͼƬ
'
'config.isShowBtn
'�Ƿ���ʾ��ť��Ĭ��ֵ��true��
'
'config.isShowTitle
'�Ƿ���ʾ���⣬Ĭ��ֵ��true��
'
'config.scaleMode
'ͼƬ����ģʽ: Ĭ��ֵ�ǡ�noBorder��
'��showAll��: ���Կ���ȫ��ͼƬ,���ֱ���,�������»�������
'��exactFil��: ����ͼƬ����̨�ĳߴ�,���ܱ���ʧ��
'��noScale��: ͼƬ��ԭʼ�ߴ�,�޷���
'��noBorder��: ͼƬ����������,���ֱ���,���ܻᱻ�ü�
'
'config.transform
'ͼƬ����ģʽ: Ĭ��ֵ�ǡ�alpha��
'��alpha��: ͸���ȵ��뵭��
'��blur��: ģ�����뵭��
'��left��: ��ͼƬ����
'��right��: �ҷ�ͼƬ����
'��top��: �Ϸ�ͼƬ����
'��bottom��: �·�ͼƬ����
'��breathe��: ��һ���ط����ĵ��뵭��
'��breatheBlur��: ��һ���ط�����ģ�����뵭������ҳ�����Ӿ������
'
'config.isShowAbout
'�Ƿ���ʾ������Ϣ��Ĭ��ֵ��true��
'

sub makexml()
Dim XmlDom,xmls,xmlss,Rs,sql
Set XmlDom = Server.CreateObject("Msxml2.FreeThreadedDOMDocument")
xmls=""
xmlss=""
xmls="<?xml version=""1.0"" encoding=""utf-8""?><data><channel>"
sql="select top 15 * from ZN_"&ModuleName&"_flash order by ADFlash_Order desc,ADFlash_ID desc"
set Rs=DB.execute(sql)
if not Rs.eof then
do while not Rs.eof
xmlss=xmlss&"<item>"&_
			"<link>"&Rs("ADFlash_Link")&"</link>"&_
			"<image>"&Rs("ADFlash_UploadFile")&"</image>"&_
			"<title>"&Rs("ADFlash_Title")&"</title>"&_
		"</item>"
Rs.movenext
loop
end if
Rs.close:set Rs=nothing
xmls=xmls&xmlss&"</channel>"&_
	"<config>"&_
		"<roundCorner>0</roundCorner>"&_
		"<autoPlayTime>8</autoPlayTime>"&_
		"<isHeightQuality>true</isHeightQuality>"&_
		"<blendMode>normal</blendMode>"&_
		"<transDuration>1</transDuration>"&_
		"<windowOpen>_blank</windowOpen>"&_
		"<btnSetMargin>auto 5 5 auto</btnSetMargin>"&_
		"<btnDistance>20</btnDistance>"&_
		"<titleBgColor>0x9ACDE8</titleBgColor>"&_
		"<titleTextColor>0xffffff</titleTextColor>"&_
		"<titleBgAlpha>.75</titleBgAlpha>"&_
		"<titleMoveDuration>1</titleMoveDuration>"&_
		"<btnAlpha>.7</btnAlpha>	"&_
		"<btnTextColor>0xffffff</btnTextColor>	"&_
		"<btnDefaultColor>0x519BCA</btnDefaultColor>"&_
		"<btnHoverColor>0x126DA6</btnHoverColor>"&_
		"<btnFocusColor>0x126DA6</btnFocusColor>"&_
		"<changImageMode>hover</changImageMode>"&_
		"<isShowBtn>true</isShowBtn>"&_
		"<isShowTitle>false</isShowTitle>"&_
		"<scaleMode>noBorder</scaleMode>"&_
		"<transform>alpha</transform>"&_
		"<isShowAbout>false</isShowAbout>"&_
		"<titleFont>΢���ź�</titleFont>"&_
	"</config>"&_
"</data>"
XmlDom.LoadXml replace(xmls,"&","&amp;")
If XmlDom.parseError.errorCode <> 0 Then
	   response.Write(XmlDom.parseError.errorCode&vbcrlf&_
	   XmlDom.parseError.reason&vbcrlf&_
	   XmlDom.parseError.line)
End If
XmlDom.save server.mappath("../../bcastr.xml")
set XmlDom=nothing
end sub
%>