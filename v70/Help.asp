<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%
dim cityname,cityid
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>预订帮助中心&mdash;&mdash;<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
      <div class="lian_up">
        <h2><%=cityname%>酒店搜索</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=uncityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_up"><h2>预订帮助中心</h2>
        <ul class="jiudian">
        <%If hotel(7) Then%>
            <li><a href="help.html">网上预订有保障吗？</a></li>
            <li><a href="help.html">网上预订有什么好处？</a></li>
            <li><a href="help.html">如何在网上预订？</a></li>
            <li><a href="help.html">为什么网上预订价格要便宜？</a></li>
            <li><a href="help.html">注册或预订时为什么要填写手机号？</a></li>
            <li><a href="help.html">我行程有变化已预订的酒店怎么办？</a></li>
        <%Else%>    
            <li><a href="help.asp">网上预订有保障吗？</a></li>
            <li><a href="help.asp">网上预订有什么好处？</a></li>
            <li><a href="help.asp">如何在网上预订？</a></li>
            <li><a href="help.asp">为什么网上预订价格要便宜？</a></li>
            <li><a href="help.asp">注册或预订时为什么要填写手机号？</a></li>
            <li><a href="help.asp">我行程有变化已预订的酒店怎么办？</a></li>
        <%End If%>
        </ul>
      </div>
      <div class="lian_up">
        <h2>最近访问酒店</h2>
  		<ul class="jiudian"><%=newhotel(6)%></ul>
      </div>
    </div>
    <div class="list_con help_big">
    	<div class="help1">帮助中心</div>
        <div class="help"><h2>网上预订有保障吗？</h2>
        	<div class="help_con">当然有保障！网上预订不收取您任何费用。只要您预订之后接收到预订成功短信，酒店就会给您保留房间。免得直接到酒店无房的尴尬。 </div>
      </div>
        <div class="help"><h2>网上预订有什么好处？</h2>
        	<div class="help_con">
        	  <p>1、预订完全免费；</p>
        	  <p> 2、享受比酒店前台更低的价格；</p>
        	  <p> 3、优先订到房间，避免因找房而耽误您的行程。 </p>
       	  </div>
        </div>
        <div class="help"><h2>如何在网上预订？</h2>
        	<div class="help_con">本站是纯互联网预订，不需要打电话。您只需在网站上找到适合您的酒店后，点击相应房型后的预订按钮，然后填写个人资料等信息，提交后您将收到一条订单正在处理中的短信(当网络堵塞时可能会延迟)，说明我们的工作人员正在为您处理，一般30分钟内会发送预订结果短信给您。如果收到含有&ldquo;订单已确认&rdquo;或&ldquo;预订成功&rdquo;字样的短信，说明您已经预订成功，按时到酒店入住即可；如果收到&ldquo;满房&rdquo;的短信，建议您再选择周边其它酒店预订。 </div>
        </div>
      <div class="help"><h2>为什么网上预订价格要比酒店前台便宜？ </h2>
        	<div class="help_con">因为我们和酒店有协议，每月会给酒店送去大量的客人，所以我们能拿到更低的协议价。同时酒店为了保证我们给他输送客人，所以给我们价格要比酒店前台价格还要低。
   	      </div>
        </div>
        <div class="help"><h2>预订需要注册吗？ </h2>
        	<div class="help_con">预订不需要注册就可直接预订，但需要填写您的手机号，方便接收预订结果短信。</div>
        </div>
      <div class="help"><h2>注册或预订时为什么要填写手机号？</h2>
        	<div class="help_con">
        	  <ul>
        	    <li><strong>Q：我到酒店时酒店前台说没有我的预订时怎么办？</strong><br />
        	      A：如果您已经通过我们预订了此家酒店，并得到我方的确认，酒店前台就会有您的订单，您可以用订单上的名字查一下，如果还是没有，您可以与我们的预订中心联系，电话：010-59610099，由我们与酒店联系为您解决此事。 </li>
        	    <li><strong>Q：我行程有变化，要更改/取消已预订的酒店怎么办？</strong><br />
        	      A：如果需要更改/取消您的预订，请致电我们预订中心，电话：010-59610099，由我们客服人员给您处理。 </li>
        	    <li><strong>Q：我想在酒店再多住几天怎么办？</strong><br />
        	      A：   如果您在酒店有条件上网的话可以直接修改延长您的订单，也可以电话通知我们的预订中心， 电话：010-59610099。 </li>
        	    <li><strong>Q：入住酒店时应注意的问题! </strong><br />
        	      A：   当您预订酒店时应以实际入住人的名字做预订。入住时您应以预订时登记的客人名字来办理入住手续，也就是说办理入住手续的客人姓名要与预订时登记的姓名一致。 </li>
        	    <li><strong>Q：到达酒店后怎样得到预订的房间？</strong><br />
        	      A：当您到达酒店后，在总台报您在预订单中填写的姓名，并说明：我有预订。酒店确认后会给您提供所预订的房间。 </li>
      	    </ul>
   	      </div>
        </div>
        <div class="help"><h2><strong>服务时间</strong></h2>
        	<div class="help_con">1、 我们为您提供24小时全天服务，节假日照常服务。 <br />
       	    2、我们只接受通过互联网提交的预订单，不接受其它形式的订单。</div>
        </div>
        <div class="help"><h2><strong>预订时间</strong><br />
        </h2>
        	<div class="help_con">1、 建议您最多提前半个月，一般提前2－3天左右就可以。<br />
       	    2、但节假日、会展期间或旅游旺季最好提前5－6天预订，以防酒店客满。</div>
        </div>
      <div class="help"><h2><strong>修改及取消订单</strong></h2>
        	<div class="help_con">如果预订成功或处理中，当您的行程有变动需更改/取消预订时，可以致电010-59610099，由我们工作人员给您处理。</div>
        </div>
        <div class="help"><h2><strong>订单提交后确认时间</strong> </h2>
        	<div class="help_con">在您提交订单后，我们一般会在15分钟内以短信形式回复您，如遇特殊情况（如酒店忙、系统出错、短信延迟等）会延时，如果30分钟内仍没有收到短信，请致电010-59610099查询，我们会尽力给您解决问题。 </div>
        </div>
        <div class="help"><h2><strong>价格和房费</strong> </h2>
        	<div class="help_con">1、   网上所公布的价格均为同各宾馆签定的协议价，它是宾馆给予住哪网的优惠价，此价格比酒店前台当日挂牌价要低。<br />
       	    2、网上公布的网上预订价已包含服务费，不包含酒店其他费用及税收。如果您没有其它特殊要求，到酒店您只需支付预订时系统计算出的总房费即可，不需要再支付其它费用。 </div>
        </div>
        <div class="help"><h2><strong>入住、离店时间</strong></h2>
        	<div class="help_con">按国际惯例，宾馆的入住时间为14：00，离店时间为正午12：00。如提前入住或推迟离店，根据酒店不同要求，某些酒店须酌情加收一定的费用</div>
        </div>
        <div class="help"><h2><strong>保留时间</strong></h2>
        	<div class="help_con">1、如在订单上无特别注明，一般情况下宾馆将保留至入住当日的18：00，过时将不予保留。如果晚于18：00到达酒店，请在预订时的特殊要求内注册具体什么时间能到达，火车或航班班次。这种情况某些酒店可能不予确认或需担保。<br />
       	    2、如果因火车晚点或其它特殊情况不能按时到达酒店，请根据确认短信提供的号码致电酒店前台说明情况，并说明大致到达时间，这样酒店还会给您延迟保留。因超过最晚到达时间到达且没有通知酒店的，需自行承担后果。 </div>
        </div>
        <div class="help">
          <h2><strong>预付房款</strong></h2>
          <div class="help_con">
            <dl>
              <dd>1、当节假日期间或举办大型会展期间、旅游旺季等酒店房间紧张的情况下，部分酒店需要您将房款提前预付至酒店，以保证您的预订能够顺利的获得确定。<br />
                2、需要预付的酒店，订单一经确认将不可取消或修改。因此请在填写担保订单前慎重考虑您是否会修改行程，以免给您造成不必要的损失。如您未按订单上约定的时间或房间数量入住，所付房款不作退回。<br />
              </dd>
            </dl>
          </div>
      </div>
    </div>
  </div>  
  
<!--#INCLUDE FILE="INC/Footer.asp"-->
</div>
</body>
</html>
<%Destroy%>