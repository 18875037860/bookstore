<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	session.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html class="loaded">
<head>
<meta charset="UTF-8">
<title>MoYun</title>
<link rel="shortcut icon" type="image/x-icon"
	href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">
<link rel="Bookmark" type="image/x-icon"
	href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">

<link rel="stylesheet" data-ignore="true"
	href="//qidian.gtimg.com/c/=/readnovel/css/reset.e0c8b.css,/readnovel/css/font.db450.css,/readnovel/css/header.6206e.css,/readnovel/css/module.73d4b.css,/readnovel/css/rank.e71d8.css,/readnovel/css/list_module.65ece.css,/readnovel/css/layout.9f7c8.css,/readnovel/css/popup.b751d.css,/readnovel/css/footer.729bd.css">

</head>
<body style="zoom: 1;">
	<div class="wrap" style="height:2500px;">
		<div class="rank-box box-center cf">
			<div class="rank-nav-list fl">
				<ul>
					<li class="act"><a
						href="http://localhost:8080/bookstore/novel/order.html""><em
							class="iconfont"> </em>全部榜单</a></li>
					<li class=""><a
						href="http://localhost:8080/bookstore/novel/recommend.html"><em
							class="iconfont"></em>推荐榜</a></li>


					<li class=""><a
						href="http://localhost:8080/bookstore/novel/collection.html"><em
							class="iconfont"></em>收藏榜</a></li>
					<li class=""><a
						href="http://localhost:8080/bookstore/novel/hot.html"><em
							class="iconfont"></em>人气榜</a></li>

				</ul>
			</div>
			<div class="main-content-wrap fl">
				<div class="rank-body cf" style="2500px;">
					<div class="rank-list">
						<h3 class="wrap-title">
							<em class="lang">推荐榜</em>
						</h3>
						<div class="book-rank-list">

							<ul>
								<c:forEach items="${novelInfodz}" var="t" varStatus="i"
									begin="0" end="9">


									<li><span class="num1">${i.index+1}</span><a class="name"
										href="../home/synopsis.html?novelId=${t.novelId}"
										action="${basePath}/novel/order.html">${t.novelName}</a>
									<p style="float: right;">${t.praiseCount}</p></li>
								</c:forEach>
							</ul>

						</div>
					</div>

					<div class="rank-list" style="margin-left: 0px;">
						<h3 class="wrap-title">
							<em class="lang">收藏榜</em>
						</h3>
						<div class="book-rank-list">

							<ul>
								<c:forEach items="${novelInfosc}" var="t" varStatus="i"
									begin="0" end="9">


									<li><span class="num1">${i.index+1}</span><a class="name"
										href="../home/synopsis.html?novelId=${t.novelId}"
										action="${basePath}/novel/order.html">${t.novelName}</a>
									<p style="float: right;">${t.collectionCount}</p></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="rank-list" style="margin-left: 0px;">
						<h3 class="wrap-title">
							<em class="lang">人气榜</em>
						</h3>
						<div class="book-rank-list">

							<ul>
								<c:forEach items="${novelInfotj}" var="t" varStatus="i"
									begin="0" end="9">


									<li><span class="num1">${i.index+1}</span><a class="name"
										href="../home/synopsis.html?novelId=${t.novelId}"
										action="${basePath}/novel/order.html">${t.novelName}</a></a>
									<p style="float: right;">${t.pageviewCount}</p></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>