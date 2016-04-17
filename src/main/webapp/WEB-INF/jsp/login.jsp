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
		<div id="errorMessage">
			<c:choose>
				<c:when test="${result == false}">
					<div class="alert alert-danger fade in">
						<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Error!</strong>
						Invalid User Id / Password
					</div>
				</c:when>
				<c:when test="${result == true}">
					<div class="alert alert-success fade in">
						<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Success!</strong>
						Successful Login
					</div>
				</c:when>
			</c:choose>
		</div>


		<div class="container row">
			<div class="well bs-component">
				<form class="form-horizontal" name="login" action="login"
					method="POST">
					<div class="form-group">
						<label for="userId" class="col-lg-2 control-label">User ID
							:</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="userId" name="userId"
								placeholder="User Id" />
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="col-lg-2 control-label">Password
							:</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<button type="reset" class="btn btn-default">Reset</button>
							<button type="submit" class="btn btn-primary">Sign In</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</html>