<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>compose</title>
<style>
table.decor {
	width: 50%;
	height: 400px;
	background-color: pink;
	margin-left: 400px;
	margin-top: 100px;
	border-style: solid;
	border-color: red;
	border-radius: 20px;
	border-style: solid;
}
</style>
</head>
<body bgcolor="cyan">
	<div style="width: 100%; height: 100px; float: left;">
		<table style="margin-top: -40px; margin-left: 300px; padding: 10px;">
			<tr>
				<th style="padding: 50px"><a href="/accomfind/html/home.html"
					style="color: yellow;">Home</a></th>
				<th style="padding: 50px"><a href="/accomfind/jsp/login.jsp"
					style="color: red;">Login</a></th>
				<th style="padding: 50px"><a
					href="/accomfind/html/facilities.html" style="color: green;">Facilities</a></th>
				<th style="padding: 50px"><a href="/accomfind/html/area.html"
					style="color: yellow;">Areas</a></th>
				<th style="padding: 50px"><a href="/accomfind/jsp/news.jsp"
					style="color: red;">News</a></th>
				<th style="padding: 50px"><a
					href="/accomfind/html/aboutus.html" style="color: green;">About
						Us</a></th>
			</tr>
		</table>
	</div>
	<h1 style="text-align: center">Compose</h1>
	<div>
		<form method="post" action="/accomfind/Compose" onsubmit="">
			<table class="decor">
				<tr>
					<th style="font-size: x-large;">Receiver Id:-</th>
					<th><input type="text" placeholder="Enter Receiver ID"
						id="txtid" name="txtid"></th>
				</tr>
				<tr>
					<th style="font-size: x-large;">Subject:-</th>
					<th><input type="text" placeholder="Enter Subject" id="txtsub"
						name="txtsub"></th>
				</tr>
				<tr>
					<th style="font-size: x-large;">Message:-</th>
					<th><textarea rows="7" cols="20" id="txtmsg" name="txtmsg"
							placeholder="Enter Message"></textarea></th>
				</tr>
				<tr>
					<th style="font-size: x-large;">Sender Id:-</th>
					<th><input type="text" placeholder="Enter Sender ID"
						id="txtsenderid" name="txtsenderid"></th>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">Submit</button></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>