<!--#include file="inc/conn.asp" -->
<%Const ItemPath=""%>
<!--#include file="inc/Main_function.asp" -->
<!--#include file="inc/function.asp" -->
<%dim rurl,cityid,cityname%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ȫ���ؼ۾Ƶ�Ԥ�� ȫ���Ƶ���д�ȫ-<%=doname%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<!--#INCLUDE FILE="inc/Header.asp"-->
  <div class="mainContent">
<div class="main_content2">
    <h2>ȫ���ؼ۾Ƶ�Ԥ�� ȫ���Ƶ���д�ȫ</h2>
    <div class="nation">
      <ul>
        <li class="f14"><strong>A</strong></li>
        <li><a href="<%=webpath%>city/?cityid=36">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=150">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=322">����</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>B</strong></li>
        <li><a href="<%=webpath%>city/?cityid=53">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=139">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=99">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=261">��ͷ</a></li>
        <li><a href="<%=webpath%>city/?cityid=37">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=312">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=283">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=63">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=260">�����׶���</a></li>
        <li><a href="<%=webpath%>city/?cityid=353">��������</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>C</strong></li>
        <li><a href="<%=webpath%>city/?cityid=324">�ɶ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=199">��ɳ</a></li>
        <li><a href="<%=webpath%>city/?cityid=394">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=221">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=214">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=141">�е�</a></li>
        <li><a href="<%=webpath%>city/?cityid=200">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=77">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=198">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=38">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=39">����</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>D</strong></li>
        <li><a href="<%=webpath%>city/?cityid=248">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=78">��ݸ</a></li>
        <li><a href="<%=webpath%>city/?cityid=249">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=369">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=285">��Ӫ</a></li>
        <li><a href="<%=webpath%>city/?cityid=301">��ͬ</a></li>
        <li><a href="<%=webpath%>city/?cityid=168">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=326">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=284">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=371">����</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>F</strong></li>
        <li><a href="<%=webpath%>city/?cityid=54">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=79">��ɽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=41">����</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>G</strong></li>
        <li><a href="<%=webpath%>city/?cityid=80">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=102">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=114">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=329">��Ԫ</a></li>
        <li><a href="<%=webpath%>city/?cityid=328">�㰲</a></li>
        <li><a href="<%=webpath%>city/?cityid=235">����</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>H</strong></li>
        <li><a href="<%=webpath%>city/?cityid=383">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=170">������</a></li>
        <li><a href="<%=webpath%>city/?cityid=127">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=42">�Ϸ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=264">���ͺ���</a></li>
        <li><a href="<%=webpath%>city/?cityid=82">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=222">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=45">��ɽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=201">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=384">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=81">��Դ</a></li>
        <li><a href="<%=webpath%>city/?cityid=252">��«��</a></li>
        <li><a href="<%=webpath%>city/?cityid=286">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=202">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=143">��ˮ</a></li>
        <li><a href="<%=webpath%>city/?cityid=279">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=171">�׸�</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>J</strong></li>
        <li><a href="<%=webpath%>city/?cityid=287">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=385">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=83">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=386">��</a></li>
        <li><a href="<%=webpath%>city/?cityid=288">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=238">�Ž�</a></li>
        <li><a href="<%=webpath%>city/?cityid=215">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=153">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=303">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=236">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=253">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=186">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=237">������</a></li>
        <li><a href="<%=webpath%>city/?cityid=174">��ľ˹</a></li>
        <li><a href="<%=webpath%>city/?cityid=152">��Դ</a></li>
        <li><a href="<%=webpath%>city/?cityid=68">��Ȫ</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>K</strong></li>
        <li><a href="<%=webpath%>city/?cityid=373">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=154">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=358">��ʲ</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>L</strong></li>
        <li><a href="<%=webpath%>city/?cityid=69">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=374">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=155">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=223">���Ƹ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=55">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=346">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=291">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=289">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=144">�ȷ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=304">�ٷ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=107">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=387">��ˮ</a></li>
        <li><a href="<%=webpath%>city/?cityid=330">��ɽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=290">�ĳ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=331">��ɽ</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>M</strong></li>
        <li><a href="<%=webpath%>city/?cityid=47">��ɽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=85">ï��</a></li>
        <li><a href="<%=webpath%>city/?cityid=332">üɽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=175">ĵ����</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>N</strong></li>
        <li><a href="<%=webpath%>city/?cityid=224">�Ͼ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=108">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=388">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=239">�ϲ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=225">��ͨ</a></li>
        <li><a href="<%=webpath%>city/?cityid=56">��ƽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=156">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=335">�ڽ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=57">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=334">�ϳ�</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>P</strong></li>
        <li><a href="<%=webpath%>city/?cityid=255">�̽�</a></li>
        <li><a href="<%=webpath%>city/?cityid=336">��֦��</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>Q</strong></li>
        <li><a href="<%=webpath%>city/?cityid=292">�ൺ</a></li>
        <li><a href="<%=webpath%>city/?cityid=145">�ػʵ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=59">Ȫ��</a></li>
        <li><a href="<%=webpath%>city/?cityid=177">�������</a></li>
        <li><a href="<%=webpath%>city/?cityid=131">��</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>R</strong></li>
        <li><a href="<%=webpath%>city/?cityid=293">����</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>S</strong></li>
        <li><a href="<%=webpath%>city/?cityid=321">�Ϻ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=91">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=226">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=133">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=256">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=146">ʯ��ׯ</a></li>
        <li><a href="<%=webpath%>city/?cityid=389">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=90">�ع�</a></li>
        <li><a href="<%=webpath%>city/?cityid=88">��ͷ</a></li>
        <li><a href="<%=webpath%>city/?cityid=158">����Ͽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=241">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=227">��Ǩ</a></li>
        <li><a href="<%=webpath%>city/?cityid=89">��β</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>T</strong></li>
        <li><a href="<%=webpath%>city/?cityid=343">���</a></li>
        <li><a href="<%=webpath%>city/?cityid=307">̫ԭ</a></li>
        <li><a href="<%=webpath%>city/?cityid=147">��ɽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=294">̩��</a></li>
        <li><a href="<%=webpath%>city/?cityid=228">̩��</a></li>
        <li><a href="<%=webpath%>city/?cityid=390">̨��</a></li>
        <li><a href="<%=webpath%>city/?cityid=219">ͨ��</a></li>
        <li><a href="<%=webpath%>city/?cityid=266">ͨ��</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>W</strong></li>
        <li><a href="<%=webpath%>city/?cityid=192">�人</a></li>
        <li><a href="<%=webpath%>city/?cityid=229">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=391">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=295">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=364">��³ľ��</a></li>
        <li><a href="<%=webpath%>city/?cityid=50">�ߺ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=296">Ϋ��</a></li>
        <li><a href="<%=webpath%>city/?cityid=135">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=110">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=137">��ָɽ</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>X</strong></li>
        <li><a href="<%=webpath%>city/?cityid=317">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=61">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=281">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=230">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=205">��̶</a></li>
        <li><a href="<%=webpath%>city/?cityid=195">�差</a></li>
        <li><a href="<%=webpath%>city/?cityid=160">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=196">Т��</a></li>
        <li><a href="<%=webpath%>city/?cityid=194">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=380">��˫����</a></li>
        <li><a href="<%=webpath%>city/?cityid=206">����</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>Y</strong></li>
        <li><a href="<%=webpath%>city/?cityid=297">��̨</a></li>
        <li><a href="<%=webpath%>city/?cityid=232">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=197">�˲�</a></li>
        <li><a href="<%=webpath%>city/?cityid=274">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=231">�γ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=309">��Ȫ</a></li>
        <li><a href="<%=webpath%>city/?cityid=209">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=207">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=92">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=258">Ӫ��</a></li>
        <li><a href="<%=webpath%>city/?cityid=319">�Ӱ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=310">�˳�</a></li>
        <li><a href="<%=webpath%>city/?cityid=244">ӥ̶</a></li>
        <li><a href="<%=webpath%>city/?cityid=338">�Ű�</a></li>
        <li><a href="<%=webpath%>city/?cityid=208">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=220">�ӱ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=243">�˴�</a></li>
      </ul>
      <br class="clearfloat" />
      <ul>
        <li class="f14"><strong>Z</strong></li>
        <li><a href="<%=webpath%>city/?cityid=163">֣��</a></li>
        <li><a href="<%=webpath%>city/?cityid=97">�麣</a></li>
        <li><a href="<%=webpath%>city/?cityid=96">��ɽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=95">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=392">��ɽ</a></li>
        <li><a href="<%=webpath%>city/?cityid=210">�żҽ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=233">��</a></li>
        <li><a href="<%=webpath%>city/?cityid=299">�Ͳ�</a></li>
        <li><a href="<%=webpath%>city/?cityid=94">տ��</a></li>
        <li><a href="<%=webpath%>city/?cityid=211">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=62">����</a></li>
        <li><a href="<%=webpath%>city/?cityid=165">פ���</a></li>
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