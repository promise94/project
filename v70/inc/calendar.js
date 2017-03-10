/*	
	双日历控件 ziqiu.zhang 2007.11.5日 
	改版自elong.com 原单日历控件
	增加了对XHtml的支持.
 */
function _g(id){return document.getElementById(id)};

//日期跳转
function setdate(city,hotelid,divid){
	var tm1=_g('txtComeDate').value;
	var tm2=_g('txtOutDate').value;
	if(tm1!=''&&tm2!=''){
		_g(divid).innerHTML="<img src='Images/loader.gif'>请稍后,价格查询中...";
		//location='?hotelid='+hotelid+'&cityid='+city+'&tm1='+tm1+'&tm2='+tm2+''
		xmlHttp('getprice.asp?hid='+hotelid+'&tm1='+tm1+'&tm2='+tm2+'&r='+Math.random( )+'',function(e){ _g(divid).innerHTML=unescape(e);});
	}
}

document.write('<iframe id=CalFrame name=CalFrame frameborder=0 src='+webpath+'inc/calendar.html style=display:none;position:absolute;z-index:110></iframe>');
document.onclick=hideCalendar;

function showCalendar(sImg,bOpenBound,sFld1,sNextP,sNextD,sStartD,sEndD,sVD,sOE,sVDE,sOT,s3F,sFld2,sCallback,sNextVDE)
{
	//1.sImg日历弹出位置的控件的名称,
	//2.bOpenBound,
	//3.sFld1取得日期的控件名称,
	
	
	//4.sNextP选取日期后新日历弹出的位置的控件名称,可不输入,
	//5.sNextD选取日期后新日历弹出从中取值的控件名称,可不输入,
	
	//6.sStartD开始有效时间,
	//7.sEndD截至有效时间,
	
	//8.sVD周几有效,例如：'1,3,5',注意星期日应输入'0'
	//9.sOE,单双日有效,'0'表示双日,'1'表示单日
	//10.sVDE特殊日期,例如'2004-10-11,2004-11-20,',最后一定要输入','
	//11.sOT如果是直接在文本框中点击则值为'text',
	//12.s3F下一个日历弹出并选择后点取日期后定位到新的控件
	
	//13.sFld2,弹出日历默认日期
	//14.sCallback
	
	//15.sNextVDE 下一次焦点的有效时间.
	
	var fld1,fld2;
	var cf=document.getElementById("CalFrame");
	var wcf=window.frames.CalFrame;
	var oImg=document.getElementById(sImg);
	if(!oImg){alert("控制对象不存在！");return;}
	if(!sFld1){alert("输入控件未指定！");return;}
	fld1=document.getElementById(sFld1);
	if(!fld1){alert("输入控件不存在！");return;}
	if(fld1.tagName!="INPUT"||fld1.type!="text"){alert("输入控件类型错误！");return;}
	if(sFld2)
	{
		fld2=document.getElementById(sFld2);
		if(!fld2){alert("参考控件不存在！");return;}
		if(fld2.tagName!="INPUT"||(fld2.type!="text"&&fld2.type!="hidden")){alert("参考控件类型错误！");return;}
	}
	if(!wcf.bCalLoaded){alert("日历未成功装载！请刷新页面！");return;}
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
	
	//==============新版本更新: 关于日历显示位置的更改 ziqiu.zhang 开始	=================
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
	
	//调用日历的控件的高度获取有问题.下面的注释掉.
	/*
	eH=oImg.height;
	alert("eH:" + eH);
	alert(oImg.height);
	alert( "oImg.height :" + oImg.height); //注:oImg.height属性在Firefox中不支持
	*/
	
	//alert("eH:" + eH);
	//alert("eT - myScroll.sTop - eH :" +　( eT - myScroll.sTop - eH ) );
	
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
	
	//==============新版本更新: 关于日历显示位置的更改 ziqiu.zhang 结束	=================
	
	
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

//得到鼠标滚过的距离 scrollTop 与 scrollLeft 
//用法与测试:
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

//得到浏览器当前显示区域的大小 clientHeight 与 clientWidth
/*	用法与测试:
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