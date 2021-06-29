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
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container">
        <header>
            <nav>
                <a href="/">Meet the Devs</a>
            </nav>
        </header>
        <main>
            <div class="left_container">
                <!-- here is a preview of the blog -->
                <h2>Welcome to 3ustin Blog</h2>
                <p>Login/Register to continue</p>
                <p>Dynamically rendered canvas with neat effect will be here with text overlayed</p>
            </div>
            <div class="right_container">
                <form method="POST" action="/login">
                    <div class="form">
                        <h2>Login</h2>
                        
                        <label>Email:</label>
                        <input type="text" id="email" name="email"/>

                        <label>Password:</label>
                        <input type="password" id="password" name="password"/>
                        
                        <small><p></p></small>

                        <input class="btn" type="submit" value="Login"/>
                    </div>
                </form>
				<form:form method="POST" action="/registration" modelAttribute="user">
					<div class="form">
						<h2>Register</h2>
						
							<form:label path="username">Username:</form:label>
							<form:input type="text" path="username"/>
							<small><p><form:errors path="username"/></p></small>

							<form:label path="email">Email:</form:label>
							<form:input type="email" path="email"/>
							<small><p><form:errors path="email"/></p></small>
							
							<form:label path="password">Password:</form:label>
							<form:password path="password"/>
							<small><p><form:errors path="password"/></p></small>
							
							<form:label path="passwordConfirmation">Password Confirmation:</form:label>
							<form:password path="passwordConfirmation"/>
							<small><p><form:errors path="passwordConfirmation"/></p></small>
							
						<input class="btn" type="submit" value="Register"/>
					</div>
				</form:form>
			</div>
		</main>
		<footer>
            <!-- find blog posts with limit 4 and render dynamically -->
            <!-- only displays 3 in tablet view -->
            <!-- only displays 2 in mobile view -->
            <div class="blog_card">
                <p>Blog Post Preview Here</p>
                <p>Text overlayed over the uploaded photo</p>
            </div>
            <div class="blog_card">
                <p>Blog Post Preview Here</p>
                <p>Text overlayed over the uploaded photo</p>
            </div>
            <div class="blog_card">
                <p>Blog Post Preview Here</p>
                <p>Text overlayed over the uploaded photo</p>
            </div>
            <div class="blog_card">
                <p>Blog Post Preview Here</p>
                <p>Text overlayed over the uploaded photo</p>
            </div>
        </footer>
    </div>
</body>
</html>