<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registration</title>
<script src="/accomfind/bs/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready(function()

	{

		//alert("in fun")

		$("#txtuserid").blur(function() {
			var sid = this.value;
			//alert(sid);

			$.get("/accomfind/Registration", {
				id : sid

			}, function(data, status) {

				$("#check").html(data);

			});

		});

	});
</script>
<style>
table.decor {
	width: 50%;
	height: 700px;
	/* background-color: pink; */
	margin-left: 400px;
	border-style: solid;
	border-color: red;
	border-radius: 20px;
}
</style>
<script src="/accomfind/js/validation.js"></script>
<script type="text/javascript">
	function main() {

		flag = true

		var userid = document.getElementById("txtuserid").value
		var userpass = document.getElementById("txtuserpass").value
		var username = document.getElementById("txtusername").value
		var useremail = document.getElementById("txtuseremail").value
		var userphone = document.getElementById("txtuserphone").value
		var usersubid = document.getElementById("txtusersubid").value
		var useradd = document.getElementById("txtuseradd").value
		var userownname = document.getElementById("txtuserownname").value
		//alert(userid+userpass)//only for testing

		if (checkEmpty(userid) == false) {
			//alert("UserId Needed")
			document.getElementById("msguserid").innerHTML = "UserId Required"
			flag = false
		}

		if (checkEmpty(userpass) == false) {
			//alert("Password Required")
			document.getElementById("msguserpass").innerHTML = "Password Required"
			flag = false
		}

		if (checkEmpty(username) == false) {
			//alert("Username Required")
			document.getElementById("msgusername").innerHTML = "Username Required"
			flag = false
		}

		if (checkEmpty(useremail) == false) {
			//alert("Email Required")
			document.getElementById("msguseremail").innerHTML = "Email Required"
			flag = false
		}

		if (checkEmpty(userphone) == false) {
			//alert("PhoneNo Required")
			document.getElementById("msguserphone").innerHTML = "PhoneNo. Required"
			flag = false
		}
		
		if (checkEmpty(usersubid) == false) {
			//alert("UserId Needed")
			document.getElementById("msgusersubid").innerHTML = "SubscriptionId Required"
			flag = false
		}
		
		if (checkEmpty(useradd) == false) {
			//alert("UserId Needed")
			document.getElementById("msguseradd").innerHTML = "Address Required"
			flag = false
		}
		
		if (checkEmpty(userownname) == false) {
			//alert("UserId Needed")
			document.getElementById("msguserownname").innerHTML = "Owner Name Required"
			flag = false
		}
		return flag

	}
</script>
</head>
<body background="/accomfind/images/acm5.jpg" style="background-repeat: no-repeat; height: 100%; width: 100%">
	<h2 id="check" style="color: red"></h2>
		<div style="width: 100%; height: 100px; float: left;">
		<table style="margin-top: -40px; margin-left: 300px; padding: 10px;">
			<tr>
			    <th style="padding: 50px"><a href="/accomfind/html/home.html" style="color: yellow;">Home</a></th>
				<th style="padding: 50px"><a href="/accomfind/jsp/login.jsp" style="color: red;">Login</a></th>
				<th style="padding: 50px"><a href="/accomfind/html/facilities.html" style="color: green;">Facilities</a></th>
				<th style="padding: 50px"><a href="/accomfind/html/area.html" style="color: yellow;">Areas</a></th>				
				<th style="padding: 50px"><a href="/accomfind/jsp/news.jsp" style="color: red;">News</a></th>
				<th style="padding: 50px"><a href="/accomfind/html/aboutus.html" style="color: green;">About Us</a></th>
			</tr>
		</table>
	</div>
	<p style="font-size: xx-large; text-align: center; color: red;">
		<strong>Owner Registration</strong>
	</p>
	<div>
		<form method="post" action="/accomfind/Registration"
			onsubmit="return main()">
			<table class="decor">
				<tr>
					<th style="font-size: x-large; color: red;"><label>Id:-</label></th>
					<th><input type="text" placeholder="Enter ID" id="txtuserid"
						name="txtuserid"></th>
					<th><span id="msguserid" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Password:-</label></th>
					<th><input type="password" placeholder="Enter Password"
						id="txtuserpass" name="txtuserpass"></th>
					<th><span id="msguserpass" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Hostel Name:-</label></th>
					<th><input type="text" placeholder="Enter Hostel Name"
						id="txtusername" name="txtusername"></th>
					<th><span id="msgusername" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Owner Name:-</label></th>
					<th><input type="text" placeholder="Enter Owner Name"
						id="txtuserownname" name="txtuserownname"></th>
					<th><span id="msguserownname" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Email:-</label></th>
					<th><input type="email" placeholder="Enter Email"
						id="txtuseremail" name="txtuseremail"></th>
					<th><span id="msguseremail" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>PhoneNo.:-</label></th>
					<th><input type="text" placeholder="Enter Phone No."
						id="txtuserphone" name="txtuserphone"></th>
					<th><span id="msguserphone" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Subscription ID:-</label></th>
					<th><input type="text" placeholder="Enter Subscription ID"
						id="txtusersubid" name="txtusersubid"></th>
					<th><span id="msgusersubid" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Address:-</label></th>
					<th><input type="text" placeholder="Enter Address"
						id="txtuseradd" name="txtuseradd"></th>
					<th><span id="msguseradd" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Area</label></th>
					<th><select id="cmbarea" name="cmbarea">
							<option value="Gomti Nagar">Gomti Nagar</option>
							<option value="Mahanagar">Mahanagar</option>
							<option value="Indira Nagar">Indira Nagar</option>
							<option value="Hazrat Ganj">Hazrat Ganj</option>
					</select></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Category</label></th>
					<th><select id="cmbcat" name="cmbcat">
							<option value="girls">Girls</option>
							<option value="boys">Boys</option>
					</select></th>
				</tr>
				<tr>
					<th style="font-size: x-large; color: red;"><label>Type</label></th>
					<th><select id="cmbtype" name="cmbtype">
							<option value="single">Single</option>
							<option value="double">Double</option>
							<option value="triple">Triple</option>
					</select></th>
				</tr>
				<tr>
					<th><input type="reset"></th>
					<th colspan="2"><button type="submit">Submit</button></th>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>