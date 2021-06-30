<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/post.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Alegreya+Sans+SC&family=Audiowide&family=Bebas+Neue&family=Bowlby+One+SC&family=Bungee&family=Dela+Gothic+One&family=Open+Sans&family=Roboto&family=Roboto+Slab&display=swap" rel="stylesheet">
	<title>WoW:Blog - ${post.title}</title>
</head>
<body>
	<div class="container">
		<header>
			<h1></h1>
			<nav>
				<a href="/home">Back Home</a>
				<a href="/about">Meet the Devs</a>
				<a href="/logout">Logout</a>
			</nav>
		</header>
		<main>
			<div class="post_container">
				<img src="${post.imageURL}">
				<h1>${post.title}</h1>
				<p>${post.content}</p>
			</div>
			<div class="comment_container">
				<h3>Comments</h3>
				<c:forEach items="${comments}" var="comment">
					<%-- TO DO - NEED TO DISPLAY THE USER WHO CREATED THE COMMENT --%>
					<p>${comment.user.username}</p>
					<p>${comment.content}</p>
				</c:forEach>
				<form:form method="POST" action="/post/${post.id}/newComment" modelAttribute="comment">
					<div class="form">
						<form:label path="content">Comment:</form:label>
						<form:textarea type="text" path="content" rows="4" cols="50"/>
						<input class="btn" type="submit" value="Submit"/>
					</div>
				</form:form>
			</div>
		</main>
	</div>
</body>
</html>