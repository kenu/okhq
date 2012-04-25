<%@page import="kr.pe.okjsp.ad.AdLog"%>
<%@page import="java.util.List"%>
<%@page import="kr.pe.okjsp.okhq.AdLogStatDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AD Click</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Click History</h1>
<table>
<tr><th>Info</th><th>Date</th><th>Ip</th></tr>
<%
	AdLogStatDao dao = new AdLogStatDao();
	List<AdLog> list = dao.getHistory();
	for (AdLog row : list) {
%><tr><td><%= row.getUrl() %></td><td class="number"><%= row.getCredate().toString().substring(0,19) %></td>
<td><%= row.getIp() %></td></tr>
<%
	}
%>
</table>
</body>
</html>