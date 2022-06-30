<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Red-Belt</title>
</head>
<body>
	<div class="container px-4">
		<div class="row gx-5 mt-5">
			<h1 class="font-monospace 4rem fw-bolder text-secondary">Welcome</h1>
			<div class="col">
				<div
					class="p-3 bg-light border border-5 border-secondary p-5 mt-5 p-3 mb-5 rounded bg-light bg-gradient font-monospace text-secondary">
				<form:form action="/register" method="post" modelAttribute="newUser">
				<div class="mb-3">
					<form:label class="form-label" path="userName">Name</form:label>
					<form:errors class="link-dark fw-bold" path="userName" />
					<form:input class="form-control" path="userName" />
				</div>
				<div class="mb-3">
					<form:label class="form-label" path="email">Email</form:label>
					<form:errors class="link-dark fw-bold" path="email" />
					<form:input class="form-control" path="email" />
				</div>
				<div class="mb-3">
					<form:label class="form-label" path="password">Password</form:label>
					<form:errors class="link-dark fw-bold" path="password" />
					<form:input type="password" class="form-control" path="password" />
				</div>
				<div class="mb-3">
					<form:label class="form-label" path="confirm">Confirm Password</form:label>
					<form:errors class="link-dark fw-bold" path="confirm" />
					<form:input type="password" class="form-control" path="confirm" />
				</div>
				<input type="submit" value="Sign Up" class="btn btn-outline-secondary" />
				</form:form>
				</div>
			</div>
			<div class="col">
				<div
					class="p-3 bg-light border border-5 border-secondary p-5 mt-5 p-3 mb-5 rounded bg-light bg-gradient font-monospace text-secondary">
				<form:form action="/login" method="post" modelAttribute="newLogin">
				<div class="mb-3">
					<form:label class="form-label" path="email">Email</form:label>
					<form:errors class="link-dark fw-bold" path="email" />
					<form:input class="form-control" path="email" />
				</div>
				<div class="mb-3">
					<form:label class="form-label" path="password">Password</form:label>
					<form:errors class="link-dark fw-bold" path="password" />
					<form:input type="password" class="form-control" path="password" />
				</div>
				<input type="submit" value="Login" class="btn btn-outline-secondary" />
				</form:form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>