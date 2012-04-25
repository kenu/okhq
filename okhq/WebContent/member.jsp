<%@page import="kr.pe.okjsp.okhq.MemberDao"%>
<%@page import="kr.pe.okjsp.member.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>OKJSP members</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>member list</h1>
<h2 class="warning">대외비</h2>
<table>
<tr><th>#</th>
<th>Name</th>
<th>Email</th>
<th>Mail</th>
<th>가입일</th>
<th>연번</th>
<th>아이디</th>
<th>포인트</th>
</tr>
<%
	MemberDao dao = new MemberDao();
	List<Member> list = dao.getList(500);
	int count = 0;
	for (Member row : list) {
%><tr>
<td><%= ++count %></td>
<td><%= row.getName() %></td>
<td><%= row.getEmail() %></td>
<td><%= row.getMailing() %></td>
<td><%= row.getJoindate() %></td>
<td class="number"><%= row.getSid() %></td>
<td><%= row.getId() %></td>
<td><%= row.getPoint() %></td>
</tr>
<%
	}
%>
</table>
</body>
</html>

