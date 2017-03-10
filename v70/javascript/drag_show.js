var getAbsoluteCoords = function (e) {
  var width = e.offsetWidth;
  var height = e.offsetHeight;
  var left = e.offsetLeft;
  var top = e.offsetTop;
  while (e=e.offsetParent) {
	left += e.offsetLeft;
	top  += e.offsetTop;
  };
  var right = left+width;
  var bottom = top+height;
  return {
	'width': width,
	'height': height,
	'left': left,
	'top': top,
	'right': right,
	'bottom': bottom
  };
};

function resetarea(wrap)
{
	wrap.parentNode.style.position="relative";
	wrap.style.display='none'
	wrap.style.left="";
	wrap.style.top="0";
	wrap.style.right="55px";
	//wrap.setAttribute("onmouseout",'return resetarea(this);');
}
function settop(wrap)
{
wrap.style.zIndex=parseInt(wrap.style.zIndex)+1;
}
function reside(wrap)
{
	 wrap.style.right = "";
	 wrap.parentNode.style.position="";
	// wrap.onmouseout="";
}

function moveordrog(wrap) {
//var expires = (moveordrog.arguments.length > 1) ? moveordrog.arguments[1] : null;
//if(expires!=null)
//{
//if(wrap.childNodes[0].tagName!="DIV"){
//var div=document.createElement("DIV");
//div.setAttribute("width",'100%');
//div.innerHTML=expires;
////var div2=document.createElement("div");
////div2.setAttribute("style",'float:left;cursor:pointer;margin-left:5px;');
////div2.setAttribute("onmouseover",'return reside(this);');
////div2.setAttribute("title",'Ðü¸¡');
////div2.innerHTML="*";
////div.appendChild(div2);
//wrap.insertBefore(div,wrap.childNodes[0]);
//wrap.setAttribute("onmouseout",'return resetarea(this);');
//}
//}
  wrap.style.display='block';
  var isChangeLayout=true;
  wrap.style.cursor = isChangeLayout?"move":"se-resize";
  if (window.ActiveXObject) 
  wrap.onselectstart = function () { event.returnValue = false; }
  document.onmousedown = function (evt) {

	evt = window.event||evt; var a=getAbsoluteCoords(wrap);
	wrap.cx=evt.clientX-(isChangeLayout?a.left:a.width); 
	wrap.cy=evt.clientY-(isChangeLayout?a.top:a.height);
	document.onmousemove = function (evt) {
	 wrap.style.right = "";
	 wrap.parentNode.style.position="";
	 wrap.style.onmouseout="return resetarea(this);"
	  evt = window.event||evt; try {
		if (isChangeLayout) {
		  wrap.style.left = (evt.clientX-wrap.cx)+"px";
		  wrap.style.top = (evt.clientY-wrap.cy)+"px";
		} else {
		  wrap.style.width = (evt.clientX-wrap.cx)+"px";
		  wrap.style.height = (evt.clientY-wrap.cy)+"px";
		}
	  } catch (ex) {};
	};
	document.onmouseup = function () {
	  document.onmousemove = null;
	  document.onmouseup = null;
	  wrap.style.cursor="default";
	//  reside(wrap);
	};
  };
}
document.ondblclick=function(){
var os=document.getElementsByClassName('div','showtips');
for(var i=0;i<os.length;i++){os[i].style.display="none";}
}