/*	
	˫�����ؼ� ziqiu.zhang 2007.11.5�� 
	�İ���elong.com ԭ�������ؼ�
	�����˶�XHtml��֧��.
 */
function _g(id){return document.getElementById(id)};

//������ת
function setdate(city,hotelid,divid){
	var tm1=_g('txtComeDate').value;
	var tm2=_g('txtOutDate').value;
	if(tm1!=''&&tm2!=''){
		_g(divid).innerHTML="<img src='Images/loader.gif'>���Ժ�,�۸��ѯ��...";
		//location='?hotelid='+hotelid+'&cityid='+city+'&tm1='+tm1+'&tm2='+tm2+''
		xmlHttp('getprice.asp?hid='+hotelid+'&tm1='+tm1+'&tm2='+tm2+'&r='+Math.random( )+'',function(e){ _g(divid).innerHTML=unescape(e);});
	}
}

document.write('<iframe id=CalFrame name=CalFrame frameborder=0 src='+webpath+'inc/calendar.html style=display:none;position:absolute;z-index:110></iframe>');
document.onclick=hideCalendar;

function showCalendar(sImg,bOpenBound,sFld1,sNextP,sNextD,sStartD,sEndD,sVD,sOE,sVDE,sOT,s3F,sFld2,sCallback,sNextVDE)
{
	//1.sImg��������λ�õĿؼ�������,
	//2.bOpenBound,
	//3.sFld1ȡ�����ڵĿؼ�����,
	
	
	//4.sNextPѡȡ���ں�������������λ�õĿؼ�����,�ɲ�����,
	//5.sNextDѡȡ���ں���������������ȡֵ�Ŀؼ�����,�ɲ�����,
	
	//6.sStartD��ʼ��Чʱ��,
	//7.sEndD������Чʱ��,
	
	//8.sVD�ܼ���Ч,���磺'1,3,5',ע��������Ӧ����'0'
	//9.sOE,��˫����Ч,'0'��ʾ˫��,'1'��ʾ����
	//10.sVDE��������,����'2004-10-11,2004-11-20,',���һ��Ҫ����','
	//11.sOT�����ֱ�����ı����е����ֵΪ'text',
	//12.s3F��һ������������ѡ����ȡ���ں�λ���µĿؼ�
	
	//13.sFld2,��������Ĭ������
	//14.sCallback
	
	//15.sNextVDE ��һ�ν������Чʱ��.
	
	var fld1,fld2;
	var cf=document.getElementById("CalFrame");
	var wcf=window.frames.CalFrame;
	var oImg=document.getElementById(sImg);
	if(!oImg){alert("���ƶ��󲻴��ڣ�");return;}
	if(!sFld1){alert("����ؼ�δָ����");return;}
	fld1=document.getElementById(sFld1);
	if(!fld1){alert("����ؼ������ڣ�");return;}
	if(fld1.tagName!="INPUT"||fld1.type!="text"){alert("����ؼ����ʹ���");return;}
	if(sFld2)
	{
		fld2=document.getElementById(sFld2);
		if(!fld2){alert("�ο��ؼ������ڣ�");return;}
		if(fld2.tagName!="INPUT"||(fld2.type!="text"&&fld2.type!="hidden")){alert("�ο��ؼ����ʹ���");return;}
	}
	if(!wcf.bCalLoaded){alert("����δ�ɹ�װ�أ���ˢ��ҳ�棡");return;}
	wcf.n_position=sNextP;
	wcf.n_textdate=sNextD;
	wcf.startdate=sStartD;
	wcf.enddate=sEndD;
	wcf.vailidday=sVD;
	wcf.oddeven=sOE;
	wcf.vailiddate=sVDE;
	wcf.nextvailiddate = sNextVDE;
	wcf.objecttype=sOT;
	wcf.thirdfocus=s3F;
	if(cf.style.display=="block"){cf.style.display="none";return;}
	
	//==============�°汾����: ����������ʾλ�õĸ��� ziqiu.zhang ��ʼ	=================
	var eT=0,eL=0,p=oImg;
	
	var sT=(document.body.scrollTop > document.documentElement.scrollTop)? document.body.scrollTop:document.documentElement.scrollTop;
	//alert(sT);
	var sL=(document.body.scrollLeft > document.documentElement.scrollLeft )? document.body.scrollLeft:document.documentElement.scrollLeft;
	//alert(sL)
	
	var h1 = document.body.clientHeight;
	//alert("h1:" + h1);
	var h2 = document.documentElement.clientHeight;
	//alert("h2:" + h2);
	var isXhtml = (h2<=h1&&h2!=0)?true:false;
	//alert(isXhtml);
	
	//alert("document.documentElement.clientHeight:" + document.documentElement.clientHeight );
	//alert("document.body.clientHeight:" + document.body.clientHeight );
	var myClient = getClient();
	var myScroll = getScroll();		
	//alert("myClient.clientWidth:" + myClient.clientWidth);
	//alert("myScroll.sTop:" + myScroll.sTop);
	//alert("myScroll.sLeft:" + myScroll.sLeft);
	
	var eH=oImg.height,eW=oImg.width;
	while(p&&p.tagName.toLowerCase() != "body"){eT+=p.offsetTop;eL+=p.offsetLeft;p=p.offsetParent;}	
	//alert("myClient.clientHeight:" + myClient.clientHeight);
	//alert("myScroll.sTop:" + myScroll.sTop);
	//alert("eT:" + eT);
	//alert("eL:" + eL);
	//alert("eT-myScroll.sTop :" + (eT-myScroll.sTop) );
	
	//���������Ŀؼ��ĸ߶Ȼ�ȡ������.�����ע�͵�.
	/*
	eH=oImg.height;
	alert("eH:" + eH);
	alert(oImg.height);
	alert( "oImg.height :" + oImg.height); //ע:oImg.height������Firefox�в�֧��
	*/
	
	//alert("eH:" + eH);
	//alert("eT - myScroll.sTop - eH :" +��( eT - myScroll.sTop - eH ) );
	
	var bottomSpace = myClient.clientHeight - eT - myScroll.sTop;
	//alert("bottomSpace:" + bottomSpace);
	//alert("myClient.clientHeight-(eT-sT)-eH:" + (parseInt(myClient.clientHeight-(eT-sT)-eH)).toString() );
	//alert("cf.height:" + cf.height);
	eH=5;
	if(sOT=="text")
	{
		//cf.style.top= ( (bottomSpace>=cf.height)?eT+eH+20:eT-cf.height ).toString() + "px";
		cf.style.top= (eT+eH+20).toString() + "px";	
	}
	else
	{
		//cf.style.top= ( (bottomSpace>=cf.height)?eT+eH+20:eT-cf.height ).toString() + "px";	
		//cf.style.top=(bottomSpace>=cf.height)?eT:eT-cf.height;	
		cf.style.top= (eT+eH+20).toString() + "px";	
	}
	
	//==============�°汾����: ����������ʾλ�õĸ��� ziqiu.zhang ����	=================
	
	
	cf.style.left= ((isXhtml?document.documentElement.clientWidth:document.body.clientWidth-(eL-sL)>=cf.width)?eL:eL+eW-cf.width).toString() + "px";
	cf.style.display="block";
	
	wcf.openbound=bOpenBound;
	wcf.fld1=fld1;
	wcf.fld2=fld2;
	wcf.callback=sCallback;
	wcf.initCalendar();
}
function hideCalendar()
{
	var cf=document.getElementById("CalFrame");
	cf.style.display="none";
}

//ziqiu.zhang 2007.11.5

//�õ��������ľ��� scrollTop �� scrollLeft 
//�÷������:
/*
	var myClient = getClient();
	alert("myClient.clientHeight:" + myClient.clientHeight);
	alert("myClient.clientWidth:" + myClient.clientWidth);
*/
function getScroll() 
{     
		var sTop = 0, sLeft = 0, sWidth = 0, sHeight = 0; 
        
		sTop = (document.body.scrollTop > document.documentElement.scrollTop)? document.body.scrollTop:document.documentElement.scrollTop;
		if( isNaN(sTop) || sTop <0 ){ sTop = 0 ;}
        
		sLeft = (document.body.scrollLeft > document.documentElement.scrollLeft )? document.body.scrollLeft:document.documentElement.scrollLeft;
		if( isNaN(sLeft) || sLeft <0 ){ sLeft = 0 ;}
		
		return { sTop:sTop, sLeft: sLeft, sWidth: sWidth, sHeight: sHeight }; 
}

//�õ��������ǰ��ʾ����Ĵ�С clientHeight �� clientWidth
/*	�÷������:
	var myScroll = getScroll();	
	alert("myScroll.sTop:" + myScroll.sTop);
	alert("myScroll.sLeft:" + myScroll.sLeft);
*/
function getClient()
{
    			var h1 = document.body.clientHeight;
			var h2 = document.documentElement.clientHeight;
			var isXhtml = (h2<=h1&&h2!=0)?true:false;
				
			this.clientHeight = isXhtml?document.documentElement.clientHeight:document.body.clientHeight;
			this.clientWidth  = isXhtml?document.documentElement.clientWidth:document.body.clientWidth;
            
    return {clientHeight:this.clientHeight,clientWidth:this.clientWidth};        
}