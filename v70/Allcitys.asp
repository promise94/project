<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim rurl,cityid,cityname%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>全国特价酒店预订 全国酒店城市大全-<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
<div class="main_content2">
    <h2>全国特价酒店预订 全国酒店城市大全</h2>
    <div class="nation">
      <ul>
        <li class="f14"><strong>A</strong></li>
        <li><a href="<%=webpath%>index/36.html">安庆</a></li>
        <li><a href="<%=webpath%>index/150.html">安阳</a></li>
        <li><a href="<%=webpath%>index/322.html">阿坝</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>B</strong></li>
        <li><a href="<%=webpath%>index/53.html">北京</a></li>
        <li><a href="<%=webpath%>index/139.html">保定</a></li>
        <li><a href="<%=webpath%>index/99.html">北海</a></li>
        <li><a href="<%=webpath%>index/261.html">包头</a></li>
        <li><a href="<%=webpath%>index/37.html">蚌埠</a></li>
        <li><a href="<%=webpath%>index/312.html">宝鸡</a></li>
        <li><a href="<%=webpath%>index/283.html">滨州</a></li>
        <li><a href="<%=webpath%>index/63.html">白银</a></li>
        <li><a href="<%=webpath%>index/260.html">巴彦淖尔盟</a></li>
        <li><a href="<%=webpath%>index/353.html">巴音郭楞</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>C</strong></li>
        <li><a href="<%=webpath%>index/324.html">成都</a></li>
        <li><a href="<%=webpath%>index/199.html">长沙</a></li>
        <li><a href="<%=webpath%>index/394.html">重庆</a></li>
        <li><a href="<%=webpath%>index/221.html">常州</a></li>
        <li><a href="<%=webpath%>index/214.html">长春</a></li>
        <li><a href="<%=webpath%>index/141.html">承德</a></li>
        <li><a href="<%=webpath%>index/200.html">郴州</a></li>
        <li><a href="<%=webpath%>index/77.html">潮州</a></li>
        <li><a href="<%=webpath%>index/198.html">常德</a></li>
        <li><a href="<%=webpath%>index/38.html">巢湖</a></li>
        <li><a href="<%=webpath%>index/39.html">池州</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>D</strong></li>
        <li><a href="<%=webpath%>index/248.html">大连</a></li>
        <li><a href="<%=webpath%>index/78.html">东莞</a></li>
        <li><a href="<%=webpath%>index/249.html">丹东</a></li>
        <li><a href="<%=webpath%>index/369.html">大理</a></li>
        <li><a href="<%=webpath%>index/285.html">东营</a></li>
        <li><a href="<%=webpath%>index/301.html">大同</a></li>
        <li><a href="<%=webpath%>index/168.html">大庆</a></li>
        <li><a href="<%=webpath%>index/326.html">德阳</a></li>
        <li><a href="<%=webpath%>index/284.html">德州</a></li>
        <li><a href="<%=webpath%>index/371.html">迪庆</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>F</strong></li>
        <li><a href="<%=webpath%>index/54.html">福州</a></li>
        <li><a href="<%=webpath%>index/79.html">佛山</a></li>
        <li><a href="<%=webpath%>index/41.html">阜阳</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>G</strong></li>
        <li><a href="<%=webpath%>index/80.html">广州</a></li>
        <li><a href="<%=webpath%>index/102.html">桂林</a></li>
        <li><a href="<%=webpath%>index/114.html">贵阳</a></li>
        <li><a href="<%=webpath%>index/329.html">广元</a></li>
        <li><a href="<%=webpath%>index/328.html">广安</a></li>
        <li><a href="<%=webpath%>index/235.html">赣州</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>H</strong></li>
        <li><a href="<%=webpath%>index/383.html">杭州</a></li>
        <li><a href="<%=webpath%>index/170.html">哈尔滨</a></li>
        <li><a href="<%=webpath%>index/127.html">海口</a></li>
        <li><a href="<%=webpath%>index/42.html">合肥</a></li>
        <li><a href="<%=webpath%>index/264.html">呼和浩特</a></li>
        <li><a href="<%=webpath%>index/82.html">惠州</a></li>
        <li><a href="<%=webpath%>index/222.html">淮安</a></li>
        <li><a href="<%=webpath%>index/45.html">黄山</a></li>
        <li><a href="<%=webpath%>index/201.html">衡阳</a></li>
        <li><a href="<%=webpath%>index/384.html">湖州</a></li>
        <li><a href="<%=webpath%>index/81.html">河源</a></li>
        <li><a href="<%=webpath%>index/252.html">葫芦岛</a></li>
        <li><a href="<%=webpath%>index/286.html">菏泽</a></li>
        <li><a href="<%=webpath%>index/202.html">怀化</a></li>
        <li><a href="<%=webpath%>index/143.html">衡水</a></li>
        <li><a href="<%=webpath%>index/279.html">海西</a></li>
        <li><a href="<%=webpath%>index/171.html">鹤岗</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>J</strong></li>
        <li><a href="<%=webpath%>index/287.html">济南</a></li>
        <li><a href="<%=webpath%>index/385.html">嘉兴</a></li>
        <li><a href="<%=webpath%>index/83.html">江门</a></li>
        <li><a href="<%=webpath%>index/386.html">金华</a></li>
        <li><a href="<%=webpath%>index/288.html">济宁</a></li>
        <li><a href="<%=webpath%>index/238.html">九江</a></li>
        <li><a href="<%=webpath%>index/215.html">吉林</a></li>
        <li><a href="<%=webpath%>index/153.html">焦作</a></li>
        <li><a href="<%=webpath%>index/303.html">晋中</a></li>
        <li><a href="<%=webpath%>index/236.html">吉安</a></li>
        <li><a href="<%=webpath%>index/253.html">锦州</a></li>
        <li><a href="<%=webpath%>index/186.html">荆州</a></li>
        <li><a href="<%=webpath%>index/237.html">景德镇</a></li>
        <li><a href="<%=webpath%>index/174.html">佳木斯</a></li>
        <li><a href="<%=webpath%>index/152.html">济源</a></li>
        <li><a href="<%=webpath%>index/68.html">酒泉</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>K</strong></li>
        <li><a href="<%=webpath%>index/373.html">昆明</a></li>
        <li><a href="<%=webpath%>index/154.html">开封</a></li>
        <li><a href="<%=webpath%>index/358.html">喀什</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>L</strong></li>
        <li><a href="<%=webpath%>index/69.html">兰州</a></li>
        <li><a href="<%=webpath%>index/374.html">丽江</a></li>
        <li><a href="<%=webpath%>index/155.html">洛阳</a></li>
        <li><a href="<%=webpath%>index/223.html">连云港</a></li>
        <li><a href="<%=webpath%>index/55.html">龙岩</a></li>
        <li><a href="<%=webpath%>index/346.html">拉萨</a></li>
        <li><a href="<%=webpath%>index/291.html">临沂</a></li>
        <li><a href="<%=webpath%>index/289.html">莱芜</a></li>
        <li><a href="<%=webpath%>index/144.html">廊坊</a></li>
        <li><a href="<%=webpath%>index/304.html">临汾</a></li>
        <li><a href="<%=webpath%>index/107.html">柳州</a></li>
        <li><a href="<%=webpath%>index/387.html">丽水</a></li>
        <li><a href="<%=webpath%>index/330.html">乐山</a></li>
        <li><a href="<%=webpath%>index/290.html">聊城</a></li>
        <li><a href="<%=webpath%>index/331.html">凉山</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>M</strong></li>
        <li><a href="<%=webpath%>index/47.html">马鞍山</a></li>
        <li><a href="<%=webpath%>index/85.html">茂名</a></li>
        <li><a href="<%=webpath%>index/332.html">眉山</a></li>
        <li><a href="<%=webpath%>index/175.html">牡丹江</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>N</strong></li>
        <li><a href="<%=webpath%>index/224.html">南京</a></li>
        <li><a href="<%=webpath%>index/108.html">南宁</a></li>
        <li><a href="<%=webpath%>index/388.html">宁波</a></li>
        <li><a href="<%=webpath%>index/239.html">南昌</a></li>
        <li><a href="<%=webpath%>index/225.html">南通</a></li>
        <li><a href="<%=webpath%>index/56.html">南平</a></li>
        <li><a href="<%=webpath%>index/156.html">南阳</a></li>
        <li><a href="<%=webpath%>index/335.html">内江</a></li>
        <li><a href="<%=webpath%>index/57.html">宁德</a></li>
        <li><a href="<%=webpath%>index/334.html">南充</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>P</strong></li>
        <li><a href="<%=webpath%>index/255.html">盘锦</a></li>
        <li><a href="<%=webpath%>index/336.html">攀枝花</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>Q</strong></li>
        <li><a href="<%=webpath%>index/292.html">青岛</a></li>
        <li><a href="<%=webpath%>index/145.html">秦皇岛</a></li>
        <li><a href="<%=webpath%>index/59.html">泉州</a></li>
        <li><a href="<%=webpath%>index/177.html">齐齐哈尔</a></li>
        <li><a href="<%=webpath%>index/131.html">琼海</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>R</strong></li>
        <li><a href="<%=webpath%>index/293.html">日照</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>S</strong></li>
        <li><a href="<%=webpath%>index/321.html">上海</a></li>
        <li><a href="<%=webpath%>index/91.html">深圳</a></li>
        <li><a href="<%=webpath%>index/226.html">苏州</a></li>
        <li><a href="<%=webpath%>index/133.html">三亚</a></li>
        <li><a href="<%=webpath%>index/256.html">沈阳</a></li>
        <li><a href="<%=webpath%>index/146.html">石家庄</a></li>
        <li><a href="<%=webpath%>index/389.html">绍兴</a></li>
        <li><a href="<%=webpath%>index/90.html">韶关</a></li>
        <li><a href="<%=webpath%>index/88.html">汕头</a></li>
        <li><a href="<%=webpath%>index/158.html">三门峡</a></li>
        <li><a href="<%=webpath%>index/241.html">上饶</a></li>
        <li><a href="<%=webpath%>index/227.html">宿迁</a></li>
        <li><a href="<%=webpath%>index/89.html">汕尾</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>T</strong></li>
        <li><a href="<%=webpath%>index/343.html">天津</a></li>
        <li><a href="<%=webpath%>index/307.html">太原</a></li>
        <li><a href="<%=webpath%>index/147.html">唐山</a></li>
        <li><a href="<%=webpath%>index/294.html">泰安</a></li>
        <li><a href="<%=webpath%>index/228.html">泰州</a></li>
        <li><a href="<%=webpath%>index/390.html">台州</a></li>
        <li><a href="<%=webpath%>index/219.html">通化</a></li>
        <li><a href="<%=webpath%>index/266.html">通辽</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>W</strong></li>
        <li><a href="<%=webpath%>index/192.html">武汉</a></li>
        <li><a href="<%=webpath%>index/229.html">无锡</a></li>
        <li><a href="<%=webpath%>index/391.html">温州</a></li>
        <li><a href="<%=webpath%>index/295.html">威海</a></li>
        <li><a href="<%=webpath%>index/364.html">乌鲁木齐</a></li>
        <li><a href="<%=webpath%>index/50.html">芜湖</a></li>
        <li><a href="<%=webpath%>index/296.html">潍坊</a></li>
        <li><a href="<%=webpath%>index/135.html">万宁</a></li>
        <li><a href="<%=webpath%>index/110.html">梧州</a></li>
        <li><a href="<%=webpath%>index/137.html">五指山</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>X</strong></li>
        <li><a href="<%=webpath%>index/317.html">西安</a></li>
        <li><a href="<%=webpath%>index/61.html">厦门</a></li>
        <li><a href="<%=webpath%>index/281.html">西宁</a></li>
        <li><a href="<%=webpath%>index/230.html">徐州</a></li>
        <li><a href="<%=webpath%>index/205.html">湘潭</a></li>
        <li><a href="<%=webpath%>index/195.html">襄樊</a></li>
        <li><a href="<%=webpath%>index/160.html">新乡</a></li>
        <li><a href="<%=webpath%>index/196.html">孝感</a></li>
        <li><a href="<%=webpath%>index/194.html">咸宁</a></li>
        <li><a href="<%=webpath%>index/380.html">西双版纳</a></li>
        <li><a href="<%=webpath%>index/206.html">湘西</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>Y</strong></li>
        <li><a href="<%=webpath%>index/297.html">烟台</a></li>
        <li><a href="<%=webpath%>index/232.html">扬州</a></li>
        <li><a href="<%=webpath%>index/197.html">宜昌</a></li>
        <li><a href="<%=webpath%>index/274.html">银川</a></li>
        <li><a href="<%=webpath%>index/231.html">盐城</a></li>
        <li><a href="<%=webpath%>index/309.html">阳泉</a></li>
        <li><a href="<%=webpath%>index/209.html">岳阳</a></li>
        <li><a href="<%=webpath%>index/207.html">益阳</a></li>
        <li><a href="<%=webpath%>index/92.html">阳江</a></li>
        <li><a href="<%=webpath%>index/258.html">营口</a></li>
        <li><a href="<%=webpath%>index/319.html">延安</a></li>
        <li><a href="<%=webpath%>index/310.html">运城</a></li>
        <li><a href="<%=webpath%>index/244.html">鹰潭</a></li>
        <li><a href="<%=webpath%>index/338.html">雅安</a></li>
        <li><a href="<%=webpath%>index/208.html">永州</a></li>
        <li><a href="<%=webpath%>index/220.html">延边</a></li>
        <li><a href="<%=webpath%>index/243.html">宜春</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>Z</strong></li>
        <li><a href="<%=webpath%>index/163.html">郑州</a></li>
        <li><a href="<%=webpath%>index/97.html">珠海</a></li>
        <li><a href="<%=webpath%>index/96.html">中山</a></li>
        <li><a href="<%=webpath%>index/95.html">肇庆</a></li>
        <li><a href="<%=webpath%>index/392.html">舟山</a></li>
        <li><a href="<%=webpath%>index/210.html">张家界</a></li>
        <li><a href="<%=webpath%>index/233.html">镇江</a></li>
        <li><a href="<%=webpath%>index/299.html">淄博</a></li>
        <li><a href="<%=webpath%>index/94.html">湛江</a></li>
        <li><a href="<%=webpath%>index/211.html">株洲</a></li>
        <li><a href="<%=webpath%>index/62.html">漳州</a></li>
        <li><a href="<%=webpath%>index/165.html">驻马店</a></li>
      </ul>
      <br class="clearfloat" />
    </div>
  </div>
  </div>  
  
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>