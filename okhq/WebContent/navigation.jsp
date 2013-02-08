<%@page import="java.util.Date"
%><%@page import="kr.pe.okjsp.util.CommonUtil"
%><%@ page pageEncoding="utf-8" 
%><%
	String today = CommonUtil.formatDate(new Date(), "yyyy-MM-dd");
%>
<nav id="nav">
<ul>
	<li><a href="/">okjsp home</a></li>
	<li><a href="/okhq/">okhq home</a></li>
</ul>
<ul>
	<li><a href="index.jsp">일별 통계</a></li>
	<li><a href="clickSummary.jsp?d=<%= today %>">광고 클릭</a></li>
</ul>
<ul>
	<li><a href="member.jsp">최근 회원 500</a></li>
	<li><a href="memberMailingList.jsp">메일링리스트</a></li>
</ul>
</nav>