<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Option explicit
Response.CodePage=936
Response.Charset="gb2312"
Response.ContentType="text/html"%>
<!--#INCLUDE FILE="inc/main_Function.asp"-->
<!--#INCLUDE FILE="inc/MD5.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>程序安装</title>
<style>
body { font-size:12px; line-height:2; font-family:Verdana;}
h1,h2,h3,h4,h5,h6 { margin:0; padding:0; font-weight:normal;}
a { color:#05a; text-decoration:none;}
a:hover { color:#f00; text-decoration:underline;}
#layout { width:598px; margin:30px auto; border:1px solid #ccc; background:url(images/top_bg.gif) 2px 2px no-repeat;}
#layout h5 { height:26px; padding:30px 15px 0 0; font-size:12px; text-align:right; color:#666;}
.box { padding:0 30px 30px 30px;}
.box h2 { font-size:20px; font-family:"microsoft yahei","黑体"; margin:20px 0 10px 0;}
.box h4 { font-size:12px; background:url(images/icon111.gif) 0 5px no-repeat; padding-left:22px; margin-bottom:20px; color:#C63;}
.t_list { color:#666;}
.t_list tr td { padding:5px;}
.btn05 { width:87px; height:32px; border:1px solid #87a3c1; background:url(images/btn01.gif); color:#555; font-size:16px; line-height:180%; cursor:pointer; font-weight:bold;}
.btn06 { width:87px; height:32px; border:1px solid #a2904d; background:url(images/btn01.gif)　0　-64px; color:#630; font-size:16px; line-height:180%; cursor:pointer; font-weight:bold;}
.input_txt { width:201px; height:18px; padding:5px 0 0 3px; border-top:1px solid #898989; border-left:1px solid #898989; border-right:1px solid #ddd; border-bottom:1px solid #ddd;}
#inst_ok { background:url(images/notify_icon_ok.gif) 170px 65px no-repeat; padding:60px 0 60px 220px;}
#inst_ok h1 { font-size:22px; font-family:"microsoft yahei","黑体"; }
#inst_err{ padding:10px;}
#inst_err h1{padding:10px;font-family:"microsoft yahei","黑体"; line-height:130%; padding-top:50px;}
#inst_err b{ color:#F00}
.errmsgs{background-color:#FCF;height:65px;text-align:center;line-height:30px;border:1px solid #F00;position:absolute;top:0;}
</style>
</head>

<body>
<div id="layout">
<h5>V7.0 2010-05-17</h5>
<%Dim MsgStr,CheckErr,FU,Action,v,mshttp,webpath,webpathB,dom,root,note,nowstep,checkobjs,checkstrs
mshttp="MSXML2.ServerXMLHTTP"
nowstep="0"
checkobjs=false
const odebug=false
const oiscache=false

Set dom=new XMLClass
if not dom.OpenXml("step.xml") then
	set root=dom.CreateNew("data")
	set note=dom.AddNode("step",root)
	dom.AddAttribute "s",1,note
	dom.AddAttribute "v",0,note
	set note=dom.AddNode("step",root)
	dom.AddAttribute "s",2,note
	dom.AddAttribute "v",0,note
	set note=dom.AddNode("step",root)
	dom.AddAttribute "s",3,note
	dom.AddAttribute "v",0,note
	dom.SaveAsXML server.MapPath("step.xml")
else
	dim i,Rst
	set Rst=dom.FindNodes("step")
	for i=0 to dom.Length-1
		if dom.GetAtt("v",Rst(i))="1" Then
			nowstep=dom.GetAtt("s",Rst(i))
		End If
	Next
End If

checkstrs="FSO文件读写删除:"&ObjectTest("Scripting.FileSystemObject")&"&nbsp;&nbsp;ADO 数据库访问对象:"&ObjectTest("adodb.connection")&"&nbsp;&nbsp;数据库操作:"&ObjectTest("ADOX.Catalog")&"&nbsp;&nbsp;无组件上传支持:"&ObjectTest("Adodb.Stream")&"&nbsp;&nbsp;HTTP 组件:"&ObjectTest("Microsoft.XMLHTTP")
if checkobjs Then response.Write("<div class=""errmsgs"">"&checkstrs&"<br>以上组件必须全部支持才可以运行本程序！请联系空间提供商或者从新配置服务器</div><style>#layout{margin:80px auto;</style>")

webpath = Left(LCase(Request.ServerVariables("SCRIPT_NAME")), InStrRev(LCase(Request.ServerVariables("SCRIPT_NAME")), "/") )
webpathB = Left(webpath, InStrRev(webpath, "/"))
webpath = server.MapPath(webpathB)
Action=request.QueryString("action")
Set v=new Validator
Set FU=new Main_function

If Action="" Then
	select case nowstep
	case "1":Action="StepTwo"
	case "2":Action="StepThree"
	End Select
End If

CheckErr = False
Select Case Action
Case "StepTwo":Call StepTwo()
Case "StepThree":Call StepThree()

Case "one":Call Do_StepOne()
Case "two":Call Do_StepTwo()
Case "three":Call Do_StepThree()
Case "four":Call Do_StepFour()
Case Else:Call StepOne()
End Select

If CheckErr Then
	Response.Write("<script>alert('"&MsgStr&"');history.back();</script>")
	Response.End()
ElseIf MsgStr<>"" Then
	Response.Redirect(MsgStr)
End If
Set v=Nothing
set fu=nothing
set dom=nothing
Sub StepOne()
%>
<div class="box">
<form name="myform" method="post" action="?action=one">
<h2>第一步：数据库安装</h2><h4>如果您不懂下面所设置的是什么，使用默认值，按下一步就可以了,此设置不影响您日常后台操作</h4>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
  <tr>
    <td width="100" align="right">设置数据库名称：</td>
    <td width="210">
      <input name="data(0)" type="text" class="input_txt" value="<%=makePassword(20)%>" />
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">设置表前缀</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">会员表：</td>
    <td><input name="data(1)" type="text" class="input_txt" value="<%=makePassword(10)%>" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">文章表：</td>
    <td><input name="data(2)" type="text" class="input_txt" value="<%=makePassword(10)%>" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">友情链接表：</td>
    <td><input name="data(3)" type="text" class="input_txt" value="<%=makePassword(10)%>" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">广告表：</td>
    <td><input name="data(5)" type="text" class="input_txt" value="<%=makePassword(10)%>" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">网站设置表：</td>
    <td><input name="data(4)" type="text" class="input_txt" value="<%=makePassword(10)%>" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td align="center"><input name="submit2" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" type="submit" value=" 下一步 " /></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</div>
  <%End Sub
Sub Do_StepOne()
	Dim dbStr,i
	For i=0 To 5
		If Request("data("&i&")")="" Or v.Islaw(Request("data(0)"))=false Then CheckErr=True:MsgStr="请您输入合法的数据库和表名称！长度为5-20位！\n数字或字母或下划线或中横线."
		dbStr=dbStr&Trim(Request("data("&i&")"))&","
	Next
	If CheckErr=False Then
		CreatDB(dbStr)
		MsgStr="?action=StepTwo"
	End If
End Sub

Sub StepTwo()
Dim installpath,weburl
		installpath = Left(LCase(Request.ServerVariables("SCRIPT_NAME")), InStrRev(LCase(Request.ServerVariables("SCRIPT_NAME")), "/") )
		installpath = Left(installpath, InStrRev(installpath, "/"))
		weburl = "http://"& LCase(Request.ServerVariables("HTTP_HOST"))
		If not installpath="/" Then 
			If not v.Islaws(replace(installpath,"/","")) Then 
				response.Write("您的网站路径文件夹名称不合法,请您修改文件夹名称为字母或数字组成.")
				response.End()
			End If
		End If
		%>
<div class="box"><form name="myform" method="post" action="?action=two">
<h2>第二步：网站设置</h2><h4>此页内容必填，默认伪静态为关闭状态，您安装完毕后可以进入后台开启伪静态功能.<br />
  如果您在此页面点击下一步长时间没有反应，请再耐心等待一会，因为系统会自动验证您的联盟id和联盟加密字符串。</h4>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
    <tr>
      <td width="100" align="right">联盟ID：</td>
      <td width="210">
        <input name="data(0)" type="text" class="input_txt" id="data(0)" />
      </td>
      <td>请登录<a href="http://un1.zhuna.cn/user/apimain.asp" target="_blank">联盟会员中心</a>获取</td>
    </tr>
    <tr>
      <td align="right">联盟加密字符串：</td>
      <td>
        <input name="data(1)" type="text" class="input_txt" id="data(1)" />
      </td>
      <td>同上</td>
    </tr>
    <tr>
      <td align="right">设置网站名称：</td>
      <td>
        <input name="data(2)" type="text" class="input_txt" />
      </td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td align="right">网站路径：</td>
      <td>
      <input name="installpath" type="hidden" class="input_txt" value="<%=installpath%>" />
        <input name="data(3)" type="text" class="input_txt" value="<%=installpath%>" />
      </td>
      <td>根目录下请直接用/</td>
    </tr>
    <tr>
      <td align="right">网站域名：</td>
      <td>
        <input name="data(4)" type="text" class="input_txt" value="<%=weburl%>" />
      </td>
      <td>本地测试填写http://127.0.0.1/</td>
    </tr>
    <tr>
      <td align="right">默认城市：</td>
      <td><%=CreatcityList()%></td>
      <td>首页将显示该城市酒店</td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td><input type="button" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" onClick="window.location.href='install.asp?action=StepOne';" value=" 上一步 " />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input name="submit" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" type="submit" value=" 下一步 " /></td>
      <td>&nbsp;</td>
    </tr>
  </table>
  </form></div>
<p>

  <%End Sub%>
<%Sub Do_StepTwo()
	Dim dbStr,i,DBandTable,cityid,cityname,defaultcity,dbStrTemp
	For i=0 To 5
		If Request("data("&i&")")="" Then CheckErr=True:MsgStr="请您填写完整的内容！\n"
		dbStrTemp=dbStrTemp&Trim(Request("data("&i&")"))&","
	Next
	If CheckErr=False Then
		If v.IsNum(Request("data(0)"))=false Then CheckErr=True:MsgStr=MsgStr+"请您输入您的网盟ID！必须为数字！且不能有空格\n"
		If v.IsUrl(Request("data(4)"))=false Then CheckErr=True:MsgStr=MsgStr+"您输入的网站域名不正确！\n"
	End If	
	If CheckErr=False Then
		If checkcityid(Request("data(0)"),Request("data(1)"))=1 Then CheckErr=True:MsgStr=MsgStr+"您输入的网盟ID或者加密字符串不正确，请检查！"
	End If
	defaultcity="53|北京,321|上海,80|广州,383|杭州,91|深圳,192|武汉,317|西安,224|南京,324|成都,"
	if instr(defaultcity,Trim(Request("data(5)")))>=1 then
		defaultcity=Trim(Request("data(5)"))&","&replace(defaultcity,Trim(Request("data(5)"))&",","")
		defaultcity=left(defaultcity,len(defaultcity)-1)
	else
		defaultcity=Trim(Request("data(5)"))&","&defaultcity
		defaultcity=left(defaultcity,len(defaultcity)-1)
	end if
	If CheckErr=False Then
		cityid=split(FU.Checkbadstr(Trim(Request("data(5)"))),"|")(0)
		If cityid=0 Then CheckErr=True:MsgStr=MsgStr+"找不到您输入的默认城市！"
	End If
	
	for i=0 to dom.Length-1
		if dom.GetAtt("s",Rst(i))="1" Then
			DBandTable=dom.GetNodeText(Rst(i))
		End If
	Next
	If DBandTable="" Then CheckErr=True:MsgStr=MsgStr+"创建数据库失败，请您从新执行上一步操作！或者联系联盟专员"
	
	If CheckErr=False Then
	Dim InstallPath,WebUrl,BaseConfig,Hotel,cachename,objconnDatabase
		dbStr=split(DBandTable,",")
		InstallPath=FU.Checkbadstr(Trim(Request("data(3)")))
		WebUrl=FU.Checkbadstr(Trim(Request("data(4)")))
		BaseConfig=FU.Checkbadstr(Trim(Request("data(2)")))&"-_-超低价预订全国5,000多家经济型酒店 全国96家连锁酒店预订-_-<p>版权：艺程酒店预订网 Copyright 2009-2010 Corporation, All Rights Reserved</p><p>备案序号：备案信息提交审查中</p>-_-0-_-网站维护中-_-妈妈的=哈哈哈|我靠=呵呵|fuck=****|bitch=*****|他妈的=***|性爱=**|法轮=**|falundafa=*********|falun=*****|江泽民=***|操你妈=***|三级片=***|我操=呵呵|干你娘=***|日你妈=***|操你=**|混账=**|发票=fapiao-_-"
		Hotel=FU.Checkbadstr(Trim(Request("data(0)")))&"-_-"&FU.Checkbadstr(Trim(Request("data(1)")))&"-_-"&split(FU.Checkbadstr(Trim(Request("data(5)"))),"|")(1)&"-_-"&cityid&"-_-"&FU.Checkbadstr(Trim(defaultcity))&"-_--_-5-_-0-_-[ISAPI_Rewrite]"&vbcrlf&_
"# Defend your computer from some worm attacks"&vbcrlf&_
"RewriteRule .*(?:global.asa|default\.ida|root\.exe|\.\.).* . [F,I,O]"&vbcrlf&_
"#API静态版规则"&vbcrlf&_
"RewriteRule ^(.*)/([A-Za-z0-9]+)-c(\d+)-x(\d*)-(.*)-(.*)-a(\d+)-e(\d+).html(?:\?(.*))? $1/hotellist\.asp\?cityid=$3&rank=$4&hn=$5&key=$6&px=$7&pg=$8&$9 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/h([A-Za-z0-9]+)-(\d+)-(\d+)\.html(?:\?(.*))? $1/hotelinfo\.asp\?cityid=$3&hotelid=$4&$5 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/liansuo-(\d+)\.html(?:\?(.*))? $1/liansuo\.asp\?lsid=$2&$3 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/expocity-(\d+)-(\d+)\.html(?:\?(.*))? $1/expo\.asp\?cityid=$2&pg=$3&$4 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/expoinfo-(\d+)-(\d+)\.html(?:\?(.*))? $1/expoinfo\.asp\?cityid=$2&id=$3&$4 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/news\.html(?:\?(.*))? $1/news\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/news-(\d+)\.html(?:\?(.*))? $1/news\.asp\?classid=$2&$3 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/newsinfo-(\d+)-(\d+)\.html(?:\?(.*))? $1/newsinfo\.asp\?id=$2&classid=$3&$4 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/onsale-(\d+)-(\d+)-(\d+)\.html(?:\?(.*))? $1/onsale\.asp\?cityid=$2&hotelid=$3&pg=$4&$5 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/onsale\.html(?:\?(.*))? $1/onsale\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/index/(\d+)\.html(?:\?(.*))? $1/city/index\.asp\?cityid=$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/index(\d+)\.html(?:\?(.*))? $1/index\.asp\?cityid=$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/search\.html(?:\?(.*))? $1/search\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/liansuo\.html(?:\?(.*))? $1/liansuo\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/allcity\.html(?:\?(.*))? $1/allcityS\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/expo\.html(?:\?(.*))? $1/expo\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/map\.html(?:\?(.*))? $1/map\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/help\.html(?:\?(.*))? $1/help\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/school\.html(?:\?(.*))? $1/school\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/jiaotong\.html(?:\?(.*))? $1/jiaotong\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/zhanguan\.html(?:\?(.*))? $1/zhanguan\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/ditie\.html(?:\?(.*))? $1/ditie\.asp\?$2 [I,L]"&vbcrlf&_
"RewriteRule ^(.*)/([^-]*)-(\d+)-(\d+)-([^-]*)-([^-]*)-(\d+)-(\d+).html(?:\?(.*))?  $1/$2-c$3-x$4-$5-$6-a$7-e$8\.html\?$9 [I,R,L]-_-http://un.zhuna.cn/api/gbk/-_-search-_-hotel-_-1-_-1-_-1-_-"
		cachename=makePassword(20)
'设置默认信息！
		Set objconnDatabase =Server.CreateObject("ADODB.Connection")
		objconnDatabase.Open "Provider=Microsoft.Jet.OLEDB.4.0;" & _
	"Data Source="&webpath&"\Database\"&dbStr(0)&".asa"
	
		if objconnDatabase.Execute("Select count(*) From ZN_"&dbStr(4)&"")(0)=0 Then
			objconnDatabase.Execute("INSERT INTO ZN_"&dbStr(4)&" (Config_InstallPath,Config_WebUrl,Config_BaseConfig,Config_Hotel,Config_cachename) VALUES ('"&InstallPath&"','"&WebUrl&"','"&BaseConfig&"','"&Hotel&"','"&cachename&"')")
		Else
			objconnDatabase.Execute("UPDATE ZN_"&dbStr(4)&" SET Config_InstallPath='"&InstallPath&"',Config_WebUrl='"&WebUrl&"',Config_BaseConfig='"&BaseConfig&"',Config_Hotel='"&Hotel&"',Config_cachename='"&cachename&"'")
		End If
		
		if objconnDatabase.Execute("Select count(*) From ZN_"&dbStr(5)&"")(0)=0 Then
		   objconnDatabase.Execute("INSERT INTO ZN_"&dbStr(5)&" (AD_Title,AD_Link,AD_SizeWidth,AD_SizeHeight,AD_Type_radio,AD_UploadFile,AD_State_radio,AD_Adddate,AD_Area) VALUES ('酒店广告','#',238,207,2,'images/san_g.gif',2,'"&now()&"','新闻页')")
		   objconnDatabase.Execute("INSERT INTO ZN_"&dbStr(5)&" (AD_Title,AD_Link,AD_SizeWidth,AD_SizeHeight,AD_Type_radio,AD_UploadFile,AD_State_radio,AD_Adddate,AD_Area) VALUES ('酒店广告','{webpath}/special/shibohui/',950,70,2,'',3,'"&now()&"','通栏')")
		End If
		
		if objconnDatabase.Execute("Select count(*) From ZN_"&dbStr(3)&"")(0)=0 Then
		   objconnDatabase.Execute("INSERT INTO ZN_"&dbStr(3)&" (FriendLink_Title,FriendLink_Link,FriendLink_Type_radio,FriendLink_State_radio,FriendLink_Externallinks,FriendLink_Order) VALUES ('住哪网','http://www.zhuna.cn',3,2,'images/zhuna2.gif',999999)")
		   objconnDatabase.Execute("INSERT INTO ZN_"&dbStr(3)&" (FriendLink_Title,FriendLink_Link,FriendLink_Type_radio,FriendLink_State_radio,FriendLink_Externallinks,FriendLink_Order) VALUES ('住哪联盟','http://un.zhuna.cn',3,2,'images/zhuna.gif',999998)")
		   objconnDatabase.Execute("INSERT INTO ZN_"&dbStr(3)&" (FriendLink_Title,FriendLink_Link,FriendLink_Type_radio,FriendLink_State_radio,FriendLink_Order) VALUES ('住哪网','http://www.zhuna.cn',1,2,999997)")
		   objconnDatabase.Execute("INSERT INTO ZN_"&dbStr(3)&" (FriendLink_Title,FriendLink_Link,FriendLink_Type_radio,FriendLink_State_radio,FriendLink_Order) VALUES ('住哪联盟','http://un.zhuna.cn',1,2,999996)")
		End If
		
		if objconnDatabase.Execute("Select count(*) From ZN_"&dbStr(2)&"_Class")(0)=0 Then
		   objconnDatabase.Execute("INSERT INTO ZN_"&dbStr(2)&"_Class (ClassID,ClassName,ParentID,ParentStr,Depth,RootID,Child,orderid,readme) VALUES (1,'旅游资讯',0,0,0,1,0,0,'无')")
		End If
		
		if objconnDatabase.Execute("Select count(*) From ZN_"&dbStr(2)&"")(0)=0 Then
		dim conn2,rs2
			set conn2=server.CreateObject("ADODB.Connection") 
			conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=;Extended properties=Excel 5.0;Data Source="&Server.MapPath("Database/news.xls") 
			Set rs2 = Server.CreateObject("ADODB.Recordset")
			rs2.open "SELECT * FROM [news$]",conn2,1,3
			while not rs2.eof 
			objconnDatabase.execute("insert into ZN_"&dbStr(2)&" ([Article_ClassID],[Article_Title],[Article_content],[Article_Author],[Article_Order],[Article_State_Radio],[Article_AddDate],[Article_ViewNum],[Article_ViewImg],[Article_CityID_select]) values("& rs2(0) &",'"& rs2(1) &"','"& rs2(2) &"','"& rs2(3) &"',"& rs2(4) &","& rs2(5) &",'"&now&"',"& rs2(7) &",'"& rs2(8) &"',"& rs2(9) &")") 
			rs2.movenext
			wend 
			rs2.close:set rs2=nothing
			conn2.close:set conn2=nothing
		End If
		objconnDatabase.close:set objconnDatabase=Nothing
'结束
		Dim setupstr
		setupstr="<%"&vbcrlf&_
"Set D=Server.CreateObject(""Scripting.Dictionary"")"&vbcrlf&_
"D.Add ""DBName"","""&dbStr(0)&""""&vbcrlf&_
"D.Add ""Manage"","""&dbStr(1)&""""&vbcrlf&_
"D.Add ""Article"","""&dbStr(2)&""""&vbcrlf&_
"D.Add ""FriendLink"","""&dbStr(3)&""""&vbcrlf&_
"D.Add ""AD"","""&dbStr(5)&""""&vbcrlf&_
"D.Add ""Config"","""&dbStr(4)&""""&vbcrlf&_
"D.Add ""Cachename"","""&Cachename&""""&vbcrlf&_
"D.Add ""DBPath"","""&FU.Checkbadstr(Trim(request("InstallPath")))&""""&vbcrlf&chr(37)&_
">"
		call CreatFile("SETUP.ASP",setupstr)
		call CreatFile("INC/SETUP.ASP.Bak",setupstr)
		for i=0 to dom.Length-1
			if dom.GetAtt("s",Rst(i))="2" Then
				dom.AddAttribute "v","1",Rst(i)
				dom.AddText dbStrTemp,true,Rst(i)
			End If
		Next
		dom.SaveXML()
		MsgStr=("?action=StepThree")
	End If
End Sub

Sub StepThree()%>
<div class="box"><form name="myform" method="post" action="?action=three">
<h2>第三步：设置登录信息</h2>
<h4>系统给出了默认值，建议您修改为不容易被猜到的！</h4>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
  <tr>
    <td width="100" align="right">后台路径：</td>
    <td width="210"><input name="data(0)" type="text" class="input_txt" value="admin_"/></td>
    <td>网站管理后台登录路径，建议修改</td>
  </tr>
  <tr>
    <td align="right">用户名：</td>
    <td><input name="data(1)" type="text" class="input_txt" value="admin" /></td>
    <td>网站管理登录用户名，建议修改</td>
  </tr>
  <tr>
    <td align="right">密码：</td>
    <td><input name="data(2)" type="password" class="input_txt" value="" /></td>
    <td>登录密码，建议修改</td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td><input type="button" onClick="window.location.href='install.asp?action=StepTwo';" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" value="上一步" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input name="submit" type="submit" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" value="下一步" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</div>
<%End Sub
Sub Do_StepThree()
	Dim dbStr,i,dbStrsplit
	For i=0 To 2
		If Request("data("&i&")")="" or v.Islaw(Request("data("&i&")"))=false Then CheckErr=True:MsgStr="请您填写完整的内容！长度为5-20位！\n数字或字母或下划线或中横线"
		dbStr=dbStr&Trim(Request("data("&i&")"))&","
	Next
	If Len(Trim(Request("data(2)")))<5 Then CheckErr=True:MsgStr="密码必须为5位以上！"
	dbStrsplit=split(dbStr,",")
	If CheckErr=False Then
%>
<div class="box">
<h2>第四步：确认信息</h2>
<h4>再次请您牢记，如果您觉得不方便记忆，请返回上一步修改。</h4>
<form name="myform" method="post" action="?action=four">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_list">
  <tr>
    <td width="100" align="right">后台路径：</td>
    <td width="210"><%=dbStrsplit(0)%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">用户名：</td>
    <td><%=dbStrsplit(1)%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">密码：</td>
    <td><%=left(dbStrsplit(2),len(dbStrsplit(2))-3)&"***"%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td><input type="button" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" onClick="history.back(1);" value="上一步" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="submit" type="submit" class="btn05" onMouseOver="this.className='btn06'" onMouseOut="this.className='btn05'" value="确认" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
  <input name="data(0)" type="hidden" value="<%=dbStr%>"/>
</form></div>
<%End If
End Sub%>

<%
Sub Do_StepFour()
Dim dbStr,objconnDatabase,DBandTable,bakpath,http,url
dbStr=FU.checkbadstr(request("data(0)"))
If dbStr="" Then CheckErr=True:MsgStr="数据丢失！"
If CheckErr=False Then
	dbStr=split(dbStr,",")
	bakpath=dbStr(0)
	for i=0 to dom.Length-1
		if dom.GetAtt("s",Rst(i))="1" Then
			DBandTable=dom.GetNodeText(Rst(i))
		End If
	Next
	If DBandTable="" Then CheckErr=True:MsgStr="数据丢失,请从新安装！"
	
	If CheckErr=False Then
	DBandTable=split(DBandTable,",")
	Set objconnDatabase =Server.CreateObject("ADODB.Connection")
		objconnDatabase.Open "Provider=Microsoft.Jet.OLEDB.4.0;" & _
	"Data Source="&webpath&"\Database\"&DBandTable(0)&".asa"
		if objconnDatabase.Execute("Select count(*) From ZN_"&DBandTable(1)&" Where Manage_ID=1")(0)=0 Then
			objconnDatabase.Execute("INSERT INTO ZN_"&DBandTable(1)&" (Manage_UserName,Manage_Password,Manage_Adminflag_select,Manage_Name,Manage_Adddate) VALUES ('"&dbStr(1)&"','"&md5(dbStr(2),16)&"',3,'默认管理员','"&now()&"')")
		Else
			objconnDatabase.Execute("UPDATE ZN_"&DBandTable(1)&" SET Manage_UserName='"&dbStr(1)&"',Manage_Password='"&md5(dbStr(2),16)&"',Manage_Adminflag_select=3,Manage_Name='默认管理员',Manage_Adddate='"&now()&"' Where Manage_ID=1")
		End If
	objconnDatabase.close:set objconnDatabase=Nothing
	
	Dim Teststr
	Teststr=ExeFSOTEST
	If cbool(Teststr(0))<>True or cbool(Teststr(1))<>True Then
		dim errmsgs
		errmsgs="<div class='box' id='inst_err'><h1>安装过程由于您的服务器权限问题而无法进行！请阅读下面提示通过FTP进行<b>必要操作</b>后才可访问！</h1>"&_
		"1.删除以下文件<br>"&webpathb&"INC/SETUP.ASP<br>"&webpathb&"INC/loop.txt<br>"&webpathb&"INC/deletetest.txt<br>"&webpathb&"DataBase/news.xls<br>"&webpathb&"install.asp<br>"&webpathb&"step.xml。<br>"&_
		"2.将"&webpathb&"SETUP.ASP文件移到到"&webpathb&"INC下！<br>"&_
		"3.将"&webpathb&"sys_admin目录名称改为"&webpathb&""&bakpath&"."&_
		"</div>"
		Response.Write errmsgs
	Else
		if IsFile("inc/SETUP.ASP") then
			Call deletefiles("inc/SETUP.ASP")
		end if
		Call filrename("SETUP.ASP","inc/SETUP.ASP")
		Call RenameFolderOrFile("sys_admin",dbStr(0),1)
		if IsFile("SETUP.ASP") then
			Call deletefiles("SETUP.ASP")
		end if
		Call deletefiles("inc/loop.txt")
		Call deletefiles("step.xml")
		Call deletefiles("Database/news.xls")
		Call deletefiles("install.asp")
		Response.Write "<div class='box' id='inst_ok'><h1>安装已经完成！</h1><a href=""index.asp"" target=""_blank"">开始浏览网站</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="""&bakpath&"/index.asp""  target=""_blank"">登录后台</a></div>"
	End If
	End If
End If
End Sub
%>
</div>
</body>
</html>
<%
Function CreatDB(dbStr)
dbStr=split(dbStr,",")
	Dim objADOXDatabase,objTable
		
	Set objADOXDatabase =Server.CreateObject("ADOX.Catalog")
	objADOXDatabase.Create "Provider=Microsoft.Jet.OLEDB.4.0;" & _
	"Data Source="&webpath&"\Database\#"&dbStr(0)&".asa"
	'会员表
	Set objTable = CreateObject("ADOX.Table")
		objTable.Name = "ZN_"&dbStr(1)
		With objTable.Columns
			.Append "Manage_Id", 3
			.Append "Manage_UserName", 202, 255
			.Append "Manage_Password", 202, 32
			.Append "Manage_LoginTime", 7
			.Append "Manage_Loginip", 202, 255
			.Append "Manage_Adminflag_select", 2
			.Append "Manage_Name", 202, 255
			.Append "Manage_Adddate", 7
			.Append "Manage_Modifydate", 7
			.Append "Manage_ChangeIp", 202, 255
		End With
		objTable.Keys.Append "Manage_Id", 1, "Manage_Id"
		Set objTable.ParentCatalog=objADOXDatabase
		objTable.Columns("Manage_Id").Properties("Autoincrement")=True
		objTable.Columns("Manage_Adminflag_select").Properties("default")=0
		objTable.Columns("Manage_LoginTime").Properties("default")="Now()"
		objTable.Columns("Manage_Adddate").Properties("default")="Now()"
		objTable.Columns("Manage_Modifydate").Properties("default")="Now()"

		objTable.Columns("Manage_Loginip").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("Manage_Name").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("Manage_ChangeIp").Properties("Jet OLEDB:Allow Zero Length") = True
		objADOXDatabase.Tables.Append objTable
	Set objTable=Nothing
	'文章表
	Set objTable = CreateObject("ADOX.Table")
		objTable.Name = "ZN_"&dbStr(2)
		With objTable.Columns
			.Append "Article_ID", 3
			.Append "Article_ClassID", 3
			.Append "Article_Title", 202, 255
			.Append "Article_content", 203
			.Append "Article_Author", 202, 255
			.Append "Article_Order", 3
			.Append "Article_State_Radio", 2
			.Append "Article_AddDate", 7
			.Append "Article_ViewNum", 3
			.Append "Article_ViewImg", 202,255
			.Append "Article_CityID_select", 3
		End With
		objTable.Keys.Append "Article_ID", 1, "Article_ID"
		Set objTable.ParentCatalog=objADOXDatabase
		objTable.Columns("Article_ID").Properties("Autoincrement")=True
		objTable.Columns("Article_Order").Properties("default")=0
		objTable.Columns("Article_State_Radio").Properties("default")=0
		objTable.Columns("Article_ViewNum").Properties("default")=0
		objTable.Columns("Article_CityID_select").Properties("default")=0
		objTable.Columns("Article_AddDate").Properties("default")="Now()"
		
		objTable.Columns("Article_Title").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("Article_Author").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("Article_content").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("Article_ViewImg").Properties("Jet OLEDB:Allow Zero Length") = True
		objADOXDatabase.Tables.Append objTable
	Set objTable=Nothing
	'文章类表
	Set objTable = CreateObject("ADOX.Table")
		objTable.Name = "ZN_"&dbStr(2)&"_Class"
		With objTable.Columns
			.Append "ClassID", 3
			.Append "ClassName", 202,50
			.Append "ParentID", 3
			.Append "ParentStr", 202,255
			.Append "Depth", 2
			.Append "RootID", 3
			.Append "Child", 3
			.Append "orderid", 3
			.Append "readme", 202,255
			.Append "indexIMG", 202,255
			.Append "Board_Setting", 203
			.Append "Board_Ads", 203
			.Append "nextid", 3
		End With
		objTable.Keys.Append "ClassID", 1, "ClassID"
		Set objTable.ParentCatalog=objADOXDatabase
		objTable.Columns("ClassID").Properties("default")=0
		objTable.Columns("ParentID").Properties("default")=0
		objTable.Columns("RootID").Properties("default")=0
		objTable.Columns("Child").Properties("default")=0
		objTable.Columns("orderid").Properties("default")=0
		objTable.Columns("nextid").Properties("default")=0
		
		objTable.Columns("ClassName").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("ParentStr").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("readme").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("indexIMG").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("Board_Setting").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("Board_Ads").Properties("Jet OLEDB:Allow Zero Length") = True
		objADOXDatabase.Tables.Append objTable
	Set objTable=Nothing
	
	'友情链接表
	Set objTable = CreateObject("ADOX.Table")
		objTable.Name = "ZN_"&dbStr(3)
		With objTable.Columns
			.Append "FriendLink_ID", 3
			.Append "FriendLink_Title", 202,255
			.Append "FriendLink_Link", 202,255
			.Append "FriendLink_Type_radio", 3
			.Append "FriendLink_UploadFile", 202,255
			.Append "FriendLink_Order", 3
			.Append "FriendLink_BeginTime", 7
			.Append "FriendLink_EndTime", 7
			.Append "FriendLink_State_radio", 3
			.Append "FriendLink_Adddate", 7
			.Append "FriendLink_AddUserName", 202,255
			.Append "FriendLink_Externallinks", 202,255
		End With
		objTable.Keys.Append "FriendLink_ID", 1, "FriendLink_ID"
		Set objTable.ParentCatalog=objADOXDatabase
		objTable.Columns("FriendLink_ID").Properties("Autoincrement")=True
		objTable.Columns("FriendLink_Type_radio").Properties("default")=1
		objTable.Columns("FriendLink_Order").Properties("default")=0
		objTable.Columns("FriendLink_Adddate").Properties("default")="now()"
		
		objTable.Columns("FriendLink_Title").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("FriendLink_Link").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("FriendLink_UploadFile").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("FriendLink_AddUserName").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("FriendLink_BeginTime").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("FriendLink_EndTime").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("FriendLink_Externallinks").Properties("Jet OLEDB:Allow Zero Length") = True
		objADOXDatabase.Tables.Append objTable
	Set objTable=Nothing

	'网站设置表
	Set objTable = CreateObject("ADOX.Table")
		objTable.Name = "ZN_"&dbStr(4)
		With objTable.Columns
			.Append "Config_Id", 3
			.Append "Config_InstallPath", 202,50
			.Append "Config_WebUrl", 202,255
			.Append "Config_BaseConfig", 203
			.Append "Config_Hotel", 203
			.Append "Config_cachename", 202,255
		End With
		objTable.Keys.Append "Config_Id", 1, "Config_Id"
		Set objTable.ParentCatalog=objADOXDatabase
		objTable.Columns("Config_Id").Properties("Autoincrement")=True
		objADOXDatabase.Tables.Append objTable
	Set objTable=Nothing
	
	'网站防止下载表.
	Dim stm,str,rss,rs,tablename
	tablename=makePassword(8)
	Set objTable = CreateObject("ADOX.Table")
 		objTable.Name = "ZN_NotNown"&tablename
		objTable.Columns.Append "ZN_NotNown"&tablename, 205
		objADOXDatabase.Tables.Append objTable
	Set objTable=Nothing
	Set stm = server.CreateObject("adodb.stream")
		stm.Type = 1 'adTypeBinary=1 adTypeText=2
		stm.Mode = 3
		stm.Open
		stm.loadfromfile server.MapPath("inc/loop.txt")
		str = stm.read
		stm.Close
	Set stm = Nothing
	set rss=server.createobject("Adodb.Connection")
	rss.Open objADOXDatabase.ActiveConnection
	set rs=server.createobject("ADODB.recordset")
	rs.open "SELECT * FROM ZN_NotNown"&tablename,rss,3,3
	rs.addnew
	rs("ZN_NotNown"&tablename).AppendChunk str
	rs.update
	rs.close
	set rs=nothing
	set rss=nothing
	
	'广告表
	Set objTable = CreateObject("ADOX.Table")
		objTable.Name = "ZN_"&dbStr(5)
		With objTable.Columns
			.Append "AD_ID", 3
			.Append "AD_Title", 202,255
			.Append "AD_Link", 202,255
			.Append "AD_SizeWidth", 3
			.Append "AD_SizeHeight", 3
			.Append "AD_Type_radio", 3
			.Append "AD_UploadFile", 202,255
			.Append "AD_Order", 3
			.Append "AD_BeginTime", 7
			.Append "AD_EndTime", 7
			.Append "AD_State_radio", 3
			.Append "AD_Adddate", 7
			.Append "AD_AddUserName", 202,255
			.Append "AD_Externallinks", 203
			.Append "AD_Area", 202,255
		End With
		objTable.Keys.Append "AD_ID", 1, "AD_ID"
		Set objTable.ParentCatalog=objADOXDatabase
		objTable.Columns("AD_ID").Properties("Autoincrement")=True
		objTable.Columns("AD_Type_radio").Properties("default")=1
		objTable.Columns("AD_Order").Properties("default")=0
		objTable.Columns("AD_SizeWidth").Properties("default")=0
		objTable.Columns("AD_SizeHeight").Properties("default")=0
		objTable.Columns("AD_Adddate").Properties("default")="now()"
		
		objTable.Columns("AD_Title").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("AD_Link").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("AD_UploadFile").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("AD_AddUserName").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("AD_BeginTime").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("AD_EndTime").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("AD_Externallinks").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("AD_Area").Properties("Jet OLEDB:Allow Zero Length") = True
		objADOXDatabase.Tables.Append objTable
	Set objTable=Nothing
	
	'Flash广告表
	Set objTable = CreateObject("ADOX.Table")
		objTable.Name = "ZN_"&dbStr(5)&"_Flash"
		With objTable.Columns
			.Append "ADFlash_ID", 3
			.Append "ADFlash_Title", 202,255
			.Append "ADFlash_Link", 202,255
			.Append "ADFlash_UploadFile", 202,255
			.Append "ADFlash_Order", 3
			.Append "ADFlash_AddDate", 7
		End With
		objTable.Keys.Append "ADFlash_ID", 1, "ADFlash_ID"
		Set objTable.ParentCatalog=objADOXDatabase
		objTable.Columns("ADFlash_ID").Properties("Autoincrement")=True
		objTable.Columns("ADFlash_Order").Properties("default")=0
		objTable.Columns("ADFlash_AddDate").Properties("default")="now()"
		
		objTable.Columns("ADFlash_Title").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("ADFlash_Link").Properties("Jet OLEDB:Allow Zero Length") = True
		objTable.Columns("ADFlash_UploadFile").Properties("Jet OLEDB:Allow Zero Length") = True
		objADOXDatabase.Tables.Append objTable
	Set objTable=Nothing
	
	Dim DBandTable,Teststr
	for i=0 to dom.Length-1
		if dom.GetAtt("s",Rst(i))="1" Then
			If dom.GetAtt("v",Rst(i))="1" Then
				DBandTable=dom.GetNodeText(Rst(i))
				If IsFile(""&webpathB&"Database\"&split(DBandTable,",")(0)&".asa") Then
				Teststr=ExeFSOTEST
				If cbool(Teststr(0))=True or cbool(Teststr(1))=True Then
					deletefiles(""&webpathB&"Database\"&split(DBandTable,",")(0)&".asa")
				End if
				End If
				Rst(i).text=""
			End If
			dom.AddText "#"&dbStr(0)&","&dbStr(1)&","&dbStr(2)&","&dbStr(3)&","&dbStr(4)&","&dbStr(5),true,Rst(i)
			dom.AddAttribute "v","1",Rst(i)
		End If
	Next
	dom.SaveXML()
	Set objADOXDatabase=Nothing
End Function

'=================================
'生成随机字符串函数
function makePassword(byVal maxLen)
Dim strNewPass
Dim whatsNext, upper, lower, intCounter
Randomize
For intCounter = 1 To maxLen
whatsNext = Int(2*Rnd)
If whatsNext = 0 Then
upper = 90
lower = 65
Else
upper = 57
lower = 48
End If
strNewPass = strNewPass & Chr(Int((upper - lower + 1) * Rnd + lower))
Next
makePassword = strNewPass
end function

Class Validator
Private Re

Private Sub Class_Initialize()
	Set Re = New RegExp
	Re.IgnoreCase = True
	Re.Global = True
End Sub

Private Sub Class_Terminate()
	Set Re = Nothing
End Sub

Public Function Islaw(ByVal Str)
Islaw = Test("^[a-zA-Z0-9_-]{4,20}$", Str)
End Function

Public Function Islaws(ByVal Str)
Islaws = Test("^[a-zA-Z0-9_-]{0,20}$", Str)
End Function

Public Function IsUrl(ByVal Str)
IsUrl = Test("^[a-zA-z]+://[^\s]*$", Str)
End Function

Public Function IsNum(ByVal Str)
IsNum= Test("^\d+$", Str)
End Function

Public Function IsChinese(ByVal Str)
IsChinese = Test("^[^u4e00-u9fa5]+$", Str)
End Function

Public Function IsEnglish(ByVal Str)
IsEnglish = Test("^[A-Za-z]+$", Str)
End Function

Private Function Test(ByVal Pattern, ByVal Str)
	If IsNull(Str) Or IsEmpty(Str) Then
		Test = False
	Else
		Re.Pattern = Pattern
		Test = Re.Test(CStr(Str))
	End If
End Function

End Class


Class XMLClass 
Private objXml 
Private xmlDoc 
Private xmlPath 
'//============================================================ 
' 
Sub Class_initialize 
	Set objXml = Server.CreateObject("MSXML2.DOMDocument") 
	objXml.preserveWhiteSpace = true 
	objXml.async = false 
End Sub 

Sub Class_Terminate 
	Set objXml = Nothing 
End Sub 
'//============================================================ 
' 
Public Function CreateNew(sName) 
Dim tmpNode
	Set tmpNode = objXml.createElement(sName) 
	objXml.appendChild(tmpNode) 
	Set CreateNew = tmpNode 
End Function 
' 
Public Function OpenXml(sPath) 
	OpenXml=False 
	sPath=Server.MapPath(sPath) 
	'Response.Write(sPath) 
	xmlPath = sPath 
		If objXml.load(sPath) Then 
			Set xmlDoc = objXml.documentElement 
			OpenXml=True 
		End If 
End Function 
' 
Public Sub LoadXml(sStr) 
	objXml.loadXML(sStr) 
	Set xmlDoc = objXml.documentElement 
End Sub 

Public Sub InceptXml(xObj) 
	Set objXml = xObj 
	Set xmlDoc = xObj.documentElement 
End Sub 
'//============================================================ 
' 
Public Function AddNode(sNode,rNode) 
' sNode STRING 节点名称 
' rNode OBJECT 增加节点的上级节点引用 
'============================================================= 
	Dim TmpNode 
	Set TmpNode = objXml.createElement(sNode) 
	rNode.appendChild TmpNode 
	Set AddNode = TmpNode 
End Function 
' 
Public Function AddAttribute(sName,sValue,oNode) 
' sName STRING 属性名称 
' sValue STRING 属性值 
' oNode OBJECT 增加属性的对象 
'============================================================= 
	oNode.setAttribute sName,sValue 
End Function 
' 
Public Function AddText(FStr,cdBool,oNode) 
	Dim tmpText 
	If cdBool Then 
		Set tmpText = objXml.createCDataSection(FStr) 
	Else 
		Set tmpText = objXml.createTextNode(FStr) 
	End If 
	oNode.appendChild tmpText 
End Function 
'======================================================================================================== 
' 
Public Function GetAtt(aName,oNode) 
' aName STRING 属性名称 
' oNode OBJECT 节点引用 
'============================================================= 
	dim tmpValue 
	tmpValue = oNode.getAttribute(aName) 
	GetAtt = tmpValue 
End Function 
' 
Public Function GetNodeName(oNode) 
' oNode OBJECT 节点引用 
	GetNodeName = oNode.nodeName 
End Function 
' 
Public Function GetNodeText(oNode) 
' oNode OBJECT 节点引用 
	GetNodeText = oNode.childNodes(0).nodeValue 
End Function 
' 
Public Function GetNodeType(oNode) 
' oNode OBJECT 节点引用 
	GetNodeType = oNode.nodeValue 
End Function 
' 
Public Function FindNodes(sNode) 
	Dim tmpNodes 
	Set tmpNodes = objXml.getElementsByTagName(sNode) 
	Set FindNodes = tmpNodes 
End Function 
' 
Public Function FindNode(sNode) 
	Dim TmpNode 
	Set TmpNode=objXml.selectSingleNode(sNode) 
	Set FindNode = TmpNode 
End Function 
' 
Public Function DelNode(sNode) 
	Dim TmpNodes,Nodesss 
	Set TmpNodes=objXml.selectSingleNode(sNode) 
	Set Nodesss=TmpNodes.parentNode 
	Nodesss.removeChild(TmpNodes) 
End Function 
' 
Public Function ReplaceNode(sNode,sText,cdBool) 
'replaceChild 
	Dim TmpNodes,tmpText 
	Set TmpNodes=objXml.selectSingleNode(sNode) 
	'AddText sText,cdBool,TmpNodes 
	If cdBool Then 
		Set tmpText = objXml.createCDataSection(sText) 
	Else 
		Set tmpText = objXml.createTextNode(sText) 
	End If 
	TmpNodes.replaceChild tmpText,TmpNodes.firstChild 
End Function 

Private Function ProcessingInstruction 
'//--创建XML声明 
	Dim objPi 
	Set objPi = objXML.createProcessingInstruction("xml", "version="&chr(34)&"1.0"&chr(34)&" encoding="&chr(34)&"gb2312"&chr(34)) 
'//--把xml生命追加到xml文档 
	objXML.insertBefore objPi, objXML.childNodes(0) 
End Function 
'//============================================================================= 
' 
Public Function SaveXML() 
'ProcessingInstruction() 
	objXml.save(xmlPath) 
End Function 
' 
Public Function SaveAsXML(sPath) 
	ProcessingInstruction() 
	objXml.save(sPath) 
End Function 
'//================================================================================== 
'相关统计 
' 
Property Get Root 
	Set Root = xmlDoc 
End Property 
' 
Property Get Length 
	Length = xmlDoc.childNodes.length 
End Property 
'//================================================================================== 
'相关测试 
Property Get TestNode 
	TestNode = xmlDoc.childNodes(0).text 
End Property 

End Class

Function ExeFSOTEST()
	On Error Resume Next
	Dim DBandTable,Rst
	Dim tfile,TestObj,Fdate(2),i
	Fdate(0)=True
	Fdate(1)=True
	set Rst=dom.FindNodes("step")
	for i=0 to dom.Length-1
		if dom.GetAtt("s",Rst(i))="3" Then
			If Rst(i).text="" Then
				Set TestObj = Server.CreateObject("Scripting.FileSystemObject")
				if TestObj.FileExists(server.MapPath("test.txt")) then TestObj.DeleteFile(server.MapPath("test.txt"))
				set tfile=TestObj.CreateTextFile(server.MapPath("test.txt"),true,true)
				tfile.WriteLine("测试")
				tfile.close
				set tfile=nothing
					err=0
				if TestObj.FileExists(server.mappath("inc/deletetest.txt")) Then
					TestObj.DeleteFile(server.MapPath("inc/deletetest.txt"))
					if err<>0 then Fdate(0)=False:err=0
				end if
				TestObj.DeleteFile(server.MapPath("test.txt"))
				if err<>0 then Fdate(1)=False:err=0
				dom.AddText cstr(Fdate(0))&"|"&cstr(Fdate(1)),False,Rst(i)
				Set TestObj=Nothing
			Else
				DBandTable=split(dom.GetNodeText(Rst(i)),"|")
				Fdate(0)=DBandTable(0)
				Fdate(1)=DBandTable(1)
			End If
		End If
	Next
	dom.SaveXML()
	ExeFSOTEST=Fdate
End Function
'测试组件支持情况
Function ObjectTest(strObj)
	On Error Resume Next
	Dim TestObj,Teststr
	ObjectTest = "<font color=red>不支持</font>"
	Err = 0
	Set TestObj = Server.CreateObject(strObj)
	If lcase(strObj)=lcase("Scripting.FileSystemObject") Then
		Teststr=ExeFSOTEST
		Err=0
		If cbool(Teststr(0))<>True or cbool(Teststr(1))<>True Then
			Err=1
		End if
	End If
	If 0 = Err Then
		ObjectTest = "<font color=green>支持</font>"
	Else
		checkobjs=true
	End If
	Set TestObj=Nothing
	If Err.Number <> 0 Then Err.Clear
End Function

'验证是否为联盟会员
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

'获取城市对于的id号
Function getcityid(agent_id,agent_md,cityname)
	dim apiUrl,xml,root,objNodes
	apiUrl="http://un.zhuna.cn/api/gbk/cityname.asp?u="&agent_id&"&m="&agent_md&"&city="&ec(cityname)&""
	set xml=GetXml(apiUrl,"")
	if xml.xml<>"" then
		set root=xml.documentElement
		Set objNodes = root.selectSingleNode("city[@name='"&cityname&"']")
		if objNodes is nothing then
		getcityid=0
		else
		getcityid =objNodes.getAttribute("ID")
		end if
	else
		getcityid=0
	end if
	set xml=nothing
End Function

'生成城市列表
Function CreatcityList()
	dim apiUrl,xml,root,creathlisturl,objNodes,strs,i
	apiUrl="http://un.zhuna.cn/api/gbk/city.asp?u=&m="
	set xml=GetXml(apiUrl,"")
	if xml.xml<>"" then
		set root=xml.documentElement
		Set objNodes = root.childNodes
		If objNodes.Length>0 Then
			strs="<select name=""data(5)"">"&vbCrlf
			For i=0 to objNodes.Length-1
				strs=strs&"<option  value='"&objNodes.item(i).getAttribute("ID")&"|"&objNodes.item(i).getAttribute("name")&"'>"&objNodes.item(i).getAttribute("suoxie")&chr(13)&objNodes.item(i).getAttribute("name")&"</option>"&vbCrlf
			Next
			strs=strs&"</select>"
		End If
		CreatcityList=strs
	else
		CreatcityList=""
	end if
	set xml=nothing
End Function
%>