<%
hotelname=Request("hotelname")
MapBz=Trim(Request("MapBz"))
MapZm=Request("MapZm")
if MapZm="" then MapZm=9
h=request("h")*1
w=request("w")*1
%><iframe src='HotelMap.asp?MapBz=<%=mapbz%>&MapZm=11&hotelname=<%=ec(hotelname)%>&W=<%=w%>&h=<%=h%>&iToolTipStyle=3' width='<%=w%>' height='<%=h%>' border='0' marginwidth='0' marginheight='0' framespacing='0' frameborder='0' scrolling='no'></iframe>
<script language="javascript" runat="server">function ec(s){return escape(s);}</script>