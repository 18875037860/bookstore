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
<html>
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
	href="//qidian.gtimg.com/c/=/readnovel/css/reset.e0c8b.css,/readnovel/css/font.db450.css,/readnovel/css/header.6206e.css,/readnovel/css/module.73d4b.css,/readnovel/css/list_module.65ece.css,/readnovel/css/all_finish.15f38.css,/readnovel/css/layout.9f7c8.css,/readnovel/css/popup.b751d.css,/readnovel/css/footer.729bd.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="https://zz.bdstatic.com/linksubmit/push.js"></script>
<script src="//pingjs.qq.com/h5/stats.js?v2.0.2"></script>
</head>
<body style="zoom: 1;" onLoad="goPage(1,10)">
	<div class="wrap" style="height:2500px;">
		<div class="all-pro-wrap box-center cf">
			<div class="range-sidebar fl">
				<div class="inner-wrap">
					<div class="select-list">
						<div class="work-filter type-filter">
							<ul type="size" style="height: 40px;">
								<li data-id="6" class=""><h2>分类</h2></li>
								<li data-id="6" class="" style="width: 120px;"><select
									style="width: 100px;" id="select1" onchange="showDiv()">
										<option>全部</option>
										<option>都市</option>
										<option>仙侠</option>
										<option>科幻</option>
										<option>言情</option>
										<option>青春</option>
										<option>玄幻</option>
										<option>悬疑</option>
										<option>奇幻</option>
										<option>游戏</option>
										<option>历史</option>
										<option>武侠</option>
										<option>轻小说</option>
								</select> <script type="text/javascript">
									function showDiv()
												{		
										window.location.href="../novel/finish.html?style="+$("#select1").val()+"&attribute="+$("#select3").val()+"";
									    } 
									function goPage(pno,psize){
										var nm=$('#idData').children('li');
										var num=$('#idData').find('li').length;							
										var pageSize = psize;//每页显示行数
										var totalPage = 0
										if((num/pageSize)>(parseInt(num/pageSize))){
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
											document.getElementById("select1").value="${novelstyle}"; 
									  		document.getElementById("select3").value="${novelattribute}"; 
									}			
									</script></li>
							</ul>
						</div>
						<div class="work-filter action-filter">
							<ul type="size" style="height: 40px;">
								<li data-id="6" class=""><h2>属性</h2></li>
								<li data-id="6" class="" style="width: 120px;"><select
									style="width: 100px;" id="select3" onchange="showDiv()">
										<option>全部</option>
										<option>免费</option>
										<option>vip</option>
								</select></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="main-content-wrap fl" data-l1="5">
				<div class="all-book-list inner-wrap">
					<div class="right-book-list">
						<ul id="idData">
							<c:forEach items="${novelInfo}" var="t">
								<li>
									<div class="book-img">
										<a href="../home/synopsis.html?novelId=${t.novelId}"> <img src="../img/timg.jpg">
										</a>
									</div>
									<div class="book-info">
										<a href="../home/synopsis.html?novelId=${t.novelId}"><h1>${t.novelName}</a>
										</h1>
										<h4>
											<a class="default">${t.authorInfo.userName}</a>
										</h4>
										<p class="tag">
											<span class="org">${t.novelStyle}</span><span class="org">${t.novelAttribute}</span><span
												class="red">${t.novelStatus}</span><span class="blue">${t.novelCount}</span>
										</p>
										<p class="intro">${t.novelSynopsis}</p>
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
</body>