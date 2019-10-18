<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="accomfind.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewowners</title>
<link rel="stylesheet" type="text/css"
	href="/accomfind/bs/bootstrap.min.css">
<script src="/accomfind/bs/bootstrap.min.js"></script>
<script src="/accomfind/bs/jquery-3.4.1.min.js"></script>
</head>
<body>
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
				href="/accomfind/jsp/viewusers.jsp">View Users</a></li>


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
				<th>Hostel Name</th>
				<th>Address</th>
				<th>Email</th>
				<th>Phone No.</th>
				<th>Owner Name</th>
				<th>Area ID</th>
				<th>Category</th>
				<th>Subscription ID</th>
				<th>Type</th>
			</tr>
			<%
				String strsql = "select * from hostel_pg_owner";
					ResultSet rsdata = CrudOperation.getData(strsql);
					while (rsdata.next()) {
						String hostelname = rsdata.getString("hostelname");
						String address = rsdata.getString("address");
						String email = rsdata.getString("email");
						String phone = rsdata.getString("phoneno");
						String ownername = rsdata.getString("ownername");
						String areaid = rsdata.getString("areaid");
						String category = rsdata.getString("category");
						String subid = rsdata.getString("subscriptionid");
						String type = rsdata.getString("type");
			%>
			<tr>
				<th><%=hostelname%></th>
				<th><%=address%></th>
				<th><%=email%></th>
				<th><%=phone%></th>
				<th><%=ownername%></th>
				<th><%=areaid%></th>
				<th><%=category%></th>
				<th><%=subid%></th>
				<th><%=type%></th>
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