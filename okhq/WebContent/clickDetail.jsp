<%@page import="kr.pe.okjsp.ad.AdLog"%>
<%@page import="java.util.List"%>
<%@page import="kr.pe.okjsp.okhq.AdLogStatDto"%>
<%@page import="kr.pe.okjsp.okhq.AdLogStatDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/check.jsp" %>
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
<tr><th>Date</th><th>Click of <%= date %></th></tr>
<%
	AdLogStatDao dao = new AdLogStatDao();
	List<AdLog> list = dao.getHistory(date);
	for (AdLog row : list) {
%><tr><td><%= row.getUrl() %></td><td class="number"><%= row.getCredate().toString().substring(0,19) %></td>
<td><%= row.getIp() %></td></tr>
<%
	}
%>
</table>
</body>
</html>