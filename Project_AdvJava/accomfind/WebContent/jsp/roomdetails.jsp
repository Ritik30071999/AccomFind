<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>roomdetails</title>
<link rel="stylesheet" type="text/css" href="/accomfind/css/style.css">
<script src="/accomfind/js/validation.js"></script>
<script type="text/javascript">
	function main() {

		flag = true

		var ownerid = document.getElementById("txtownerid").value
		var charges = document.getElementById("txtcharges").value
		var total = document.getElementById("txttotal").value
		var facilities = document.getElementById("txtfacilities").value
		//alert(userid+userpass)//only for testing

		if (checkEmpty(ownerid) == false) {
			document.getElementById("msgownerid").innerHTML = "OwnerId Required"
			flag = false
		}
		if (checkEmpty(charges) == false) {
			document.getElementById("msgcharges").innerHTML = "Charges Required"
			flag = false
		}
		if (checkEmpty(total) == false) {
			document.getElementById("msgtotal").innerHTML = "Total Rooms Required"
			flag = false
		}
		if (checkEmpty(facilities) == false) {
			document.getElementById("msgfacilities").innerHTML = "Facilities Required"
			flag = false
		}
		return flag

	}
</script>
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
		<form method="post" action="/accomfind/RoomDetails"
			onsubmit="return main()">
			<table class="decor">
				<tr>
					<th style="font-size: x-large; color: red;"><label>Id:-</label></th>
					<th><input type="text" placeholder="Enter Owner ID" id="txtownerid"
						name="txtownerid"></th>
					<th><span id="msgownerid" style="color: red"></span></th>
				</tr>
       			<tr>
					<th style="font-size: x-large; color: red;"><label>Charges:-</label></th>
					<th><input type="text" placeholder="Enter Charges"
						id="txtcharges" name="txtcharges"></th>
					<th><span id="msgcharges" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Total Rooms:-</label></th>
					<th><input type="text" placeholder="Enter Total Rooms" id="txttotal"
						name="txttotal"></th>
					<th><span id="msgtotal" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Facilities:-</label></th>
					<th><input type="text" placeholder="Enter Facilities" id="txtfacilities"
						name="txtfacilities"></th>
					<th><span id="msgfacilities" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Air Condition:-</label></th>
					<th><select id="cmbac" name="cmbac">
							<option value="yes">Yes</option>
							<option value="no">No</option>
					</select></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Roomtype:-</label></th>
					<th><select id="cmbroomtyype" name="cmbroomtype">
							<option value="Single">Single</option>
							<option value="Double">Double</option>
							<option value="Triple">Triple</option>
					</select></th>
				</tr>
				<tr>
					<th><input type="reset"></th>
					<th colspan="2"><button type="submit">Submit</button></th>
				</tr>
			</table>
		</form>
	</div>
	<%
		}
	%>
</body>
</html>