<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<%
Dim Action,CheckErr,MsgStr

CheckAdminLogin 2
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "do_mod":header(""):Call Do_Mod_Config()
Case Else:	  header(""):Call Mod_Config()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy

Sub CreatSet(fo)
	Dim objPi,objXML,TmpNode,tempnode,fso,oName,oImg,files,text
	set objXML=server.CreateObject("MSXML2.DOMDocument")
	'��ȡ�����ļ�
	set fso=server.CreateObject( "Scripting.FileSystemObject" )
		If fso.FileExists(server.mappath(ItemPath&"special/"&fo&"/set.txt")) Then
			set files=fso.OpenTextFile(server.mappath(ItemPath&"special/"&fo&"/set.txt"))
				oName=files.ReadLine
				oImg=files.ReadLine
			Set files=Nothing
		Else
			set fso=nothing
			Set objXML=nothing
			exit sub
		end if
	Set fso=Nothing
	'����xml���������ļ�
	Set objPi = objXML.createProcessingInstruction("xml", "version="&chr(34)&"1.0"&chr(34)&" encoding="&chr(34)&"gb2312"&chr(34)) 
	objXML.insertBefore objPi, objXML.childNodes(0)
		Set TmpNode=objXML.createElement("root") 
		objXML.appendChild TmpNode
			
		set tempnode=objXML.createElement("name")
		tempnode.appendChild objXML.createTextNode(oName) 
		TmpNode.appendChild tempnode
		
		set tempnode=objXML.createElement("state")
		tempnode.appendChild objXML.createTextNode("0") 
		TmpNode.appendChild tempnode
		
		set tempnode=objXML.createElement("img")
		tempnode.appendChild objXML.createTextNode(oImg) 
		TmpNode.appendChild tempnode
		
		set tempnode=objXML.createElement("link")
		tempnode.appendChild objXML.createTextNode(fo) 
		TmpNode.appendChild tempnode
		
		set tempnode=objXML.createElement("order")
		tempnode.appendChild objXML.createTextNode("0")
		TmpNode.appendChild tempnode
		
	objXml.save(server.mappath(ItemPath&"special/"&fo&"/set.xml"))
	Set objXML=nothing
	set objpi=nothing
End Sub

Sub Mod_Config()
	Dim xml
	Set xml = Server.CreateObject("MSXML2.DOMDocument") 
	xml.preserveWhiteSpace = true 
	xml.async = false
%>
<div id="main">
  <div class="main_box">
    <h2>�޸�ר��</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
    <%
	dim root,fso,ho,fo
	set fso=server.CreateObject("Scripting.FileSystemObject")
	set root = fso.getfolder(server.mappath( ItemPath&"special"))
	If root.subfolders.count>0 Then
	for each ho in root.subfolders
		Set fo=fso.GetFolder(Server.MapPath(ItemPath&"special"&"/"&ho.name))
			if not fso.FileExists(Server.MapPath(ItemPath&"special"&"/"&ho.name&"/set.xml")) Then
				creatset(ho.name)
			end if
			if xml.load(Server.MapPath(ItemPath&"special/"&ho.name&"/set.xml")) Then
				Set root=xml.documentElement
				%>
     <tr><form action="" method="post">
        <td class="td_right">ר�⣺</td>
          <td class="td_left">
                <input name="name"  style="width:125px;border:1px solid #999;" value="<%=root.selectSingleNode("name").text%>" />&nbsp;&nbsp;
                ͼƬ��<input name="img"  style="width:125px;border:1px solid #999;" value="<%=root.selectSingleNode("img").text%>" />&nbsp;&nbsp;
                ���ӣ�<input name="link"  style="width:125px;border:1px solid #999;" value="<%=root.selectSingleNode("link").text%>" />&nbsp;&nbsp;
                �ļ��У�<%=ho.name%>&nbsp;&nbsp;<input name="order" type="hidden" style="width:25px; border: 1px solid #999" value="<%=root.selectSingleNode("order").text%>" />
<input type="radio" value="0" name="state"  <%If root.selectSingleNode("state").text=0 then%>checked="checked"<%End if%> />�ر�
<input type="radio" value="1" name="state"  <%If root.selectSingleNode("state").text=1 then%>checked="checked"<%End if%>/>����
<input type="radio" value="2" name="state"  />ɾ��
<input name="Submit" type="button" value="�޸�" class="btn02"  onclick="return check(this.form,'<%=ho.name%>');" />
		<%end if%>
</td></form>
      </tr>
<%
		Set fo=nothing
	next
	
	Else
		response.Write("����ר��")
	End If
	%>
       </table>
<h3 style=" padding:10px;">1.��un.zhuna.cn��ȡ����ר��.&nbsp;&nbsp;��&nbsp;&nbsp;2.ͨ��FTP�ϴ���վ��SpecialĿ¼��.&nbsp;&nbsp;��&nbsp;&nbsp;3.�ڴ˻�ȡר����Ϣ����.</h3>
    <script>
    function check(form,val)
	{
		var stateval;

		for(i=0;i<=form.state.length-1;i++)
		{
			if(form.state[i].checked)
			stateval=i;
		}
		if(form.state[2].checked){
			if(!confirm('ȷ��Ҫִ����β�����'))
			return false;
		}
		window.location="?action=do_mod&name="+form.name.value+"&img="+form.img.value+"&order="+form.order.value+"&state="+stateval+"&fold="+val+"&link="+form.link.value;
	}
    </script>
  </div>
</div>
<%
End Sub

Sub Do_Mod_Config()
	Dim oname,oimg,oorder,ostate,ofold,xml,TmpNode,fso,olink
	oname=request.QueryString("name")
	oimg=request.QueryString("img")
	oorder=request.QueryString("order")
	ostate=request.QueryString("state")
	ofold=request.QueryString("fold")
	olink=request.QueryString("link")
	
	If Not CheckErr Then
		if ostate=2 Then
			Set fso = CreateObject("Scripting.FileSystemObject")
				fso.DeleteFolder(server.MapPath(ItemPath&"special/"&ofold&""))
			Set fso=nothing
		else
			set xml=server.CreateObject("MSXML2.DOMDocument")
			if xml.load(Server.MapPath(ItemPath&"special/"&ofold&"/set.xml")) then
			
				Set TmpNode=XML.documentElement
					TmpNode.selectSingleNode("name").text=oname
					TmpNode.selectSingleNode("img").text=oimg
					TmpNode.selectSingleNode("order").text=oorder
					TmpNode.selectSingleNode("state").text=ostate
					TmpNode.selectSingleNode("link").text=olink
				set TmpNode=nothing
				Xml.save(server.mappath(ItemPath&"special/"&ofold&"/set.xml"))
			end if
			Set XML=nothing
		end if
		MsgStr="../Msg.asp?title="&ec("�޸ĳɹ���")&"&msg="&ec("��ز�����")&"<br><a href="""&request.ServerVariables("SCRIPT_NAME")&""">"&ec("�����޸�")&"</a>"
	End If
End Sub
%>