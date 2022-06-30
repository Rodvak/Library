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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>The Baby</title>
</head>
<body>
	<div
		class="container bg-light bg-gradient mt-5 p-4 border border-5 border-secondary text-secondary font-monospace text-secondary">
		<h1><c:out value="${baby.babyName}"></c:out></h1>
		<br />
		<h2>(added by) <c:out value="${baby.user.getUserName()}"></c:out></h2>
		<br />
		<h3>Gender: <c:out value="${baby.gender}"></c:out></h3><br />
		<h3>Origin: <c:out value="${baby.origin}"></c:out></h3><br />
		<h3>Meaning: <c:out value="${baby.meaning}"></c:out></h3><br />
		<br />
		<c:if test="${baby.user == loggedUser}">
			<a class="btn btn-outline-success" href="/babys/${baby.id}/edit">Edit</a><br />
		</c:if>
	 <br /> <a class="btn btn-outline-secondary" href="/home">Home</a>
	</div>
</body>
</html>