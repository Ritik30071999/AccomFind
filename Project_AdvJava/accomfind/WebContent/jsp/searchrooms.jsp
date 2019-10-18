<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="accomfind.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>searchrooms</title>
<link rel="stylesheet" type="text/css" href="/accomfind/css/style.css">
<script src="/accomfind/bs/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function()

	{

		//alert("in fun")

		$("#cmbarea").blur(function() {
			var sid = this.value;
			//alert(sid);

			$.get("/accomfind/SearchRooms", {
				id : sid

			}, function(data, status) {

				$("#check").html(data);

			});

		});

	});
</script>
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
			<table>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Search
							Areas:-</label></th>
					<th><select id="cmbarea" name="cmbarea">
							<option value="Gomti Nagar">Gomti Nagar</option>
							<option value="Mahanagar">Mahanagar</option>
							<option value="Indira Nagar">Indira Nagar</option>
							<option value="Hazrat Ganj">Hazrat Ganj</option>
					</select></th>
				</tr>
				<tr>
					<th colspan="2"><button type="button">Search</button></th>
				</tr>
			</table>
		<div id="check" style="background-color: orange; float: left">
			<%
				String strsql = "select * from hostel_pg_owner where areaid=?";
					ResultSet rsdata = CrudOperation.getData(strsql, userid);
					if (rsdata.next()) {
						String hostelname = rsdata.getString("hostelname");
						String address = rsdata.getString("address");
						String email = rsdata.getString("email");
						String phoneno = rsdata.getString("phoneno");
						String ownername = rsdata.getString("ownername");
						String area = rsdata.getString("areaid");
						String category = rsdata.getString("category");
						String subid = rsdata.getString("subscriptionid");
						String type = rsdata.getString("type");
			%>
			<table border=2 style="margin-left: 100px; margin-top: 100px">
				<tr>
					<th>Hostel Name</th>
					<th><%=hostelname%></th>
				</tr>
				<tr>
					<th>Address</th>
					<th><%=address%></th>
				</tr>
				<tr>
					<th>Email</th>
					<th><%=email%></th>
				</tr>
				<tr>
					<th>Phone No.</th>
					<th><%=phoneno%></th>
				</tr>
				<tr>
					<th>Owner Name</th>
					<th><%=ownername%></th>
				</tr>
				<tr>
					<th>Area</th>
					<th><%=area%></th>
				</tr>
				<tr>
					<th>Category</th>
					<th><%=category%></th>
				</tr>
				<tr>
					<th>Subscription ID</th>
					<th><%=subid%></th>
				</tr>
				<tr>
					<th>Type</th>
					<th><%=type%></th>
				</tr>
			</table>
			<%
				}
			%>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>