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
<style type="text/css">
* {
text-align: center;
font-size: smaller;
}
.number {
text-align: right;
}
table {
border: 1px solid #ccc;
margin: 0 auto;
}
</style>
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