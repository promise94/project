<div class="header">
    <div class="logo">
      <div class="logo_pic"><a href="<%=webpath%>"><img src="<%=webpath%>images/logo.gif" alt="<%=doname%>-<%=webkeyword%>" /></a></div>
        <div class="logo_tex">
            <div class="she_home">        
	          <a onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://<%=domain%>');" href="http://<%=domain%>">�����ҳ</a><a onclick="window.external.AddFavorite('http://<%=domain%>', '<%=doname%>')" href="javascript:void(0);" target="_self">�ղر�վ</a><a href="http://un.zhuna.cn/r.asp?sxid=<%=agent_id%>">ס��������</a>
            </div>
            <div>Ԥ�����̣������Ƶꡡ&rarr;��ѡ��Ƶꡡ&rarr;���鿴��Ϣ��&rarr;���ύ������&rarr;��Ԥ���ɹ� </div>
        </div>
    </div>
      <div class="clearfloat"></div>
    <div class="nav" id="nav">
<%If hotel(7) Then%>
    <a href="<%=webpath%>">�� ҳ</a>
    <a href="<%=webpath%>search.html">�Ƶ�����</a>
    <a href="<%=webpath%>liansuo.html">�����Ƶ�</a>
    <a href="<%=webpath%>allcity.html">ȫ���Ƶ�</a>
    <a href="<%=webpath%>onsale.html">�����</a>
    <a href="<%=webpath%>expo.html">��չ��Ϣ</a>
    <a href="<%=webpath%>map.html">���ӵ�ͼ</a>
    <a href="<%=webpath%>news.html">������Ѷ</a>
    <a href="<%=webpath%>special/">ר��Ƶ��</a>
    <a href="<%=webpath%>help.html">��������</a>
<%Else%>
    <a href="<%=webpath%>">�� ҳ</a>
    <a href="<%=webpath%>search.asp">�Ƶ�����</a>
    <a href="<%=webpath%>liansuo.asp">�����Ƶ�</a>
    <a href="<%=webpath%>allcity.asp">ȫ���Ƶ�</a>
    <a href="<%=webpath%>onsale.asp">�����</a>
    <a href="<%=webpath%>expo.asp">��չ��Ϣ</a>
    <a href="<%=webpath%>map.asp">���ӵ�ͼ</a>
    <a href="<%=webpath%>news.asp">������Ѷ</a>
    <a href="<%=webpath%>special/">ר��Ƶ��</a>
    <a href="<%=webpath%>help.asp">��������</a>
<%End If%></div>  
      <div class="find">
      <form id="form1" name="form1" method="post" action="orderlist.asp">
        ��ѯ�ҵĶ������ֻ���&nbsp;&nbsp;<input name="mobile" type="text" size="11" style="height:12px;" value="<%=request("mobile")%>" maxlength="11"/>
        &nbsp;&nbsp;Ԥ��������&nbsp;&nbsp;<input name="oname" type="text" id="oname" size="11" value="<%=request("oname")%>" style="height:12px; "/>
         <input type="submit" name="button" id="button" value=" "  style="width:55px; height:20px; border:none; background:url(images/but.gif) no-repeat;"/>
     </form>
    </div>
  </div>
<script language="javascript" src="<%=webpath%>javascript/menu.js"></script>
<script language="javascript" src="<%=webpath%>javascript/main.js"></script>

<%ShowAD 2,"ads"%>