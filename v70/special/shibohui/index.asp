<!--#include file="../../inc/conn.asp" -->
<%Const ItemPath="../../"%>
<!--#include file="../../inc/Main_function.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�Ϻ��������ʾƵ���ǰ�� ��ռ�Ȼ������� - <%=doname%></title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<style>
body { margin:0 auto; font-size:12px; font-family:Verdana; line-height:150%; }
ul, dl, h1, h2, h3, h4, h5, h6, form { padding:0; margin:0; }
h1 { font-size:18px; }
h2 { font-size:14px; }
h3 { font-size:14px; font-weight:normal; }
h4 { font-size:12px; }
h5 { font-size:12px; font-weight:normal; }
ul { list-style:none; }
img { border:0px; }
a { text-decoration: none; border:none; }
#top { background:#fff; }
#contain { width:950px; margin:0 auto; }
.diqu { height:35px; background:url(images/index_04.jpg) no-repeat; }
#title { padding-left:50px; }
#title ul li { width:121px; height:26px; padding-left:10px; padding-top:8px; float:left; background:url(images/ctrip1.gif) no-repeat; font-size:14px; cursor:pointer; color:#fff; font-weight:bold; }
#title ul li.hover { background:url(images/ctrip.gif) no-repeat; color:#2955aa; font-weight:bold; }
#title ul .ho-te { width:131px; height:26px; background:url(images/ho-te.gif) no-repeat; }
#title ul #one4 { width:138px; height:26px; background:url(images/ho-te.gif) no-repeat; }
#title ul #one4.hover { background:url(images/ho-te2.gif) no-repeat; }
.hotel { height:432px; overflow:auto; zoom:1; }
.te_hotel { width:553px; height:426px; float:left; padding-left:50px; padding-top:6px; background:url(images/index_05.jpg) no-repeat; }
.te_hotel tr td { height:31px; border-bottom:1px #ccc dashed; }
.te_hotel tr td a { color:#000; }
.te_hotel tr td a:hover { color:#f60; }
.zhushi { color:#f60; font-weight:bold; padding-top:6px; }
.hot { float:left; width:347px; height:432px; background:url(images/more.jpg) no-repeat; }
.hot_jiu { width:155px; height:104px; padding-left:140px; padding-top:52px; }
.hot_jiu a { color:#fff; text-decoration:none; }
.hot_news { padding-top:20px; padding-left:100px; }
.hot_news ul li { line-height:1.6; }
.hot_news ul li a { color:#333; }
.sh { height:327px; background:url(images/sh_07.jpg) no-repeat; padding:130px 50px 10px 50px; }
.sh ul li { width:154px; float:left; text-align:center; margin-left:13px; margin-bottom:10px; }
.sh ul li a { color:#333; }
.sd { overflow:auto; zoom:1; background:#eafeff; }
.sd ul li { float:left; width:184px; margin-left:30px; }
.foot { margin:0; padding-top:8px; padding-bottom:8px; }
.foot p { text-align:center; margin:6px 0px; }
.foot p a { color:#fff; text-decoration:none; }
.STYLE4 { color: #053794 }
</style>
<script>
<!--
//gaoge
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
var menu=document.getElementById(name+i);
var con=document.getElementById("con_"+name+"_"+i);
menu.className=i==cursel?"hover":"";
con.style.display=i==cursel?"block":"none";
}
}
//-->
</script>
</head>
<body>
<div id="contain">
  <div class="head"><a href='<%=webpath%>' title="������ҳ"><img src="images/index_01.jpg" width="950" height="106" /><img src="images/index_02.jpg" width="950" height="112" /><img src="images/index_03.jpg" width="950" height="81" /></a></div>
  <div class="diqu">
    <div id="title">
      <ul>
        <li id="one1" onclick="setTab('one',1,4)" class="hover">½���츽���Ƶ�</li>
        <li id="one2" onclick="setTab('one',2,4)">��̲�����Ƶ�</li>
        <li id="one3" onclick="setTab('one',3,4)">�Ͼ�·�����Ƶ�</li>
        <li id="one4" onclick="setTab('one',4,4)">�ǻ������Ƶ�</li>
      </ul>
    </div>
  </div>
  <div class="hotel">
    <div class="te_hotel">
      <div id="con_one_1">
        <table width="536" height="299" border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <th width="210" height="34" align="left" valign="middle" scope="col">�Ƶ�����&nbsp;</th>
            <th width="123" height="34" align="left" valign="middle" scope="col">�Ǽ�&nbsp;</th>
            <th width="67" height="34" align="left" valign="middle" scope="col">��ͼ�&nbsp;</th>
            <th width="63" height="34" align="left" valign="middle" scope="col">���߾�&nbsp;</th>
            <th width="73" height="34" align="left" valign="middle" scope="col">Ԥ��&nbsp;</th>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=6037" target="_blank">�Ϻ���������</a></td>
            <td align="left" valign="middle">�������Ǽ�</td>
            <td align="left" valign="middle"><span class="STYLE4">1280Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.20</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=6037" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9856" target="_blank">�Ϻ���ͥ��ݾƵ꣨��׶��ŵ꣩</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">246Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.92</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9856" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4568" target="_blank">�Ϻ����ȱ���</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">198Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">1.12</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4568" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7283" target="_blank">�Ϻ��ֽ�����</a></td>
            <td align="left" valign="middle">�������Ǽ�</td>
            <td align="left" valign="middle"><span class="STYLE4">598Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">1.17</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7283" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4674" target="_blank">�Ϻ������Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">148Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">1.20</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4674" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8893" target="_blank">�Ϻ��ǳ̴�ҵ�Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">198Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">1.21</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8893" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9729" target="_blank">�Ϻ�Ϊ�������Ƶ꣨����̲�꣩</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">135Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">1.36</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9729" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8202" target="_blank">�Ϻ�������˹�Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">268Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">1.36</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8202" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=6822" target="_blank">�Ϻ����׾Ƶ꣨����̲�꣩</a></td>
            <td align="left" valign="middle">�������Ǽ�</td>
            <td align="left" valign="middle"><span class="STYLE4">178Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">1.39</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=6822" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7500" target="_blank">�Ϻ�����������Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">318Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">1.50</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7500" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
        </table>
      </div>
      <div id="con_one_2" style="display:none">
        <table width="536" height="299" border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <th width="210" height="34" align="left" valign="middle" scope="col">�Ƶ�����&nbsp;</th>
            <th width="123" height="34" align="left" valign="middle" scope="col">�Ǽ�&nbsp;</th>
            <th width="67" height="34" align="left" valign="middle" scope="col">��ͼ�&nbsp;</th>
            <th width="63" height="34" align="left" valign="middle" scope="col">���߾�&nbsp;</th>
            <th width="73" height="34" align="left" valign="middle" scope="col">Ԥ��&nbsp;</th>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7500" target="_blank">�Ϻ�����������Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">318Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.40</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7500" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7283" target="_blank">�Ϻ��ֽ�����</a></td>
            <td align="left" valign="middle">�������Ǽ�</td>
            <td align="left" valign="middle"><span class="STYLE4">598Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.40</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7283" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7344" target="_blank">�Ϻ����ֱ���</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">128Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.42</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7344" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7860" target="_blank">�Ϻ���������</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">188Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.45</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7860" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=6822" target="_blank">�Ϻ����׾Ƶ꣨����̲�꣩</a></td>
            <td align="left" valign="middle">�������Ǽ�</td>
            <td align="left" valign="middle"><span class="STYLE4">178Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.45</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=6822" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8202" target="_blank">�Ϻ�������˹�Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">268Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.63</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8202" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9856" target="_blank">�Ϻ���ͥ��ݾƵ꣨��׶��ŵ꣩</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">246Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.64</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9856" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=5978" target="_blank">�Ϻ����Ǵ�Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">258Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.64</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=5978" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8893" target="_blank">�Ϻ��ǳ̴�ҵ�Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">198Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.70</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8893" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4568" target="_blank">�Ϻ����ȱ���</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">198Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.70</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4568" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
        </table>
      </div>
      <div id="con_one_3" style="display:none">
        <table width="536" height="299" border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <th width="210" height="34" align="left" valign="middle" scope="col">�Ƶ�����&nbsp;</th>
            <th width="123" height="34" align="left" valign="middle" scope="col">�Ǽ�&nbsp;</th>
            <th width="67" height="34" align="left" valign="middle" scope="col">��ͼ�&nbsp;</th>
            <th width="63" height="34" align="left" valign="middle" scope="col">���߾�&nbsp;</th>
            <th width="73" height="34" align="left" valign="middle" scope="col">Ԥ��&nbsp;</th>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7543" target="_blank">�Ϻ����Ƿ���</a></td>
            <td align="left" valign="middle">�������Ǽ�</td>
            <td align="left" valign="middle"><span class="STYLE4">280Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.20</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7543" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=5039" target="_blank">�Ϻ�ٳ�����ݣ�ԭٳ�����ݣ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">330Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.20</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=5039" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4366" target="_blank">�Ϻ���������Ƶ�</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">200Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.42</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4366" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=5034" target="_blank">�Ϻ����оƵ�</a></td>
            <td align="left" valign="middle">���ƶ��Ǽ�</td>
            <td align="left" valign="middle"><span class="STYLE4">268Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.51</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=5034" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9195" target="_blank">�Ϻ���Ϫ�Ƶ�</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">148Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.54</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9195" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7534" target="_blank">�Ϻ�24K���������Ƶ꣨����·�꣩</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">248Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.54</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7534" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7533" target="_blank">�Ϻ�24K���������Ƶ꣨����㳡�꣩</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">198Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.85</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7533" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8640" target="_blank">�Ϻ�����֮�������Ƶ꣨��̲�꣩</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">219Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.89</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8640" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7561" target="_blank">�Ϻ��������վƵ�</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">218Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.92</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7561" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7538" target="_blank">�Ϻ��»��־Ƶ깫Ԣ</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">618Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.92</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7538" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
        </table>
      </div>
      <div id="con_one_4" style="display:none">
        <table width="536" height="299" border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <th width="210" height="34" align="left" valign="middle" scope="col">�Ƶ�����&nbsp;</th>
            <th width="123" height="34" align="left" valign="middle" scope="col">�Ǽ�&nbsp;</th>
            <th width="67" height="34" align="left" valign="middle" scope="col">��ͼ�&nbsp;</th>
            <th width="63" height="34" align="left" valign="middle" scope="col">���߾�&nbsp;</th>
            <th width="73" height="34" align="left" valign="middle" scope="col">Ԥ��&nbsp;</th>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8893" target="_blank">�Ϻ��ǳ̴�ҵ�Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">198Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.40</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8893" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4568" target="_blank">�Ϻ����ȱ���</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">198Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.41</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=4568" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9275" target="_blank">�Ϻ����þƵ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">498Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.50</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=9275" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8202" target="_blank">�Ϻ�������˹�Ƶ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">268Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.51</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8202" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8640" target="_blank">�Ϻ�����֮�������Ƶ꣨��̲�꣩</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">219Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.54</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=8640" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7538" target="_blank">�Ϻ��»��־Ƶ깫Ԣ</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">618Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.70</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7538" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7532" target="_blank">�Ϻ��������ʾƵ�</a></td>
            <td align="left" valign="middle">�൱������</td>
            <td align="left" valign="middle"><span class="STYLE4">458Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.86</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7532" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=5034" target="_blank">�Ϻ����оƵ�</a></td>
            <td align="left" valign="middle">���ƶ��Ǽ�</td>
            <td align="left" valign="middle"><span class="STYLE4">268Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.89</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=5034" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=10131" target="_blank">�Ϻ��ǳ̳��ھƵ�</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">198Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.94</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=10131" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
          <tr>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7534" target="_blank">�Ϻ�24K���������Ƶ꣨����·�꣩</a></td>
            <td align="left" valign="middle">�����;Ƶ�</td>
            <td align="left" valign="middle"><span class="STYLE4">248Ԫ</span></td>
            <td align="left" valign="middle"><span class="STYLE4">0.98</span></td>
            <td align="left" valign="middle"><a href="<%=webpath%>hotelinfo.asp?cityid=321&hotelid=7534" target="_blank"><img src="images/yuding.gif" width="48" height="20" /></a></td>
          </tr>
        </table>
      </div>
      <div class="zhushi">���Ϲ����ľƵ�۸񲢷��������ڼ�����ռ۸����ռ۸���鿴�Ƶ���ϸҳ��</div>
    </div>
    <div class="hot">
      <div class="hot_jiu"><a href="<%=webpath%>hotellist.asp?cityid=321&lsid=3" target="_blank">��������</a>��<a href="<%=webpath%>hotellist.asp?cityid=321&lsid=2" target="_blank">����֮��</a>��<a href="<%=webpath%>hotellist.asp?cityid=321&lsid=1" target="_blank">���</a> <a href="<%=webpath%>hotellist.asp?cityid=321&lsid=7" target="_blank">���ֺ�̩</a>��<a href="<%=webpath%>hotellist.asp?cityid=321&lsid=101">����֮��</a>��<a href="<%=webpath%>hotellist.asp?cityid=321&lsid=6" target="_blank">Ī̩</a> <a href="<%=webpath%>hotellist.asp?cityid=321&lsid=10" target="_blank">���ϼ�԰</a>��<a href="<%=webpath%>hotellist.asp?cityid=321&lsid=11" target="_blank">��ԷE��</a>��<a href="<%=webpath%>hotellist.asp?cityid=321&lsid=17" target="_blank">����</a> <a href="<%=webpath%>hotellist.asp?cityid=321&lsid=71" target="_blank">���׾Ƶ�</a>��<a href="<%=webpath%>hotellist.asp?cityid=321&lsid=58" target="_blank">��������</a>��<a href="<%=webpath%>hotellist.asp?cityid=321&lsid=49" target="_blank">�ǳ�</a></div>
      <div class="more"><img src="images/more_02.jpg" border="0" usemap="#Map" href="<%=webpath%>search.asp" />
        <map name="Map" id="Map">
          <area shape="rect" coords="197,3,302,36" href="<%=webpath%>search.asp" />
        </map>
      </div>
      <div class="hot_news">
        <ul>
          <li><a href="<%=webpath%>ditie.asp">�Ϻ�����վ�����Ƶ�<font color="#FF3300">[��]</font></a></li>
          <li><a href="<%=webpath%>zhanguan.asp?cityid=321">�Ϻ�չ�ݸ����Ƶ�</a></li>
          <li><a href="<%=webpath%>jiaotong.asp?lei=2&cityid=321">�Ϻ�����վ�����Ƶ�</a></li>
          <li><a href="<%=webpath%>jiaotong.asp?lei=1&cityid=321">�Ϻ���վ�����Ƶ�</a></li>
          <li><a href="<%=webpath%>jiaotong.asp?lei=3&cityid=321">�Ϻ����������Ƶ�</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="sh">
    <ul>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u9646%u5BB6%u5634" target="_blank"><img src="images/lujiazui.jpg" />�Ϻ�½����</a></li>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u5357%u4EAC%u8DEF" target="_blank"><img src="images/nanjing.jpg" />�Ϻ��Ͼ�·</a></li>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u57CE%u968D%u5E99" target="_blank"><img src="images/chenghuang.jpg" />�Ϻ��ǻ���</a></li>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u73AF%u7403%u91D1%u878D%u4E2D%u5FC3" target="_blank"><img src="images/huanqiu.jpg" />�����������</a></li>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u91D1%u8302%u5927%u53A6" target="_blank"><img src="images/jinmao.jpg" />��ï����</a></li>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u4EBA%u6C11%u5E7F%u573A" target="_blank"><img src="images/renmin.jpg" />����㳡</a></li>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u4E0A%u6D77%u535A%u7269%u9986" target="_blank"><img src="images/bowuguan.jpg" />�Ϻ������</a></li>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u5B59%u4E2D%u5C71%u6545%u5C45" target="_blank"><img src="images/sunzhongshan.jpg" />����ɽ�ʾӼ����</a></li>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u4E0A%u6D77%u79D1%u6280%u9986" target="_blank"><img src="images/kejiguan.jpg" />�Ϻ��Ƽ���</a></li>
      <li><a href="<%=webpath%>hotellist.asp?cityid=321&rank=0&key=%u9526%u6C5F%u4E50%u56ED" target="_blank"><img src="images/jinjiang.jpg" />������԰</a></li>
    </ul>
  </div>

    <!--#include file="../../inc/footer.asp" -->

</div>
</body>
</html>
<%Destroy%>