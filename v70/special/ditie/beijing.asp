<!--#include file="../../inc/conn.asp" -->
<%Const ItemPath="../../"%>
<!--#include file="../../inc/Main_function.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>北京地铁线路图 北京地铁附近酒店-<%=doname%></title>
<link type="text/css" href="css/bus_base.css" rel="stylesheet">
</head>
<body>
<DIV  class="content">
  <!--地图热点-->
  <IMG src="images/bjditie.gif" useMap=#Map border=0>
  <MAP id=Map name=Map>
    <AREA title=天通苑北地铁站 shape=RECT target=_blank 
  coords=802,7,868,25 
  href="<%=webpath%>hotellist.asp?cityid=53&key=天通苑北">
    <AREA title=天通苑地铁站 
  shape=RECT target=_blank coords=803,37,857,53 
  href="<%=webpath%>hotellist.asp?cityid=53&key=天通苑">
    <AREA title=天通苑南地铁站 
  shape=RECT target=_blank coords=802,65,868,83 
  href="<%=webpath%>hotellist.asp?cityid=53&key=天通苑南">
    <area shape="poly" coords="802,111,815,107,819,95,860,92,856,108,821,111,815,126,802,124" href="<%=webpath%>hotellist.asp?cityid=53&key=立水桥" target="_blank" />
<AREA title=立水桥南地铁站 shape=RECT 
  target=_blank coords=802,137,868,156 
  href="<%=webpath%>hotellist.asp?cityid=53&key=立水桥南">
    <AREA title=北苑路北地铁站 
  shape=RECT target=_blank coords=803,165,868,182 
  href="<%=webpath%>hotellist.asp?cityid=53&key=北苑路北">
    <AREA title=大屯路东地铁站 
  shape=RECT target=_blank coords=801,192,868,210 
  href="<%=webpath%>hotellist.asp?cityid=53&key=大屯路东">
    <AREA title=惠新西街北口地铁站 
  shape=RECT target=_blank coords=802,221,889,237 
  href="<%=webpath%>hotellist.asp?cityid=53&key=惠新西街北口">
    <area shape="poly" coords=801,254,814,247,821,259,827,267,884,267,887,281,819,279,801,257 
  href="<%=webpath%>hotellist.asp?cityid=53&key=惠新西街南口" target="_blank" >
    <AREA title=和平西桥地铁站 shape=RECT target=_blank 
  coords=801,285,870,304 
  href="<%=webpath%>hotellist.asp?cityid=53&key=和平西桥">
    <AREA title=和平里北街地铁站 
  shape=RECT target=_blank coords=802,309,881,330 
  href="<%=webpath%>hotellist.asp?cityid=53&key=和平里北街">
    <area shape="poly" coords=800,355,810,346,818,338,854,334,856,349,823,354,812,367,799,356 
  href="<%=webpath%>hotellist.asp?cityid=53&key=雍和宫" target="_blank" />
    <AREA title=北新桥地铁站 shape=RECT target=_blank 
  coords=801,377,857,394 
  href="<%=webpath%>hotellist.asp?cityid=53&key=北新桥">
    <AREA title=张自忠路地铁站 
  shape=RECT target=_blank coords=802,404,866,421 
  href="<%=webpath%>hotellist.asp?cityid=53&key=张自忠路">
    <AREA title=东四地铁站 
  shape=RECT target=_blank coords=803,434,844,450 
  href="<%=webpath%>hotellist.asp?cityid=53&key=东四">
    <AREA title=灯市口地铁站 
  shape=RECT target=_blank coords=801,466,854,482 
  href="<%=webpath%>hotellist.asp?cityid=53&key=灯市口">
    <AREA title=磁器口地铁站 
  shape=RECT target=_blank coords=801,578,856,596 
  href="<%=webpath%>hotellist.asp?cityid=53&key=磁器口">
    <AREA title=天坛东门地铁站 
  shape=RECT target=_blank coords=801,607,869,625 
  href="<%=webpath%>hotellist.asp?cityid=53&key=天坛东门">
    <AREA title=蒲黄榆地铁站 
  shape=RECT target=_blank coords=802,639,858,656 
  href="<%=webpath%>hotellist.asp?cityid=53&key=蒲黄榆">
    <AREA title=刘家窑地铁站 
  shape=RECT target=_blank coords=801,667,857,684 
  href="<%=webpath%>hotellist.asp?cityid=53&key=刘家窑">
    <AREA title=宋家庄地铁站 
  shape=RECT target=_blank coords=801,704,857,723 
  href="<%=webpath%>hotellist.asp?cityid=53&key=宋家庄">
    <AREA title=北苑城铁站 
  shape=RECT target=_blank coords=883,145,924,162 
  href="<%=webpath%>hotellist.asp?cityid=53&key=北苑">
    <AREA title=望京西城铁站 
  shape=RECT target=_blank coords=883,195,933,212 
  href="<%=webpath%>hotellist.asp?cityid=53&key=望京西">
    <AREA title=光熙门城铁站 
  shape=RECT target=_blank coords=882,298,935,314 
  href="<%=webpath%>hotellist.asp?cityid=53&key=光熙门">
    <AREA title=柳芳城铁站 
  shape=RECT target=_blank coords=882,337,922,353 
  href="<%=webpath%>hotellist.asp?cityid=53&key=柳芳">
    <AREA title=东四十条地铁站 
  shape=RECT target=_blank coords=863,420,927,432 
  href="<%=webpath%>hotellist.asp?cityid=53&key=东四十条">
    <AREA title=朝阳门地铁站 
  shape=RECT target=_blank coords=863,456,916,470 
  href="<%=webpath%>hotellist.asp?cityid=53&key=朝阳门">
    <AREA title=亮马桥地铁站 
  shape=RECT target=_blank coords=956,328,1015,343 
  href="<%=webpath%>hotellist.asp?cityid=53&key=亮马桥">
    <AREA title=农业展览馆地铁站 
  shape=RECT target=_blank coords=957,364,1035,378 
  href="<%=webpath%>hotellist.asp?cityid=53&key=农业展览馆">
    <AREA title=团结湖地铁站 
  shape=RECT target=_blank coords=956,398,1016,413 
  href="<%=webpath%>hotellist.asp?cityid=53&key=团结湖">
    <AREA title=呼家楼地铁站 
  shape=RECT target=_blank coords=955,433,1013,448 
  href="<%=webpath%>hotellist.asp?cityid=53&key=呼家楼">
    <AREA title=金台夕照地铁站 
  shape=RECT target=_blank coords=957,466,1025,482 
  href="<%=webpath%>hotellist.asp?cityid=53&key=金台夕照">
    <AREA title=双井地铁站 
  shape=RECT target=_blank coords=956,543,1000,559 
  href="<%=webpath%>hotellist.asp?cityid=53&key=双井">
    <AREA title=劲松地铁站 
  shape=RECT target=_blank coords=956,577,1001,591 
  href="<%=webpath%>hotellist.asp?cityid=53&key=劲松">
    <AREA title=西二旗城铁站 
  shape=RECT target=_blank coords=506,137,560,153 
  href="<%=webpath%>hotellist.asp?cityid=53&key=西二旗">
    <AREA title=上地城铁站 shape=RECT 
  target=_blank coords=520,163,559,179 
  href="<%=webpath%>hotellist.asp?cityid=53&key=上地">
    <AREA title=五道口城铁站 
  shape=RECT target=_blank coords=508,208,558,224 
  href="<%=webpath%>hotellist.asp?cityid=53&key=五道口">
    <AREA title=大钟寺城铁站 
  shape=RECT target=_blank coords=505,319,560,333 
  href="<%=webpath%>hotellist.asp?cityid=53&key=大钟寺">
    <AREA title=车公庄地铁站 
  shape=RECT target=_blank coords=519,414,574,429 
  href="<%=webpath%>hotellist.asp?cityid=53&key=车公庄">
    <AREA title=阜成门地铁站 
  shape=RECT target=_blank coords=519,454,572,468 
  href="<%=webpath%>hotellist.asp?cityid=53&key=阜成门">
    <AREA title=公益西桥地铁站 
  shape=RECT target=_blank coords=626,761,690,776 
  href="<%=webpath%>hotellist.asp?cityid=53&key=公益西桥">
    <AREA title=角门西地铁站 
  shape=RECT target=_blank coords=625,727,679,741 
  href="<%=webpath%>hotellist.asp?cityid=53&key=角门西">
    <AREA title=马家堡地铁站 
  shape=RECT target=_blank coords=626,691,678,705 
  href="<%=webpath%>hotellist.asp?cityid=53&key=马家堡">
    <AREA title=北京南站地铁站 
  shape=RECT target=_blank coords=625,656,689,672 
  href="<%=webpath%>hotellist.asp?cityid=53&key=北京南站">
    <AREA title=陶然亭地铁站 
  shape=RECT target=_blank coords=625,621,678,636 
  href="<%=webpath%>hotellist.asp?cityid=53&key=陶然亭">
    <AREA title=菜市口地铁站 
  shape=RECT target=_blank coords=625,586,678,601 
  href="<%=webpath%>hotellist.asp?cityid=53&key=菜市口">
    <AREA title=灵境胡同地铁站 
  shape=RECT target=_blank coords=624,471,692,484 
  href="<%=webpath%>hotellist.asp?cityid=53&key=灵境胡同">
    <AREA title=西四地铁站 
  shape=RECT target=_blank coords=626,440,666,456 
  href="<%=webpath%>hotellist.asp?cityid=53&key=西四">
    <AREA title=平安里地铁站 shape=RECT 
  target=_blank coords=626,413,676,428 
  href="<%=webpath%>hotellist.asp?cityid=53&key=平安里">
    <AREA title=国家图书馆地铁站 
  shape=RECT target=_blank coords=395,376,471,389 
  href="<%=webpath%>hotellist.asp?cityid=53&key=国家图书馆">
    <AREA title=魏公村地铁站 
  shape=RECT target=_blank coords=409,332,462,345 
  href="<%=webpath%>hotellist.asp?cityid=53&key=魏公村">
    <AREA title=人民大学地铁站 
  shape=RECT target=_blank coords=402,299,464,311 
  href="<%=webpath%>hotellist.asp?cityid=53&key=人民大学">
    <AREA title=中关村地铁站 
  shape=RECT target=_blank coords=411,205,464,218 
  href="<%=webpath%>hotellist.asp?cityid=53&key=中关村">
    <AREA title=北京大学东门地铁站 
  shape=RECT target=_blank coords=379,178,463,191 
  href="<%=webpath%>hotellist.asp?cityid=53&key=北京大学东门">
    <AREA 
  title=圆明园地铁站 shape=RECT target=_blank coords=410,151,463,166 
  href="<%=webpath%>hotellist.asp?cityid=53&key=圆明园">
    <AREA title=古城路地铁站 
  shape=POLY target=_blank 
  coords=67,513,74,505,83,511,93,518,96,531,60,531,58,521 
  href="<%=webpath%>hotellist.asp?cityid=53&key=古城路">
    <AREA title=八角游乐园地铁站 
  shape=POLY target=_blank 
  coords=128,505,122,515,104,519,101,532,161,532,161,518,129,506 
  href="<%=webpath%>hotellist.asp?cityid=53&key=八角游乐园">
    <AREA title=苹果园地铁站 
  shape=RECT target=_blank coords=7,470,64,486 
  href="<%=webpath%>hotellist.asp?cityid=53&key=苹果园">
    <AREA title=八宝山地铁站 
  shape=POLY target=_blank 
  coords=185,505,182,514,172,522,171,532,207,533,209,524,190,505 
  href="<%=webpath%>hotellist.asp?cityid=53&key=八宝山">
    <AREA title=玉泉路地铁站 
  shape=POLY target=_blank 
  coords=230,505,230,511,218,519,218,531,258,532,259,522,245,512,241,505 
  href="<%=webpath%>hotellist.asp?cityid=53&key=玉泉路">
    <AREA title=五棵松地铁站 
  shape=POLY target=_blank 
  coords=279,506,286,504,293,510,302,521,302,531,267,531,267,520,280,508 
  href="<%=webpath%>hotellist.asp?cityid=53&key=五棵松">
    <AREA title=万寿路地铁站 
  shape=POLY target=_blank 
  coords=324,505,324,514,313,517,313,531,344,531,347,521,337,511,332,507 
  href="<%=webpath%>hotellist.asp?cityid=53&key=万寿路">
    <AREA title=公主坟地铁站 
  shape=POLY target=_blank 
  coords=372,505,365,512,358,517,355,526,360,531,385,531,393,530,393,519 
  href="<%=webpath%>hotellist.asp?cityid=53&key=公主坟">
    <AREA title=军事博物馆地铁站 
  shape=POLY target=_blank 
  coords=423,504,418,513,399,517,399,530,451,531,457,529,458,522,436,513,431,504 
  href="<%=webpath%>hotellist.asp?cityid=53&key=军事博物馆">
    <AREA title=木樨地地铁站 
  shape=POLY target=_blank 
  coords=479,506,477,515,465,516,467,529,502,530,502,522,491,516,491,507,480,504 
  href="<%=webpath%>hotellist.asp?cityid=53&key=木樨地">
    <AREA title=南礼士路地铁站 
  shape=POLY target=_blank 
  coords=525,504,524,515,513,515,511,525,513,529,559,531,560,523,545,516,534,504,528,504 
  href="<%=webpath%>hotellist.asp?cityid=53&key=南礼士路">
    <area shape="poly" target=_blank 
  coords=559,509,566,501,578,509,584,516,607,518,610,527,600,530,577,529,566,518,558,510 
  href="<%=webpath%>hotellist.asp?cityid=53&key=复兴门">
    <AREA title=长椿街地铁站 shape=POLY target=_blank 
  coords=536,543,565,543,576,537,581,539,583,548,576,556,535,555,535,544 
  href="<%=webpath%>hotellist.asp?cityid=53&key=长椿街">
    <area shape="poly" target=_blank 
  coords=622,552,629,544,639,545,637,556,629,569,618,570,593,568,591,558 
  href="<%=webpath%>hotellist.asp?cityid=53&key=宣武门">
    <AREA shape=POLY target=_blank 
  coords=624,507,638,500,642,490,664,494,665,503,646,507,640,516,630,518 
  href="<%=webpath%>hotellist.asp?cityid=53&key=西单">
    <AREA title=天安门西地铁站 shape=POLY target=_blank 
  coords=669,513,671,505,679,505,685,511,691,518,704,519,701,530,697,531,679,530,652,529,653,519,669,512 
  href="<%=webpath%>hotellist.asp?cityid=53&key=天安门西">
    <AREA title=和平门地铁站 
  shape=POLY target=_blank 
  coords=688,550,692,544,700,545,703,555,719,557,718,567,709,569,677,567,677,559 
  href="<%=webpath%>hotellist.asp?cityid=53&key=和平门">
    <AREA title=前门地铁站 
  shape=POLY target=_blank 
  coords=748,554,752,544,760,547,763,555,773,560,771,570,746,569,739,559 
  href="<%=webpath%>hotellist.asp?cityid=53&key=前门">
    <AREA title=天安门东地铁站 
  shape=POLY target=_blank 
  coords=723,506,720,516,709,520,709,530,755,530,755,522,740,515,730,506 
  href="<%=webpath%>hotellist.asp?cityid=53&key=天安门东">
    <AREA title=王府井地铁站 
  shape=POLY target=_blank 
  coords=769,514,773,505,782,504,784,517,792,517,795,527,794,533,760,531,758,522,770,514 
  href="<%=webpath%>hotellist.asp?cityid=53&key=王府井">
    <area shape="poly" target=_blank coords=801,550,807,543,820,548,832,559,854,557,855,568,821,570 
  href="<%=webpath%>hotellist.asp?cityid=53&key=崇文门">
    <AREA title=北京站地铁站 shape=POLY target=_blank 
  coords=850,536,865,542,893,544,901,547,899,558,865,558,847,545 
  href="<%=webpath%>hotellist.asp?cityid=53&key=北京站">
    <area shape="poly" coords=800,509,811,502,819,514,844,516,843,532,818,532,801,507 
  href="<%=webpath%>hotellist.asp?cityid=53&key=东单" target=_blank>
    <AREA shape=POLY target=_blank 
  coords=864,517,860,505,870,503,879,512,897,516,908,517,915,520,913,532,880,530 
  href="<%=webpath%>hotellist.asp?cityid=53&key=建国门">
    <AREA title=永安里地铁站 shape=POLY target=_blank 
  coords=927,509,935,506,940,516,954,519,954,530,944,531,918,531,919,522 
  href="<%=webpath%>hotellist.asp?cityid=53&key=永安里">
    <AREA shape=POLY target=_blank 
  coords=964,518,954,510,963,501,974,509,992,518,994,527,994,532,974,531,960,516 
  href="<%=webpath%>hotellist.asp?cityid=53&key=国贸">
    <AREA title=大望路地铁站 shape=POLY target=_blank 
  coords=1009,511,1011,505,1023,505,1026,515,1037,520,1035,531,1004,532,1003,528,1002,524 
  href="<%=webpath%>hotellist.asp?cityid=53&key=大望路">
    <AREA shape=POLY target=_blank 
  coords=1041,519,1046,505,1056,505,1061,521,1064,533,1063,540,1040,539 
  href="<%=webpath%>hotellist.asp?cityid=53&key=四惠">
    <AREA shape=POLY target=_blank 
  coords=1077,503,1085,502,1093,511,1094,521,1108,523,1107,537,1071,533,1068,523 
  href="<%=webpath%>hotellist.asp?cityid=53&key=四惠东">
    <AREA title=高碑店地铁站 shape=POLY target=_blank 
  coords=1126,522,1129,510,1140,510,1142,525,1151,525,1161,527,1158,541,1119,538,1120,528 
  href="<%=webpath%>hotellist.asp?cityid=53&key=高碑店">
    <AREA title=传媒大学地铁站 
  shape=POLY target=_blank 
  coords=1180,522,1183,511,1194,511,1198,523,1209,525,1216,530,1215,540,1167,538,1169,529 
  href="<%=webpath%>hotellist.asp?cityid=53&key=传媒大学">
    <AREA title=双桥地铁站 
  shape=POLY target=_blank 
  coords=1223,523,1228,510,1237,511,1242,523,1246,540,1223,539,1223,522 
  href="<%=webpath%>hotellist.asp?cityid=53&key==双桥">
    <AREA title=管庄地铁站 
  shape=POLY target=_blank 
  coords=1260,510,1272,510,1279,528,1279,539,1256,539,1257,526 
  href="<%=webpath%>hotellist.asp?cityid=53&key=管庄">
    <AREA title=八里桥地铁站 
  shape=POLY target=_blank 
  coords=1283,526,1282,539,1315,540,1319,528,1323,514,1316,509,1303,523 
  href="<%=webpath%>hotellist.asp?cityid=53&key=八里桥">
    <AREA title=通州北苑地铁站 
  shape=RECT target=_blank coords=1293,561,1356,578 
  href="<%=webpath%>hotellist.asp?cityid=53&key=通州北苑">
    <AREA title=果园地铁站 
  shape=RECT target=_blank coords=1327,589,1372,604 
  href="<%=webpath%>hotellist.asp?cityid=53&key=果园">
    <AREA title=九棵树地铁站 
  shape=RECT target=_blank coords=1335,616,1386,633 
  href="<%=webpath%>hotellist.asp?cityid=53&key=九棵树">
    <AREA title=梨园地铁站 
  shape=RECT target=_blank coords=1359,646,1406,661 
  href="<%=webpath%>hotellist.asp?cityid=53&key=梨园">
    <AREA title=临河里地铁站 
  shape=RECT target=_blank coords=1372,676,1424,693 
  href="<%=webpath%>hotellist.asp?cityid=53&key=临河里">
    <AREA title=土桥地铁站 
  shape=RECT target=_blank coords=1401,710,1442,725 
  href="<%=webpath%>hotellist.asp?cityid=53&key=土桥">
    <AREA  shape=POLY target=_blank 
  coords=864,392,860,384,865,375,879,382,890,393,915,392,916,407,878,407,873,393 
  href="<%=webpath%>hotellist.asp?cityid=53&key=东直门">
    <AREA title=安河桥北地铁站 shape=POLY 
  target=_blank 
  coords=257,154,271,149,274,140,285,142,290,153,303,154,306,166,255,166 
  href="<%=webpath%>hotellist.asp?cityid=53&key=安河桥北">
    <AREA title=北宫门地铁站 
  shape=POLY target=_blank 
  coords=317,153,326,151,328,141,338,140,344,153,354,155,355,168,316,167 
  href="<%=webpath%>hotellist.asp?cityid=53&key=北宫门">
    <AREA title=西苑地铁站 
  shape=POLY target=_blank 
  coords=378,141,391,143,397,154,398,166,372,167,371,154 
  href="<%=webpath%>hotellist.asp?cityid=53&key==西苑">
    <AREA title=龙泽城铁站 shape=POLY 
  target=_blank coords=579,94,603,94,602,109,596,124,587,124,580,107 
  href="<%=webpath%>hotellist.asp?cityid=53&key=龙泽">
    <AREA title=回龙观城铁站 
  shape=POLY target=_blank 
  coords=619,94,619,109,629,109,630,121,640,123,647,109,658,110,658,94 
  href="<%=webpath%>hotellist.asp?cityid=53&key=回龙观">
    <AREA title=霍营城铁站 
  shape=POLY target=_blank coords=691,94,720,94,720,109,713,122,700,123,693,110 
  href="<%=webpath%>hotellist.asp?cityid=53&key=霍营">
    <AREA title=森林公园南门地铁站 
  shape=RECT target=_blank coords=712,147,801,163 
  href="<%=webpath%>hotellist.asp?cityid=53&key=森林公园南门">
    <AREA 
  title=奥林匹克公园地铁站 shape=RECT target=_blank coords=711,181,801,197 
  href="<%=webpath%>hotellist.asp?cityid=53&key=奥林匹克公园">
    <AREA 
  title=奥体中心地铁站 shape=RECT target=_blank coords=711,214,776,231 
  href="<%=webpath%>hotellist.asp?cityid=53&key=奥体中心">
    <AREA title=动物园地铁站 
  shape=POLY target=_blank 
  coords=497,364,536,363,537,376,519,389,510,391,497,376 
  href="<%=webpath%>hotellist.asp?cityid=53&key=动物园">
    <AREA shape=POLY target=_blank 
  coords=520,391,554,390,566,376,578,383,567,395,554,403,520,403 
  href="<%=webpath%>hotellist.asp?cityid=53&key=西直门">
    <AREA title=新街口地铁站 shape=RECT target=_blank 
  coords=620,383,676,398 
  href="<%=webpath%>hotellist.asp?cityid=53&key=新街口">
    <AREA title=巴沟地铁站 
  shape=POLY target=_blank 
  coords=358,259,361,248,372,248,377,262,379,281,354,281,354,266 
  href="<%=webpath%>hotellist.asp?cityid=53&key=巴沟">
    <AREA title=苏州街地铁站 shape=POLY 
  target=_blank 
  coords=399,262,403,250,414,251,418,261,428,265,428,280,389,278,390,266 
  href="<%=webpath%>hotellist.asp?cityid=53&key=苏州街">
    <AREA shape=POLY target=_blank 
  coords=454,264,444,250,402,247,402,235,449,235,462,247,469,257 
  href="<%=webpath%>hotellist.asp?cityid=53&key=海淀黄庄">
    <AREA title=知春里地铁站 shape=POLY target=_blank 
  coords=488,265,497,262,504,250,515,252,521,263,528,269,527,281,488,281 
  href="<%=webpath%>hotellist.asp?cityid=53&key=知春里">
    <AREA shape=POLY target=_blank 
  coords=507,235,544,236,552,247,562,254,554,264,540,251,507,249 
  href="<%=webpath%>hotellist.asp?cityid=53&key=知春路">
    <AREA title=西土城地铁站 shape=POLY target=_blank 
  coords=568,263,579,262,584,250,591,251,595,262,608,266,606,280,568,280 
  href="<%=webpath%>hotellist.asp?cityid=53&key=西土城">
    <AREA title=牡丹园地铁站 
  shape=POLY target=_blank 
  coords=623,261,629,249,642,257,651,268,651,280,614,279,613,270 
  href="<%=webpath%>hotellist.asp?cityid=53&key=牡丹园">
    <AREA title=健德门地铁站 
  shape=POLY target=_blank 
  coords=666,258,671,248,681,249,684,261,694,265,693,278,659,279,659,270 
  href="<%=webpath%>hotellist.asp?cityid=53&key=健德门">
    <AREA shape=POLY target=_blank 
  coords=700,266,707,266,713,251,724,251,729,265,739,265,736,279,701,279 
  href="<%=webpath%>hotellist.asp?cityid=53&key=北土城">
    <AREA title=安贞门地铁站 shape=POLY target=_blank 
  coords=755,264,765,264,768,250,778,251,779,262,792,263,792,279,755,279 
  href="<%=webpath%>hotellist.asp?cityid=53&key=安贞门">
    <AREA shape=POLY target=_blank 
  coords=881,255,892,248,901,264,931,264,931,280,897,278 
  href="<%=webpath%>hotellist.asp?cityid=53&key=芍药居">
    <AREA title=太阳宫地铁站 shape=POLY target=_blank 
  coords=939,255,951,245,954,239,988,239,987,252,962,252,948,263,941,253 
  href="<%=webpath%>hotellist.asp?cityid=53&key=太阳宫">
    <AREA shape=POLY target=_blank 
  coords=952,298,963,290,971,298,1013,298,1012,313,966,311 
  href="<%=webpath%>hotellist.asp?cityid=53&key=三元桥">
    <AREA title=积水潭地铁站 shape=POLY target=_blank 
  coords=593,332,632,332,631,347,620,351,613,363,607,360,604,351,594,346 
  href="<%=webpath%>hotellist.asp?cityid=53&key=积水潭">
    <AREA title=鼓楼大街地铁站 
  shape=POLY target=_blank 
  coords=651,332,700,332,701,346,684,348,679,363,671,362,664,350,651,345 
  href="<%=webpath%>hotellist.asp?cityid=53&key=鼓楼大街">
    <AREA title=安定门地铁站 shape=POLY 
  target=_blank 
  coords=708,333,748,333,746,348,735,350,730,361,721,362,718,349,708,345 
  href="<%=webpath%>hotellist.asp?cityid=53&key=安定门">
    
    <AREA title=2号航站楼 shape=POLY 
  coords=1009,143,1067,136,1097,136,1098,164,1089,173,1079,172,1061,159,1007,157
  href="<%=webpath%>hotellist.asp?cityid=53&key=2号航站楼">
    <AREA 
  title=3号航站楼 shape=POLY 
  coords=1113,138,1145,138,1150,145,1205,145,1206,160,1150,161,1139,171,1133,177,1127,177,1121,167,1113,167
  href="<%=webpath%>hotellist.asp?cityid=53&key=3号航站楼">
    
  </MAP>
  <!--地图热点END-->
</DIV>
<div class="foottitle">
  <h3><img src="images/blacktrain.gif" align="absmiddle" /> 地铁线路信息:</h3>
  <p>&nbsp; &nbsp; <img src="images/l1pic.gif" align="absmiddle"> 地铁1号线&nbsp;&nbsp; <img 
src="images/l2pic.gif" align="absmiddle"> 地铁2号线&nbsp;&nbsp; <img 
src="images/l4pic.gif" align="absmiddle"> 地铁4号线&nbsp;&nbsp; <img 
src="images/l5pic.gif" align="absmiddle"> 地铁5号线&nbsp; &nbsp; <img 
src="images/l8pic.gif" align="absmiddle"> 地铁8号线&nbsp; <img src="images/lapic.gif" align="absmiddle"> 机场线&nbsp; &nbsp; <img 
src="images/batong.gif" align="absmiddle"> 地铁八通线&nbsp; &nbsp; <img 
src="images/l10pic.gif" align="absmiddle"> 地铁10号线&nbsp; &nbsp; <img 
src="images/l13pic.gif" align="absmiddle"> 地铁13号线 </p>
</div>
</body>
</html>
<%Destroy%>