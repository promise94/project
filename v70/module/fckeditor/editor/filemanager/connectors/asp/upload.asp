<%	Response.Clear
	Response.Write "<script type=""text/javascript"">"
	Response.Write "(function(){var d=document.domain;while (true){try{var A=window.parent.document.domain;break;}catch(e) {};d=d.replace(/.*?(?:\.|$)/,'');if (d.length==0) break;try{document.domain=d;}catch (e){break;}}})();"
	Response.Write "window.parent.OnUploadCompleted(1,""" & Replace( "", """", "\""" ) & """,""" & Replace( "", """", "\""" ) & """,""" & Replace( "对不起，网站关闭此功能！" , """", "\""" ) & """) ;"
	Response.Write "</script>"
	Response.End
%>
