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
	<title>WoW:Blog — Dev Team</title>
</head>
<body>
	<div class="container">
		<header>
			<h1></h1>
			<nav>
				<a href="/home">Back Home</a>
				<a href="/post/new">Create Post</a>
				<a href="/logout">Logout</a>
			</nav>
		</header>
		<main>
			<div class="post_container">
				<div class="post_row">
					<div class="post_img">
						<img src="../img/tj_k.jpg" alt="Image Failed to Load">
					</div>
					<div class="post_content">
						<h3>TJ Kapfer</h3>
						<small>Full Stack Engineer — Front End Lead</small>
						<p>TJ is a recent Coding Dojo graduate (as of 7/2/2021), and aspires to be a front end engineer, hoping to one day get his foot in the door of the gaming industry. He enjoys several hobbies including magic the gathering, DnD, and PC/PS4 gaming.</p>
						<nav>
							<a href="https://www.linkedin.com/in/trey-kapfer-252ab5103/">LinkedIn</a>
							<a href="https://github.com/treykapfer">GitHub</a>
						</nav>
					</div>
				</div>
				<div class="post_row">
					<div class="post_img">
					</div>
					<div class="post_content">
						<h1>Austin Dupras</h1>
						<small>Full Stack Engineer — Back End Lead</small>
						<p></p>
						<nav>
						</nav>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>