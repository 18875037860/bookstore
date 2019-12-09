<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	session.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML>
<html class="no-js">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MoYun</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css"
	href="../resource/persionalBS/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="../resource/persionalBS/css/component.css" />
<script src="../resource/persionalBS/js/modernizr.custom.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
<script src="../resource/persionalBS/js/books1.js"></script>
<script type="text/javascript">
	window.onload = function()//用window的onload事件，窗体加载完毕的时候
	{
		var v = "${NOnovel}";
		if (v == "false") {
			$("#kongkong").attr("src", "../resource/images/images/img_7.jpg");
		}
	}
	$(function() {
		$(".bk-bookview").click(function() {
			window.location.href = "../home/moyun.html";
		})
	})
</script>

<style type="text/css">
.bk-list {
	width: 1200px;
}

.bk-list li {
	floag: left;
	list-style: none;
	display: inline;
}

a {
	font-size: 20px;
}
</style>

</head>
<body>
	<div class="container">
		<header class="clearfix">
			<h1>我的书架</h1>
			<nav class="codrops-demos">
				<a href="#" class="current-demo">collections</a> <a href="#">my
					works</a>
			</nav>
		</header>
		<div class="main">
			<ul id="bk-list" class="bk-list clearfix">
				<c:forEach items="${novelinfos}" var="t" varStatus="i">
					<li>
						<div class="bk-book book-3 bk-bookdefault" id="bl">
							<div class="bk-front">
								<div class="bk-cover">
									<h2>
										<span id="bookName"
											style="font-size: 30px; text-align: center;">${t.novelName }
										</span> <span id="novelId" hidden="hidden">${t.novelId }</span>

									</h2>
								</div>
								<div class="bk-cover-back"></div>
							</div>

							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
						<div class="bk-info">
							<button class="bk-bookview">查看内容</button>
							<h3>
								<span>${t.authorInfo.userName}</span> <span>${t.novelName}</span>
							</h3>
							<p style="height: 300px;">${t.novelSynopsis}</p>
						</div>
					</li>
				</c:forEach>
				<img id="kongkong" />
			</ul>
		</div>
	</div>
	<script src="http://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
	<script src="../resource/persionalBS/js/books1.js"></script>
	<script>
		$(function() {
			Books.init();
		});

		$(function() {
			$(".bk-bookview").click(function() {
				var bookid= $("#novelId").text();
				window.location.href = "${basePath}home/moyun.html?status=synopsis&novelId="+bookid;			
			})
		})
	</script>

</body>
</html>
