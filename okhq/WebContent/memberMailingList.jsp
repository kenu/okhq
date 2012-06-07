<%@page import="kr.pe.okjsp.okhq.MemberDao"%>
<%@page import="kr.pe.okjsp.member.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/plain; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/check.jsp" %>
<%
	MemberDao dao = new MemberDao();
	List<Member> list = dao.getMailingList();
	int count = 0;
	for (Member row : list) {
%>"<%= ++count %>","<%= row.getName() %>","<%= row.getEmail() %>","<%= row.getMailing() %>","<%= row.getJoindate() %>","<%= row.getSid() %>","<%= row.getId() %>","<%= row.getPoint() %>"
<%
	}
%>

