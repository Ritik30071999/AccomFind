<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="accomfind.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>userhome</title>
<link rel="stylesheet" type="text/css" href="/accomfind/css/style.css">
</head>
<body>
	<%
		HttpSession hs = request.getSession(false);
		String userid = (String) hs.getAttribute("sessionkey");
		if (userid == null || hs.isNew()) {

		} else {
	%>
	<div
		style="width: 100%; height: 80px; background-color: cyan; float: left">
		<span style="color: red; font-size: 30px; float: left">Hello <%=userid%></span>
		<div style="margin-left: 1400px; margin-bottom: 0px;">
			<a href="/accomfind/LogOff">Log Out</a>
		</div>
	</div>
	<div
		style="width: 20%; height: 900px; background-color: green; float: left">
		<%@include file="/menus/menu2.html"%>
	</div>
	<div
		style="width: 80%; height: 900px; background-color: orange; float: left">
		<%
			String strsql = "select * from news order by date desc limit 5";
				ResultSet rs = CrudOperation.getData(strsql);
		%>
		<marquee direction="up" onmouseover="this.stop()"
			onmouseout="this.start()">
			<ul style="list-style-type: none;">
				<%
					while (rs.next()) {
							String id = rs.getString("newsid");
				%>
				<li><a href="/accomfind/jsp/viewnews.jsp?nid=<%=id%>"><%=rs.getString("topic")%></a></li>
				<%-- <li><a href="#"><%=rs.getString("newsid")%></a></li> --%>
				<%
					}
				%>
			</ul>
		</marquee>
	</div>
	<%
		}
	%>
</body>
</html>