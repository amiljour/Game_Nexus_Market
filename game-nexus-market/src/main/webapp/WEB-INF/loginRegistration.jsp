<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
<meta charset="UTF-8">
<title>LoginAndRegistration</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>

	<div class=" d-flex align-items-center m-5">

	<a href="/" class="btn btn-light "><- Back to Dashboard</a>

		<h1 class="text-center">Game Nexus Market</h1>

	</div>
	
	<div class="d-flex m-5">
	
		<div class="form-control me-5 d-flex flex-column">

			<h2 class="text-center">Register</h2>

			<form:form action="/register" method="POST" modelAttribute="newUser">

				<form:input type="hidden" path="admin" value="false" />

				<div class="form-group m-2">
					<form:label path="firstName">First Name:</form:label>
					<form:input type="text" path="firstName" class="form-control" />
					<form:errors path="firstName" class="text-danger" />
				</div>

				<div class="form-group m-2">
					<form:label path="lastName">Last Name:</form:label>
					<form:input type="text" path="lastName" class="form-control" />
					<form:errors path="lastName" class="text-danger" />
				</div>

				<div class="form-group m-2">
					<form:label path="email">Email:</form:label>
					<form:input type="text" path="email" class="form-control" />
					<form:errors path="email" class="text-danger" />
				</div>

				<div class="form-group m-2">
					<form:label path="password">Password:</form:label>
					<form:input type="password" path="password" class="form-control" />
					<form:errors path="password" class="text-danger" />
				</div>

				<div class="form-group m-2">
					<form:label path="confirm">Confirm Password:</form:label>
					<form:input type="password" path="confirm" class="form-control" />
					<form:errors path="confirm" class="text-danger" />
				</div>

				<button type="submit" class="btn btn-primary m-3">Submit</button>

			</form:form>

		</div>

		<div class="form-control ms-5">

			<h2 class="text-center">Login</h2>

			<form:form action="/login" method="POST" modelAttribute="newLogin">

				<div class="form-group m-2">
					<form:label path="email">Email:</form:label>
					<form:input type="text" path="email" class="form-control" />
					<form:errors path="email" class="text-danger" />
				</div>

				<div class="form-group m-2">
					<form:label path="password">Password:</form:label>
					<form:input type="password" path="password" class="form-control" />
					<form:errors path="password" class="text-danger" />
				</div>

				<button type="submit" class="btn btn-primary m-3">Submit</button>

			</form:form>

		</div>
	</div>


</body>
</html>