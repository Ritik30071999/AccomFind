<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adminhome</title>
<link rel="stylesheet" type="text/css"
	href="/accomfind/bs/bootstrap.min.css">
<script src="/accomfind/bs/bootstrap.min.js"></script>
<script src="/accomfind/bs/jquery-3.4.1.min.js"></script>
</head>
<body background="/accomfind/images/acm6.jpg">
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
	<br>
	<script src="/accomfind/bs/bootstrap.min.js"></script>
	<script src="/accomfind/bs/jquery-3.4.1.min.js"></script>
	<%
		}
	%>
</body>
</html>