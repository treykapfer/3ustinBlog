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
			<div class="post_wrap">
				<div class="post_img">
					<img src="${post.imageURL}">
				</div>
				<div class="post_content">
					<h1>${post.title}</h1>
					<h6>Posted by ${post.user.username} at ${post.createdAt}</h6>
					<p>${post.content}</p>
				</div>
			</div>
			<div class="comment_container">
				<h2>Comments</h2>
				<c:forEach items="${post.comments}" var="comment">
					<div class="comment_card">
						<p>${comment.user.username} says:</p>
						<p class="high_font">${comment.content}</p>
						<small>Posted at ${comment.createdAt}</small>
					</div>
				</c:forEach>
				<form:form method="POST" action="/post/${post.id}/newComment" modelAttribute="comment" id="comment_form">
					<div class="form">
						<form:label path="content">Comment:</form:label>
						<form:textarea type="text" path="content" rows="4" cols="50"/>
						<input class="btn" type="submit" value="Comment"/>
					</div>
				</form:form>
			</div>
		</main>
	</div>
</body>
</html>