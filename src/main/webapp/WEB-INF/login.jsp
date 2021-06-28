<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login & Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	    <h1 class="text-center">Login and Registration</h1>
	    <div class="d-flex justify-content-around">
		    <form:form method="POST" action="/registration" modelAttribute="user">
		    	<div class="d-flex flex-column">
			    	<h2>Register User</h2>
			    	
			    		<form:label path="username">Username:</form:label>
			            <form:input type="text" path="username"/>
			            <small><p class="text-danger"><form:errors path="username"/></p></small>

						<form:label path="email">Email:</form:label>
			            <form:input type="email" path="email"/>
			            <small><p class="text-danger"><form:errors path="email"/></p></small>
			            
			            <form:label path="password">Password:</form:label>
			            <form:password path="password"/>
			            <small><p class="text-danger"><form:errors path="password"/></p></small>
			            
			            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
			            <form:password path="passwordConfirmation"/>
			            <small><p class="text-danger"><form:errors path="passwordConfirmation"/></p></small>
			            
			        <input class="btn btn-primary mt-2" type="submit" value="Register"/>
		        </div>
		    </form:form>
		    
			<form method="POST" action="/login">
				<div class="d-flex flex-column">
					<h2>Login</h2>
					
					<label>Email:</label>
					<input type="text" id="email" name="email"/>

					<label>Password:</label>
					<input type="password" id="password" name="password"/>
					
					<small><p class="text-danger">${error}</p></small>

					<input class="btn btn-primary mt-2" type="submit" value="Login"/>
				</div>
			</form>
		</div>
    </div>
</body>
</html>