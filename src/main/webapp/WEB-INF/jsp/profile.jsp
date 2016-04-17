<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Welcome Login</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>

<body>
	<div class="container">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>User Id</th>
						<th>Name</th>
						<th>Birth Date</th>
						<th>Email ID</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><c:out value="${user.userId}" /></td>
						<td><c:out value="${user.firstName}" />&nbsp;&nbsp;<c:out
								value="${user.lastName}" /></td>
						<td><c:out value="${user.birthDate}" /></td>
						<td><c:out value="${user.emailId}" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</html>