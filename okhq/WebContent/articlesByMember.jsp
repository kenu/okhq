<%@page import="kr.pe.okjsp.okhq.ArticleDao"%>
<%@page import="kr.pe.okjsp.Article"%>
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
<title>OKJSP member articles</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>member article</h1>
<h2 class="warning">대외비</h2>
<table>
<tr><th>#</th>
<th>게시판</th>
<th>제목</th>
<th>내용</th>
<th>일시</th>
<th>연번</th>
<th>닉네임</th>
<th>view</th>
<th>memo</th>
</tr>
<%
	ArticleDao dao = new ArticleDao();
	String sidr  = request.getParameter("sid");
	List<Article> list = dao.getArticleListBy(sidr);
	int count = 0;
	for (Article row : list) {
%><tr>
<td><%= ++count %></td>
<td><%= row.getBbs() %></td>
<td class="title"><%= row.getSubject() %></td>
<td class="preview"><%= row.getContent() %></td>
<td><%= row.getWhen("yyyy-MM-dd HH:mm:ss") %></td>
<td class="number"><%= row.getSeq() %></td>
<td><%= row.getWriter() %></td>
<td class="number"><%= row.getRead() %></td>
<td class="number"><%= row.getMemo() %></td>
<td class="number"><%= row.getId() %></td>
</tr>
<%
	}
%>
</table>
<%= list.size() %>
<%= sidr %>
</body>
</html>

