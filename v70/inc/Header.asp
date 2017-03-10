<div class="header">
    <div class="logo">
      <div class="logo_pic"><a href="<%=webpath%>"><img src="<%=webpath%>images/logo.gif" alt="<%=doname%>-<%=webkeyword%>" /></a></div>
        <div class="logo_tex">
            <div class="she_home">        
	          <a onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://<%=domain%>');" href="http://<%=domain%>">设成首页</a><a onclick="window.external.AddFavorite('http://<%=domain%>', '<%=doname%>')" href="javascript:void(0);" target="_self">收藏本站</a><a href="http://un.zhuna.cn/r.asp?sxid=<%=agent_id%>">住哪网联盟</a>
            </div>
            <div>预订流程：搜索酒店　&rarr;　选择酒店　&rarr;　查看信息　&rarr;　提交订单　&rarr;　预订成功 </div>
        </div>
    </div>
      <div class="clearfloat"></div>
    <div class="nav" id="nav">
<%If hotel(7) Then%>
    <a href="<%=webpath%>">首 页</a>
    <a href="<%=webpath%>search.html">酒店搜索</a>
    <a href="<%=webpath%>liansuo.html">连锁酒店</a>
    <a href="<%=webpath%>allcity.html">全国酒店</a>
    <a href="<%=webpath%>onsale.html">促销活动</a>
    <a href="<%=webpath%>expo.html">会展信息</a>
    <a href="<%=webpath%>map.html">电子地图</a>
    <a href="<%=webpath%>news.html">新闻资讯</a>
    <a href="<%=webpath%>special/">专题频道</a>
    <a href="<%=webpath%>help.html">帮助中心</a>
<%Else%>
    <a href="<%=webpath%>">首 页</a>
    <a href="<%=webpath%>search.asp">酒店搜索</a>
    <a href="<%=webpath%>liansuo.asp">连锁酒店</a>
    <a href="<%=webpath%>allcity.asp">全国酒店</a>
    <a href="<%=webpath%>onsale.asp">促销活动</a>
    <a href="<%=webpath%>expo.asp">会展信息</a>
    <a href="<%=webpath%>map.asp">电子地图</a>
    <a href="<%=webpath%>news.asp">新闻资讯</a>
    <a href="<%=webpath%>special/">专题频道</a>
    <a href="<%=webpath%>help.asp">帮助中心</a>
<%End If%></div>  
      <div class="find">
      <form id="form1" name="form1" method="post" action="orderlist.asp">
        查询我的订单：手机号&nbsp;&nbsp;<input name="mobile" type="text" size="11" style="height:12px;" value="<%=request("mobile")%>" maxlength="11"/>
        &nbsp;&nbsp;预订人姓名&nbsp;&nbsp;<input name="oname" type="text" id="oname" size="11" value="<%=request("oname")%>" style="height:12px; "/>
         <input type="submit" name="button" id="button" value=" "  style="width:55px; height:20px; border:none; background:url(images/but.gif) no-repeat;"/>
     </form>
    </div>
  </div>
<script language="javascript" src="<%=webpath%>javascript/menu.js"></script>
<script language="javascript" src="<%=webpath%>javascript/main.js"></script>

<%ShowAD 2,"ads"%>