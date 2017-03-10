<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Option explicit
dim startime,installpath,weburl,BaseConfig,hotel,cachename,oiscache
dim domain,agent_id,agent_md,doname,webkeyword,uncityid,uncityname,webpath,flietime,doserver,beianinfo,tagcityid,relist,rehotel,D,Badwords,Class_str,DB,FU
Response.CodePage=936
Response.Charset="gb2312"
Response.ContentType="text/html"
const Copyright="v7.0[asp]"
startime = Timer()
%>
<!--#INCLUDE FILE="SETUP.ASP"-->
<%
set DB=new DB_Connection
set FU=new Main_Function

If SetConfig Then ReWriteCache:SetConfig

agent_id	= hotel(0)					
agent_md	= hotel(1)
doname		= baseconfig(0)		
webkeyword	= baseconfig(1) 
uncityid	= hotel(3)
uncityname	= hotel(2)
webpath		= installpath
beianinfo	= baseconfig(2) 	
flietime	= hotel(6)					
doserver	= hotel(9)
tagcityid	= hotel(4)
relist		= hotel(10)
rehotel		= hotel(11)
Badwords	= baseconfig(5)
oiscache	= hotel(13)	'是否缓存酒店信息

domain		= Request.ServerVariables ("SERVER_NAME")&webpath '网站频道所在目录（此处不需要修改）
const mshttp= "MSXML2.ServerXMLHTTP" 'Microsoft.XMLHTTP or MSXML2.ServerXMLHTTP（此处不需要修改）
const odebug=false	'是否打开调试
const updateserver="http://demo.be88.cn/Update/"

Sub ReWriteCache
	Dim AP,Rs,Rss,Str
	Set Rs=DB.Execute("SELECT * FROM ZN_"&D("Config"))
	If Rs.Eof Or Rs.Bof Then
		response.Write "网站配置文件丢失，请从新安装目录，或者联系联盟管理员"
		response.End()
	Else
		Set AP=new ApplicationClass
			AP.RemoveAll
			AP.Add Rs("Config_cachename")&"installpath",Rs("Config_installpath"),365
			AP.Add Rs("Config_cachename")&"weburl",Rs("Config_weburl"),365
			AP.Add Rs("Config_cachename")&"BaseConfig",Rs("Config_BaseConfig"),365
			AP.Add Rs("Config_cachename")&"hotel",Rs("Config_hotel"),365
				Set Rss=DB.Execute("select ClassId,ClassName from ZN_"&D("Article")&"_Class where Depth<2 order by rootid,orderid")
					If Not Rss.Eof And Not Rss.Bof Then
						While Not Rss.Eof And Not Rss.Bof
							str=str&Rss(0)&"|"&Rss(1)&","
							Rss.Movenext
						wend
						str=left(str,len(str)-1)
					Else
						str="0"
					End If
				Rss.Close:Set Rss=Nothing
			AP.Add Rs("Config_cachename")&"Class_str",str,365
		Set AP=Nothing
	End If
	Rs.Close:Set Rs=Nothing
End Sub

Function SetConfig()
	Dim AP
	Set AP=new ApplicationClass
	cachename   = D("Cachename")
	installpath = AP.Values (cachename&"installpath")
	weburl		= AP.Values (cachename&"weburl")
	BaseConfig  = AP.Values (cachename&"BaseConfig")
	hotel	 	= AP.Values (cachename&"hotel")
	Class_str	= AP.Values (cachename&"Class_str")
	Set AP=Nothing
	If installpath="" Or weburl="" Or  BaseConfig="" Or  hotel="" Or  cachename="" Or Class_str="" Then
		SetConfig=True
	Else
		BaseConfig=Split(BaseConfig,"-_-")
		hotel=Split(hotel,"-_-")
		SetConfig=False
	End IF
End Function
spiderbot
function spiderbot()
	dim agent: agent = lcase(request.servervariables("http_user_agent"))

	dim Bot: Bot = ""
	if instr(agent, "googlebot") > 0 then Bot = "Google"
	if instr(agent, "mediapartners-google") > 0 then Bot = "Google Adsense"
	if instr(agent, "baiduspider") > 0 then Bot = "Baidu"
	if instr(agent, "sogou spider") > 0 then Bot = "Sogou"
	if instr(agent, "yahoo") > 0 then Bot = "Yahoo!"
	if instr(agent, "msn") > 0 then Bot = "MSN"
	if instr(agent, "ia_archiver") > 0 then Bot = "Alexa"
	if instr(agent, "iaarchiver") > 0 then Bot = "Alexa"
	if instr(agent, "sohu") > 0 then Bot = "Sohu"
	if instr(agent, "sqworm") > 0 then Bot = "AOL"
	if instr(agent, "yodaobot") > 0 then Bot = "Yodao"
	if instr(agent, "iaskspider") > 0 then Bot = "Iask"
	if len(Bot) > 0 then

	end if
end function
%>