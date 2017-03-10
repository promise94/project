<%If baseconfig(3) Then Response.Write(baseconfig(4)):Response.End()
'===该类主要是获得某个城市的名称===
'cityid 调用城市ID 具体对应城市请参考 http://un.zhuna.cn/api/utf-8/city.asp?u=6&m=a0b923820dcc509a
'XML保存位置:DataBase/XML/city/_getCityname_"&cityid&".xml
Function getcityname(cityid)
	dim apiUrl,http,backXml,xml,root,iscreat,creathlisturl
	apiUrl=doserver&"cityname.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&""
	apiUrl=apiUrl&"&domain="&domain&"&Copyright="&Copyright&"&doname="&server.URLEncode(doname)&""
	creathlisturl=webpath&"DataBase/XML/city/"&replace(webpath,"/","")&"_getCityname_"&cityid&".xml"

	set xml=GetXml(apiUrl,creathlisturl)
	if xml.xml<>"" then
		set root=xml.documentElement
		getcityname =root.firstChild.getAttribute("name")
	else
		getcityname=""
	end if
	set xml=nothing
End Function


'===该类主要是获得某个城市的商业区名称===
'cityid 调用城市ID
'shangyequid 商业区ID
'具体对应城市请参考 http://un.zhuna.cn/api/gbk/shangyequ.asp?cityid=321&u=6&m=ed314f60ea53fb5e&shangyequid=686
'xml保存路径:DataBase/XML/shangyequ/"&replace(webpath,"/","")&"_getshangyequ_"&cityid&"_"&syqid&".xml"
Function getsyqname(cityid,syqid)
	dim apiUrl,http,backXml,xml,root,creathlisturl
	apiUrl=doserver&"shangyequ.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&shangyequid="&syqid&""
	creathlisturl=webpath&"DataBase/XML/shangyequ/"&replace(webpath,"/","")&"_getshangyequ_"&cityid&"_"&syqid&".xml"

	set xml=GetXml(apiUrl,creathlisturl)
	if xml.xml<>"" then
		set root=xml.documentElement
		getsyqname =root.firstChild.getAttribute("name")
	else
		getsyqname = ""
	end if
	set xml=nothing
End Function

'===该类主要是获得某个城市的连锁品牌===
'cityid 调用城市ID 具体对应城市请参考 http://un.zhuna.cn/api/utf-8/city.asp?u=6&m=a0b923820dcc509a  
'cnum  品牌调用数量
'调用某个城市连锁品牌 cityid=城市ID 全国cityid=0
'xml 保存路径:DataBase/XML/shangyequ/"&replace(webpath,"/","")&"_getshangyequ_"&cityid&".xml"
Function getexpocity(cnum)
	dim apiUrl,http,backXml,xml,rst,i,excnum,expocityid,expocityname,creathlisturl
	apiUrl=doserver&"expo_city.asp?u="&agent_id&"&m="&agent_md&"&cnum="&cnum&""
	creathlisturl=webpath&"DataBase/XML/expo/"&replace(webpath,"/","")&"_getexpocity_"&cityid&".xml"
	
	set xml=GetXml(apiUrl,creathlisturl)
	if xml.xml<>"" then
		Set Rst=xml.documentElement.childNodes
			excnum=Rst.Length-1
			if excnum>=cnum then excnum=(cnum-1)
			For i=0 To excnum
				with Rst(i)
					expocityid=.getAttribute("cityid")
					expocityname=.getAttribute("cityname")
				end with
				If hotel(7) Then
					getexpocity=getexpocity&"<a href='expocity-"&expocityid&"-1.html'>"
				Else
					getexpocity=getexpocity&"<a href='expo.asp?cityid="&expocityid&"'>"
				End If
				getexpocity=getexpocity&""&expocityname&"</a>"
			Next
	else
		getexpocity=""
	end if
	set xml=nothing
End Function

'===该类主要是获得某个城市的连锁品牌===
'cityid 调用城市ID 具体对应城市请参考 http://un.zhuna.cn/api/utf-8/city.asp?u=6&m=a0b923820dcc509a  
'cnum  品牌调用数量
'调用某个城市连锁品牌 cityid=城市ID 全国cityid=0
'shtml保存路径:webpath&"DataBase/html/"&replace(webpath,"/","")&"_getchain_"&cityid&"_"&cnum&".shtml"
Function getchain(cityid,cnum)
	dim creathlisturl,ls_id,ls_name,ls_picurl,ls_num,lsurl,apiUrl,http,backXml,xml,rst,i,lsnum,iscreat
	creathlisturl=webpath&"DataBase/html/"&replace(webpath,"/","")&"_getchain_"&cityid&"_"&cnum&".shtml"
	iscreat=IsFileDATE(creathlisturl)
	if iscreat(0)<>True or iscreat(1)<>True then
		apiUrl=doserver&"chain.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&""
		apiUrl=apiUrl&"&domain="&domain&"&Copyright="&Copyright&"&doname="&server.URLEncode(doname)&""
			set backXml=GetBackXml(apiUrl)
			set xml=ExXML(backXml,"")
			set backXml=nothing
			if xml.xml<>"" then
						Set Rst=xml.documentElement.childNodes
						lsnum=Rst.Length-1
						if lsnum>=cnum then lsnum=(cnum-1)
						For i=0 To lsnum
							with Rst(i)
							ls_id=.getAttribute("id")
							ls_name=.getAttribute("name")
							ls_picurl=.getAttribute("picurl")
							ls_num=.getAttribute("num")
							end with
						If hotel(7) Then
							lsurl=""&webpath&"liansuo-"&ls_id&".html"
							if cityid>=1 then lsurl=""&webpath&""&relist&"-"&cityid&"-0-"&server.URLEncode(ls_name)&"--0-1.html"
						Else
							lsurl=""&webpath&"liansuo.asp?lsid="&ls_id&""
							if cityid>=1 then lsurl=""&webpath&"hotellist.asp?cityid="&cityid&"&lsid="&ls_id&""
						End If
						getchain=getchain&"<li><a href='"&lsurl&"' title='浏览"&ls_name&"分布城市'>"
						getchain=getchain&"<img src='"&ls_picurl&"' width='50' height='40' />"&ls_name&"</a></li>"
						Next
		call CreatFile(creathlisturl,getchain)
		else
		getchain=""
		end if
		set xml=nothing
	else
		getchain=ReadFile(creathlisturl)
	end if
End Function

'===该类主要是获得城市列表===
'cnum 调用城市数目 
'img 	可以设置前置图片或其他符号,不适用默认为空
'xmode 显示模式 xmode=0 只显示城市 xmode=1 显示城市+酒店预订
'paixu 城市列表排序 （1=城市ID由小到大 2=城市ID由大到小 3=酒店签约数量 4=城市名称排序）
'shtml保存路径:webpath&"DataBase/html/"&replace(webpath,"/","")&"_getcitylist_"&paixu&"_"&cnum&"_"&xmode&".shtml"
Function getcitylist(cnum,paixu,img,xmode)
	dim creathlisturl,apiUrl,http,backXml,xml,x_cityID,x_cityname,x_suoxie,rst,lsnum,i,iscreat
	creathlisturl=webpath&"DataBase/html/"&replace(webpath,"/","")&"_getcitylist_"&paixu&"_"&cnum&"_"&xmode&".shtml"
	iscreat=IsFileDATE(creathlisturl)
	if iscreat(0)<>True or iscreat(1)<>True then
		apiUrl=doserver&"city.asp?u="&agent_id&"&m="&agent_md&"&px="&paixu&""
			set backXml=GetBackXml(apiUrl)
			set xml=ExXML(backXml,"")
			set backXml=nothing
			if xml.xml<>"" then
				  Set Rst=xml.documentElement.childNodes
				  lsnum=Rst.Length-1
				  if lsnum>=cnum then lsnum=cnum
				  For i=0 To lsnum
					  with Rst(i)
					  x_cityID=.getAttribute("ID")
					  x_cityname=.getAttribute("name")
					  x_suoxie=.getAttribute("suoxie")
					  end with
				  getcitylist=getcitylist&"<li title='"&x_cityname&"酒店预订'>"
				  If hotel(7) Then
				 	 getcitylist=getcitylist&"<a href='"&webpath&"index/"&x_cityID&".html'>"
				  Else
				 	 getcitylist=getcitylist&"<a href='"&webpath&"city/?cityid="&x_cityID&"'>"
				  End If
				  if xmode=0 then getcitylist=getcitylist&""&img&""&left(x_cityname,2)&""
				  if xmode=1 then getcitylist=getcitylist&""&img&""&left(x_suoxie,1)&""&left(x_cityname,4)&"酒店预订"
				  if xmode=2 then getcitylist=getcitylist&""&img&""&left(x_cityname,4)&"酒店预订"
				  getcitylist=getcitylist&"</a></li>"
				  Next
			call CreatFile(creathlisturl,getcitylist)
			else
				getcitylist=""
			End if
		Set Xml=Nothing
	else
		getcitylist=ReadFile(creathlisturl)
	end if
End Function

'===该类主要是获得城市商业区列表===
'cnum 调用商业区数目 
'cityid 城市ID
Function getcbdlist(cityid,cnum)
	dim creathlisturl,lsnum,http,backXml,xml,Rst,i,x_shangyequID,x_shangyequ,x_Hotelnum,iscreat,apiUrl
	creathlisturl=webpath&"DataBase/html/"&replace(webpath,"/","")&"_getcbdlist_"&cityid&"_"&cnum&".shtml"
	iscreat=IsFileDATE(creathlisturl)
	if iscreat(0)<>True or iscreat(1)<>True then
		apiUrl=doserver&"shangyequ.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&cnum="&cnum&""
			set backXml=GetBackXml(apiUrl)
			set xml=ExXML(backXml,"")
			set backXml=nothing
			if xml.xml<>"" then
				  Set Rst=xml.documentElement.childNodes
				  lsnum=Rst.Length-1
				  if lsnum>=cnum then lsnum=cnum
				  For i=0 To lsnum
					  with Rst(i)
					  x_shangyequID=.getAttribute("id")
					  x_shangyequ=.getAttribute("name")
					  x_Hotelnum=.getAttribute("HotelNum")
					  end with
				  If hotel(7) Then
				 	 getcbdlist=getcbdlist&"<li title='"&x_shangyequ&"酒店预订(共"&x_Hotelnum&"家)'><span>共"&x_Hotelnum&"家</span><a href='"&webpath&""&relist&"-c"&cityID&"-x0---a0-e1.html?bid="&x_shangyequID&"'>"&left(x_shangyequ,15)&"</a></li>"
				  Else
				 	 getcbdlist=getcbdlist&"<li title='"&x_shangyequ&"酒店预订'><span>共"&x_Hotelnum&"家</span><a href='"&webpath&"hotellist.asp?cityid="&cityID&"&bid="&x_shangyequID&"' title='共"&x_Hotelnum&"家'>"&left(x_shangyequ,14)&"</a></li>"
				  End If
				 
			Next
			call CreatFile(creathlisturl,getcbdlist)
			else
				getcbdlist=""
			End if
		Set Xml=Nothing
	else
		getcbdlist=ReadFile(creathlisturl)
	end if
End Function

'===该类主要是获得城市酒店列表===
'img 	可以设置前置图片或其他符号,不适用默认为空
'hnum 	调用的酒店数量
'cityid 调用城市ID 具体对应城市请参考 http://un.zhuna.cn/api/utf-8/city.asp?u=6&m=a0b923820dcc509a
'hid 	酒店的ID，在查询某个酒店附近其他酒店时候需要,其他情况下默认为0
'		为了不影响原有gethotellist函数，提高函数的易用性，我们将对hid参数尽快功能扩充，增加了会展附近酒店、关键词、星级酒店，商业区
'minprice maxprice 酒店的价格的最大和最小值,不需要的时候请默认为空
'paixu 	城市列表排序 （1=网站默认 2=价格由低到高 3=星级由低到高 4=客户评价由高到低）
'tlen 	显示酒店名称的长度
'xmode 	显示模式 xmode=1 图片模式 xmode=2 显示最低价格 xmode=3 显示附近距离 xmode=4 在2的模式下带商业区(一般配合hid使用)
'shtml保存路径 :webpath&"DataBase/html/"&replace(webpath,"/","")&"_"&hnum&"_"&cityid&"_"&hid&"_"minprice&maxprice&"_"&paixu&"_"&xmode&".shtml"
Function gethotellist(img,hnum,cityid,hid,minprice,maxprice,paixu,tlen,xmode)
	dim creathlisturl,sapiurl,totalput,page,hnum1,i,id,mjiage,Picture,juli,apiurl,iscreat
	dim http,backXml,xml,root,rst,hotelname,xingji,jcityid,g_shangyequ,g_shangyequid
	creathlisturl=webpath&"DataBase/html/"&replace(webpath,"/","")&"HotelList_"&hnum&"_"&cityid&"_"&hid&"_"
	creathlisturl=creathlisturl&minprice&maxprice&"_"&paixu&"_"&xmode&".shtml"
	iscreat=IsFileDATE(creathlisturl)
	if iscreat(0)<>True or iscreat(1)<>True then
	if minprice<>"" then sapiurl=sapiurl&"&minprice="&minprice&""
	if maxprice<>"" then sapiurl=sapiurl&"&maxprice="&maxprice&""
	'hid扩充
	if instr(hid&"","key_")>=1 then sapiurl=sapiurl&"&key="&replace(hid&"","key_","")&""
	if instr(hid&"","cbd_")>=1 then sapiurl=sapiurl&"&bid="&replace(hid&"","cbd_","")&""
	if instr(hid&"","rank_")>=1 then sapiurl=sapiurl&"&rank="&replace(hid&"","rank_","")&""
	if instr(hid&"","liansuo_")>=1 then sapiurl=sapiurl&"&lsid="&replace(hid&"","liansuo_","")&""
	if instr(hid&"","huiyi_")>=1 then hid=replace(hid&"","huiyi_","")*-1
	if instr(hid&"","_")>=1 then hid=0
	apiUrl=doserver&"search.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&px="&paixu&"&hid="&hid&sapiurl&""
	'response.Write apiUrl
			set backXml=GetBackXml(apiUrl)
			set xml=ExXML(backXml,"")
			set backXml=nothing
			if xml.xml<>"" then
						'list 根结点	list.hotel
						set root=xml.documentElement
						totalput=root.getAttribute("totalput")
						page=root.getAttribute("PageIdx")
						Set Rst=xml.documentElement.childNodes
						hnum=hnum-1
						hnum1=Rst.Length-1
						if hnum1>=hnum then hnum1=hnum
						For i=0 To hnum1
							with Rst(i) '结点<hotel ID="3921" Name="北京如家快捷酒店（六里桥店）" xingji="0"> 
								ID=.getAttribute("ID")
								HotelName =.getAttribute("Name")
								xingji	  =.getAttribute("xingji")
								mjiage    =.getAttribute("mjiage")
								Picture	  =.getElementsByTagName("Picture").item(0).getAttribute("v")
								juli	  =.getElementsByTagName("JuLi").item(0).getAttribute("v")
								jcityid	  =.getElementsByTagName("cityinfo ").item(0).getAttribute("cityid")
								g_shangyequ	  =.getElementsByTagName("shangyequ").item(0).getAttribute("v")
								g_shangyequid	  =.getElementsByTagName("shangyequid").item(0).getAttribute("v")
							end with
							gethotellist=gethotellist&"<li>"
							if xmode=2 or xmode=4 then gethotellist=gethotellist&"<span>"&mjiage&"元</span>"
							if xmode=3 then gethotellist=gethotellist&"<span>"&juli&"公里</span>"
							If hotel(7) Then
								gethotellist=gethotellist&"<a href='"&webpath&""&rehotel&"-"&cityid&"-"&id&".html' title='"&hotelname&"&#10;最低价格："&mjiage&"元起订 &#10;商圈："&g_shangyequ&"'>"
							Else
								gethotellist=gethotellist&"<a href='"&webpath&"hotelinfo.asp?cityid="&jcityid&"&hotelid="&id&"' title='"&hotelname&"&#10;最低价格："&mjiage&"元起订 &#10;商圈："&g_shangyequ&"'>"
							End If
							if xmode=1 then gethotellist=gethotellist&"<img src='"&Picture&"' width='119' height='89'/>"
							gethotellist=gethotellist&img&left(hotelname,tlen)
							If hotel(7) Then
								if xmode=4 and g_shangyequ<>"" then gethotellist=gethotellist&"&nbsp;(<a href='"&webpath&""&relist&"-c"&cityID&"-x0---a0-e1.html?bid="&g_shangyequid&"' title='"&g_shangyequ&"'>"&left(g_shangyequ,8)&"</a>)"
							Else
								if xmode=4 and g_shangyequ<>"" then gethotellist=gethotellist&"&nbsp;(<a href='"&webpath&"hotellist.asp?cityid="&cityid&"&bid="&g_shangyequid&"' title='"&g_shangyequ&"'>"&left(g_shangyequ,8)&"</a>)"
							End If
							gethotellist=gethotellist&"</a></li>"
						Next
				call CreatFile(creathlisturl,gethotellist)
			else
				gethotellist=""
			End if
		Set Xml=Nothing
	else
		gethotellist=ReadFile(creathlisturl)
	end if
End Function

'=====详细页面中附近酒店图文调用=====
'hnum 调用条数 最多调用10条
'Cityid 城市ID
'hid 酒店ID（查询该酒店附近的酒店 hid=0时得到的是整个城市的酒店）
'paixu 只有当hid=0时才起作用 排序 （1=网站默认 2=价格由低到高 3=星级由低到高 4=客户评价由高到低）
'shtml 路径:webpath&"DataBase/html/"&replace(webpath,"/","")&"_hotelpiclist_"&hnum&"_"&cityid&"_"&hid&"_"&paixu&".shtml"
Function hotelpiclist(hnum,Cityid,hid,paixu)
dim creathlisturl,iscreat,apiUrl,backXml,root,xml,totalput,page,Rst,hnum1,i,ID,HotelName,xingji,mjiage,Picture,juli,jcityid,Address

	creathlisturl=webpath&"DataBase/html/"&replace(webpath,"/","")&"_hotelpiclist_"&hnum&"_"&cityid&"_"&hid&"_"&paixu&".shtml"
	iscreat=IsFileDATE(creathlisturl)
	if iscreat(0)<>True or iscreat(1)<>True then
	apiUrl=doserver&"search.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&px="&paixu&"&hid="&hid&""
			set backXml=GetBackXml(apiUrl)
			set xml=ExXML(backXml,"")
			set backXml=nothing
			if xml.xml<>"" then
					'list 根结点	list.hotel
					set root=xml.documentElement
					totalput=root.getAttribute("totalput")
					page=root.getAttribute("PageIdx")
					Set Rst=xml.documentElement.childNodes
					hnum=hnum-1
					hnum1=Rst.Length-1
					if hnum1>=hnum then hnum1=hnum
					For i=0 To hnum1
						with Rst(i) '结点
							ID=.getAttribute("ID")
							HotelName =.getAttribute("Name")
							xingji	  =.getAttribute("xingji")
							mjiage    =.getAttribute("mjiage")
							Picture	  =.getElementsByTagName("Picture").item(0).getAttribute("v")
							juli	  =.getElementsByTagName("JuLi").item(0).getAttribute("v")
							jcityid	  =.getElementsByTagName("cityinfo ").item(0).getAttribute("cityid")
							Address	  =.getElementsByTagName("Address").item(0).getAttribute("v")
						end with
						hotelpiclist=hotelpiclist&"<dl class='ZhoubianHotel'>"
						If hotel(7) Then
						hotelpiclist=hotelpiclist&"<dt><a target='_blank' href='"&webpath&rehotel&"-"&jcityid&"-"&ID&".html'><img src="""&Picture&""" width=""90"" height=""70"" /></dt>"
						hotelpiclist=hotelpiclist&"<dd><a title='"&HotelName&"' target='_blank' href='"&webpath&rehotel&"-"&jcityid&"-"&ID&".html'><strong>"&left(HotelName,15)&"</strong></a></dd>"
						Else
						hotelpiclist=hotelpiclist&"<dt><a target='_blank' href='"&webpath&"hotelinfo.asp?cityid="&jcityid&"&hotelid="&ID&"'><img src="""&Picture&""" width=""90"" height=""70"" /></dt>"
						hotelpiclist=hotelpiclist&"<dd><a title='"&HotelName&"' target='_blank' href='"&webpath&"hotelinfo.asp?cityid="&jcityid&"&hotelid="&ID&"'><strong>"&left(HotelName,15)&"</strong></a></dd>"
						End If
						hotelpiclist=hotelpiclist&"<dd title='"&Address&"'>"&left(Address,16)&"</dd>"
						hotelpiclist=hotelpiclist&"<dd>该酒店最低 <font color=red><strong>"&mjiage&"</strong></font> 元起订</dd>"
						if juli<>"" then hotelpiclist=hotelpiclist&"<dd>两酒店相距 <font color=green><strong>"&juli&"</strong></font> 公里</dd>"
						hotelpiclist=hotelpiclist&"</dl>"
					Next
				call CreatFile(creathlisturl,hotelpiclist)
		else
			hotelpiclist=""
		End if
	Set Xml=Nothing
	else
		hotelpiclist=ReadFile(creathlisturl)
	end if
End Function

'读取当前城市热门地标，最多只允许调用15个
'cityid城市ID
'lanum调用条数
'shtml路径:webpath&"DataBase/html/"&replace(webpath,"/","")&"_latlon_"&cityid&"_"&lanum&".shtml"
function citylatlon(cityid,lanum)
	dim creathlisturl,apiUrl,http,backXml,xml,rst,i_latlon,la_key,iscreat
	creathlisturl=webpath&"DataBase/html/"&replace(webpath,"/","")&"_latlon_"&cityid&"_"&lanum&".shtml"
	iscreat=IsFileDATE(creathlisturl)
	if iscreat(0)<>True or iscreat(1)<>True then
	apiUrl=doserver&"latlon.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&latlonnum="&lanum&""
			set backXml=GetBackXml(apiUrl)
			set xml=ExXML(backXml,"")
			set backXml=nothing
			if xml.xml<>"" then
					Set Rst=xml.documentElement.childNodes
					For i_latlon=0 To Rst.Length-1
						with Rst(i_latlon)
							la_key=.getAttribute("key")
						end with
						If hotel(7) Then
							citylatlon=citylatlon&"<a href='"&webpath&""&relist&"-c"&cityID&"-x0--"&server.URLEncode(la_key)&"-a0-e1.html'>"&la_key&"</a> "
						Else
							citylatlon=citylatlon&"<a href='"&webpath&"hotellist.asp?cityid="&cityID&"&key="&server.URLEncode(la_key)&"'>"&la_key&"</a> "
						End If
				Next
				call CreatFile(creathlisturl,citylatlon)
			else
				citylatlon=""
			End if
		Set Xml=Nothing
	else
		citylatlon=ReadFile(creathlisturl)
	end if
end function

'===该类主要是获得城市商业区列表===
'cnum 调用商业区数目 
'cityid 城市ID
'bid 当bid=商业区ID时 只读取该ID下的酒店列表
Function cbd_hotellist(cityid,cnum,bid)
	dim creathlisturl,lsnum,http,backXml,xml,Rst,i,x_shangyequID,x_shangyequ,x_Hotelnum,iscreat,apiUrl
	creathlisturl=webpath&"DataBase/html/"&replace(webpath,"/","")&"_cbd_hotellist_"&cityid&"_"&cnum&"_"&bid&".shtml"
	iscreat=IsFileDATE(creathlisturl)
	if iscreat(0)<>True or iscreat(1)<>True then
		apiUrl=doserver&"shangyequ.asp?u="&agent_id&"&m="&agent_md&"&cityid="&cityid&"&cnum="&cnum&""
		if bid>=1 then apiUrl=apiUrl&"&shangyequid="&bid&""
		set backXml=GetBackXml(apiUrl)
			set xml=ExXML(backXml,"")
			set backXml=nothing
			if xml.xml<>"" then
				  Set Rst=xml.documentElement.childNodes
				  lsnum=Rst.Length-1
				  if lsnum>=cnum then lsnum=cnum
				  For i=0 To lsnum
					  with Rst(i)
					  x_shangyequID=.getAttribute("id")
					  x_shangyequ=.getAttribute("name")
					  x_Hotelnum=.getAttribute("HotelNum")
					  end with
					  cbd_hotellist=cbd_hotellist&"<div class=""ht_tex"">"
					  If hotel(7) Then
						  cbd_hotellist=cbd_hotellist&"<h4>"&x_shangyequ&"酒店预订（<a href='"&webpath&""&relist&"-c"&cityID&"-x0---a0-e1.html?bid="&x_shangyequID&"'>"&x_Hotelnum&"家</a>）</h4>"
					  Else
					      cbd_hotellist=cbd_hotellist&"<h4>"&x_shangyequ&"酒店预订（<a href='"&webpath&"hotellist.asp?cityid="&cityid&"&bid="&x_shangyequID&"'>"&x_Hotelnum&"家</a>）</h4>"
					  End If
						  cbd_hotellist=cbd_hotellist&"<ul>"&gethotellist("",5,cityid,"cbd_"&x_shangyequID&"","","",1,22,2)&"</ul>"
					  cbd_hotellist=cbd_hotellist&"</div>"
				Next
				call CreatFile(creathlisturl,cbd_hotellist)
			else
				cbd_hotellist=""
			End if
		Set Xml=Nothing
	else
		cbd_hotellist=ReadFile(creathlisturl)
	end if
End Function


'API接口中xingji对应的中文星级
Function rankText(IntXing)
	Select Case IntXing
		Case 2 rankText="二星及以下/经济型"
		Case 3 rankText="三星级/舒适型"
		Case 4 rankText="四星级/高档型"
		Case 5 rankText="五星级/豪华型"
		Case Else rankText="经济型酒店"
	End Select
End Function


'记录访问酒店记录
Function cookiehotel(cityid,hid,hname)
	dim hotelco,hotelsp,hotelhum,ich
	hname=htmldel(hname&"")
	hotelco=request.cookies("cookiehotel")
	hotelco=htmldel(hotelco&"")
	if instr(hotelco,hname&"$"&hid&"$"&cityid)>=1 then hotelco=replace(hotelco,hname&"$"&hid&"$"&cityid,"")
	hotelsp=split(hotelco&",",",")
	hotelhum=ubound(hotelsp)
	if hotelhum>=9 then hotelhum=9
	for ich=0 to hotelhum
		if hotelsp(ich)<>"" then cookiehotel=cookiehotel&hotelsp(ich)&","
	next
	if cityid<>"" and hname<>"" then cookiehotel=hname&"$"&hid&"$"&cityid&","&cookiehotel
	cookiehotel=replace(cookiehotel&"*",",*","")
	Response.Cookies("cookiehotel")=cookiehotel
	Response.Cookies("cookiehotel").Domain=Request.ServerVariables ("SERVER_NAME")
	Response.Cookies("cookiehotel").Expires=Date+30
End Function

'读取酒店访问记录
Function newhotel(chum)
	dim hotelco,hotelsp,hotelhum,ich,nhotels
	hotelco=request.cookies("cookiehotel")
	if instr(hotelco,",")=0 then exit function
	hotelco=htmldel(hotelco&"")
	hotelsp=split(hotelco&",",",")
	hotelhum=ubound(hotelsp)
	if hotelhum>=chum then hotelhum=chum
	for ich=0 to hotelhum
		if hotelsp(ich)<>"" and instr(hotelsp(ich)&"","$")>=1 then
			nhotels=split(hotelsp(ich)&"","$")
			If hotel(7) Then
				newhotel=newhotel&"<li><a href='"&webpath&rehotel&"-"&nhotels(2)&"-"&nhotels(1)&".html'>"&left(nhotels(0),15)&"</a></li>"
			Else
				newhotel=newhotel&"<li><a href='"&webpath&"hotelinfo.asp?cityid="&nhotels(2)&"&hotelid="&nhotels(1)&"'>"&left(nhotels(0),15)&"</a></li>"
			End If
		end if
	next
End Function

'=======================================
'功能：	将新闻分类从缓存读出并且写入字典
'参数：	无
'返回：	无=
Sub GetClassDict()
	Dim str,Ho
	Str=Application(cachename&"Class_str")
	If Str<>"" Then
		Str=Split(Str,",")
		If ubound(Str)>0 Then
			For Each Ho In Str
				If D.Exists("Class_"&split(Ho,"|")(0)) Then D.Remove("Class_"&split(Ho,"|")(0))
				D.Add "Class_"&split(Ho,"|")(0),split(Ho,"|")(1)
			Next
		Else
			If D.Exists("Class_"&split(Str(0),"|")(0)) Then D.Remove("Class_"&split(Str(0),"|")(0))
			D.Add "Class_"&split(Str(0),"|")(0),split(Str(0),"|")(1)
		End If
	End If
End Sub

'=======================================
'功能：	从数据库中读取新闻数据
'参数：	SQL sql字符串；olen 截取文字长度；target 打开页面,0或1; tp 类型0为文字 1为图片
'返回：	字符串 html字符串
Function NewsList(SQL,olen,target,tp)
	Dim Rs,tempstr,temp,tempimg
		Set Rs=DB.Execute(SQL)
			If Not Rs.Eof Then
				temp="_self"
				If target Then temp="_blank"
				While Not Rs.eof
				If tp Then tempimg="<img border=""0"" src="""&Rs("Article_ViewImg")&""" alt="""&Rs("Article_Title")&""" width=""90"" height=""66"" />"
				If Hotel(7) Then
					tempstr=tempstr&"<li><a href="""&ItemPath&"NewsInfo-"&Rs("Article_Id")&"-"&Rs("Article_Classid")&".html"" target="""&temp&""" title="""&Rs("Article_Title")&""">"&tempimg&FU.CutStr(Rs("Article_Title"),olen)&"</a></li>"
				Else
					tempstr=tempstr&"<li><a href="""&ItemPath&"NewsInfo.asp?Classid="&Rs("Article_Classid")&"&id="&Rs("Article_Id")&""" target="""&temp&""" title="""&Rs("Article_Title")&""">"&tempimg&FU.CutStr(Rs("Article_Title"),olen)&"</a></li>"
				End If
				Rs.movenext
				Wend
			Else
				If instr(lcase(SQL)," and ")>0 And InStr(lcase(SQL)," order ")>0 Then
					SQL=left(SQL,instr(lcase(SQL)," and "))&right(SQL,len(sql)-InStr(lcase(SQL)," order "))
				End If
				Set Rs=DB.Execute(SQL)
				If Not Rs.Eof Then
					temp="_self"
					If target Then temp="_blank"
					While Not Rs.eof
					If tp Then tempimg="<img border=""0"" src="""&Rs("Article_ViewImg")&""" alt="""&Rs("Article_Title")&""" width=""90"" height=""66"" />"
					If Hotel(7) Then
						tempstr=tempstr&"<li><a href="""&ItemPath&"NewsInfo-"&Rs("Article_Id")&"-"&Rs("Article_Classid")&".html"" target="""&temp&""" title="""&Rs("Article_Title")&""">"&tempimg&FU.CutStr(Rs("Article_Title"),olen)&"</a></li>"
					Else
						tempstr=tempstr&"<li><a href="""&ItemPath&"NewsInfo.asp?Classid="&Rs("Article_Classid")&"&id="&Rs("Article_Id")&""" target="""&temp&""" title="""&Rs("Article_Title")&""">"&tempimg&FU.CutStr(Rs("Article_Title"),olen)&"</a></li>"
					End If
					Rs.movenext
					Wend
				End If
			End If
		Rs.Close:Set Rs=Nothing
	NewsList=tempstr
End Function

'=======================================
'功能：	从数据库中读取广告
'参数：	id 广告id
'返回：	无
Sub ShowAD(id,css)
  dim Rs,SQL
  SQL="Select Top 1 AD_ID,AD_Title,AD_Link,AD_SizeWidth,AD_SizeHeight,AD_Type_radio,AD_UploadFile,AD_BeginTime,AD_EndTime,AD_State_radio,AD_Externallinks From ZN_"&D("AD")&" Where AD_Id="&id&" And AD_State_radio<>3 And IIf(AD_State_radio=1,(now BETWEEN AD_BeginTime and AD_EndTime),-1)=-1"
  Set Rs=DB.Execute(SQL)
  If Not Rs.eof Then
	  Select case Rs("AD_Type_radio")
	  case 1:
	  response.Write("<div class="""&css&"""><a href="""&replace(Rs("AD_Link"),"{webpath}",webpath)&""" target=""_blank"" title="""&Rs("AD_Title")&""">"&Rs("AD_Title")&"</a></div>")
	  case 2:
	  response.Write("<div class="""&css&"""><a href="""&replace(Rs("AD_Link"),"{webpath}",webpath)&""" target=""_blank"" title="""&Rs("AD_Title")&"""><img width="""&Rs("AD_SizeWidth")&""" height="""&Rs("AD_SizeHeight")&""" src="""&ItemPath&Rs("AD_UploadFile")&""" border=""0"" alt="""&Rs("AD_Title")&""" /></a></div>")
	  case 3:
	  response.Write("<div class="""&css&""">"&Rs("AD_Externallinks")&"</div>")
	  End Select
  End If
  Rs.Close:Set Rs=Nothing
End Sub
%>