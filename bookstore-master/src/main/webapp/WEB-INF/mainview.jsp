<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>MoYun</title>
<meta charset="UTF-8">


<link href="https://fonts.googleapis.com/css?family=Work+Sans"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../resources/css/icomoon.css">
<link rel="stylesheet" href="../resources/css/flaticon.css">
<link rel="stylesheet" href="../resources/css/animate.css">
<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css">

<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script src="../resources/js/popper.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/owl.carousel.min.js"></script>
<script src="../resources/js/jquery.waypoints.min.js"></script>
<script src="../resources/js/bootstrap-datepicker.js"></script>
<script src="../resources/js/jquery.animateNumber.min.js"></script>
<script src="../resources/js/main.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style type="text/css">
.carousel-inner img {
	width: 100%;
	height: 390px;
}

span {
	color: white;
	font-size: 13px;
	font-weight: bold;
}

a {
	color: white;
	font-size: 13px;
	font-weight: bold;
}

p {
	color: white;
	padding-top: 8px;
	padding-left: 40px;
}

td {
	color: white;
}

h5 {
	color: white;
	text-align: center;
	padding-top: 10px;
	font-weight: bold;
}

hr {
	background-color: white;
}
</style>

</head>
<body style="height: 1430px;">
	<div class="row" style="margin-top: 1.5px;">
		<div class="col-2"></div>

		<div class="col-8">
			<div id="pic_carousel" class="carousel slide" data-ride="carousel">
				<!--指标-->
				<ul class="carousel-indicators">
					<li data-target="#pic_carousel" data-slide-to="0" class="active"></li>
					<li data-target="#pic_carousel" data-slide-to="1"></li>
					<li data-target="#pic_carousel" data-slide-to="2"></li>
				</ul>
				<!--轮播图片-->
				<div class="carousel-inner">

					<div class="carousel-item active">
						<img src="../resources/img/pic1.jpg">
						<div class="carousel-caption"></div>
					</div>
					<div class="carousel-item ">
						<img src="../resources/img/pic2.jpg">
						<div class="carousel-caption"></div>
					</div>
					<div class="carousel-item ">
						<img src="../resources/img/pic3.jpg">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#pic_carousel"
					data-slide="prev"> <span class="carousel-control-prev-icon"></span></a>
				<a class="carousel-control-next" href="#pic_carousel"
					data-slide="next"> <span class="carousel-control-next-icon"></span></a>
			</div>
		</div>
		<div class="col-2">
			<div
				style="width: 230px; height: 390px; background-color: #343A40; opacity: 0.9; margin-left: 12px;">
				<h5>墨韵小说网最新动态</h5>
				<hr>
				<span style="font-size: 12px;">[消息]&nbsp;&nbsp;${ggNovelInfo[0].authorInfo.userName}又出作品啦,快去看看吧!</span><br>
				<span style="font-size: 12px;">[消息]&nbsp;&nbsp;${ggNovelInfo[1].authorInfo.userName}最近更新了${ggNovelInfo[1].novelName}!</span><br>
				<span style="font-size: 12px;">[消息]&nbsp;&nbsp;${ggNovelInfo[2].novelName}登上了推荐榜榜首!</span><br>
				<span style="font-size: 12px;">[消息]&nbsp;&nbsp;${ggNovelInfo[3].novelName}收获最佳浏览量${ggNovelInfo[3].novelCount}!</span><br>
				<span style="font-size: 12px;">[消息]&nbsp;&nbsp;${ggNovelInfo[4].novelName}收藏量创新高啦!</span><br>
				<span style="font-size: 12px;">[消息]&nbsp;&nbsp;${ggNovelInfo[5].authorInfo.userName}的${ggNovelInfo[5].novelName}获得了最高${ggNovelInfo[5].novelGrade}的评分!</span><br>
				<hr>
				<span style="font-size: 12px;">[温馨提示]&nbsp;&nbsp;为了保护您的视力,观看小说时请注意休息!</span><br>
			</div>
		</div>
	</div>


	<div class="row" style="margin-top: 20px;">
		<div class="col-2" style="height: 200px;">
			<div
				style="width: 230px; height: 971px; background-color: #343A40; opacity: 0.9; color: white;">
				<h5>最受欢迎榜</h5>
				<hr style="background-color: white;">
				<div class="row" style="margin-top: -5px;">
					<div class="col-7">
						<div
							style="background-color: red; width: 40px; font-weight: bold;">No.1</div>
						<a href="../home/synopsis.html?novelId=${welcomeNovel[0].novelId}">${welcomeNovel[0].novelName}</a><br> <span
							style="color: red;">${welcomeNovel[0].praiseCount}推荐票</span><br>
						<span style="color: black;">${welcomeNovel[0].novelStyle}---${welcomeNovel[0].novelLable}</span>
					</div>
					<div class="col-5">
						<img src="../resources/img/avatar.jpg"
							style="width: 80px; margin-left: -10px;">
					</div>
				</div>
				<hr width="100%">
				<div id="welnovel" style="margin-top: -25px;">
					<c:forEach items="${welcomeNovel}" var="t" varStatus="i" begin="1"
						end="14">
						<div>

							<br> <span style="margin-right: 20px; margin-left: 5px;">${i.index+1}</span>
							<a href="../home/synopsis.html?novelId=${t.novelId}">${t.novelName}</a> <span
								style="float: right; margin-right: 10px;">${t.praiseCount}</span>
							<hr width="85%" style="float: right;">
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
		<div class="col-10" style="margin-top: -1px;">

			<div class="row">
				<c:forEach items="${styleNovel}" var="t" varStatus="i" begin="0"
					end="3">
					<div class=col-3>
						<div
							style="width: 320px; height: 320px; background-color: #A4A4A4; opacity: 0.5;">
							<table class="table table-hover">
								<thead>
									<tr>
										<p>---------------${t[0].novelStyle}---------------</p>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${t}" var="s" varStatus="i" begin="0" end="4">
										<tr style="height: 54.25px;">
											<td><a href="../home/synopsis.html?novelId=${s.novelId}">[${s.novelStyle}]&nbsp;&nbsp;${s.novelName}</a></td>
											<td>${s.praiseCount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row" style="margin-top: 10px;">
				<c:forEach items="${styleNovel}" var="t" varStatus="i" begin="4"
					end="7">
					<div class=col-3>
						<div
							style="width: 320px; height: 320px; background-color: #A4A4A4; opacity: 0.5;">
							<table class="table table-hover">
								<thead>
									<tr>
										<p>---------------${t[0].novelStyle}---------------</p>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${t}" var="s" varStatus="i" begin="0" end="4">
										<tr style="height: 54.25px;">
											<td><a href="../home/synopsis.html?novelId=${s.novelId}">[${s.novelStyle}]&nbsp;&nbsp;${s.novelName}</a></td>
											<td>${s.praiseCount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row" style="margin-top: 10px;">
				<c:forEach items="${styleNovel}" var="t" varStatus="i" begin="8"
					end="11">
					<div class=col-3>
						<div
							style="width: 320px; height: 320px; background-color: #A4A4A4; opacity: 0.5;">
							<table class="table table-hover">
								<thead>
									<tr>
										<p>---------------${t[0].novelStyle}---------------</p>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${t}" var="s" varStatus="i" begin="0" end="4">
										<tr style="height: 54.25px;">
											<td><a href="../home/synopsis.html?novelId=${s.novelId}">[${s.novelStyle}]&nbsp;&nbsp;${s.novelName}</a></td>
											<td>${s.praiseCount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>