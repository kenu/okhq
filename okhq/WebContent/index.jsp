<%@page import="java.util.List"%>
<%@page import="kr.pe.okjsp.okhq.AdLogStatDto"%>
<%@page import="kr.pe.okjsp.okhq.AdLogStatDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/check.jsp" %>
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
	String yyyyMM = request.getParameter("yyyyMM");
	AdLogStatDao dao = new AdLogStatDao();
	List<AdLogStatDto> list = dao.getListByMonth(yyyyMM);
	for (AdLogStatDto row : list) {
%><tr><td><a href="clickSummary.jsp?d=<%= row.getLdate() %>"><%= row.getLdate() %></a></td>
<td class="number"><%= row.getLcount() %></td></tr>
<%
	}
%>
</table>
<div>
<form action="./" method="get">
<select name="yyyyMM">
<option>201406</option>
<option>201405</option>
<option>201404</option>
<option>201403</option>
<option>201402</option>
<option>201401</option>
<option>201312</option>
<option>201311</option>
<option>201310</option>
<option>201309</option>
<option>201308</option>
<option>201307</option>
<option>201306</option>
<option>201305</option>
<option>201304</option>
<option>201303</option>
<option>201302</option>
<option>201301</option>
<option>201212</option>
<option>201211</option>
<option>201210</option>
<option>201209</option>
<option>201208</option>
<option>201207</option>
<option>201206</option>
<option>201205</option>
<option>201204</option>
</select>
<input type="submit" value="조회">
</form>
</div>
<jsp:include page="/navigation.jsp"></jsp:include>
</body>
</html>