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
<title>Ԥ����������&mdash;&mdash;<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
    <div class="side_list">
      <div class="lian_up">
        <h2><%=cityname%>�Ƶ�����</h2>
        <iframe id="SearchID" width="235" height="269" scrolling="no" frameborder="0" src="http://un.zhuna.cn/api/SearchBox_gbk.asp?w=240&uid=<%=agent_id%>&bColor=acc6e1&tColor=cccccc&bgimg=http://un.zhuna.cn/images/srh_tit_bg.gif&cid=<%=uncityid%>&box=1,2,3,4&order=1&searchurl=<%=domain%>&target=_top&tm1=<%=session("tm1")%>&tm2=<%=session("tm2")%>"></iframe>
      </div>
      <div class="lian_up"><h2>Ԥ����������</h2>
        <ul class="jiudian">
        <%If hotel(7) Then%>
            <li><a href="help.html">����Ԥ���б�����</a></li>
            <li><a href="help.html">����Ԥ����ʲô�ô���</a></li>
            <li><a href="help.html">���������Ԥ����</a></li>
            <li><a href="help.html">Ϊʲô����Ԥ���۸�Ҫ���ˣ�</a></li>
            <li><a href="help.html">ע���Ԥ��ʱΪʲôҪ��д�ֻ��ţ�</a></li>
            <li><a href="help.html">���г��б仯��Ԥ���ľƵ���ô�죿</a></li>
        <%Else%>    
            <li><a href="help.asp">����Ԥ���б�����</a></li>
            <li><a href="help.asp">����Ԥ����ʲô�ô���</a></li>
            <li><a href="help.asp">���������Ԥ����</a></li>
            <li><a href="help.asp">Ϊʲô����Ԥ���۸�Ҫ���ˣ�</a></li>
            <li><a href="help.asp">ע���Ԥ��ʱΪʲôҪ��д�ֻ��ţ�</a></li>
            <li><a href="help.asp">���г��б仯��Ԥ���ľƵ���ô�죿</a></li>
        <%End If%>
        </ul>
      </div>
      <div class="lian_up">
        <h2>������ʾƵ�</h2>
  		<ul class="jiudian"><%=newhotel(6)%></ul>
      </div>
    </div>
    <div class="list_con help_big">
    	<div class="help1">��������</div>
        <div class="help"><h2>����Ԥ���б�����</h2>
        	<div class="help_con">��Ȼ�б��ϣ�����Ԥ������ȡ���κη��á�ֻҪ��Ԥ��֮����յ�Ԥ���ɹ����ţ��Ƶ�ͻ�����������䡣���ֱ�ӵ��Ƶ��޷������Ρ� </div>
      </div>
        <div class="help"><h2>����Ԥ����ʲô�ô���</h2>
        	<div class="help_con">
        	  <p>1��Ԥ����ȫ��ѣ�</p>
        	  <p> 2�����ܱȾƵ�ǰ̨���͵ļ۸�</p>
        	  <p> 3�����ȶ������䣬�������ҷ������������г̡� </p>
       	  </div>
        </div>
        <div class="help"><h2>���������Ԥ����</h2>
        	<div class="help_con">��վ�Ǵ�������Ԥ��������Ҫ��绰����ֻ������վ���ҵ��ʺ����ľƵ�󣬵����Ӧ���ͺ��Ԥ����ť��Ȼ����д�������ϵ���Ϣ���ύ�������յ�һ���������ڴ����еĶ���(���������ʱ���ܻ��ӳ�)��˵�����ǵĹ�����Ա����Ϊ������һ��30�����ڻᷢ��Ԥ��������Ÿ���������յ�����&ldquo;������ȷ��&rdquo;��&ldquo;Ԥ���ɹ�&rdquo;�����Ķ��ţ�˵�����Ѿ�Ԥ���ɹ�����ʱ���Ƶ���ס���ɣ�����յ�&ldquo;����&rdquo;�Ķ��ţ���������ѡ���ܱ������Ƶ�Ԥ���� </div>
        </div>
      <div class="help"><h2>Ϊʲô����Ԥ���۸�Ҫ�ȾƵ�ǰ̨���ˣ� </h2>
        	<div class="help_con">��Ϊ���Ǻ;Ƶ���Э�飬ÿ�»���Ƶ���ȥ�����Ŀ��ˣ������������õ����͵�Э��ۡ�ͬʱ�Ƶ�Ϊ�˱�֤���Ǹ������Ϳ��ˣ����Ը����Ǽ۸�Ҫ�ȾƵ�ǰ̨�۸�Ҫ�͡�
   	      </div>
        </div>
        <div class="help"><h2>Ԥ����Ҫע���� </h2>
        	<div class="help_con">Ԥ������Ҫע��Ϳ�ֱ��Ԥ��������Ҫ��д�����ֻ��ţ��������Ԥ��������š�</div>
        </div>
      <div class="help"><h2>ע���Ԥ��ʱΪʲôҪ��д�ֻ��ţ�</h2>
        	<div class="help_con">
        	  <ul>
        	    <li><strong>Q���ҵ��Ƶ�ʱ�Ƶ�ǰ̨˵û���ҵ�Ԥ��ʱ��ô�죿</strong><br />
        	      A��������Ѿ�ͨ������Ԥ���˴˼ҾƵ꣬���õ��ҷ���ȷ�ϣ��Ƶ�ǰ̨�ͻ������Ķ������������ö����ϵ����ֲ�һ�£��������û�У������������ǵ�Ԥ��������ϵ���绰��010-59610099����������Ƶ���ϵΪ��������¡� </li>
        	    <li><strong>Q�����г��б仯��Ҫ����/ȡ����Ԥ���ľƵ���ô�죿</strong><br />
        	      A�������Ҫ����/ȡ������Ԥ�������µ�����Ԥ�����ģ��绰��010-59610099�������ǿͷ���Ա�������� </li>
        	    <li><strong>Q�������ھƵ��ٶ�ס������ô�죿</strong><br />
        	      A��   ������ھƵ������������Ļ�����ֱ���޸��ӳ����Ķ�����Ҳ���Ե绰֪ͨ���ǵ�Ԥ�����ģ� �绰��010-59610099�� </li>
        	    <li><strong>Q����ס�Ƶ�ʱӦע�������! </strong><br />
        	      A��   ����Ԥ���Ƶ�ʱӦ��ʵ����ס�˵�������Ԥ������סʱ��Ӧ��Ԥ��ʱ�ǼǵĿ���������������ס������Ҳ����˵������ס�����Ŀ�������Ҫ��Ԥ��ʱ�Ǽǵ�����һ�¡� </li>
        	    <li><strong>Q������Ƶ�������õ�Ԥ���ķ��䣿</strong><br />
        	      A����������Ƶ������̨������Ԥ��������д����������˵��������Ԥ�����Ƶ�ȷ�Ϻ������ṩ��Ԥ���ķ��䡣 </li>
      	    </ul>
   	      </div>
        </div>
        <div class="help"><h2><strong>����ʱ��</strong></h2>
        	<div class="help_con">1�� ����Ϊ���ṩ24Сʱȫ����񣬽ڼ����ճ����� <br />
       	    2������ֻ����ͨ���������ύ��Ԥ������������������ʽ�Ķ�����</div>
        </div>
        <div class="help"><h2><strong>Ԥ��ʱ��</strong><br />
        </h2>
        	<div class="help_con">1�� �����������ǰ����£�һ����ǰ2��3�����ҾͿ��ԡ�<br />
       	    2�����ڼ��ա���չ�ڼ���������������ǰ5��6��Ԥ�����Է��Ƶ������</div>
        </div>
      <div class="help"><h2><strong>�޸ļ�ȡ������</strong></h2>
        	<div class="help_con">���Ԥ���ɹ������У��������г��б䶯�����/ȡ��Ԥ��ʱ�������µ�010-59610099�������ǹ�����Ա��������</div>
        </div>
        <div class="help"><h2><strong>�����ύ��ȷ��ʱ��</strong> </h2>
        	<div class="help_con">�����ύ����������һ�����15�������Զ�����ʽ�ظ��������������������Ƶ�æ��ϵͳ���������ӳٵȣ�����ʱ�����30��������û���յ����ţ����µ�010-59610099��ѯ�����ǻᾡ������������⡣ </div>
        </div>
        <div class="help"><h2><strong>�۸�ͷ���</strong> </h2>
        	<div class="help_con">1��   �����������ļ۸��Ϊͬ������ǩ����Э��ۣ����Ǳ��ݸ���ס�������Żݼۣ��˼۸�ȾƵ�ǰ̨���չ��Ƽ�Ҫ�͡�<br />
       	    2�����Ϲ���������Ԥ�����Ѱ�������ѣ��������Ƶ��������ü�˰�ա������û����������Ҫ�󣬵��Ƶ���ֻ��֧��Ԥ��ʱϵͳ��������ܷ��Ѽ��ɣ�����Ҫ��֧���������á� </div>
        </div>
        <div class="help"><h2><strong>��ס�����ʱ��</strong></h2>
        	<div class="help_con">�����ʹ��������ݵ���סʱ��Ϊ14��00�����ʱ��Ϊ����12��00������ǰ��ס���Ƴ���꣬���ݾƵ겻ͬҪ��ĳЩ�Ƶ����������һ���ķ���</div>
        </div>
        <div class="help"><h2><strong>����ʱ��</strong></h2>
        	<div class="help_con">1�����ڶ��������ر�ע����һ������±��ݽ���������ס���յ�18��00����ʱ�����豣�����������18��00����Ƶ꣬����Ԥ��ʱ������Ҫ����ע�����ʲôʱ���ܵ���𳵻򺽰��Ρ��������ĳЩ�Ƶ���ܲ���ȷ�ϻ��赣����<br />
       	    2��������������������������ܰ�ʱ����Ƶ꣬�����ȷ�϶����ṩ�ĺ����µ�Ƶ�ǰ̨˵���������˵�����µ���ʱ�䣬�����Ƶ껹������ӳٱ������򳬹�������ʱ�䵽����û��֪ͨ�Ƶ�ģ������ге������ </div>
        </div>
        <div class="help">
          <h2><strong>Ԥ������</strong></h2>
          <div class="help_con">
            <dl>
              <dd>1�����ڼ����ڼ��ٰ���ͻ�չ�ڼ䡢���������ȾƵ귿����ŵ�����£����־Ƶ���Ҫ����������ǰԤ�����Ƶ꣬�Ա�֤����Ԥ���ܹ�˳���Ļ��ȷ����<br />
                2����ҪԤ���ľƵ꣬����һ��ȷ�Ͻ�����ȡ�����޸ġ����������д��������ǰ���ؿ������Ƿ���޸��г̣����������ɲ���Ҫ����ʧ������δ��������Լ����ʱ��򷿼�������ס������������˻ء�<br />
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