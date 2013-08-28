<%@page import="kr.pe.okjsp.Navigation"%>
<%@page import="kr.pe.okjsp.util.CommonUtil"%>
<%
	long sid = CommonUtil.getCookieLong(request, "sid");
	boolean isValid = 8912 == sid || 163 == sid
			|| 21987 == sid || 8510 == sid
			|| 21016 == sid;
	
	if (!isValid) {
    	response.sendRedirect(Navigation.getPath("LOGFORM"));
    	return;
    }
%>