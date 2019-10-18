<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="accomfind.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admininbox</title>
<link rel="stylesheet" type="text/css"
	href="/accomfind/bs/bootstrap.min.css">
<script src="/accomfind/bs/bootstrap.min.js"></script>
<script src="/accomfind/bs/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%
		HttpSession hs = request.getSession(false);
		String ownerid = (String) hs.getAttribute("sessionkey");
		if (ownerid == null || hs.isNew()) {

		} else {
	%>
	<nav
		class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center">
		<!-- Brand -->
		<a class="navbar-brand" href="#"> <img
			src="/accomfind/images/acm2.jpg" alt="logo" style="width: 40px;">
		</a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="/accomfind/jsp/viewowners.jsp">View Owners</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/accomfind/jsp/viewusers.jsp">View Users</a></li>


			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Message </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/accomfind/jsp/compose.jsp">Compose</a>
					<a class="dropdown-item" href="/accomfind/jsp/inbox.jsp">Inbox</a>
				</div></li>

			<li class="nav-item"><a class="nav-link"
				href="/accomfind/jsp/registration.jsp">Create Account </a></li>

			<li class="nav-item"><a class="nav-link"
				href="/accomfind/jsp/deleteaccount.jsp">Delete Account</a>
			<li class="nav-item navbar-right"><a class="nav-link"
				href="/accomfind/LogOff">Log Out</a>
		</ul>
	</nav>
	<br>
	<div
		style="width: 100%; height: 900px; background-color: orange; float: left">
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
	<script src="/accomfind/bs/bootstrap.min.js"></script>
	<script src="/accomfind/bs/jquery-3.4.1.min.js"></script>

</body>
</html>