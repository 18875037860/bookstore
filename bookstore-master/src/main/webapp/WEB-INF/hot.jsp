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
<link rel="shortcut icon" type="image/x-icon"
	href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">
<link rel="Bookmark" type="image/x-icon"
	href="//qidian.gtimg.com/readnovel/favicon/favicon.ico">

<link rel="stylesheet" data-ignore="true"
	href="//qidian.gtimg.com/c/=/readnovel/css/reset.e0c8b.css,/readnovel/css/Select.d4cec.css,/readnovel/css/font.db450.css,/readnovel/css/header.6206e.css,/readnovel/css/module.73d4b.css,/readnovel/css/list_module.65ece.css,/readnovel/css/rank.e71d8.css,/readnovel/css/layout.9f7c8.css,/readnovel/css/popup.b751d.css,/readnovel/css/footer.729bd.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/LightTip.css">
<link rel="stylesheet"
	href="https://qidian.gtimg.com/readnovel/css/lbfUI/css/Popup.css">
<script src="https://zz.bdstatic.com/linksubmit/push.js"></script>
<script src="//pingjs.qq.com/h5/stats.js?v2.0.2"></script>
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<style name="lbf-overlay">
.lbf-overlay {
	position: fixed;
	top: 0;
	left: 0;
}
</style>
</head>
<body style="zoom: 1;" onLoad="goPage(1,6)">
	<script type="text/javascript">							
function goPage(pno,psize){
	var nm=$('#idData').children('li');
	var num=$('#idData').find('li').length;
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
	<div class="wrap" style="height:2500px;">
		<div class="rank-box box-center cf">
			<div class="rank-nav-list fl">
				<ul>
					<li class=""><a
						href="http://localhost:8080/bookstore/novel/order.html"><em
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
				<div class="rank-header inner-wrap">
					<h3 class="lang">人气榜</h3>
					<ul class="type cf rank-tab-box">
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=全部">全部</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=言情">言情</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=武侠">武侠</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=青春">青春</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=玄幻">玄幻</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=仙侠">仙侠</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=悬疑">悬疑</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=科幻">科幻</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=玄幻">玄幻</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=都市">都市</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=历史">历史</a></li>
						<li><a
							href="http://localhost:8080/bookstore/novel/hot.html?style=轻小说">轻小说</a></li>
					</ul>
					<ul class="type cf rank-tab-box">
					</ul>

				</div>
				<div class="rank-body">

					<div class="rank-view-list" id="rank-view-list">
						<div class="book-img-text">
							<ul id="idData">
								<c:forEach items="${novelInfodz}" var="t" varStatus="i">
									<li data-rid="1">
										<div class="book-img-box">
											<span class="rank-tag no1">${i.index+1}</span> <a
												href="../home/synopsis.html?novelId=${t.novelId}"><img
												src="../img/timg.jpg"></a>
										</div>
										<div class="book-mid-info">
											<h4>
												<a href="../home/synopsis.html?novelId=${t.novelId}">${t.novelName}</a>
											</h4>
											<p class="author">
												<img
													src="//qidian.gtimg.com/readnovel/images/ico/account.1e031.png"><a
													class="name default">${t.authorInfo.userName}</a><em>|</em><span>${t.novelStyle}</span><em>|</em><span>${t.novelAttribute}</span>
											</p>
											<p class="intro">${t.novelSynopsis}</p>
										</div>
										<div class="book-right-info">
											<p class="btn">
												<a class="pink-btn"
													href="../home/synopsis.html?novelId=${t.novelId}">书籍详情</a>
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
</body>
</html>