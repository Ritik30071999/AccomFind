<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>news</title>
<style>
table.decor {
	width: 50%;
	height: 500px;
	background-color: pink;
	margin-left: 400px;
	border-style: solid;
	border-color: red;
	border-radius: 20px;
}
</style>
</head>
<body bgcolor="cyan">
	<div style="width: 100%; height: 100px; float: left;">
		<table style="margin-top: -40px; margin-left: 300px; padding: 10px;">
			<tr>
				<th style="padding: 50px"><a href="/accomfind/html/home.html">Home</a></th>
				<th style="padding: 50px"><a
					href="/accomfind/html/facilities.html">Facilities</a></th>
				<th style="padding: 50px"><a href="/accomfind/html/area.html">Areas</a></th>
				<th style="padding: 50px"><a
					href="/accomfind/html/homeregistration.html">Registration</a></th>
				<th style="padding: 50px"><a href="/accomfind/jsp/news.jsp">News</a></th>
				<th style="padding: 50px"><a
					href="/accomfind/html/aboutus.html">About Us</a></th>
			</tr>
		</table>
	</div>
	<div>
		<p style="text-align: center; font-size: xx-large;">
			<strong>News</strong>
		</p>
		<form method="post" action="/accomfind/News" onsubmit="">
			<table class="decor">
				<tr>
					<th style="font-size: x-large;">News ID:-</th>
					<th><input type="text" placeholder="Enter NewsID"
						required="required" id="txtnewsid" name="txtnewsid"></th>
				</tr>
				<tr>
					<th style="font-size: x-large;">Title-</th>
					<th><input type="text" placeholder="Enter Subject"
						required="required" id="txttitle" name="txttitle"></th>
				</tr>
				<tr>
					<th style="font-size: x-large;">Text:-</th>
					<th><textarea rows="6" cols="20" placeholder="Enter News"
							required="required" id="txtarea" name="txtarea"></textarea></th>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">Submit</button></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>