<%@page import="kr.pe.okjsp.member.MemberDao"%>
<%@page import="kr.pe.okjsp.member.Member"%>
<%@page import="java.util.List"%>
<%@page import="kr.pe.okjsp.okhq.AdLogStatDto"%>
<%@page import="kr.pe.okjsp.okhq.AdLogStatDao"%>
<%@ page language="java" contentType="text/html; charset="
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>OKJSP members</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>member list</h1>
<table>
<tr><th>Name</th><th>Email</th></tr>
<%
	MemberDao dao = new MemberDao();
	List<Member> list = dao.getList();
	for (Member row : list) {
%><tr><td><%= row.getName() %></td><td class="number"><%= row.getEmail() %></td></tr>
<%
	}
%>
</table>
</body>
</html>

