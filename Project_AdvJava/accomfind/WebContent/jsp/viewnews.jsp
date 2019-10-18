<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="accomfind.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewnews</title>
</head>
<body>
	<%
		int newsid = Integer.parseInt(request.getParameter("nid"));
		String strsql = "select topic from news where newsid=?";
		ResultSet rs = CrudOperation.getData(strsql, newsid);
		if (rs.next()) {
	%>
	<div
		style="background-color: cyan; width: 50%; height: 300px; overflow: scroll;">
		<p style="color: red; font-size: medium;"><%=rs.getString("contents")%></p>
	</div>
	<%
		}
	%>
</body>
</html>