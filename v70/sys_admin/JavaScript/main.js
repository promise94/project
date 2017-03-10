//CheckBox
function $(val){return document.getElementById(val)}
function CheckBoxCheckAll(CheckBoxName,obj){
	var CheckBoxName,stat,eventSrcObj,obj;
	var CheckBoxs=document.getElementsByName(CheckBoxName);
	if(obj.getAttribute('CheckBoxStat')!=null){
		obj.getAttribute('CheckBoxStat')+''=='true'?stat=false:stat=true;
		obj.setAttribute('CheckBoxStat',stat);
	}else{
		obj.setAttribute('CheckBoxStat',true);
		stat=true;
	}
	for(var n=0;n<CheckBoxs.length;n++){
		CheckBoxs[n].checked=stat;
	}
}
function closeload(){$('loading').style.display="none";}
