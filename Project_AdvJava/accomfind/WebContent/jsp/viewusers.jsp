<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="accomfind.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewusers</title>
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
	%><nav
		class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center">
		<!-- Brand -->
		<a class="navbar-brand" href="#"> <img
			src="/accomfind/images/acm2.jpg" alt="logo" style="width: 40px;">
		</a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="/accomfind/jsp/adminhome.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/accomfind/jsp/viewowners.jsp">View Owners</a></li>


			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Message </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/accomfind/jsp/compose.jsp">Compose</a>
					<a class="dropdown-item" href="/accomfind/jsp/admininbox.jsp">Inbox</a>
				</div></li>

			<li class="nav-item"><a class="nav-link"
				href="/accomfind/jsp/registration.jsp">Create Account </a></li>

			<li class="nav-item"><a class="nav-link"
				href="/accomfind/jsp/deleteaccount.jsp">Delete Account</a>
			<li class="nav-item navbar-right"><a class="nav-link"
				href="/accomfind/LogOff">Log Out</a>
		</ul>
	</nav>
	<div
		style="width: 100%; height: 900px; background-color: orange; float: left">
		<table border=2 style="margin-left: 100px; margin-top: 100px">
			<tr>
				<th>Name</th>
				<th>Address</th>
				<th>Email</th>
				<th>Phone No.</th>
				<th>Gender</th>
			</tr>
			<%
				String strsql = "select * from user";
					ResultSet rsdata = CrudOperation.getData(strsql);
					while (rsdata.next()) {
						String name = rsdata.getString("name");
						String address = rsdata.getString("address");
						String email = rsdata.getString("email");
						String phone = rsdata.getString("phoneno");
						String gender = rsdata.getString("gender");
			%>
			<tr>
				<th><%=name%></th>
				<th><%=address%></th>
				<th><%=email%></th>
				<th><%=phone%></th>
				<th><%=gender%></th>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<br>
	<%
		}
	%>
	<script src="/accomfind/bs/bootstrap.min.js"></script>
	<script src="/accomfind/bs/jquery-3.4.1.min.js"></script>
</body>
</html>