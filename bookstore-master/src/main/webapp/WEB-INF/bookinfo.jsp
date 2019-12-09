<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js h-100" lang="en">
<head>
<title>MoYun</title>

<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" id="main-stylesheet" data-version="1.1.0"
	href="<%=path%>/styles/shards-dashboards.1.1.0.min.css">
<link rel="stylesheet" href="<%=path%>/styles/extras.1.1.0.min.css">
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	window.onload = function()//用window的onload事件，窗体加载完毕的时候
	{
		var style = document.getElementById("style");
		var status = document.getElementById("feInputState1");  
		var attribute = document.getElementById("VInputState");  
	    for (var i = 0; i < style.length; i++){  
	        if (style.options[i].text == "${noveldetails.novelStyle}"){  
	        	style.options[i].selected = true;  
	            break;  
	        }  
	    } 
	    for (var i = 0; i < status.length; i++){  
	        if (status.options[i].text == "${noveldetails.novelStatus}"){  
	        	status.options[i].selected = true;  
	            break;  
	        }  
	    } 
	    for (var i = 0; i < attribute.length; i++){  
	        if (attribute.options[i].text == "${noveldetails.novelAttribute}"){  
	        	attribute.options[i].selected = true;  
	            break;  
	        }  
	    } 
		}
	function submitinfo() {
		var name = $("#feFirstName").val();
		var synopsis = $("#synopsis").val();
		if ((name != "") && (synopsis != "")) {
			return true
		} else {
			alert("请先完善更新小说信息...")
			return false
		}
	}
</script>
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
				<form action="#"
					class="main-sidebar__search w-100 border-right d-sm-flex d-md-none d-lg-none">
					<div class="input-group input-group-seamless ml-3">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="fas fa-search"></i>
							</div>
						</div>
						<input class="navbar-search form-control" type="text"
							placeholder="Search for something..." aria-label="Search">
					</div>
				</form>
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
				<div class="page-header row no-gutters py-4"
					style="margin-left: 20px;">
					<div class="col-12 col-sm-4 text-center text-sm-left mb-0">
						<span class="text-uppercase page-subtitle">CREATE CHAPTER</span>
						<h3 class="page-title">小说详情</h3>
					</div>
				</div>
			</div>
			<div class="main-content-container container-fluid px-4"
				style="margin-top: 30px;">
				<div class="row">
					<div class="col-lg-4">
						<div class="card card-small mb-4 pt-3" style="height: 522.5px;">
							<div class="card-header border-bottom text-center">
								<div class="mb-3 mx-auto">
									<img id="picpic" class="rounded"
										src="<%=path%>/images/avatars/0.jpg" alt="User Avatar"
										width="110">
								</div>
								<h4 class="mb-0">${noveldetails.novelName}</h4>
								<input type="file" id="pic" style="width: 0px;" accept="image/*" />
								<a onclick="cg()">
									<button type="button"
										class="mb-2 btn btn-sm btn-pill btn-outline-primary mr-2">
										<i class="material-icons mr-1">person_add</i>更换封面
									</button>
								</a>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item px-4">
									<div class="progress-wrapper">
										<strong class="text-muted d-block mb-2">点赞</strong>
										<div class="progress progress-sm">
											<div class="progress-bar bg-primary" role="progressbar"
												aria-valuenow="74" aria-valuemin="0" aria-valuemax="100"
												style="width: ${noveldetails.praiseCount}%;">
												<span class="progress-value">${noveldetails.praiseCount}</span>
											</div>
										</div>
									</div>
								</li>
								<li class="list-group-item p-4"><strong
									class="text-muted d-block mb-2">小说详情</strong> <span name=""
									style="overflow-y: auto; overflow-x: auto; height: 100px;">${noveldetails.novelSynopsis}</span>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card card-small mb-4">
							<div class="card-header border-bottom">
								<h6 class="m-0">小说详情</h6>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item p-3">
									<div class="row">
										<div class="col">
											<form action="../author/updatenovel.html"
												onsubmit="return submitinfo()" method="post">
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="feFirstName">小说名称</label><input name="novelId"
															value="${noveldetails.novelId}" hidden="hidden"></input>
														<input type="text" class="form-control" id="feFirstName"
															placeholder="Novel Name" name="novelName" style="padding-left: 17.5px;"
															value='${noveldetails.novelName}'>
													</div>
													<div class="form-group col-md-6">
														<label for="feLastName">小说类型</label>										
															<select class="form-control" name="novelStyle"
																		id="style">
																		<option>都市</option>
																		<option>科幻</option>
																		<option>历史</option>
																		<option>现实</option>
																		<option>青春</option>
																		<option>武侠</option>
																		<option>仙侠</option>
																		<option>玄幻</option>
																		<option>悬疑</option>
																		<option>游戏</option>
																		<option>言情</option>
																		<option>轻小说</option>
																	</select>
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="feInputState">章节信息</label> <select
															id="feInputState0" class="form-control">
															<c:forEach items="${noveldetails.chapterInfo}" var="t"
																varStatus="i">
																<option>第${t.chapterIndex}章&nbsp;&nbsp;${t.chapterName}</option>
															</c:forEach>
														</select>
													</div>
													<div class="form-group col-md-6">
														<label for="inputZip">字数</label> <input type="text" style="padding-left: 17.5px;"
															class="form-control" id="inputZip" readonly="readonly"
															value="${noveldetails.novelCount}">
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="feEmailAddress">小说状态</label> <select
															id="feInputState1" class="form-control" name="novelStatus">
															<option>连载</option>
															<option>完结</option>
														</select>
													</div>
													<div class="form-group col-md-6">
														<label for="fePassword">读者</label> <select
															id="VInputState" class="form-control"
															name="novelAttribute">
															<option>免费</option>
															<option>vip</option>
														</select>
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-12">
														<label for="feDescription">小说详情</label>
														<textarea class="form-control" name="novelSynopsis" id="synopsis"
															rows="5">${noveldetails.novelSynopsis}</textarea>
													</div>
												</div>
												<button type="submit" class="btn btn-accent">更新小说信息</button>
											</form>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>

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
<script type="text/javascript">
	var base64ToSrc = function(element, file) {
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e) {
			base64Code = this.result;
			$(element).attr("src", base64Code);
		}
	};
	var cg = function() {

		var file = document.getElementById("pic");
		file.click();
	}
	var file = document.getElementById("pic");

	file.onchange = function() {

		var tximg = document.getElementById("picpic");
		console.log("change");
		base64ToSrc(tximg, file.files[0]);

		var formFile = new FormData();
		formFile.append("file", file.files[0]);

		//ajax异步传给后端数据
		$.ajax({
			async : true,
			type : "POST",
			url : "../author/updatenovel.html",
			data : formFile,
			dataType : "json",
			cache : false,
			processData : false,
			contentType : false,
			success : function() {
				console.log('ok');
			},
			error : function() {
				console.log('nook');
			}
		});

	}
</script>
</html>