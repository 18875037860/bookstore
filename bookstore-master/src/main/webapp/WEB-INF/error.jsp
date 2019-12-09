<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js h-100" lang="en">
<head>
<meta charset="utf-8" pageEncoding="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>操作错误</title>
<meta name="description"
	content="A high-quality &amp; free Bootstrap admin dashboard template pack that comes with lots of templates and components.">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" id="main-stylesheet" data-version="1.1.0"
	href="<%=path%>/styles/shards-dashboards.1.1.0.min.css">
<link rel="stylesheet" href="<%=path%>/styles/extras.1.1.0.min.css">
<script async defer src="https://buttons.github.io/buttons.js"></script>
</head>
<body class="h-100">

	<div class="container-fluid">
		<div class="row">
			<aside class="main-sidebar col-12 col-md-3 col-lg-2 px-0">
				<div class="main-navbar">
					<nav
						class="navbar align-items-stretch navbar-light bg-white flex-md-nowrap border-bottom p-0">
						<a class="navbar-brand w-100 mr-0" href="#"
							style="line-height: 25px;">
							<div class="d-table m-auto">
								<img id="main-logo" class="d-inline-block align-top mr-1"
									style="max-width: 25px;"
									src="<%=path%>/images/shards-dashboards-logo.svg"
									alt="Shards Dashboard"> <span
									class="d-none d-md-inline ml-1">AUTHOR CENTER</span>
							</div>
						</a> <a class="toggle-sidebar d-sm-inline d-md-none d-lg-none"> <i
							class="material-icons">&#xE5C4;</i>
						</a>
					</nav>
				</div>

				<div class="nav-wrapper">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link "
							href="../author/moyun.html"> <i class="material-icons">table_chart</i>
								<span>我的作品</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../author/newchapter.html"> <i class="material-icons">edit</i>
								<span>新建章节</span>
						</a></li>
					</ul>
				</div>
			</aside>
			<main
				class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
			<div class="main-navbar sticky-top bg-white">
				<nav
					class="navbar align-items-stretch navbar-light flex-md-nowrap p-0">
					<form action="#"
						class="main-navbar__search w-100 d-none d-md-flex d-lg-flex">
						<div class="input-group input-group-seamless ml-3">
							<div class="input-group-prepend">
								<div class="input-group-text"></div>
							</div>

						</div>
					</form>
					<nav class="nav">
						<a href="#"
							class="nav-link nav-link-icon toggle-sidebar d-md-inline d-lg-none text-center border-left"
							data-toggle="collapse" data-target=".header-navbar"
							aria-expanded="false" aria-controls="header-navbar"> <i
							class="material-icons">&#xE5D2;</i>
						</a>
					</nav>
				</nav>
			</div>
			<div class="error">
				<div class="error__content">
					<h2>500</h2>
					<h3>Something went wrong!</h3>
					<p>There was a problem on our end. Please try again later.</p>
					<button type="button" class="btn btn-accent btn-pill">&larr;
						Go Back</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	<script src="https://unpkg.com/shards-ui@latest/dist/js/shards.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Sharrre/2.0.1/jquery.sharrre.min.js"></script>
	<script src="<%=path%>/scripts/extras.1.1.0.min.js"></script>
	<script src="<%=path%>/scripts/shards-dashboards.1.1.0.min.js"></script>
</body>
</html>