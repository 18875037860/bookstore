<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MoYun</title>
<meta charset="utf-8">

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

<style type="text/css">
a {
	margin: 5px;
}

li {
	width: 230px;
	height: 60px;
	font-weight: bold;
	background-color: #707071;
}

li:hover {
	background-color: #343A40 !important;
}

img {
	width: 30px;
	height: 30px;
}

span {
	font-family: Microsoft Yahei;
}

div:hover {
	color: black;
}
</style>

<script type="text/javascript">
	window.onload = function()//用window的onload事件，窗体加载完毕的时候
	{
		var user = "${user.userName}";
		if (user == "") {
			$("#login").attr("style", "display:block;");
			$("#userinfo").attr("style", "display:none");
		} else {
			//$("#login").hide();
			$("#login").attr("style", "display:none;");
			$("#userinfo").attr("style", "display:block");
		}
		var status = "${status}";
		if (status == "synopsis") {
			document.getElementById("FrameId").src = "../home/synopsis.html?novelId=${novelid}";
		}
		else if ((status == "author") && (user!="")){
			document.getElementById("FrameId").src = "../author/moyun.html";
			changeColor("author")
		}else{
			document.getElementById("FrameId").src = "./loadframe.html";
		}
	};
	function ck() {
		if ("${user.userName}" == "") {
			window.location.href = "../user/signin.html";
		} else {
			$("#login").attr("style", "display:none;");
			$("#userinfo").attr("style", "display:block")
		}
	};

	function sk(id) {
		var color = document.getElementById(id).style.backgroundColor;
		if (color != "rgb(52, 58, 64)") {
			$("#novelkind").show(500)
		}
	};

	function hk(id) {
		var x = event.clientX;
		var y = event.clientY;
		var color = document.getElementById(id).style.backgroundColor;
		if ((x > 155) && (x < 375) && (y < 550) && (y > 95)) {
			$("#novelkind").show()
		} else {
			if (color != "rgb(52, 58, 64)") {
				$("#novelkind").hide(500)
			}
		}
	};

	function nh() {
		var color = document.getElementById("kind").style.backgroundColor;
		if (color != "rgb(52, 58, 64)") {
			$("#novelkind").hide(500)
		}
	};

	function changeColor(id) {
		$('#' + id).css({
			background : "#343A40"
		});
		if (id == 'kind') {
			$("#novelkind").show(500)
		} else {
			$("#novelkind").hide(500)
		}
		if (id != 'kind') {
			$('#kind').css({
				background : "#707071"
			});
		}
		if (id != 'all') {
			$('#all').css({
				background : "#707071"
			})
		}
		if (id != 'order') {
			$('#order').css({
				background : "#707071"
			});
		}
		if (id != 'finish') {
			$('#finish').css({
				background : "#707071"
			});
		}
		if (id != 'free') {
			$('#free').css({
				background : "#707071"
			});
		}
		if (id != 'author') {
			$('#author').css({
				background : "#707071"
			});
		}
		if (id != 'user') {
			$('#discuss').css({
				background : "#707071"
			});
		}
	}

	function personalcenter(id) {
		if (("${user.userName}" == "") && (id == "user")) {
			alert("请先登录个人信息!")
		} else {
			window.location.href = "../user/loadfans.html";
			//changeColor(id)
		}
	};

	function authorcenter(id) {
		if (("${user.userName}" == "") && (id == "author")) {
			alert("请先登录个人信息!")
		} else {
			window.location.href = "../home/moyun.html?status=author";
		}
	};
	
	function changebackground(id) {
		changeColor(id)
	}
	function cancelstyle() {
		$("#novelkind").hide(500)
	}
</script>
</head>
<body>

	<div class="row">
		<div class="col-1"></div>
		<div class="col-10">
			<div
				style="height: 60px; width: 100%; margin-top: 20px; background-color: white;"
				class="row">
				<div class="col-2" style="margin-top: -20px;">
					<span
						style="font-size: 42.5px; font-weight: bold; color: #343A40; margin-left: -15px;">MoYun</span>
				</div>
				<div class="col-9">
					<form action="../home/search.html" target="FrameName">
						<div class="row">
							<div class="col-8" style="text-align: right;">
								<input style="width: 88%; height: 30px; margin-right: -70px;"
									name="novelName" class="btn btn-dark"
									placeholder="search  information..." />
							</div>
							<div class="col-4">
								<input type="submit" style="margin-top: 1px; margin-left: 60px;"
									class="btn btn-outline-dark btn-sm" value="查询"></input>
							</div>
						</div>
					</form>
				</div>
				<div class="col-1" style="float: right;">
					<div style="margin-left: 20px; margin-top: -8px;">
						<input id="login" type="button" style="display: none;"
							class="btn btn-outline-dark" value="登录|注册" onclick="ck()"></input>
					</div>
					<div id="userinfo" style="display: none;">
						<h5
							style="width: 145%; height: 50px; text-align: center; padding-top: 10px;">欢迎您,${user.userName}</h5>
						<div
							style="width: 144.5%; height: 30px; text-align: center; margin-top: -20px; background-color: #32609E">
							<a href="../home/moyun.html?status=logout" style="color: white;">注销登录</a>
						</div>
					</div>
				</div>
			</div>
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-dark probootstrap-navbar-dark row"
				style="text-align: center;">
				<div style="background-color: red; margin-left: 0px;">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#probootstrap-nav" aria-controls="probootstrap-nav"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="probootstrap-nav"
						style="width: 100%; backtext-align: center;">
						<ul id="menu" class="navbar-nav mr-auto">
							<li id="kind" class="nav-item active"
								style="background-color: #343A40; margin-left: -11px;"
								onmouseenter="sk(this.id)" onmouseleave="hk(this.id)"><a
								name="kind" href="./moyun.html" class="nav-link"
								onclick="changebackground(this.name)">作品分类</a></li>
							<li id="all" class="nav-item active"><a name="all"
								href="../novel/all.html" target="FrameName" class="nav-link"
								onclick="changebackground(this.name)">全部作品</a></li>
							<li id="order" class="nav-item active"><a name="order"
								href="../novel/order.html" target="FrameName" class="nav-link"
								onclick="changebackground(this.name)">排行</a></li>
							<li id="finish" class="nav-item active"><a name="finish"
								href="../novel/finish.html" target="FrameName" class="nav-link"
								onclick="changebackground(this.name)">完本</a></li>
							<li id="free" class="nav-item active"><a name="free"
								href="../novel/free.html" target="FrameName" class="nav-link"
								onclick="changebackground(this.name)">免费</a></li>
							<li id="author" class="nav-item active"><a name="author"
								class="nav-link" onclick="authorcenter(this.name)">作者专区</a></li>
							<li id="discuss" class="nav-item active"><a name="user"
								class="nav-link" onclick="personalcenter(this.name)">个人中心</a></li>
						</ul>

					</div>
				</div>
			</nav>
			<div style="position: relative;">
				<iframe id="FrameId" name="FrameName" scrolling="no" frameborder="0"
					width="102%" height="2530px;" style="margin-left: -14px;"></iframe>
				<div id="novelkind" onmouseleave="nh()"
					style="width: 230px; margin-left: -14px; background-color: #343A40; opacity: 0.9; margin-top: -2536px; position: absolute; z-index: 999">
					<div class="row" style="height: 65px;">
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 0px 0px 2px;">
								<div class="col-sm-4" style="margin-top: -12px;">
									<a style="font-size: 45px; margin-left: -7px;"
										href="../novel/kind.html?style=都市" target="FrameName" onclick="cancelstyle()">♖</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">都市</span><br>
									<p style="font-size: 15px;">${kindNu[0]}</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 2px 0px 0px;">
								<div class="col-sm-4" style="margin-top: -13px;">
									<a style="font-size: 45px; margin-left: -1px;"
										href="../novel/kind.html?style=科幻" target="FrameName" onclick="cancelstyle()">⚘</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">科幻</span><br>
									<p style="font-size: 15px;">${kindNu[1]}</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="height: 65px;">
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 0px 0px 2px;">
								<div class="col-sm-4" style="margin-top: -10px;">
									<a style="font-size: 40px; margin-left: -2.5px;"
										href="../novel/kind.html?style=历史" target="FrameName" onclick="cancelstyle()">✤</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">历史</span><br>
									<p style="font-size: 15px;">${kindNu[2]}</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 2px 0px 0px;">
								<div class="col-sm-4" style="margin-top: -14px;">
									<a style="font-size: 42px; margin-left: -5px;"
										href="../novel/kind.html?style=现实" target="FrameName" onclick="cancelstyle()">✯</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">现实</span><br>
									<p style="font-size: 15px;">${kindNu[3]}</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="height: 65px;">
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 0px 0px 2px;">
								<div class="col-sm-4" style="margin-top: -12px;">
									<a style="font-size: 45px; margin-left: -2px;"
										href="../novel/kind.html?style=青春" target="FrameName" onclick="cancelstyle()">❦</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">青春</span><br>
									<p style="font-size: 15px;">${kindNu[4]}</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 2px 0px 0px;">
								<div class="col-sm-4" style="margin-top: -10px;">
									<a style="font-size: 40px; margin-left: -5px;"
										href="../novel/kind.html?style=武侠" target="FrameName" onclick="cancelstyle()">☯</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">武侠</span><br>
									<p style="font-size: 15px;">${kindNu[5]}</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="height: 65px;">
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 0px 0px 2px;">
								<div class="col-sm-4" style="margin-top: 2px;">
									<a style="font-size: 28px; margin-left: 2px;"
										href="../novel/kind.html?style=仙侠" target="FrameName" onclick="cancelstyle()">卍</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">仙侠</span><br>
									<p style="font-size: 15px;">${kindNu[6]}</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 2px 0px 0px;">
								<div class="col-sm-4" style="margin-top: -8px;">
									<a style="font-size: 37px; margin-left: -4px;"
										href="../novel/kind.html?style=玄幻" target="FrameName" onclick="cancelstyle()">☣</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">玄幻</span><br>
									<p style="font-size: 15px;">${kindNu[7]}</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="height: 65px;">
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 0px 0px 2px;">
								<div class="col-sm-4" style="margin-top: -2px;">
									<a style="font-size: 33px; margin-left: 0px;"
										href="../novel/kind.html?style=悬疑" target="FrameName" onclick="cancelstyle()">☠</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">悬疑</span><br>
									<p style="font-size: 15px;">${kindNu[8]}</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 2px 0px 0px;">
								<div class="col-sm-4" style="margin-top: -10px;">
									<a style="font-size: 40px; margin-left: -1px;"
										href="../novel/kind.html?style=游戏" target="FrameName" onclick="cancelstyle()">♤</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">游戏</span><br>
									<p style="font-size: 15px;">${kindNu[9]}</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="height: 65px;">
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 0px 0px 2px;">
								<div class="col-sm-4" style="margin-top: -20px;">
									<a style="font-size: 40px; margin-left: 2px;"
										href="../novel/kind.html?style=言情" target="FrameName" onclick="cancelstyle()">ღ</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 15px;">言情</span><br>
									<p style="font-size: 15px;">${kindNu[10]}</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="row" style="color: white; margin: 2px 0px 0px 0px;">
								<div class="col-sm-4" style="margin-top: -4px;">
									<a style="font-size: 30px; margin-left: -1px;"
										href="../novel/kind.html?style=轻小说" target="FrameName" onclick="cancelstyle()">の</a>
								</div>
								<div class="col-sm-8">
									<span style="font-size: 12px;">轻小说</span><br>
									<p style="font-size: 15px;">${kindNu[11]}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
	</div>

</body>
</html>