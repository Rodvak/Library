<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>Welcome</title>
</head>
<body>
<div class="container bg-light bg-gradient mt-5 p-4 border border-5 border-secondary text-secondary">
<h1 class="font-monospace text-secondary">Hello, <c:out value="${loggedUser.userName}"></c:out>.  Here are some suggestions.</h1>

<table class="table table-light table-striped table-borderless mt-5 font-monospace text-secondary">
			<thead>
				<tr>
					<th>Name</th>
					<th>Gender</th>
					<th>Origin</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="baby" items="${allBabys}">
					<tr>
						<td><a class="link-secondary" href="/babys/${baby.id}">
						<c:out value="${baby.babyName}"></c:out></a></td>
						<td><c:out value="${baby.gender}"></c:out></td>
						<td><c:out value="${baby.origin}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
<a class="btn btn-outline-warning" href="/logout">Logout</a>
<br /><br /> 
<a class="btn btn-outline-secondary" href="/names/new">New Name</a>
</div>
</body>
</html>
