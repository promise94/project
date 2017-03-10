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
        <li><a href="<%=webpath%>city/?cityid=36">安庆</a></li>
        <li><a href="<%=webpath%>city/?cityid=150">安阳</a></li>
        <li><a href="<%=webpath%>city/?cityid=322">阿坝</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>B</strong></li>
        <li><a href="<%=webpath%>city/?cityid=53">北京</a></li>
        <li><a href="<%=webpath%>city/?cityid=139">保定</a></li>
        <li><a href="<%=webpath%>city/?cityid=99">北海</a></li>
        <li><a href="<%=webpath%>city/?cityid=261">包头</a></li>
        <li><a href="<%=webpath%>city/?cityid=37">蚌埠</a></li>
        <li><a href="<%=webpath%>city/?cityid=312">宝鸡</a></li>
        <li><a href="<%=webpath%>city/?cityid=283">滨州</a></li>
        <li><a href="<%=webpath%>city/?cityid=63">白银</a></li>
        <li><a href="<%=webpath%>city/?cityid=260">巴彦淖尔盟</a></li>
        <li><a href="<%=webpath%>city/?cityid=353">巴音郭楞</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>C</strong></li>
        <li><a href="<%=webpath%>city/?cityid=324">成都</a></li>
        <li><a href="<%=webpath%>city/?cityid=199">长沙</a></li>
        <li><a href="<%=webpath%>city/?cityid=394">重庆</a></li>
        <li><a href="<%=webpath%>city/?cityid=221">常州</a></li>
        <li><a href="<%=webpath%>city/?cityid=214">长春</a></li>
        <li><a href="<%=webpath%>city/?cityid=141">承德</a></li>
        <li><a href="<%=webpath%>city/?cityid=200">郴州</a></li>
        <li><a href="<%=webpath%>city/?cityid=77">潮州</a></li>
        <li><a href="<%=webpath%>city/?cityid=198">常德</a></li>
        <li><a href="<%=webpath%>city/?cityid=38">巢湖</a></li>
        <li><a href="<%=webpath%>city/?cityid=39">池州</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>D</strong></li>
        <li><a href="<%=webpath%>city/?cityid=248">大连</a></li>
        <li><a href="<%=webpath%>city/?cityid=78">东莞</a></li>
        <li><a href="<%=webpath%>city/?cityid=249">丹东</a></li>
        <li><a href="<%=webpath%>city/?cityid=369">大理</a></li>
        <li><a href="<%=webpath%>city/?cityid=285">东营</a></li>
        <li><a href="<%=webpath%>city/?cityid=301">大同</a></li>
        <li><a href="<%=webpath%>city/?cityid=168">大庆</a></li>
        <li><a href="<%=webpath%>city/?cityid=326">德阳</a></li>
        <li><a href="<%=webpath%>city/?cityid=284">德州</a></li>
        <li><a href="<%=webpath%>city/?cityid=371">迪庆</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>F</strong></li>
        <li><a href="<%=webpath%>city/?cityid=54">福州</a></li>
        <li><a href="<%=webpath%>city/?cityid=79">佛山</a></li>
        <li><a href="<%=webpath%>city/?cityid=41">阜阳</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>G</strong></li>
        <li><a href="<%=webpath%>city/?cityid=80">广州</a></li>
        <li><a href="<%=webpath%>city/?cityid=102">桂林</a></li>
        <li><a href="<%=webpath%>city/?cityid=114">贵阳</a></li>
        <li><a href="<%=webpath%>city/?cityid=329">广元</a></li>
        <li><a href="<%=webpath%>city/?cityid=328">广安</a></li>
        <li><a href="<%=webpath%>city/?cityid=235">赣州</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>H</strong></li>
        <li><a href="<%=webpath%>city/?cityid=383">杭州</a></li>
        <li><a href="<%=webpath%>city/?cityid=170">哈尔滨</a></li>
        <li><a href="<%=webpath%>city/?cityid=127">海口</a></li>
        <li><a href="<%=webpath%>city/?cityid=42">合肥</a></li>
        <li><a href="<%=webpath%>city/?cityid=264">呼和浩特</a></li>
        <li><a href="<%=webpath%>city/?cityid=82">惠州</a></li>
        <li><a href="<%=webpath%>city/?cityid=222">淮安</a></li>
        <li><a href="<%=webpath%>city/?cityid=45">黄山</a></li>
        <li><a href="<%=webpath%>city/?cityid=201">衡阳</a></li>
        <li><a href="<%=webpath%>city/?cityid=384">湖州</a></li>
        <li><a href="<%=webpath%>city/?cityid=81">河源</a></li>
        <li><a href="<%=webpath%>city/?cityid=252">葫芦岛</a></li>
        <li><a href="<%=webpath%>city/?cityid=286">菏泽</a></li>
        <li><a href="<%=webpath%>city/?cityid=202">怀化</a></li>
        <li><a href="<%=webpath%>city/?cityid=143">衡水</a></li>
        <li><a href="<%=webpath%>city/?cityid=279">海西</a></li>
        <li><a href="<%=webpath%>city/?cityid=171">鹤岗</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>J</strong></li>
        <li><a href="<%=webpath%>city/?cityid=287">济南</a></li>
        <li><a href="<%=webpath%>city/?cityid=385">嘉兴</a></li>
        <li><a href="<%=webpath%>city/?cityid=83">江门</a></li>
        <li><a href="<%=webpath%>city/?cityid=386">金华</a></li>
        <li><a href="<%=webpath%>city/?cityid=288">济宁</a></li>
        <li><a href="<%=webpath%>city/?cityid=238">九江</a></li>
        <li><a href="<%=webpath%>city/?cityid=215">吉林</a></li>
        <li><a href="<%=webpath%>city/?cityid=153">焦作</a></li>
        <li><a href="<%=webpath%>city/?cityid=303">晋中</a></li>
        <li><a href="<%=webpath%>city/?cityid=236">吉安</a></li>
        <li><a href="<%=webpath%>city/?cityid=253">锦州</a></li>
        <li><a href="<%=webpath%>city/?cityid=186">荆州</a></li>
        <li><a href="<%=webpath%>city/?cityid=237">景德镇</a></li>
        <li><a href="<%=webpath%>city/?cityid=174">佳木斯</a></li>
        <li><a href="<%=webpath%>city/?cityid=152">济源</a></li>
        <li><a href="<%=webpath%>city/?cityid=68">酒泉</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>K</strong></li>
        <li><a href="<%=webpath%>city/?cityid=373">昆明</a></li>
        <li><a href="<%=webpath%>city/?cityid=154">开封</a></li>
        <li><a href="<%=webpath%>city/?cityid=358">喀什</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>L</strong></li>
        <li><a href="<%=webpath%>city/?cityid=69">兰州</a></li>
        <li><a href="<%=webpath%>city/?cityid=374">丽江</a></li>
        <li><a href="<%=webpath%>city/?cityid=155">洛阳</a></li>
        <li><a href="<%=webpath%>city/?cityid=223">连云港</a></li>
        <li><a href="<%=webpath%>city/?cityid=55">龙岩</a></li>
        <li><a href="<%=webpath%>city/?cityid=346">拉萨</a></li>
        <li><a href="<%=webpath%>city/?cityid=291">临沂</a></li>
        <li><a href="<%=webpath%>city/?cityid=289">莱芜</a></li>
        <li><a href="<%=webpath%>city/?cityid=144">廊坊</a></li>
        <li><a href="<%=webpath%>city/?cityid=304">临汾</a></li>
        <li><a href="<%=webpath%>city/?cityid=107">柳州</a></li>
        <li><a href="<%=webpath%>city/?cityid=387">丽水</a></li>
        <li><a href="<%=webpath%>city/?cityid=330">乐山</a></li>
        <li><a href="<%=webpath%>city/?cityid=290">聊城</a></li>
        <li><a href="<%=webpath%>city/?cityid=331">凉山</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>M</strong></li>
        <li><a href="<%=webpath%>city/?cityid=47">马鞍山</a></li>
        <li><a href="<%=webpath%>city/?cityid=85">茂名</a></li>
        <li><a href="<%=webpath%>city/?cityid=332">眉山</a></li>
        <li><a href="<%=webpath%>city/?cityid=175">牡丹江</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>N</strong></li>
        <li><a href="<%=webpath%>city/?cityid=224">南京</a></li>
        <li><a href="<%=webpath%>city/?cityid=108">南宁</a></li>
        <li><a href="<%=webpath%>city/?cityid=388">宁波</a></li>
        <li><a href="<%=webpath%>city/?cityid=239">南昌</a></li>
        <li><a href="<%=webpath%>city/?cityid=225">南通</a></li>
        <li><a href="<%=webpath%>city/?cityid=56">南平</a></li>
        <li><a href="<%=webpath%>city/?cityid=156">南阳</a></li>
        <li><a href="<%=webpath%>city/?cityid=335">内江</a></li>
        <li><a href="<%=webpath%>city/?cityid=57">宁德</a></li>
        <li><a href="<%=webpath%>city/?cityid=334">南充</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>P</strong></li>
        <li><a href="<%=webpath%>city/?cityid=255">盘锦</a></li>
        <li><a href="<%=webpath%>city/?cityid=336">攀枝花</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>Q</strong></li>
        <li><a href="<%=webpath%>city/?cityid=292">青岛</a></li>
        <li><a href="<%=webpath%>city/?cityid=145">秦皇岛</a></li>
        <li><a href="<%=webpath%>city/?cityid=59">泉州</a></li>
        <li><a href="<%=webpath%>city/?cityid=177">齐齐哈尔</a></li>
        <li><a href="<%=webpath%>city/?cityid=131">琼海</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>R</strong></li>
        <li><a href="<%=webpath%>city/?cityid=293">日照</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>S</strong></li>
        <li><a href="<%=webpath%>city/?cityid=321">上海</a></li>
        <li><a href="<%=webpath%>city/?cityid=91">深圳</a></li>
        <li><a href="<%=webpath%>city/?cityid=226">苏州</a></li>
        <li><a href="<%=webpath%>city/?cityid=133">三亚</a></li>
        <li><a href="<%=webpath%>city/?cityid=256">沈阳</a></li>
        <li><a href="<%=webpath%>city/?cityid=146">石家庄</a></li>
        <li><a href="<%=webpath%>city/?cityid=389">绍兴</a></li>
        <li><a href="<%=webpath%>city/?cityid=90">韶关</a></li>
        <li><a href="<%=webpath%>city/?cityid=88">汕头</a></li>
        <li><a href="<%=webpath%>city/?cityid=158">三门峡</a></li>
        <li><a href="<%=webpath%>city/?cityid=241">上饶</a></li>
        <li><a href="<%=webpath%>city/?cityid=227">宿迁</a></li>
        <li><a href="<%=webpath%>city/?cityid=89">汕尾</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>T</strong></li>
        <li><a href="<%=webpath%>city/?cityid=343">天津</a></li>
        <li><a href="<%=webpath%>city/?cityid=307">太原</a></li>
        <li><a href="<%=webpath%>city/?cityid=147">唐山</a></li>
        <li><a href="<%=webpath%>city/?cityid=294">泰安</a></li>
        <li><a href="<%=webpath%>city/?cityid=228">泰州</a></li>
        <li><a href="<%=webpath%>city/?cityid=390">台州</a></li>
        <li><a href="<%=webpath%>city/?cityid=219">通化</a></li>
        <li><a href="<%=webpath%>city/?cityid=266">通辽</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>W</strong></li>
        <li><a href="<%=webpath%>city/?cityid=192">武汉</a></li>
        <li><a href="<%=webpath%>city/?cityid=229">无锡</a></li>
        <li><a href="<%=webpath%>city/?cityid=391">温州</a></li>
        <li><a href="<%=webpath%>city/?cityid=295">威海</a></li>
        <li><a href="<%=webpath%>city/?cityid=364">乌鲁木齐</a></li>
        <li><a href="<%=webpath%>city/?cityid=50">芜湖</a></li>
        <li><a href="<%=webpath%>city/?cityid=296">潍坊</a></li>
        <li><a href="<%=webpath%>city/?cityid=135">万宁</a></li>
        <li><a href="<%=webpath%>city/?cityid=110">梧州</a></li>
        <li><a href="<%=webpath%>city/?cityid=137">五指山</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>X</strong></li>
        <li><a href="<%=webpath%>city/?cityid=317">西安</a></li>
        <li><a href="<%=webpath%>city/?cityid=61">厦门</a></li>
        <li><a href="<%=webpath%>city/?cityid=281">西宁</a></li>
        <li><a href="<%=webpath%>city/?cityid=230">徐州</a></li>
        <li><a href="<%=webpath%>city/?cityid=205">湘潭</a></li>
        <li><a href="<%=webpath%>city/?cityid=195">襄樊</a></li>
        <li><a href="<%=webpath%>city/?cityid=160">新乡</a></li>
        <li><a href="<%=webpath%>city/?cityid=196">孝感</a></li>
        <li><a href="<%=webpath%>city/?cityid=194">咸宁</a></li>
        <li><a href="<%=webpath%>city/?cityid=380">西双版纳</a></li>
        <li><a href="<%=webpath%>city/?cityid=206">湘西</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>Y</strong></li>
        <li><a href="<%=webpath%>city/?cityid=297">烟台</a></li>
        <li><a href="<%=webpath%>city/?cityid=232">扬州</a></li>
        <li><a href="<%=webpath%>city/?cityid=197">宜昌</a></li>
        <li><a href="<%=webpath%>city/?cityid=274">银川</a></li>
        <li><a href="<%=webpath%>city/?cityid=231">盐城</a></li>
        <li><a href="<%=webpath%>city/?cityid=309">阳泉</a></li>
        <li><a href="<%=webpath%>city/?cityid=209">岳阳</a></li>
        <li><a href="<%=webpath%>city/?cityid=207">益阳</a></li>
        <li><a href="<%=webpath%>city/?cityid=92">阳江</a></li>
        <li><a href="<%=webpath%>city/?cityid=258">营口</a></li>
        <li><a href="<%=webpath%>city/?cityid=319">延安</a></li>
        <li><a href="<%=webpath%>city/?cityid=310">运城</a></li>
        <li><a href="<%=webpath%>city/?cityid=244">鹰潭</a></li>
        <li><a href="<%=webpath%>city/?cityid=338">雅安</a></li>
        <li><a href="<%=webpath%>city/?cityid=208">永州</a></li>
        <li><a href="<%=webpath%>city/?cityid=220">延边</a></li>
        <li><a href="<%=webpath%>city/?cityid=243">宜春</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>Z</strong></li>
        <li><a href="<%=webpath%>city/?cityid=163">郑州</a></li>
        <li><a href="<%=webpath%>city/?cityid=97">珠海</a></li>
        <li><a href="<%=webpath%>city/?cityid=96">中山</a></li>
        <li><a href="<%=webpath%>city/?cityid=95">肇庆</a></li>
        <li><a href="<%=webpath%>city/?cityid=392">舟山</a></li>
        <li><a href="<%=webpath%>city/?cityid=210">张家界</a></li>
        <li><a href="<%=webpath%>city/?cityid=233">镇江</a></li>
        <li><a href="<%=webpath%>city/?cityid=299">淄博</a></li>
        <li><a href="<%=webpath%>city/?cityid=94">湛江</a></li>
        <li><a href="<%=webpath%>city/?cityid=211">株洲</a></li>
        <li><a href="<%=webpath%>city/?cityid=62">漳州</a></li>
        <li><a href="<%=webpath%>city/?cityid=165">驻马店</a></li>
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