<!--#INCLUDE FILE="../../inc/Conn.asp"-->
<%Const ItemPath="../../"%>
<!--#INCLUDE FIlE="../../inc/Main_Function.asp"-->
<!--#INCLUDE FILE="../inc/Main_Function.asp"-->
<%
Dim Action,ModuleName,CheckErr,MsgStr

ModuleName=D("Config")

CheckAdminLogin 3
Action=LCase(Request("Action"))

CheckErr = False

Select Case Action
Case "do_mod":header("CreateDragContainer(document.getElementById('cityList'));"):Call Do_Mod_Config()
Case "testspeed":Call testspeed()
Case Else:	  header("CreateDragContainer(document.getElementById('cityList'));"):Call Mod_Config()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
footer
destroy

Sub Mod_Config()
	Dim Rs,baseconfig,hotel,installpath,weburl,cachename,installpath2
	Set Rs = DB.Execute("SELECT * FROM ZN_"&ModuleName)
	If Not Rs.Eof then
		baseconfig = Split(Rs("Config_BaseConfig")&"-_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_-","-_-")
		hotel = Split(Rs("Config_hotel")&"-_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_-","-_-")
		
		installpath = Left(LCase(Request.ServerVariables("SCRIPT_NAME")), InStrRev(LCase(Request.ServerVariables("SCRIPT_NAME")), "/") - 1)
		installpath = Left(installpath, InStrRev(installpath, "/")-1)
		installpath = Left(installpath, InStrRev(installpath, "/"))
		installpath2=installpath
		If installpath=LCase(Rs("Config_InstallPath")) Then installpath=Rs("Config_InstallPath")

		weburl = "http://"& LCase(Request.ServerVariables("HTTP_HOST"))
		If weburl = Trim(LCase(Rs("Config_weburl"))) Then weburl = Trim(LCase(Rs("Config_weburl")))
		cachename=Rs("Config_cachename")
	Else
		CheckErr = True:MsgStr=MsgStr+"��վ�����ļ���ʧ������°�װĿ¼��������ϵ���˹���Ա��"
	End If
	Rs.Close:Set Rs=Nothing
	If CheckErr Then Exit Sub
%>
<div id="main">
  <div class="main_box">
    <h2>�޸���վ����</h2>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
     <form name="modform" method="post" action="?action=do_mod" onsubmit="return fillcitylist();">
      <tr>
        <td class="td_right">��վ��װĿ¼��</td>
        <td class="td_left"><input name="installpath" type="text" id="installpath" value="<%=Server.HTMLEncode(installpath2)%>" size="40" />
        <input name="installpath2" type="hidden" value="<%=Server.HTMLEncode(installpath)%>" size="40" />
�Ƶ�Ƶ��Ŀ¼ ������ѳ����������վ��/hotel/Ŀ¼�� ��webpath=&quot;/hotel/&quot; </td>
      </tr>
       <tr>
        <td class="td_right">��վ��������</td>
        <td class="td_left"><input name="weburl" type="text" id="weburl" value="<%=Server.HTMLEncode(weburl)%>" size="40" />
         </td>
      </tr>
      <tr>
        <td class="td_right">��վ���ƣ�</td>
        <td class="td_left"><input name="baseconfig(0)" type="text" id="baseconfig(0)" value="<%=Server.HTMLEncode(baseconfig(0))%>" size="40" />
          ��վ������ ���磺�ճ̾Ƶ�Ԥ���� �벻Ҫʹ��&ldquo;ס��&rdquo;��������վ���ƣ����鵽������ID���˺�</td>
      </tr>
      <tr>
        <td class="td_right">վ��ؼ��֣�</td>
        <td class="td_left"><textarea name="baseconfig(1)" cols="50" rows="5" id="baseconfig(1)"><%=Server.HTMLEncode(baseconfig(1))%></textarea>
          </td>
      </tr>
      <tr>
        <td class="td_right">��վ��Ȩ��Ϣ��</td>
        <td class="td_left">
		<textarea name="baseconfig(2)" cols="50" rows="5" id="baseconfig(2)"><%=Server.HTMLEncode(baseconfig(2))%></textarea>
		֧��html����</td>
      </tr>
      <tr>
        <td class="td_right">��վ״̬��</td>
        <td class="td_left">
        <input type="radio" name="baseconfig(3)" value="0"<%If FU.CheckNumeric(baseconfig(3)) = 0 Then Response.Write (" checked=""checked""")%>/>
          ��
  <input type="radio" name="baseconfig(3)" value="1"<%If FU.CheckNumeric(baseconfig(3)) = 1 Then Response.Write (" checked=""checked""")%>/>
          �ر�
  </td>
      </tr>
      <tr>
        <td class="td_right">��վ״̬˵����</td>
        <td class="td_left"><textarea name="baseconfig(4)" cols="50" rows="5" id="baseconfig(4)"><%=Server.HTMLEncode(baseconfig(4))%></textarea></td>
      </tr>
      <tr>
        <td class="td_right">�Ƿ��֣�</td>
        <td class="td_left"><textarea name="baseconfig(5)" cols="50" rows="5" id="baseconfig(5)"><%=Server.HTMLEncode(baseconfig(5))%></textarea></td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">&nbsp;</td>
      </tr>
      <tr>
        <td class="td_right">�����ƹ�ID</td>
        <td class="td_left"><input name="hotel(0)" type="text" id="hotel(0)" value="<%=hotel(0)%>" size="40" /></td>
      </tr>
      <tr>
        <td class="td_right">���˼����ַ�</td>
        <td class="td_left"><input name="hotel(1)" type="text" id="hotel(1)" value="<%=Server.HTMLEncode(hotel(1))%>" size="40" /></td>
      </tr>
      <tr>
        <td class="td_right">Ĭ�ϳ���</td>
        <td class="td_left"><input name="hotel(2)" type="text" id="hotel(2)" value="<%=Server.HTMLEncode(hotel(2))%>" size="40" /><input name="hotel(3)" type="hidden" id="hotel(3)" value="<%=hotel(3)%>" size="40" /></td>
      </tr>
       <tr>
        <td class="td_right">��ҳѡ�����</td>
        <td class="td_left">
<%=CreatcityList%><input type="hidden" value="<%=hotel(4)%>" name="hotel(4)" id="hotel(4)" />
<div id="cityList">
<%If hotel(4)<>"" Then
dim citylist,cityitem,i
citylist=split(hotel(4),",")
	If ubound(citylist)>0 Then
		for i=0 to ubound(citylist)
		cityitem=split(citylist(i),"|")
			response.Write("<span ondblclick=""return updatename(this,'"&trim(cityitem(1))&"')"" style=""border:#CCC solid 1px;padding:3px;cursor:move;"" value="""&trim(cityitem(1))&""" id="""&trim(cityitem(0))&""">"&trim(cityitem(1))&"<em style=""cursor:pointer"" onclick=""return delCity("&trim(cityitem(0))&");"">��</em></span>")
		next
	Else
		cityitem=split(citylist(0),"|")
		response.Write("<span ondblclick=""return updatename(this,'"&trim(cityitem(1))&"')"" style=""border:#CCC solid 1px;padding:3px;cursor:move;"" value="""&trim(cityitem(1))&""" id="""&trim(cityitem(0))&""">"&trim(cityitem(1))&"<em style=""cursor:pointer"" onclick=""return delCity("&trim(cityitem(0))&");"">��</em></span>")
	End If
End If
%>

</div>
         </td>
      </tr>
      <tr>
        <td class="td_right">�Ƿ�򿪻��棺</td>
        <td class="td_left">
        <span class="tablerow">
          <input type="radio" name="hotel(13)" value="0"<%If FU.CheckNumeric(hotel(13)) = 0 Then Response.Write (" checked=""checked""")%>/>
          �ر�
          <input type="radio" name="hotel(13)" value="1"<%If FU.CheckNumeric(hotel(13)) = 1 Then Response.Write (" checked=""checked""")%>/>
          �� </span>ǿ�ҽ������򿪻��棬�������Լ���������վ���ٶȡ��ռ䲻�������½����������ռ�ҲҪ�򿪴˹��ܣ�</td>
      </tr>
       <tr>
        <td class="td_right">�������ʱ��</td>
        <td class="td_left"><input name="hotel(6)" type="text" id="hotel(6)" value="<%=hotel(6)%>" size="40" /> 
        ����Ϊ��λ��ֵԽ����վ���ٶ�Խ�죡</td>
      </tr>
       <tr>
        <td class="td_right">������</td>
        <td class="td_left"><input name="cachename" type="text" id="cachename" value="<%=Server.HTMLEncode(cachename)%>" size="40" /></td>
      </tr>
       <tr>
        <td class="td_right">�ӿڵ�ַ</td>
        <td class="td_left">
        <%=getHost(Server.HTMLEncode(hotel(9)))%>&nbsp;&nbsp;<input type="button" name="testspeed" id="testspeed" value="����" onclick="return dotestspeed(this);" class="btn03" />&nbsp;&nbsp;������ķ���������ͨ��·���Ƽ�������ͨ��������ͨ���ؾ��⣻������ķ�����Ϊ������·���Ƽ����õ��ţ����е��Ÿ��ؾ���
        </td>
      </tr>
       <tr>
        <td class="td_right">�Ƶ��ѯα��̬ҳǰ������</td>
        <td class="td_left"><input name="hotel(10)" type="text" id="hotel(10)" value="<%=hotel(10)%>" size="40" /> 
        ���磺search-c80-x0---a0-e1.html search����ǰ������</td>
      </tr>
          <tr>
        <td class="td_right">�Ƶ���ϸα��̬ҳǰ������</td>
        <td class="td_left"><input name="hotel(11)" type="text" id="hotel(11)" value="<%=hotel(11)%>" size="40" /> 
        ���磺hotel-53-4881.html hotel����ǰ������</td>
      </tr>
        <tr>
        <td class="td_right">�Ƿ���ʾ�����ϴ�ͼƬ��</td>
        <td class="td_left">
        <span class="tablerow">
          <input type="radio" name="hotel(12)" value="0"<%If FU.CheckNumeric(hotel(12)) = 0 Then Response.Write (" checked=""checked""")%>/>
          ����ʾ
          <input type="radio" name="hotel(12)" value="1"<%If FU.CheckNumeric(hotel(12)) = 1 Then Response.Write (" checked=""checked""")%>/>
          ��ʾ </span></td>
      </tr>
      <tr>
        <td class="td_right">α��̬��</td>
        <td class="td_left"><span class="tablerow">
          <input type="radio" name="hotel(7)" value="0"<%If FU.CheckNumeric(hotel(7)) = 0 Then Response.Write (" checked=""checked""")%>/>
          �ر�
          <input type="radio" name="hotel(7)" value="1"<%If FU.CheckNumeric(hotel(7)) = 1 Then Response.Write (" checked=""checked""")%>/>
          �� ��������վ�л��˹���ʱ����Ҫ<a href="../Cache/Zhuna_Cache.asp" target="main">�����վ����</a>��</span></td>
      </tr>
        <tr>
        <td class="td_right">�Զ����£�</td>
        <td class="td_left"><span class="tablerow">
          <input type="radio" name="hotel(14)" value="0"<%If FU.CheckNumeric(hotel(14)) = 0 Then Response.Write (" checked=""checked""")%>/>
          �ر�
          <input type="radio" name="hotel(14)" value="1"<%If FU.CheckNumeric(hotel(14)) = 1 Then Response.Write (" checked=""checked""")%>/>
          �� �򿪴˹��ܵ�����¼��̨ʱ�����Զ�����������վ��</span></td>
      </tr>
      <tr>
        <td class="td_right">α��̬����</td>
        <td class="td_left"><span class="tablerow2">
          <textarea name="hotel(8)" cols="100" rows="5"><%=Server.HTMLEncode(hotel(8))%></textarea>
         </span></td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
        <input name="submit" type="submit" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" id="submit" value="�ύ" />
        <input type="button" name="backbutton" id="backbutton" class="btn05"  onclick="history.back(1);" value="����" /></td>
      </tr>
    </form>
    </table>
  </div>
</div>
<SCRIPT src="../../javascript/drag_drop.js" type=text/javascript></SCRIPT>
<SCRIPT src="../../javascript/cookie.js" type=text/javascript></SCRIPT>
<script>
function dotestspeed(val){
if(GetCookie("testspeed"))
{
	val.disabled=true;
	val.parentNode.innerHTML+=GetCookie("testspeed").split('||||')[0];
	eval(GetCookie("testspeed").split('||||')[1]);
}
else
{
	val.disabled=true;
	val.value="������..";
	xmlHttp('Zhuna_Config.asp?action=testspeed&r='+Math.random(),
		function(e){	
			var es=e.split('||||');
		    val.parentNode.innerHTML+=es[0];
			eval(es[1]);
			_g('testspeed').value="����";
			SetCookie("testspeed",e,60*60*24);//����һ�����
	});
}}
function _g(n){return document.getElementById(n)}
function xmlHttp(Url,xmlBack){var xObj=null;try{xObj=new ActiveXObject("MSXML2.XMLHTTP")}catch(e){try{xObj=new ActiveXObject("Microsoft.XMLHTTP")}catch(e2){try{xObj=new XMLHttpRequest()}catch(e){}}};with(xObj){open("get",Url, true);onreadystatechange=function(){if(readyState==4&&status==200){xmlBack(responseText)}};send(null)}};

var dragHelper = document.createElement('DIV');
dragHelper.style.cssText = 'position:absolute;display:none;';
document.getElementById("cityList").appendChild(dragHelper);
function changtag(val)
{
	CreateDragContainer(document.getElementById('cityList'));
	var root=document.getElementById("cityList")
	var oNote=root.getElementsByTagName("span");
	var isthere=false;
	for(i=0;i<oNote.length;i++){
	if(oNote[i].attributes.getNamedItem("id"))
	var id=oNote[i].attributes.getNamedItem("id").nodeValue;
	if(oNote[i].attributes.getNamedItem("value"))
	var value=oNote[i].attributes.getNamedItem("value").nodeValue;
	if((id+"|"+value)==val)isthere=true;
	}
	if(!isthere){
	var val=val.split('|');
		document.getElementById("cityList").innerHTML+="<span ondblclick=\"return updatename(this,'"+val[1]+"');\" style=\"border:#CCC solid 1px; padding:3px;cursor:move;\" value=\""+val[1]+"\" id=\""+val[0]+"\">"+val[1]+"<em style=\"cursor:pointer\" onclick=\"return delCity("+val[0]+");\">��</em></span>";
	}
	
}
function updatename(val,itemval)
{
	if(val.innerHTML.indexOf("input")==-1)
	val.innerHTML=val.innerHTML.replace(itemval,"<input onblur='return changvals(this);' style='' size=4 value="+itemval+">");
}
function changvals(val)
{
	val.parentNode.setAttribute("value",val.value);
}
function fillcitylist()
{
	var root=document.getElementById("cityList")
	var oNote=root.getElementsByTagName("span");
	var liststr="";
	for(i=0;i<oNote.length;i++){
		if(oNote[i].parentNode.style.display!="none"){
		if(oNote[i].attributes.getNamedItem("id")){
			var id=oNote[i].attributes.getNamedItem("id").nodeValue;
			liststr+=id+"|";
		}
		if(oNote[i].attributes.getNamedItem("value")){
			var value=oNote[i].attributes.getNamedItem("value").nodeValue;
			liststr+=value+",";
		}
		}
	}
	if(liststr.length>0){
	document.getElementById("hotel(4)").value=liststr.substr(0,liststr.length-1);}
	else{
	alert("��ҳ����ѡ�����Ϊ�գ�");
	return false;}
}
function delCity(val)
{
	document.getElementById(val).parentNode.removeChild(document.getElementById(val));
}
</script>
<%
End Sub

Sub Do_Mod_Config()
	Dim BaseConfig,hotel,i,Rs,SQL,cityid,AP
	If Request("installpath")="" Then CheckErr=True:MsgStr=MsgStr+"��վĿ¼����Ϊ�ա�"
	If Request("hotel(0)")="" Then CheckErr=True:MsgStr=MsgStr+"�ƹ�ID����Ϊ�ա�"
	If Request("hotel(1)")="" Then CheckErr=True:MsgStr=MsgStr+"���˼����ַ�����Ϊ�ա�"
	If Request("cachename")="" Then CheckErr=True:MsgStr=MsgStr+"����������Ϊ�ա�"
	If Request("hotel(9)")="" Then CheckErr=True:MsgStr=MsgStr+"�ӿڵ�ַ����Ϊ��"
	
	For i = 0 To 5
		BaseConfig = BaseConfig & Trim(Request.Form("baseconfig(" & i & ")")) & "-_-"
	Next
	For i = 0 To 14
		If i=3 Then
			cityid=getcityid(Trim(Request.Form("hotel(2)")))
			If cityid<>0 Then
			hotel = hotel & Trim(cityid) & "-_-"
			Else
				CheckErr=True
				MsgStr="���Ҳ���������ĳ���ID��"
			End If
		Elseif i=11 Then
			If left(Trim(Request.Form("hotel(11)")),1)<>"h" Then
				hotel = hotel &"h"& Trim(Request.Form("hotel("&i&")")) & "-_-"
			Else
				hotel = hotel & Trim(Request.Form("hotel("&i&")")) & "-_-"
			End If
		Else
			hotel = hotel & Trim(Request.Form("hotel("&i&")")) & "-_-"
		End If
	Next

	If Not CheckErr Then
		SQL = "SELECT * FROM ZN_"&ModuleName
		Set Rs = DB.Recordset(SQL,1,3)
		If Not Rs.Eof Then
			If split(Rs("Config_hotel"),"-_-")(0)<>Trim(Request.Form("hotel(0)")) or split(Rs("Config_hotel"),"-_-")(1)<>Trim(Request.Form("hotel(1)")) Then
				If checkcityid(Trim(Request.Form("hotel(0)")),Trim(Request.Form("hotel(1)")))=1 Then
					response.Write("<script>alert(""�����������ID���߼����ַ�������ȷ�����飡"");history.back(1);</script>")
					response.End()
				End If
			End If
			If split(Rs("Config_hotel"),"-_-")(7)<>Trim(Request.Form("hotel(7)")) Then
				If Trim(Request.Form("hotel(7)"))=1 Then
					If IsFile("/httpd.ini") Then
						response.Write("<script>alert(""����������վ��Ŀ¼�´���httpd.ini�ļ�������������վ��Ҫ���ļ�������ͨ��ftp����������ļ����ٽ��д�α��̬���ܵĲ�����"");history.back(1);</script>")
						response.End()
					Else
						Call CreatFile("/httpd.ini",Trim(Request.Form("hotel(8)")))
					End If
				Else
					Call Deletefiles("/httpd.ini")
				End If
			End If
			Dim files,tstr,fso,tempstr,f
			If (Rs("Config_installpath")<>FU.CheckBadstr(Trim(Request.Form("installpath")))) or (FU.CheckBadstr(Trim(Request.Form("installpath2")))<>FU.CheckBadstr(Trim(Request.Form("installpath")))) Then
				set fso=server.CreateObject("Scripting.FileSystemObject")
					If fso.FileExists(server.mappath("../../inc/SETUP.ASP")) Then
						set files=fso.OpenTextFile(server.mappath("../../inc/SETUP.ASP"))
						do while files.AtEndOfStream = false
							tempstr=files.ReadLine
							if instr(tempstr,"""DBPath""")>0 Then
								tstr=tstr&"D.Add ""DBPath"","""&FU.CheckBadstr(Trim(Request.Form("installpath2")))&""""&vbcrlf
							else
								tstr=tstr&tempstr&vbcrlf
							end if
						loop
						set f=fso.CreateTextFile(server.mappath("../../inc/SETUP.ASP"),true)
						f.write(tstr)
						f.close:set f=nothing
						Set files=Nothing
					end if
				Set fso=Nothing
			End If
			'���û�����
			If Rs("Config_cachename")<>FU.CheckBadstr(Trim(Request.Form("cachename"))) Then
				set fso=server.CreateObject("Scripting.FileSystemObject")
					If fso.FileExists(server.mappath("../../inc/SETUP.ASP")) Then
						set files=fso.OpenTextFile(server.mappath("../../inc/SETUP.ASP"))
						do while files.AtEndOfStream = false
							tempstr=files.ReadLine
							if instr(tempstr,"""Cachename""")>0 Then
								tstr=tstr&"D.Add ""Cachename"","""&FU.CheckBadstr(Trim(Request.Form("cachename")))&""""&vbcrlf
							else
								tstr=tstr&tempstr&vbcrlf
							end if
						loop
						set f=fso.CreateTextFile(server.mappath("../../inc/SETUP.ASP"),true)
						f.write(tstr)
						f.close:set f=nothing
						Set files=Nothing
					end if
				Set fso=Nothing
			End If
			
			Rs("Config_installpath")=FU.CheckBadstr(Trim(Request.Form("installpath")))
			Rs("Config_weburl")=FU.CheckBadstr(Trim(Request.Form("weburl")))
			Rs("Config_BaseConfig")=BaseConfig
			Rs("Config_hotel")=hotel
			Rs("Config_cachename")=FU.CheckBadstr(Trim(Request.Form("cachename")))
			Rs.update
			'����д�뻺��
				Set AP=new ApplicationClass
				AP.Add Rs("Config_cachename")&"installpath",FU.CheckBadstr(Trim(Request.Form("installpath"))),365
				AP.Add Rs("Config_cachename")&"weburl",FU.CheckBadstr(Trim(Request.Form("weburl"))),365
				AP.Add Rs("Config_cachename")&"BaseConfig",BaseConfig,365
				AP.Add Rs("Config_cachename")&"hotel",hotel,365
				AP.Add "cachename",FU.CheckBadstr(Trim(Request.Form("cachename"))),365
				Set AP=Nothing

			MsgStr="../Msg.asp?title="&ec("�޸ĳɹ���")&"&msg="&ec("��ز�����")&"<br><a href="""&request.ServerVariables("SCRIPT_NAME")&"?Action=mod"">"&ec("�����޸�")&"</a>"
		End If
		Rs.Close:Set Rs=Nothing
	End If
End Sub

Function getcityid(cityname)
	dim apiUrl,http,backXml,xml,root,iscreat,creathlisturl,objNodes
	apiUrl=doserver&"city.asp?u="&agent_id&"&m="&agent_md&"&cityname="&ec(cityname)&""
	apiUrl=apiUrl&"&domain="&domain&"&Copyright="&Copyright&"&doname="&server.URLEncode(doname)&""
	creathlisturl=webpath&"DataBase/XML/city/"&replace(webpath,"/","")&"_getCity_all.xml"

	set xml=GetXml(apiUrl,creathlisturl)
	if xml.xml<>"" then
		set root=xml.documentElement
		Set objNodes = root.selectSingleNode("city[@name='"&cityname&"']")
		if objNodes is nothing then
		getcityid=1
		else
		getcityid =objNodes.getAttribute("ID")
		end if
	else
		getcityid=1
	end if
	set xml=nothing
End Function
Function CreatcityList()
	dim apiUrl,xml,root,creathlisturl,objNodes,strs,i
	apiUrl=doserver&"city.asp?u="&agent_id&"&m="&agent_md
	apiUrl=apiUrl&"&domain="&domain&"&Copyright="&Copyright&"&doname="&server.URLEncode(doname)&""
	creathlisturl=webpath&"DataBase/XML/city/"&replace(webpath,"/","")&"_getCity_all.xml"
	set xml=GetXml(apiUrl,creathlisturl)
	if xml.xml<>"" then
		set root=xml.documentElement
		Set objNodes = root.childNodes
		If objNodes.Length>0 Then
			strs="<select onchange=""return changtag(this.value);"">"&vbCrlf
			For i=0 to objNodes.Length-1
			'  <city ID="97" name="�麣" HotelNum="71" suoxie="ZH" /> 
				strs=strs&"<option value='"&objNodes.item(i).getAttribute("ID")&"|"&objNodes.item(i).getAttribute("name")&"'>"&objNodes.item(i).getAttribute("suoxie")&chr(13)&objNodes.item(i).getAttribute("name")&"</option>"&vbCrlf
			Next
			strs=strs&"</select>"
		End If
		CreatcityList=strs
	else
		CreatcityList=""
	end if
	set xml=nothing
End Function

'��֤�Ƿ�Ϊ���˻�Ա
Function checkcityid(agent_id,agent_md)
	dim apiUrl,xml,root
	apiUrl="http://un.zhuna.cn/api/gbk/usercheck.asp?u="&agent_id&"&m="&agent_md
	set xml=GetXml(apiUrl,"")
	if xml.xml<>"" then
		set root=xml.documentElement
		if root is nothing then
			checkcityid=1
		else
			checkcityid =root.text
		end if
	else
		checkcityid=1
	end if
	set xml=nothing
End Function

Function getHost(val)
	dim xml,root,objNodes,strs,selected,i
	set xml=GetXml("http://un.zhuna.cn/api/dns.xml","")
	if xml.xml<>"" then
		set root=xml.documentElement
		Set objNodes = root.childNodes
		If objNodes.Length>0 Then
			strs="<select name=""hotel(9)"" id=""hotel(9)"">"&vbCrlf
			For i=0 to objNodes.Length-1
				selected=""
				if cstr(val)=cstr(objNodes.item(i).getAttribute("v")&"/api/gbk/") then
			 	selected=("selected")
			 	end if
				strs=strs&"<option value='"&objNodes.item(i).getAttribute("v")&"/api/gbk/' "&selected&">"&objNodes.item(i).getAttribute("title")&"</option>"&vbCrlf
			Next
			strs=strs&"</select>"
		End If
	end if
	set xml=nothing
	getHost=strs
End Function

Function testspeed()
if request.Cookies("testspeed")<>"" Then
response.Write(FU.CheckBadstr(request.Cookies("testspeed")))
response.End()
End If
response.Write("<br>")
	dim xml,root,objNodes,selected,i,apiUrl,startime,endtime,xml2,citynode,lesstime,star,j,colors
	set xml=GetXml("http://un.zhuna.cn/api/dns.xml","")
	set xml2=GetXml("http://un.zhuna.cn/api/gbk/city.asp","")
	if xml.xml<>"" then
		set root=xml.documentElement
		Set objNodes = root.childNodes
		Set citynode=xml2.documentElement.childNodes
		If objNodes.Length>0 Then
			For i=0 to objNodes.Length-1
				colors="green"
				For j=0 to 3
					apiUrl=objNodes.item(i).getAttribute("v")&"/api/gbk/cityname.asp?u="&agent_id&"&m="&agent_md&"&cityid="&citynode.item(i+j).getAttribute("ID")
					startime= Timer()
					If ExXML(GetBackXml(apiUrl),"").xml<>"" Then
						Endtime=Endtime+(Timer()-startime)
					End If					
				Next
				Endtime=round(Endtime/4,6)
				If Endtime<>"" Then
					If Endtime>0.1 Then colors="red"
					response.Write(objNodes.item(i).getAttribute("title")&"��ַ��ȡ����&nbsp;&nbsp;����ʱ�䣺<font color="&colors&">"&Endtime&"</font><br>")
					If lesstime="" Then lesstime=Endtime:star=objNodes.item(i).getAttribute("v")
					If lesstime>Endtime Then lesstime=Endtime:star=objNodes.item(i).getAttribute("v")
				End If
			Next
		End If
	end if
	set xml=nothing
response.Write("<br>������Ϣ��ӳ���Ǵ����ķ�������ȡ�Ƶ���Ϣ����ʱ�䡣���Խ�������ο���<font color=brown>[�˹��ܱ����ڷ������˲���,�ڱ��ز����ٶȷ�ӳ���Ǵ����ĵ��Ի�ȡ��Ϣ���ٶ�]</font>")
response.Write("||||var city_sel=document.getElementById(""hotel(9)"");for(var i=0;i<city_sel.options.length;i++){if(city_sel.options[i].value=='"&star&"/api/gbk/'){city_sel.options[i].selected=true;break;}}")
End Function
%>