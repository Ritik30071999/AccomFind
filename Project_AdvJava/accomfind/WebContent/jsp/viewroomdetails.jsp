<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="accomfind.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewroomdetails</title>
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
		<%
			String strsql = "select * from room_details where ownerid=?";
				ResultSet rsdata = CrudOperation.getData(strsql, ownerid);
				if (rsdata.next()) {
					String id = rsdata.getString("ownerid");
					String ac = rsdata.getString("aircondition");
					String charges = rsdata.getString("charges");
					String facilities = rsdata.getString("facilities");
					String total = rsdata.getString("totalrooms");
					String type = rsdata.getString("roomtype");
		%>
		<table border=2 style="margin-left: 100px; margin-top: 100px">
			<tr>
				<th>ID</th>
				<th><%=id%></th>
			</tr>
			<tr>
				<th>Type</th>
				<th><%=type%></th>
			</tr>
			<tr>
				<th>Charges</th>
				<th><%=charges%></th>
			</tr>
			<tr>
				<th>Total Rooms</th>
				<th><%=total%></th>
			</tr>
			<tr>
				<th>Facilities</th>
				<th><%=facilities%></th>
			</tr>
			<tr>
				<th>Air Condition</th>
				<th><%=ac%></th>
			</tr>
		</table>
		<%
			}
		%>
	</div>
	<%
		}
	%>
</body>
</html>