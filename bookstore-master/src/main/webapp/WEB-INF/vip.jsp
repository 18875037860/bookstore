<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	session.setAttribute("basePath", basePath);
%>
<html class="loaded">
<head>
<meta charset="UTF-8">
<title>MoYun</title>
<style>
ul.pagination {
	display: inline-block;
	padding: 0;
	margin: 0;
}

ul.pagination li {
	display: inline;
}

ul.pagination li a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 5px;
}

ul.pagination li a.active {
	background-color: red;
	color: white;
	border-radius: 10px;
}
ul










.pagination





 





li





 





a










:hover










:not





 





(
.active





 





)
{
background-color










:





 





#ddd










;
}
</style>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script src="https://zz.bdstatic.com/linksubmit/push.js"></script>

<link href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">
<link href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">

<link
	href="//qidian.gtimg.com/c/=/readnovel/css/reset.e0c8b.css,/readnovel/css/font.db450.css,/readnovel/css/header.6206e.css,/readnovel/css/module.73d4b.css,/readnovel/css/list_module.65ece.css,/readnovel/css/free.81f32.css,/readnovel/css/layout.9f7c8.css,/readnovel/css/popup.b751d.css,/readnovel/css/footer.729bd.css">

<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/LightTip.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/Popup.css">
<style name="lbf-overlay">
.lbf-overlay {
	position: fixed;
	top: 0;
	left: 0;
}
</style>
</head>
<body style="zoom: 1;" onLoad="goPage(1,10)">
	<script type="text/javascript">							
								function goPage(pno,psize){
									var nm=$('#idData').children('li');
									var num=$('#idData').find('li').length;
								/*  var num = itable.rows.length;//表格所有行数(所有记录数)*/
								  console.log(num);
									
									var pageSize = psize;//每页显示行数
									var totalPage = 0
									if(num/pageSize>parseInt(num/pageSize)){
									    totalPage=parseInt(num/pageSize)+1;
									  }else{
									    totalPage=parseInt(num/pageSize);
									  }
										var currentPage = pno;//当前页数
										var startRow = (currentPage - 1) * pageSize+1;//开始显示的行 31
										var endRow = currentPage * pageSize;//结束显示的行  40
										  for(var i=1;i<(num+1);i++){
										  var irow = nm[i-1];
										  if(i>=startRow && i<=endRow){
										    irow.style.display = "block";
										  }else{
										    irow.style.display = "none";
										  }
										}
										var tempStr=" ";
										
										if(currentPage>1){
											  tempStr += "<li><a href=\"#\" onClick=\"goPage("+(currentPage-1)+","+psize+")\"><</a></li>"
											}else{
												tempStr +="<li><a><</a></li>"
											}
										for(var i=0;i<totalPage;i++)
											{
											var page=i+1;
											if(page==currentPage)
												{tempStr += "<li><a class=\"active\" href=\"#\" onClick=\"goPage("+(i+1)+","+psize+")\">"+page+"</a></li>";}
											else
												tempStr += "<li><a  href=\"#\" onClick=\"goPage("+(i+1)+","+psize+")\">"+page+"</a></li>";																						
											}
										if(currentPage<totalPage){
											  tempStr += "<li><a href=\"#\" onClick=\"goPage("+(currentPage+1)+","+psize+")\">></a></li>";
											}else{
											  tempStr += "<li><a>></a></li>";
											} 
										document.getElementById("barcon").innerHTML = tempStr;  
								}							
						  </script>
	<div class="wrap" style="height: 2500px;">
		<div class="header">
			<div class="top-head box-center cf">
				<h1 class="logo" title="小说阅读网">
					<a href="//www.readnovel.com"><em></em></a>
				</h1>
				<div class="search-wrap">

					<form class="cf" id="formUrl" action="//www.readnovel.com/search"
						method="get" target="_blank">
						<input class="search-box" id="s-box" name="kw" type="text"
							placeholder="冥冥之中喜欢你" autocomplete="off" value=""> <input
							class="submit-input" type="submit" id="searchSubmit" data-eid=""><label
							id="search-btn" class="search-btn" for="searchSubmit"><em
							class="iconfont"></em></label>
					</form>
				</div>
				<div class="user-wrap">
					<div class="avatar" id="j-userWrap">
						<a class="link" href="javascript:" id="j-avatar"><img
							src="//qidian.gtimg.com/readnovel/images/ico/account.1e031.png"></a>
						<div class="down-drop" id="j-userDownDrop">
							<dl>
								<dd>
									<a href="javascript:" id="sign-out">退出</a>
								</dd>
							</dl>
						</div>
					</div>
					<ul>
						<li><a class="head-shelf" href="javascript:"><em
								class="iconfont"></em>我的书架</a></li>
					</ul>
				</div>
			</div>

			<div class="top-nav-wrap box-center cf">
				<div class="left-nav fl">
					<ul class="cf">
						<li class="type " id="j-navType"><a
							href="http://localhost:8080/bookstore/novel/all.html"><em
								class="iconfont"></em>全部分类</a>

							<div class="type-list" id="j-typeList">
								<cite></cite>
								<dl>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=都市"><em
											class="iconfont"></em>都市</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=仙侠"><em
											class="iconfont"></em>仙侠</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=科幻"><em
											class="iconfont"></em>科幻</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=言情"><em
											class="iconfont"></em>言情</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=青春"><em
											class="iconfont"></em>青春</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=玄幻"><em
											class="iconfont"></em>玄幻</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=悬疑"><em
											class="iconfont"></em>悬疑</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=奇幻"><em
											class="iconfont"></em>奇幻</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=游戏"><em
											class="iconfont"></em>游戏</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=历史"><em
											class="iconfont"></em>历史</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=武侠"><em
											class="iconfont"></em>武侠</a>
									</dd>
									<dd>
										<a
											href="http://localhost:8080/bookstore/novel/all.html?style=轻小说"><em
											class="iconfont"></em><i>轻小说</i></a>
									</dd>
								</dl>
							</div></li>
						<li class=""><a
							href="http://localhost:8080/bookstore/novel/order.html">排行榜</a></li>
						<li class=""><a
							href="http://localhost:8080/bookstore/novel/vip.html">免费</a></li>
						<li class=""><a
							href="http://localhost:8080/bookstore/novel/finish.html">完本</a></li>

					</ul>
				</div>
			</div>
		</div>
		<div class="free-container box-center">
			<div class="free-type-tab mb20 cf">
				<a class="lang act"
					href="http://localhost:8080/bookstore/novel/vip.html">vip专享</a> <a
					class="lang" href="http://localhost:8080/bookstore/novel/free.html">免费作品</a>
			</div>
			<div id="free-channel-wrap">
				<div id="j-freeBookWrap">


					<div class="limit-free-list cf">
						<div class="limit-book-list fl" data-l1="5">

							<div id="limit-list" class="inner-wrap">
								<div class="book-img-text">
									<ul id="idData">
										<c:forEach items="${novelInfo}" var="t">
											<li data-rid="1">
												<div class="book-img-box">
													<a href="../home/synopsis.html?novelId=${t.novelId}"
														data-eid="qd_E04" data-bid="11844610603786303"
														target="_blank"><img src="../img/timg.jpg"></a>
												</div>
												<div class="book-mid-info">
													<h4>
														<a href="../home/synopsis.html?novelId=${t.novelId}"
															target="_blank" data-eid="qd_C40"
															data-bid="13184277605283804"
															action="${basePath}/novel/vip.html">${t.novelName}</a>
													</h4>

													<p class="author">
														<src="../img/timg.jpg""> <a class="default name"
															data-eid="qd_E06">${t.authorInfo.userName}</a> <em>|</em>
														<span>${t.novelStyle}</span> <em>|</em> <span>${t.novelStatus}</span>
													</p>
													<p class="intro">${t.novelSynopsis}</p>


												</div>
												<div class="book-right-info">
													<p class="btn">
														<a class="pink-btn" href="/book/11844610603786303"
															target="_blank" data-eid="qd_E02"
															data-bid="11844610603786303">免费阅读</a>
													</p>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div class="page-box cf">
									<ul class="pagination" id="barcon">
									</ul>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>