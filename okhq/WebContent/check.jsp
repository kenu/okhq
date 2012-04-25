<%@page import="kr.pe.okjsp.Navigation"%>
<%@page import="kr.pe.okjsp.util.CommonUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String sid = CommonUtil.getCookie(request, "sid");
	boolean isValid = "163".equals(sid);
	
	if (!isValid) {
    	response.sendRedirect(Navigation.getPath("LOGFORM"));
    	return;
    }
%>