<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js h-100" lang="en">
<head>
<meta charset="utf-8" pageEncoding="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>新建章节</title>
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
<script type="text/javascript"
	src="<%=path%>/resource/js/jquery-2.1.4.min.js">
	<script async defer src="https://buttons.github.io/buttons.js">
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/quill/1.3.6/quill.snow.css">
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
									alt="zuopingua"> <span class="d-none d-md-inline ml-1">AUTHOR
									CENTER</span>
							</div>
						</a> <a class="toggle-sidebar d-sm-inline d-md-none d-lg-none"> <i
							class="material-icons">&#xE5C4;</i>
						</a>
					</nav>
				</div>
				<form action="#"
					class="main-sidebar__search w-100 border-right d-sm-flex d-md-none d-lg-none">
					<div class="input-group input-group-seamless ml-3">
						<div class="input-group-prepend">
							<div class="input-group-text"></div>
						</div>
					</div>
				</form>
				<div class="nav-wrapper">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link "
							href="../author/moyun.html?status=author"> <i class="material-icons">table_chart</i>
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
				<div class="page-header row no-gutters py-4" style="margin-left: 20px;">
					<div class="col-12 col-sm-4 text-center text-sm-left mb-0">
						<span class="text-uppercase page-subtitle">CREATE CHAPTER</span>
						<h3 class="page-title">新建章节</h3>
					</div>
				</div>
			</div>
			<div class="main-content-container container-fluid px-4">				
				<div class="row" style="margin-top: 30px;">
					<div class="col-lg-9 col-md-12">
						<!-- Add New Post Form -->
						<div class="card card-small mb-3">
							<div class="card-body">
								<form class="add-new-post">
									<input id="chap_title"
										class="form-control form-control-lg mb-3" type="text"
										placeholder="请输入章节的标题..." />
									<div type="text" id="editor-container"
										class="add-new-post__editor mb-1"></div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-12">

						<div class='card card-small mb-3' style="height: 540px;">
							<div class="card-header border-bottom">
								<h6 class="m-0">选择书籍</h6>
							</div>
							<div class='card-body p-0'>
								<ul class="list-group list-group-flush">
									<li class="list-group-item px-3 pb-2 pre-scrollable"
										style="height: 540px;">

										<c:forEach items="${novels}" var="item" varStatus="i">
											<div class="custom-control custom-checkbox mb-1">
												<input type="radio" name="nv" class="custom-control-input"
													id="category${i.index+1}" "  value="category${i.index+1}"">
												<label class="custom-control-label"
													for="category${i.index+1}">${item.novelName}</label>
											</div>
										</c:forEach>


									</li>
									<li class="list-group-item d-flex px-3">
										<div class="input-group row" style="text-align: center;margin-left: 0px;">
										<div class="col-12">
											<button class="btn btn-sm btn-accent ml-auto" style="width: 100%;margin-top: 40px;"
											onclick="showDiv()">
											<script type="text/javascript">
												function showDiv() {
													var choice;
													$(
															"input[type ='radio']:checked")
															.each(
																	function() {
																		choice = $(
																				this)
																				.next()
																				.html();
																	})
													var chap_title = document
															.getElementById('chap_title').value;
													var chap_text = $("#editor-container").text()
													if((choice!=undefined)&&(chap_title!="")&&(chap_text!="")){
														window.location.href = "../author/uploadchapter.html?chapterName="
															+ chap_title
															+ "&chapterContent="
															+ chap_text
															+ "&novelInfo.novelName="
															+ choice;
													}else{
														alert("请先请先完善所有章节信息...")
													}
													
												}
											</script>
											<i class="material-icons">file_copy</i> 提交
										</button>
										</div>													
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/quill/1.3.6/quill.min.js"></script>
	<script src="<%=path%>/scripts/app/app-blog-new-post.1.1.0.js"></script>
</body>
</html>