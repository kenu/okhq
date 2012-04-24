<%@page import="java.util.List"%>
<%@page import="kr.pe.okjsp.okhq.AdLogStatDto"%>
<%@page import="kr.pe.okjsp.okhq.AdLogStatDao"%>
<%@ page language="java" contentType="text/html; charset="
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AD Click</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Daily Click</h1>
<table>
<tr><th>Date</th><th>Click</th></tr>
<%
	AdLogStatDao dao = new AdLogStatDao();
	List<AdLogStatDto> list = dao.getList();
	for (AdLogStatDto row : list) {
%><tr><td><%= row.getLdate() %></td><td class="number"><%= row.getLcount() %></td></tr>
<%
	}
%>
</table>
</body>
</html>