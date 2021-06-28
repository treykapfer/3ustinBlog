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
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between text-white bg-dark align-items-center p-2">
			<h1>Welcome ${sesUser.username}</h1>
			<nav>
				<a class="btn btn-primary" href="/idea/new">Add Idea</a>
				<a class="btn btn-primary" href="/logout">Logout</a>
			</nav>
		</header>
		
		<main>
		<h2 class="p-2 text-right">All Ideas</h2>
			<table class="table">
				<thead class="thead-light">
				    <tr>
				      <th scope="col">Idea</th>
				      <th scope="col">Created By</th>
				      <th scope="col">Options</th>
				    </tr>
				</thead>
			<tbody>
				<c:forEach items="${allIdeas}" var="idea">
			  		<tr>
		   				<td>${idea.name}</td>
		   				<td>${idea.user.username}</td>
			      		<td>
			      			<a href="/idea/${idea.id}">View</a> // 
			      			<a href="/idea/${idea.id}/edit">Edit</a> // 
			      			<a href="/idea/${idea.id}/delete">Delete</a> 
			      		</td>
			   		</tr>
				</c:forEach>
			</tbody>
			</table>
		</main>	
		<footer>
			<small class="text-warning text-right">${userID}</small>
		</footer>
	</div>
</body>
</html>