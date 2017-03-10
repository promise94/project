<%
hotelname=Request("hotelname")
MapBz=Trim(Request("MapBz"))
MapZm=Request("MapZm")
if MapZm="" then MapZm=9
h=request("h")*1
w=request("w")*1
%>
<html>
<head>
<title>酒店地图</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script type="text/javascript" language="javascript" src="http://api.mapbar.com/api/mapbar31.2.js"></script>
<script language="JavaScript"  type="text/javascript" >
	var maplet=null;
window.onload=function(){
	maplet = new Maplet("DP_Map_Show");
	maplet.centerAndZoom(new MPoint('<%=MapBz%>'), <%=MapZm%>);
	maplet.showOverview(0,0);
	maplet.addControl(new MStandardControl());
	maplet.addOverlay(new MMarker(   
				new MPoint("<%=MapBz%>"),   
				new MIcon("images/mapb.gif",20,20),   
				null,
				new MLabel("<%=hotelname%>",25,2,80)
			)
	);
	maplet.refresh();
	};
</script>
<style>.*,font,a{font-size:12px; text-decoration:none;}</style>
</head>
<body  style="margin:0px">
<div id="DP_Map_Show" style="width:<%=w%>px; height:<%=h%>px;border:0px #CCC solid; margin-top:5px;"></div>
</body>
</html>