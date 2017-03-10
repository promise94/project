var obj=null;
var strVariable=window.location.href
strVariable=strVariable.toLowerCase(); 
var As=document.getElementById('nav').getElementsByTagName('a');
obj = As[0];
for(i=1;i<As.length;i++){if(strVariable.indexOf(As[i].href)>=0)
obj=As[i];}
obj.id='nav_current'