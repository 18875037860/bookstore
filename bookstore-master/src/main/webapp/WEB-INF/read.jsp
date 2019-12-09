<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">
<link rel="Bookmark" type="image/x-icon"
	href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">
<link rel="stylesheet" data-ignore="true"
	href="//qidian.gtimg.com/c/=/readnovel/css/lbfUI/css/icon.c9000.css,/readnovel/css/lbfUI/css/Drag.41d31.css,/readnovel/css/lbfUI/css/Checkbox.cc633.css,/readnovel/css/reset.e0c8b.css,/readnovel/css/font.db450.css,/readnovel/css/header.6206e.css,/readnovel/css/module.73d4b.css,/readnovel/css/footer.729bd.css,/readnovel/css/read.80298.css,/readnovel/css/layout.9f7c8.css,/readnovel/css/popup.b751d.css,/readnovel/css/book_popup.9cb94.css,/readnovel/css/vote_popup.76a80.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/Panel.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/LightTip.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/Popup.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/Drag.css">
<style name="lbf-overlay">
.lbf-overlay {
	position: fixed;
	top: 0;
	left: 0;
}
</style>
</head>
<body class="theme-0 w800" style="zoom: 1;">
	<div class="read-main-wrap font-family01" style="font-size: 18px"
		id="j_readMainWrap">
		<div id="j_chapterBox" data-l1="3">
			<div class="text-wrap" id="j_textWrap">
				<div class="read-container">
					<div class="book-cover-wrap">
						<div class="book-photo">
							<img
								src="//bookcover.yuewen.com/qdbimg/349573/c_10710260903382003/180">
						</div>
						<h1>${novel.novelName}</h1>
						<h2>
							<a>${novel.authorInfo.userName}</a>著
						</h2>
						<div class="info-list cf">
							<ul>
								<li><p>${novel.novelStyle}</p> <span>类型</span></li>

								<li><em>${date}</em><span>上架</span></li>
								<li><p>
										<em>${novel.novelCount}</em>
									</p> <span>${novel.novelStatus}(字)</span></li>
							</ul>
						</div>
						<h5>©版权所有 侵权必究</h5>
					</div>
				</div>
			</div>
		</div>
		<div id="j_chapterBox" data-l1="3">
			<div class="text-wrap" id="j_textWrap" data-cid="31286896293937123">
				<div class="read-container">
					<div class="main-text-wrap">
						<div class="text-head">
							<h3>
								第${chapter.chapterIndex}章 <a>${chapter.chapterName}</a>
							</h3>
						</div>
						<div class="read-content j_readContent">
							<p>${text}</p>

							<div class="chapter-control dib-wrap" data-l1="3">

								<a id="j_chapterPrev"
									href="read.html?chapterIndex=${chapter.chapterIndex-1}&novelInfo.novelId=${novel.novelId}">上一章</a><span>|</span>

								<a href="synopsis.html?no=${novel.novelId}">目录</a><span>|</span>
								<a id="j_chapterNext"
									href="read.html?chapterIndex=${chapter.chapterIndex+1}&novelInfo.novelId=${novel.novelId}">下一章</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="float-wrap" id="j_floatWrap">
				<div class="left-bar-list" id="j_leftBarList" style="top: 0px;">
					<dl>


						<dd>
							<a href="synopsis.html?novelId=${novel.novelId}"><i><em
									class="iconfont"></em><span>返回</span></i></a>
						</dd>
					</dl>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
