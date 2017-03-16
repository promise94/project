/*
**************************
(C)2010-2014 qf580.com
update: 2013-9-1 20:39:00
person: Feng
**************************
*/


$(function(){
	$("#classid").change(function(){
		var v = $(this).val();
		$.ajax({
			url : "ajax_do.php?action=infoclass&id="+v+"&row=",
			type:'get',
			dataType:'html',
			beforeSend:function(){},
			success:function(data, textStatus, xmlHttp){
				if(data != ''){
					$("#df").html(data);
				}else{
					$("#df").html("");
				}
			}
		});
		$.ajax({
			url : "ajax_do.php?action=viewguige&id="+v+"&row=",
			type:'get',
			dataType:'html',
			beforeSend:function(){},
			success:function(info, textStatus, xmlHttp){
				if(info != ''){
					$("#viewguige").html(info);
				}else{
					$("#viewguige").html("");
				}
			}
		});
	});

	$(".infosrc").mousemove(function(){
		$(this).find("ul").show();
	}).mouseleave(function(){
		$(this).find("ul").hide();
	});
});


function GetSrcName(name)
{
	$("#source").val(name);
}