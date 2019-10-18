<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="accomfind.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>inbox</title>
<link rel="stylesheet" type="text/css" href="/accomfind/css/style.css">
</head>
<body>
	<%
		HttpSession hs = request.getSession(false);
		String ownerid = (String) hs.getAttribute("sessionkey");
		if (ownerid == null || hs.isNew()) {

		} else {
	%>
	<div
		style="width: 100%; height: 80px; background-color: cyan; float: left">
		<span style="color: red; font-size: 30px; float: left">Hello <%=ownerid%></span>
		<div style="margin-left: 1400px; margin-bottom: 0px;">
			<a href="/accomfind/LogOff">Log Out</a>
		</div>
	</div>
	<div
		style="width: 20%; height: 900px; background-color: green; float: left">
		<%@include file="/menus/menu.html"%>
	</div>
	<div
		style="width: 80%; height: 900px; background-color: orange; float: left">
		<form method="post" action="/accomfind/Inbox">
			<table border="2" style="margin-left: 100px; margin-top: 100px">
				<tr>
					<th>Select</th>
					<th>SenderId</th>
					<th>Date</th>
					<th>Subject</th>
				</tr>
				<%
					String strsql = "select * from inbox";
						ResultSet rsdata = CrudOperation.getData(strsql);
						while (rsdata.next()) {
							String senderid = rsdata.getString("senderid");
							String date = rsdata.getString("dateofmsg");
							String subject = rsdata.getString("subject");
				%>
				<tr>
					<th><input type="checkbox" name="chk" value="<%=senderid%>"></th>
					<th><%=senderid%></th>
					<th><%=date%></th>
					<th><%=subject%></th>
				</tr>
				<%
					}
				%>
				<tr colspan="4" align="center">
					<th><button type="submit">Delete</button></th>
				</tr>
			</table>
		</form>
	</div>
	<%
		}
	%>
</body>
</html>