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
<title>Create a Name</title>
</head>
<body>
<div class="container bg-light bg-gradient mt-5 p-4 border border-5 border-secondary text-secondary font-monospace text-secondary">
		<h1>Add a Name ${loggedUser.userName}.</h1>
		<form:form action="/create/baby" method="post" modelAttribute="baby">
		<form:input type="hidden" path="user" value="${user_id}"/>
		
			<div class="mb-3">
				<form:label class="form-label" path="babyName">New Name</form:label>
				<form:errors class="link-secondary" path="babyName" />
				<form:input class="form-control" path="babyName" />
			</div>
			<div class="mb-3">
				<form:label class="form-label" path="gender">Typical Gender</form:label>
				<form:errors class="link-secondary" path="gender" />
				<form:select class="form-select" path="gender">
				<form:option value="Neutral"></form:option>
				<form:option value="Female"></form:option>
				<form:option value="Male"></form:option>
				</form:select>	
			</div>
			<div class="mb-3">
				<form:label class="form-label" path="origin">Origin</form:label>
				<form:errors class="link-secondary" path="origin" />
				<form:input class="form-control" path="origin" />
			</div>
			<div class="mb-3">
				<form:label class="form-label" path="meaning">Meaning</form:label>
				<form:errors class="link-secondary" path="meaning" />
				<form:input class="form-control" path="meaning" />
			</div>
			<input type="submit" value="Submit" class="btn btn-outline-secondary" />
		</form:form>
		<br />
			<a class="btn btn-outline-warning" href="/home"> Cancel</a>
	</div>
</body>
</html>