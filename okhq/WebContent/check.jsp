<%@page import="kr.pe.okjsp.Navigation"%>
<%@page import="kr.pe.okjsp.util.CommonUtil"%>
<%
	String sid = CommonUtil.getCookie(request, "sid");
	boolean isValid = "8912".equals(sid) || "163".equals(sid) 
			|| "21987".equals(sid);
	
	if (!isValid) {
    	response.sendRedirect(Navigation.getPath("LOGFORM"));
    	return;
    }
%>