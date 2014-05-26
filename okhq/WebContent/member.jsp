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
<th>글보기</th>
</tr>
<%
	int pageNo = 0;
    String p = request.getParameter("page");

    MemberDao dao = new MemberDao();
    List<Member> list = null;
	if ("all".equals(p)) {
		list = dao.getList();
	} else if (p != null) {
		pageNo = Integer.parseInt(request.getParameter("page"));
	    list = dao.getList(pageNo);
	} else {
		list = dao.getList(0);
	}
	int count = 0;
	for (Member row : list) {
%><tr>
<td><%= ++count + pageNo * 500 %></td>
<td><%= row.getName() %></td>
<td><%= row.getEmail() %></td>
<td><%= row.getMailing() %></td>
<td><%= row.getJoindate() %></td>
<td class="number"><%= row.getSid() %></td>
<td><%= row.getId() %></td>
<td><%= row.getPoint() %></td>
<td><a href="./articlesByMember.jsp?sid=<%= row.getSid() %>" target="_blank">글이력</a></td>
</tr>
<%
	}
%>
<tr><td colspan="9">
<a href="javascript:history.back();" >back</a>
<a href="./member.jsp?page=<%= pageNo + 1 %>">next <%= pageNo + 1 %></a>
<a href="./member.jsp?page=all">all</a>
</td></tr>
</table>
<jsp:include page="/navigation.jsp"></jsp:include>
</body>
</html>

