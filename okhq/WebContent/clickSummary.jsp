<%@page import="kr.pe.okjsp.okhq.AdLogStatDao"%>
<%@page import="kr.pe.okjsp.okhq.AdLogSummary"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%--@ include file="/check.jsp" --%>
<%
	String date = request.getParameter("d");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AD Click Detail</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Daily Click Detail</h1>
<table>
<tr><th>URL</th><th>Click of <%= date %></th></tr>
<%
	AdLogStatDao dao = new AdLogStatDao();
	List<AdLogSummary> list = dao.getSummary(date);
	for (AdLogSummary row : list) {
%><tr><td><a href="clickDetail.jsp?d=<%= date %>#<%= row.getUrl() %>"><%= row.getUrl() %></a></td>
<td class="number"><%=row.getCount() %></td></tr>
<%
	}
%>
</table>
</body>
</html>