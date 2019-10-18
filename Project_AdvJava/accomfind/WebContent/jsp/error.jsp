<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>errorpage</title>
</head>
<body>
	<h1>Some fault occurred or Server is busy!</h1>
	<%
		System.out.println(exception.getMessage());
	%>
</body>
</html>