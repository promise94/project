<%If baseconfig(3) Then Response.Write(baseconfig(4)):Response.End()
'===������Ҫ�ǻ��ĳ�����е�����===
'cityid ���ó���ID �����Ӧ������ο� http://un.zhuna.cn/api/utf-8/city.asp?u=6&m=a0b923820dcc509a
'XML����λ��:DataBase/XML/city/_getCityname_"&cityid&".xml
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


'===������Ҫ�ǻ��ĳ�����е���ҵ������===
'cityid ���ó���ID
'shangyequid ��ҵ��ID
'�����Ӧ������ο� http://un.zhuna.cn/api/gbk/shangyequ.asp?cityid=321&u=6&m=ed314f60ea53fb5e&shangyequid=686
'xml����·��:DataBase/XML/shangyequ/"&replace(webpath,"/","")&"_getshangyequ_"&cityid&"_"&syqid&".xml"
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

'===������Ҫ�ǻ��ĳ�����е�����Ʒ��===
'cityid ���ó���ID �����Ӧ������ο� http://un.zhuna.cn/api/utf-8/city.asp?u=6&m=a0b923820dcc509a  
'cnum  Ʒ�Ƶ�������
'����ĳ����������Ʒ�� cityid=����ID ȫ��cityid=0
'xml ����·��:DataBase/XML/shangyequ/"&replace(webpath,"/","")&"_getshangyequ_"&cityid&".xml"
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

'===������Ҫ�ǻ��ĳ�����е�����Ʒ��===
'cityid ���ó���ID �����Ӧ������ο� http://un.zhuna.cn/api/utf-8/city.asp?u=6&m=a0b923820dcc509a  
'cnum  Ʒ�Ƶ�������
'����ĳ����������Ʒ�� cityid=����ID ȫ��cityid=0
'shtml����·��:webpath&"DataBase/html/"&replace(webpath,"/","")&"_getchain_"&cityid&"_"&cnum&".shtml"
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
						getchain=getchain&"<li><a href='"&lsurl&"' title='���"&ls_name&"�ֲ�����'>"
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

'===������Ҫ�ǻ�ó����б�===
'cnum ���ó�����Ŀ 
'img 	��������ǰ��ͼƬ����������,������Ĭ��Ϊ��
'xmode ��ʾģʽ xmode=0 ֻ��ʾ���� xmode=1 ��ʾ����+�Ƶ�Ԥ��
'paixu �����б����� ��1=����ID��С���� 2=����ID�ɴ�С 3=�Ƶ�ǩԼ���� 4=������������
'shtml����·��:webpath&"DataBase/html/"&replace(webpath,"/","")&"_getcitylist_"&paixu&"_"&cnum&"_"&xmode&".shtml"
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
				  getcitylist=getcitylist&"<li title='"&x_cityname&"�Ƶ�Ԥ��'>"
				  If hotel(7) Then
				 	 getcitylist=getcitylist&"<a href='"&webpath&"index/"&x_cityID&".html'>"
				  Else
				 	 getcitylist=getcitylist&"<a href='"&webpath&"city/?cityid="&x_cityID&"'>"
				  End If
				  if xmode=0 then getcitylist=getcitylist&""&img&""&left(x_cityname,2)&""
				  if xmode=1 then getcitylist=getcitylist&""&img&""&left(x_suoxie,1)&""&left(x_cityname,4)&"�Ƶ�Ԥ��"
				  if xmode=2 then getcitylist=getcitylist&""&img&""&left(x_cityname,4)&"�Ƶ�Ԥ��"
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

'===������Ҫ�ǻ�ó�����ҵ���б�===
'cnum ������ҵ����Ŀ 
'cityid ����ID
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
				 	 getcbdlist=getcbdlist&"<li title='"&x_shangyequ&"�Ƶ�Ԥ��(��"&x_Hotelnum&"��)'><span>��"&x_Hotelnum&"��</span><a href='"&webpath&""&relist&"-c"&cityID&"-x0---a0-e1.html?bid="&x_shangyequID&"'>"&left(x_shangyequ,15)&"</a></li>"
				  Else
				 	 getcbdlist=getcbdlist&"<li title='"&x_shangyequ&"�Ƶ�Ԥ��'><span>��"&x_Hotelnum&"��</span><a href='"&webpath&"hotellist.asp?cityid="&cityID&"&bid="&x_shangyequID&"' title='��"&x_Hotelnum&"��'>"&left(x_shangyequ,14)&"</a></li>"
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

'===������Ҫ�ǻ�ó��оƵ��б�===
'img 	��������ǰ��ͼƬ����������,������Ĭ��Ϊ��
'hnum 	���õľƵ�����
'cityid ���ó���ID �����Ӧ������ο� http://un.zhuna.cn/api/utf-8/city.asp?u=6&m=a0b923820dcc509a
'hid 	�Ƶ��ID���ڲ�ѯĳ���Ƶ긽�������Ƶ�ʱ����Ҫ,���������Ĭ��Ϊ0
'		Ϊ�˲�Ӱ��ԭ��gethotellist��������ߺ����������ԣ����ǽ���hid�������칦�����䣬�����˻�չ�����Ƶꡢ�ؼ��ʡ��Ǽ��Ƶ꣬��ҵ��
'minprice maxprice �Ƶ�ļ۸��������Сֵ,����Ҫ��ʱ����Ĭ��Ϊ��
'paixu 	�����б����� ��1=��վĬ�� 2=�۸��ɵ͵��� 3=�Ǽ��ɵ͵��� 4=�ͻ������ɸߵ��ͣ�
'tlen 	��ʾ�Ƶ����Ƶĳ���
'xmode 	��ʾģʽ xmode=1 ͼƬģʽ xmode=2 ��ʾ��ͼ۸� xmode=3 ��ʾ�������� xmode=4 ��2��ģʽ�´���ҵ��(һ�����hidʹ��)
'shtml����·�� :webpath&"DataBase/html/"&replace(webpath,"/","")&"_"&hnum&"_"&cityid&"_"&hid&"_"minprice&maxprice&"_"&paixu&"_"&xmode&".shtml"
Function gethotellist(img,hnum,cityid,hid,minprice,maxprice,paixu,tlen,xmode)
	dim creathlisturl,sapiurl,totalput,page,hnum1,i,id,mjiage,Picture,juli,apiurl,iscreat
	dim http,backXml,xml,root,rst,hotelname,xingji,jcityid,g_shangyequ,g_shangyequid
	creathlisturl=webpath&"DataBase/html/"&replace(webpath,"/","")&"HotelList_"&hnum&"_"&cityid&"_"&hid&"_"
	creathlisturl=creathlisturl&minprice&maxprice&"_"&paixu&"_"&xmode&".shtml"
	iscreat=IsFileDATE(creathlisturl)
	if iscreat(0)<>True or iscreat(1)<>True then
	if minprice<>"" then sapiurl=sapiurl&"&minprice="&minprice&""
	if maxprice<>"" then sapiurl=sapiurl&"&maxprice="&maxprice&""
	'hid����
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
						'list �����	list.hotel
						set root=xml.documentElement
						totalput=root.getAttribute("totalput")
						page=root.getAttribute("PageIdx")
						Set Rst=xml.documentElement.childNodes
						hnum=hnum-1
						hnum1=Rst.Length-1
						if hnum1>=hnum then hnum1=hnum
						For i=0 To hnum1
							with Rst(i) '���<hotel ID="3921" Name="������ҿ�ݾƵ꣨�����ŵ꣩" xingji="0"> 
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
							if xmode=2 or xmode=4 then gethotellist=gethotellist&"<span>"&mjiage&"Ԫ</span>"
							if xmode=3 then gethotellist=gethotellist&"<span>"&juli&"����</span>"
							If hotel(7) Then
								gethotellist=gethotellist&"<a href='"&webpath&""&rehotel&"-"&cityid&"-"&id&".html' title='"&hotelname&"&#10;��ͼ۸�"&mjiage&"Ԫ�� &#10;��Ȧ��"&g_shangyequ&"'>"
							Else
								gethotellist=gethotellist&"<a href='"&webpath&"hotelinfo.asp?cityid="&jcityid&"&hotelid="&id&"' title='"&hotelname&"&#10;��ͼ۸�"&mjiage&"Ԫ�� &#10;��Ȧ��"&g_shangyequ&"'>"
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

'=====��ϸҳ���и����Ƶ�ͼ�ĵ���=====
'hnum �������� ������10��
'Cityid ����ID
'hid �Ƶ�ID����ѯ�þƵ긽���ľƵ� hid=0ʱ�õ������������еľƵ꣩
'paixu ֻ�е�hid=0ʱ�������� ���� ��1=��վĬ�� 2=�۸��ɵ͵��� 3=�Ǽ��ɵ͵��� 4=�ͻ������ɸߵ��ͣ�
'shtml ·��:webpath&"DataBase/html/"&replace(webpath,"/","")&"_hotelpiclist_"&hnum&"_"&cityid&"_"&hid&"_"&paixu&".shtml"
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
					'list �����	list.hotel
					set root=xml.documentElement
					totalput=root.getAttribute("totalput")
					page=root.getAttribute("PageIdx")
					Set Rst=xml.documentElement.childNodes
					hnum=hnum-1
					hnum1=Rst.Length-1
					if hnum1>=hnum then hnum1=hnum
					For i=0 To hnum1
						with Rst(i) '���
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
						hotelpiclist=hotelpiclist&"<dd>�þƵ���� <font color=red><strong>"&mjiage&"</strong></font> Ԫ��</dd>"
						if juli<>"" then hotelpiclist=hotelpiclist&"<dd>���Ƶ���� <font color=green><strong>"&juli&"</strong></font> ����</dd>"
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

'��ȡ��ǰ�������ŵر꣬���ֻ�������15��
'cityid����ID
'lanum��������
'shtml·��:webpath&"DataBase/html/"&replace(webpath,"/","")&"_latlon_"&cityid&"_"&lanum&".shtml"
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

'===������Ҫ�ǻ�ó�����ҵ���б�===
'cnum ������ҵ����Ŀ 
'cityid ����ID
'bid ��bid=��ҵ��IDʱ ֻ��ȡ��ID�µľƵ��б�
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
						  cbd_hotellist=cbd_hotellist&"<h4>"&x_shangyequ&"�Ƶ�Ԥ����<a href='"&webpath&""&relist&"-c"&cityID&"-x0---a0-e1.html?bid="&x_shangyequID&"'>"&x_Hotelnum&"��</a>��</h4>"
					  Else
					      cbd_hotellist=cbd_hotellist&"<h4>"&x_shangyequ&"�Ƶ�Ԥ����<a href='"&webpath&"hotellist.asp?cityid="&cityid&"&bid="&x_shangyequID&"'>"&x_Hotelnum&"��</a>��</h4>"
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


'API�ӿ���xingji��Ӧ�������Ǽ�
Function rankText(IntXing)
	Select Case IntXing
		Case 2 rankText="���Ǽ�����/������"
		Case 3 rankText="���Ǽ�/������"
		Case 4 rankText="���Ǽ�/�ߵ���"
		Case 5 rankText="���Ǽ�/������"
		Case Else rankText="�����;Ƶ�"
	End Select
End Function


'��¼���ʾƵ��¼
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

'��ȡ�Ƶ���ʼ�¼
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
'���ܣ�	�����ŷ���ӻ����������д���ֵ�
'������	��
'���أ�	��=
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
'���ܣ�	�����ݿ��ж�ȡ��������
'������	SQL sql�ַ�����olen ��ȡ���ֳ��ȣ�target ��ҳ��,0��1; tp ����0Ϊ���� 1ΪͼƬ
'���أ�	�ַ��� html�ַ���
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
'���ܣ�	�����ݿ��ж�ȡ���
'������	id ���id
'���أ�	��
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