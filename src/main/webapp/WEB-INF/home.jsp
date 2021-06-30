<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>WoW:Blog - Dashboard</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
</head>
<body>
	<div class="container">
		<header>
			<h1>Welcome ${sesUser.username}</h1>
			<nav>
				<a href="/about">Meet the Devs</a>
				<a href="/logout">Logout</a>
			</nav>
		</header>
		<main>
			<div class="post_container">
				<c:forEach items="${posts}" var="post">
					<a href="/post/${post.id}" class="post_row">
						<div class="post_img">
							<img src="${post.imageURL}">
						</div>
						<div class="post_content">
							${post.title}
							<p>${post.content}</p>
						</div>
					</a>
				</c:forEach>
			</div>
		</main>	
		<footer>
			<small>${userID}</small>
		</footer>
	</div>
</body>
</html>