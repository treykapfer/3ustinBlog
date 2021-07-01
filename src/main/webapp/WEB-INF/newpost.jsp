<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Post</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container">
    	<header class="d-flex justify-content-between text-white bg-dark align-items-center p-2">
			<h1>Welcome ${sesUser.username}</h1>
			<nav>
				<a class="btn btn-primary" href="/posts">Home</a>
				<a class="btn btn-primary" href="/logout">Logout</a>
			</nav>
		</header>
	<main>
		<h1>New Post</h1>
		<form:form action="/posts/add" method="post" modelAttribute="newPost" class="d-flex flex-column w-50">
			<form:input path="user" type="hidden" value="${sesUser.id}"/>
			
			<form:label path="title">Post Name</form:label>
			<form:input path="title" type="text" placeholder="Post Title"/>
			<form:errors path="title" type="text" class="text-danger" />

			<form:label path="content">Post Name</form:label>
			<form:input path="content" type="text" placeholder="paste Image URL"/>
			<form:errors path="content" type="text" class="text-danger" />

			<form:label path="imageurl">Post Name</form:label>
			<form:input path="imageurl" type="text" placeholder="paste Image URL"/>
			<form:errors path="imageurl" type="text" class="text-danger" />
			
			<input type="submit" value="Create" class="btn btn-sm btn-primary w-25 mt-3" />
			
		</form:form>
	</main>
  </div>
</body>
</html>