<%@page import="kr.pe.okjsp.okhq.MemberDao"
%><%@page import="kr.pe.okjsp.member.Member"
%><%@page import="java.util.List"
%><%@page language="java" contentType="text/plain; charset=euc-kr"
    pageEncoding="euc-kr"
%><%@ include file="/check.jsp" 
%><%
	MemberDao dao = new MemberDao();
	List<Member> list = dao.getMailingList();
	int count = 0;
	for (Member row : list) {
%>"<%= ++count %>","<%= row.getName() %>","<%= row.getEmail() %>","<%= row.getJoindate() %>","<%= row.getSid() %>","<%= row.getId() %>","<%= row.getPoint() %>"
<%
	}
%>

