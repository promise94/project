// JavaScript Document
var widths = 184;  //����ͼƬ��
var heights = 138; //����ͼƬ��
//img1=new Image();��������������һ��ͼƬԪ�صĶ���
//�����Ƕ�ͼ������Խ��и�ֵ������,��imgs.src="xxxx.jpg"��ָ��ͼƬ��������ַ.
//�������һ������head��,����Ԥ����ͼƬ,���ӿ�ͼƬ��ʾ.
//ֻ����new Images()�õ���ͼƬIE7����,
//��IE6��firefox���ϵ�imgUrl[1]="http://p.zhuna.cn/images/show_pic_01.jpg";�õ���ͼƬ

var nn = 1;	//��ǰ����ʾ�Ĺ���ͼ
var key = 0;  //��ʶ�Ƿ�Ϊ��һ�ο�ʼִ��
var tt;		//��ʶ����

function change_img()
{
	if(key == 0){
		key = 1;
	} //�����һ��ִ��KEY=1����ʾ�Ѿ�ִ�й�һ���ˡ�
	else if(document.all){//document.all��IE6/7��ʶ��firefox����ִ�д˶�����
		document.getElementById("pic").filters[0].Apply();	//���˾�Ӧ�õ�������
		document.getElementById("pic").filters[0].Play(duration=2);  //��ʼת����ת��Ч��
	}
	eval('document.getElementById("pic").src=img'+nn+'.src');   //�滻ͼƬ
	//eval('document.getElementById("url").href=url'+nn+'.src');	//�滻URL
	for (var i = 1 ; i <= counts ; i++)
	{
		document.getElementById("xxjdjj" + i).className = 'axx';   //����������ϵ��������ӱ�Ϊδѡ��״̬
	}
	document.getElementById("xxjdjj" + nn).className = 'bxx';	   //����ǰҳ���ID����Ϊѡ��״̬
	nn++;
	if(nn > counts){
		nn = 1;
	}		//���ID������ͼƬ���������ͷ��ʼѭ��
	tt = setTimeout('change_img()',5000);  //��4�������ִ��change_img()����.
}
function changeimg(n)//��������ϵ�����ִ�еķ�����
{
	nn=n;	//��ǰҳ���ID���ڴ����Nֵ,
	window.clearInterval(tt); //�������ѭ����TT
	//����ִ��change_img();��change_img()�������õ�ͼƬID�Ѿ��ڴ˴����޸�,�����ID����ʼִ��.
	change_img();
}

//��ʽ��
document.write('<style>');
document.write('.axx{padding:1px 7px;border-left:#cccccc 1px solid;}');
document.write('a.axx:link,a.axx:visited{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#666;}');
document.write('a.axx:active,a.axx:hover{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#999;}');
document.write('.bxx{padding:1px 7px;border-left:#cccccc 1px solid;}');
document.write('a.bxx:link,a.bxx:visited{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#D34600;}');
document.write('a.bxx:active,a.bxx:hover{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#D34600;}');
document.write('</style>');

//���ݲ���
document.write('<div style="width:'+widths+'px;height:'+heights+'px;overflow:hidden;text-overflow:clip;float:left;">');
document.write('<div><img id="pic" style="border:0px;filter:progid:dximagetransform.microsoft.wipe(gradientsize=1.0,wipestyle=4, motion=forward)" width='+widths+' height='+heights+' /></div>');
document.write('<div style="filter:alpha(style=1,opacity=10,finishOpacity=80);background: #888888;width:100%-2px;text-align:right;top:-12px;position:relative;margin:1px;height:12px;padding:0px;margin:0px;border:0px;">');

//ѭ���г����ж�����������¼
for(var i=1;i<counts+1;i++){document.write('<a href="javascript:changeimg('+i+');" id="xxjdjj'+i+'" class="axx" target="_self">'+i+'</a>');}
document.write('</div></div>');
//��ʼִ�й�������
change_img();