//�Ƶ���ת
function ebook(rid){window.open('ebook.asp?rid='+rid+'',"ebook")}

// �Զ������ҳ���Ի��������Ч��
if ( screen.availWidth > 1000 && document.documentElement.offsetWidth < 1010 )	{
	self.moveTo(-4,-4);
	self.resizeTo(screen.availWidth+7,screen.availHeight+8);
	document.body.style.cssText="overflow-x:hidden;";
}else if ( screen.availWidth < 1000 && document.documentElement.offsetWidth < 750 )	{
	self.moveTo(-3,-3);
	self.resizeTo(screen.availWidth+5,screen.availHeight+6);
}

// �ݴ����
function killErrors() {
return true;
}
window.onerror = killErrors;

//��ҳTAG
function selectTag(showContent,selfObj){
	// ������ǩ
	var tag = document.getElementById("tags").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// ��������
	for(i=0; j=document.getElementById("tagcontent"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
}

function _g(n){return document.getElementById(n)}
function xmlHttp(Url,xmlBack){var xObj=null;try{xObj=new ActiveXObject("MSXML2.XMLHTTP")}catch(e){try{xObj=new ActiveXObject("Microsoft.XMLHTTP")}catch(e2){try{xObj=new XMLHttpRequest()}catch(e){}}};with(xObj){open("get",Url, true);onreadystatechange=function(){if(readyState==4&&status==200){xmlBack(responseText)}};send(null)}};

function xmlHttp2(Url,xmlBack,_obj){var xObj=null;try{xObj=new ActiveXObject("MSXML2.XMLHTTP")}catch(e){try{xObj=new ActiveXObject("Microsoft.XMLHTTP")}catch(e2){try{xObj=new XMLHttpRequest()}catch(e){}}};with(xObj){open("get",Url, true);onreadystatechange=function(){if(readyState==4&&status==200){xmlBack(responseText,_obj)}};send(null)}};

document.getElementsByClassName=function(tag,cName){var els= [];var myclass=new RegExp("\\b"+cName+"\\b");var elem=this.getElementsByTagName(tag);for(var h=0;h<elem.length;h++){if(myclass.test(elem[h].className))els.push(elem[h])}return els};
function loadcs(id,cityname,obj){v1(obj);xmlHttp('./tuijian.asp?cid='+id+'&cname='+escape(cityname)+'&r='+Math.random( ),function(e){_g('tagcontent').innerHTML=e;_g('loadimg').style.display="none";});}
function v1(obj){
  var objs=_g('tags').getElementsByTagName('a');
  for(var k=0;k<objs.length;k++){
	  objs[k].className='';
  }
  obj.className='hhtc';
  _g('loadimg').style.display="";
}