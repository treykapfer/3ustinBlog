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
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Alegreya+Sans+SC&family=Audiowide&family=Bebas+Neue&family=Bowlby+One+SC&family=Bungee&family=Dela+Gothic+One&family=Open+Sans&family=Roboto&family=Roboto+Slab&display=swap" rel="stylesheet">
    <title>WoW:Blog - New Post</title>
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
		<h1>New Post</h1>
			<form:form action="/post/add" method="post" modelAttribute="newPost">
				<form:input path="user" type="hidden" value="${UserID}"/>
				
				<form:label path="title">Post Name</form:label>
				<form:input path="title" type="text" placeholder="Post Title"/>
				<form:errors path="title" type="text"/>

				<form:label path="content">Post Name</form:label>
				<form:input path="content" type="text" placeholder="paste Image URL"/>
				<form:errors path="content" type="text"/>

				<form:label path="imageURL">Post Name</form:label>
				<form:input path="imageURL" type="text" placeholder="paste Image URL"/>
				<form:errors path="imageURL" type="text"/>
				
				<input type="submit" value="Create"/>
				
			</form:form>
		</main>
  </div>
</body>
</html>