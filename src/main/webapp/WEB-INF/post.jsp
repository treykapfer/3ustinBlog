<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ideas</title>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between text-white bg-dark align-items-center p-2">
			<h1>Welcome ${sesUser.username}</h1>
			<nav>
				<a class="btn btn-primary" href="/about">Meet the Devs</a>
				<a class="btn btn-primary" href="/logout">Logout</a>
			</nav>
		</header>
		<main>
			<h1>${post.title}</h1>
			<img href="${post.imageURL}">
			<p>${post.content}</p>
		</main>	
		<footer>
			<c:forEach items="${comments}" var="comment"> 
				<p>${comment.content}</p>
			</c:forEach>
			<small class="text-warning text-right">${userID}</small>
		</footer>
	</div>
</body>
</html>