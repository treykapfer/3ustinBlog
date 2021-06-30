<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Alegreya+Sans+SC&family=Audiowide&family=Bebas+Neue&family=Bowlby+One+SC&family=Bungee&family=Dela+Gothic+One&family=Open+Sans&family=Roboto&family=Roboto+Slab&display=swap" rel="stylesheet">
	<title>WoW:Blog - Dashboard</title>
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
							<h3>${post.title}</h3>
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