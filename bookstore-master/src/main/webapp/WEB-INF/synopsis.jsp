<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="loaded">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">
<link rel="Bookmark" type="image/x-icon"
	href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">

<link rel="stylesheet" data-ignore="true"
	href="//qidian.gtimg.com/c/=/readnovel/css/lbfUI/css/icon.c9000.css,/readnovel/css/lbfUI/css/Drag.41d31.css,/readnovel/css/reset.e0c8b.css,/readnovel/css/font.db450.css,/readnovel/css/header.6206e.css,/readnovel/css/module.73d4b.css,/readnovel/css/footer.729bd.css,/readnovel/css/layout.9f7c8.css,/readnovel/css/book_details.00241.css,/readnovel/css/popup.b751d.css,/readnovel/css/book_popup.9cb94.css,/readnovel/css/vote_popup.76a80.css">

<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/Panel.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/LightTip.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/Popup.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/Drag.css">
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	window.onload = function()//用window的onload事件，窗体加载完毕的时候
	{
		if(${sumChapter}==0){
			$("#read").hide()
			$("#showCP").hide()
			$("#updateNew").removeAttr('href');
		}	
	}
	function concern() {
		var user = "${user.userName}"
		if (user == "") {
			alert("请先登录个人信息!")
		} else {
			window.location.href = "./collect.html?novelId=${novel.novelId}"
		}
	}
	/* function jumpToread() {
		window.location.href="read.html?chapterIndex=${readlog}&novelInfo.novelId=${novel.novelId}"
	} */
</script>
<style name="lbf-overlay">
.lbf-overlay {
	position: fixed;
	top: 0;
	left: 0;
}
</style>
</head>
<body style="zoom: 1;">
	<div class="wrap" style="height: 2500px;">
		<div class="header"></div>
		<div class="crumbs-nav center1020">
			<span> <a href="../home/moyun.html">首页</a><em class="iconfont"></em>
				<a
				href="../novel/all.html?style=${novel.novelStyle}&status=全部&attribute=全部">${novel.novelStyle}</a><em
				class="iconfont"></em> <a>${novel.novelName}</a>
			</span>
		</div>

		<div class="book-detail-wrap center1020">
			<div class="book-information cf">
				<div class="book-img">
					<a class="J-getJumpUrl default" id="bookImg"
						data-bid="5250982304577901" data-firstchapterjumpurl=""> <img
						src="../img/timg.jpg"></a>
				</div>
				<div class="book-info">
					<h1>
						<em method="post">${novel.novelName}</em> <a
							class="writer default" target="_blank">${novel.authorInfo.userName}
							著</a>
					</h1>
					<p class="tag-box">
						<span class="tag"> <i class="blue">${novel.novelAttribute}</i>
							<i>${novel.novelStyle}</i><i>${novel.novelStatus}</i></span>
					</p>
					<p class="total">
						<span>${novel.novelCount}</span><em>字</em>
					</p>
					<p class="intro">${novel.novelSynopsis}</p>
					<p class="btn">
						<a class="pink-btn J-getJumpUrl" id="read"
							href="read.html?chapterIndex=${readlog}&novelInfo.novelId=${novel.novelId}">免费试读</a>
						<a class="border-btn add-book" onclick="concern()">${bkslf}</a>
					</p>
				</div>
			</div>
			<div class="content-nav-wrap cf" data-l1="10"
				style="background-color: white;">
				<div class="nav-wrap fl">
					<ul>
						<li class="j_catalog_block"><a class="lang">目录<i><span
									id="J-catalogCount">(${sumChapter}章)</span></i></a></li>
					</ul>
				</div>
				<div class="update">
					<p>
						<a class="blue" id="updateNew"
							href="read.html?chapterIndex=${sumChapter}&novelInfo.novelId=${novel.novelId}">更新至第${sumChapter}章
							${chapter[sumChapter-1].chapterName}</a>
					</p>
				</div>
			</div>
			<div class="catalog-content-wrap " id="j-catalogWrap">
				<div class="go-top-box" id="j-goTopBox">
				</div>
				<div class="volume-wrap" id="showCP">
					<div class="volume" style="background-color: white;">
						<div>
							<ul class="cf">
								<c:forEach items="${chapter}" var="t" varStatus="i">
									<li data-rid="${i.index+1}"><a style="text-align: center; width: 100%;"
										href="../home/read.html?chapterIndex=${i.index+1}&novelInfo.novelId=${novel.novelId}">第${i.index+1}章${t.chapterName}</a></li>
								</c:forEach>

							</ul>
						</div>
					</div>

				</div>
			</div>
			<div class="book-content-wrap cf">
				<div class="left-wrap fl">
					<div class="left-block-bg">
						<div class="left-wrap-title">
							<h3>作品互动区</h3>
						</div>
						<div class="fans-zone mb20" data-l1="5">
							<div class="fans-interact cf">
								<dl>
									<dd class="line"></dd>
									<dd>
										<h4 class="lang">
											<span>总票数</span>
										</h4>
										<div class="action-wrap">
											<div class="ticket month-ticket">
												<p class="num">
													<i id="monthCount">${novel.praiseCount}</i>
												</p>
												<p></p>
												<div class="icon-box month">
													<span></span> <b></b>
												</div>
												<a class="red-radius-btn j_showVoteWrap " id="投票"
													href="./vote.html?novelId=${novel.novelId}"
													data-showtype="1" data-aid="qd_G22"><em
													class="iconfont"></em>点赞量</a>
											</div>
										</div>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
				<div class="right-wrap fr" style="height: 347.5px;">
					<div class="author-state">
						<div class="info-wrap cf">
							<div class="img-box">
								<img
									src="https://ccstatic-1252317822.file.myqcloud.com/portraitimg/2018-03-12/5aa60468c7ef4.jpeg">
							</div>
							<h3>${novel.authorInfo.userName}</h3>
							<div class="total-wrap">
								<ul class="cf">
									<li><em class="iconfont"></em>
										<h4>作品总数</h4>
										<p>${sumnovel}</p></li>
									<li><em class="iconfont"></em>
										<h4>累计字数</h4>
										<p>${sumcharacter}</p></li>
									<li><em class="iconfont"></em>
										<h4>创作日期</h4>
										<p>${date1}</p></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
