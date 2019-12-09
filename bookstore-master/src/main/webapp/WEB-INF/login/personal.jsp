<%@page import="com.cqjtu.bookstore.bean.UserInfo"%>
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
<html>
<head>
<title>MoYun</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${basePath }resource/assets/css/main.css" />
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="${basePath }resource/assets/js/skel.min.js"></script>
<script src="${basePath }resource/assets/js/util.js"></script>
<script src="${basePath }resource/assets/js/main.js"></script>
<script type="text/javascript">
	function unfollow(userId) {
		$.ajax({
			url : "${basePath}user/unfollow.html",
			type : "GET",
			data : {
				"userId" : userId,
			},
			async : false,
			timeout : 5000,
			success : function(data) {
				if (data == "success") {
					alert("取消成功");
					$("#recon").text("关注");
				} else {
					alert("取消失败");
				}
			},
			error : function() {
				alert("错误");
			}
		})
	}
	function follow(userId) {
		$.ajax({
			url : "${basePath}user/follow.html",
			type : "GET",
			data : {
				"userId" : userId,
			},
			async : false,
			timeout : 5000,
			success : function(data) {
				if (data == "success") {
					alert("关注成功");
					$("#con").text("取消关注");
				} else {
					alert("已关注，关注失败");
				}
			},
			error : function() {
				alert("错误");
			}
		})
	}
	function contactMsg() {
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		var message = document.getElementById("message").value;
		var myreg = /^[0-9a-z]+\w*@([0-9a-z]+\.)+[0-9a-z]+$/;
		if (name == null || name == undefined || name == '') {
			alert("请告诉我们您的名字！");
			document.getElementById('name').focus();
			return false;
		} else if (email == null || email == undefined || email == '') {
			alert("请告诉我们你的邮箱，以便回复！");
			document.getElementById('email').focus();
			return false;
		} else if (message == null || message == undefined || message == '') {
			alert("内容不能为空！");
			document.getElementById('message').focus();
			return false;
		} else if (!myreg.test(email)) {
			alert("邮箱格式错误");
			document.getElementById('email').focus();
			return;
		} else {
			$.ajax({
				url : "${basePath}user/contact.html",
				type : "POST",
				data : {
					"message" : message,
				},
				async : false,
				timeout : 5000,
				success : function(data) {
					if (data == "success") {
						alert("感谢您的消息，我们将尽快给您反馈!");
						$("input[type=reset]").trigger("click");
					} else {
						alert("我们未能收到消息");
					}
				},
				error : function() {
					alert("未知错误");
				}
			})
		}
	}
</script>
<style type="text/css">
a {
	text-decoration: none
}

p { //
	border: 1px solid #333;
	width: 100%;
	color: black;
}

#three {
	background: #ECFFFF;
}

#footer {
	background: #909090;
}

table th {
	text-align: center;
	table-layout: fixed;
	min-width: 100px;
}
</style>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a class="logo"><strong>${user.userName}</strong> persional Space</a>
			<nav id="nav">
				<a href="../home/moyun.html">首页</a> <a href="../user/find.html">修改密码</a>
				<a href="#getconnect">联系我们</a> <a href="../user/pay.html">VIP服务</a>
			</nav>
			<a href="#navPanel" class="navPanelToggle"><span
				class="fa fa-bars"></span></a>
		</div>
	</header>

	<!-- Banner -->
	<section id="banner" style="height: 1000px;">
		<div class="inner">
			<header>
				<h1>Welcome ${user.userName}</h1>
			</header>

			<div class="flex ">

				<div id="collections">
					<a href="../user/bookshelf.html"> <span class="icon fa-car"></span>
						<h3>收藏作品</h3>
						<p>Suspendisse amet ullamco</p>
					</a>
				</div>

				<div id="fans">
					<a href="#three"> <span class="icon fa-camera"></span>
						<h3>我的互动</h3>
						<p>Class aptent taciti ad litora</p>
					</a>
				</div>

				<div id="persionalWorks">
					<a href="${basePath}home/moyun.html?status=author"> <span class="icon fa-bug"></span>
						<h3>个人作品</h3>
						<p>Nulla vitae mauris non felis</p>
					</a>
				</div>

			</div>

			<footer>
				<a href="../home/moyun.html" class="button">返回主页</a>
			</footer>
		</div>
	</section>


	<!-- Three -->
	<section id="three" class="wrapper align-center"
		style="height: 1000px;">
		<div class="inner">
			<div class="flex flex-2">


				<!-- 表格 -->
				<p>我的关注</p>
				<table class="text-center table table-bordered table-hovered">
					<tr>
						<th>用户</th>
						<th>作品</th>
						<th>作品类型</th>
						<th>作品编号</th>
						<th>互动</th>
					</tr>
					<c:forEach items="${fondFs }" var="t" varStatus="i">
						<tr>
							<td><a href="javascript:toFans(${t.userName})">${t.userName }
							</a>
							<td>${t.novelInfo[0].novelName }</td>
							<td>${t.novelInfo[0].novelStyle }</td>
							<td>${t.novelInfo[0].novelId }</td>
							<td><a id="con" class="btn btn-success"
								href="javascript:follow(${t.userId});">关注</a>
						</tr>
					</c:forEach>

				</table>
				<hr>
				<p>我的关注</p>
				<table class="text-center table table-bordered table-hovered">
					<tr>
						<th>用户</th>
						<th>书名</th>
						<th>作品类型</th>
						<th>作品编号</th>
						<th>互动</th>
					</tr>
					<c:forEach items="${fondIfs}" var="t" varStatus="i">
						<tr>
							<td>${t.userName }</td>
							<td>${t.novelInfo[0].novelName }</td>
							<td>${t.novelInfo[0].novelStyle }</td>
							<td>${t.novelInfo[0].novelId }</td>
							<td><a id="recon" class="btn btn-success"
								href="javascript:unfollow(${t.userId});">取消关注</a>
						</tr>
					</c:forEach>
				</table>
				<hr>
			</div>
		</div>
	</section>
	<footer id="footer" style="height: 1000px;">
		<div class="inner">

			<h3 id="getconnect">取得联系</h3>

			<form onsubmit="return false" action="#" method="post"
				id="contactForm">

				<div class="field half first">
					<label for="name">姓名</label> <input name="name" id="name"
						type="text" placeholder="Name">
				</div>
				<div class="field half">
					<label for="email">电子邮件</label> <input name="email" id="email"
						type="email" placeholder="Email">
				</div>
				<div class="field">
					<label for="message">消息</label>
					<textarea name="message" id="message" rows="6"
						placeholder="Message"></textarea>
				</div>
				<ul class="actions">
					<li><input value="发送消息" class="button alt" type="submit"
						onclick="return contactMsg()"></li>
				</ul>
				<input type="reset" style="display: none;" />
			</form>

			<div class="copyright">
				&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>.
				Images: <a href="https://unsplash.com">Unsplash</a>.
			</div>
		</div>
	</footer>
</body>
</html>