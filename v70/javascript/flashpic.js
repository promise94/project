// JavaScript Document
var widths = 184;  //焦点图片宽
var heights = 138; //焦点图片高
//img1=new Image();在这里是声明了一个图片元素的对象
//后面是对图像的属性进行赋值或设置,如imgs.src="xxxx.jpg"是指定图片的索引地址.
//这个代码一般用于head区,用于预加载图片,即加快图片显示.
//只有用new Images()得到的图片IE7才认,
//而IE6和firefox可认得imgUrl[1]="http://p.zhuna.cn/images/show_pic_01.jpg";得到的图片

var nn = 1;	//当前所显示的滚动图
var key = 0;  //标识是否为第一次开始执行
var tt;		//标识作用

function change_img()
{
	if(key == 0){
		key = 1;
	} //如果第一次执行KEY=1，表示已经执行过一次了。
	else if(document.all){//document.all仅IE6/7认识，firefox不会执行此段内容
		document.getElementById("pic").filters[0].Apply();	//将滤镜应用到对像上
		document.getElementById("pic").filters[0].Play(duration=2);  //开始转换及转换效果
	}
	eval('document.getElementById("pic").src=img'+nn+'.src');   //替换图片
	//eval('document.getElementById("url").href=url'+nn+'.src');	//替换URL
	for (var i = 1 ; i <= counts ; i++)
	{
		document.getElementById("xxjdjj" + i).className = 'axx';   //将下面黑条上的所有链接变为未选中状态
	}
	document.getElementById("xxjdjj" + nn).className = 'bxx';	   //将当前页面的ID设置为选中状态
	nn++;
	if(nn > counts){
		nn = 1;
	}		//如果ID大于总图片数量。则从头开始循环
	tt = setTimeout('change_img()',5000);  //在4秒后重新执行change_img()方法.
}
function changeimg(n)//点击黑条上的链接执行的方法。
{
	nn=n;	//当前页面的ID等于传入的N值,
	window.clearInterval(tt); //清除用于循环的TT
	//重新执行change_img();但change_img()内所调用的图片ID已经在此处被修改,会从新ID处开始执行.
	change_img();
}

//样式表
document.write('<style>');
document.write('.axx{padding:1px 7px;border-left:#cccccc 1px solid;}');
document.write('a.axx:link,a.axx:visited{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#666;}');
document.write('a.axx:active,a.axx:hover{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#999;}');
document.write('.bxx{padding:1px 7px;border-left:#cccccc 1px solid;}');
document.write('a.bxx:link,a.bxx:visited{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#D34600;}');
document.write('a.bxx:active,a.bxx:hover{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#D34600;}');
document.write('</style>');

//内容部分
document.write('<div style="width:'+widths+'px;height:'+heights+'px;overflow:hidden;text-overflow:clip;float:left;">');
document.write('<div><img id="pic" style="border:0px;filter:progid:dximagetransform.microsoft.wipe(gradientsize=1.0,wipestyle=4, motion=forward)" width='+widths+' height='+heights+' /></div>');
document.write('<div style="filter:alpha(style=1,opacity=10,finishOpacity=80);background: #888888;width:100%-2px;text-align:right;top:-12px;position:relative;margin:1px;height:12px;padding:0px;margin:0px;border:0px;">');

//循环列出共有多少条滚动记录
for(var i=1;i<counts+1;i++){document.write('<a href="javascript:changeimg('+i+');" id="xxjdjj'+i+'" class="axx" target="_self">'+i+'</a>');}
document.write('</div></div>');
//开始执行滚动操作
change_img();