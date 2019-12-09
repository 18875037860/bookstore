<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Conten-Type" content="text/html; charset=utf-8">
<title>MoYun</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700"
	rel="stylesheet">

<link rel="stylesheet" href="../resource/css1/css/animate.css">
<link rel="stylesheet" href="../resource/css1/css/icomoon.css">
<link rel="stylesheet" href="../resource/css1/css/themify-icons.css">
<link rel="stylesheet" href="../resource/css1/css/bootstrap.css">
<link rel="stylesheet" href="../resource/css1/css/magnific-popup.css">
<link rel="stylesheet" href="../resource/css1/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../resource/css1/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../resource/css1/css/style.css">

<script src="js/respond.min.js"></script>
<style type="text/css">
#gtco-header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	min-width: 1000px;
	z-index: -10;
	zoom: 1;
	background-color: #fff;
	background-repeat: no-repeat;
	background-size: cover;
	-webkit-background-size: cover;
	-o-background-size: cover;
	background-position: center 0;
}
</style>
</head>
<body>
	<div class="gtco-loader"></div>
	<div id="page">
		<div class="page-inner">
			<header id="gtco-header" class="gtco-cover" role="banner"
				style="background-image: url(../resource/images/images/2.jpg)">
				<div class="overlay"></div>
				<div class="gtco-container">
					<div class="row">
						<div class="col-md-12 col-md-offset-0 text-left">


							<div class="row row-mt-15em">
								<div class="col-md-7 mt-text animate-box"
									data-animate-effect="fadeInUp">
									<span class="intro-text-small">Welcome to MOYun</span>
									<h1>Enter MoYun Broaden Your Horizons.</h1>
								</div>
								<div class="col-md-4 col-md-push-1 animate-box"
									data-animate-effect="fadeInRight" style="margin-top: -90px;">
									<div class="form-wrap">
										<div class="tab">
											<ul class="tab-menu">
												<li class="active gtco-first"><a href="#"
													data-tab="login">Login</a></li>
												<li class="gtco-second"><a href="#" data-tab="regist">Register</a></li>
											</ul>
											<div class="tab-content">
												<div class="tab-content-inner active" data-content="login">
													<form action="#" method="post" onsubmit="return false"
														id="logForm">
														<input type="reset" style="display: none;" />
														<div class="row form-group">
															<div class="col-md-12">
																<label for="username">Username or Email</label> <input
																	type="text" class="form-control" id="username"
																	placeholder="请输入用户名或邮箱" name="userName">
															</div>
														</div>
														<div class="row form-group">
															<div class="col-md-12">
																<label for="password">Password</label> <input
																	type="password" class="form-control" id="password"
																	placeholder="请输入密码" name="userPassword">
															</div>
														</div>
														<div class="row form-group">
															<div class="col-md-12">
																<div
																	style="width: 60%; padding: 0; margin: 0; float: left; box-sizing: border-box;">
																	<input type="text" class="form-control"
																		id="verifyInput" placeholder="请输入验证码"
																		name="verifyCode">
																</div>
																<div
																	style="width: 40%; padding: 0; margin: 0; float: left; box-sizing: border-box;">
																	<img id="img1" title="点击获取新的验证码"
																		src="../user/getVerifyCodeImage.html"
																		onclick="changeimg()" width="100" height="43" alt=""
																		style="display: inline-block;">
																</div>
															</div>
														</div>

														<div class="row form-group">
															<div class="col-md-12"
																style="width: 50%; padding-left: 18px; margin: 0; float: left; box-sizing: border-box;">
																<input type="submit" class="btn btn-primary"
																	value="Login" onclick="return checkLogin()">
															</div>
															<div
																style="width: 50%; padding: 10px; margin: 0; float: left; box-sizing: border-box; absolute: bottom;">
																<a href="../user/find.html"
																	style="text-decoration: underline;">忘记密码？</a>
															</div>
														</div>
													</form>
												</div>
												<div class="tab-content-inner " data-content="regist">

													<form id="regForm" onsubmit="return false" action="#"
														method="post" enctype="application/x-www-form-urlencoded">
														<div class="row form-group">
															<div class="col-md-12">
																<label for="username">Phone or Email</label> <input
																	type="text" class="form-control" id="email"
																	name="email" placeholder="请输入手机或邮箱">
															</div>
														</div>
														<div class="row form-group">
															<div class="col-md-12">
																<label for="password2">Username</label> <input
																	type="text" required="required" class="form-control"
																	id="username1" name="userName1" placeholder="请输入用户名">
																<span id="usernameMsg" class="warning" hidden="hidden">用户名已存在</span>
															</div>
														</div>
														<div class="row form-group">
															<div class="col-md-12">
																<label for="password">Password</label> <input
																	type="password" class="form-control" id="password1"
																	name="userPassword1" placeholder="请输入密码"> <span
																	id="password1Msg" class="warning" hidden="hidden">密码不能小于6位</span>
															</div>
														</div>

														<div class="row form-group">
															<div class="col-md-12">
																<label for="password2">Repeat Password</label> <input
																	type="password" class="form-control" id="password2"
																	name="userPassword2" placeholder="请输再次入密码"> <span
																	id="password2Msg" class="warning" hidden="hidden">前后密码不一致</span>
															</div>
														</div>

														<div class="row form-group">
															<div class="col-md-12">
																<label for="VerificationCode ">Verification Code
																</label>
																<div>
																	<input type="text" class="form-control"
																		id="VerificationCode" name="code" placeholder="请输入验证码">
																</div>
															</div>
														</div>

														<div class="row form-group">
															<div class="col-md-12">
																<div
																	style="width: 50%; padding: 0; margin: 0; float: left; box-sizing: border-box;">
																	<input type="submit" class="btn btn-primary"
																		value="注册登录" onclick="return checkPassword()">
																</div>
																<div
																	style="width: 50%; padding: 0; margin: 0; float: left; box-sizing: border-box;">
																	<span><input type="button"
																		class="btn btn-primary" value="获取验证码"
																		name="getEmailCode" id="sendidcode"></span>

																</div>
															</div>
														</div>
														<input type="reset" style="display: none;" />
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>
	</div>
	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	<script src="../resource/js/jquery-3.4.1.min.js"></script>
	<script src="../resource/js/jquery.form.js"></script>
	<script src="../resource/js1/js/jquery.easing.1.3.js"></script>
	<script src="../resource/js1/js/modernizr-2.6.2.min.js"></script>
	<script src="../resource/js/DD_belatedPNG_0.0.8a-min.js"></script>
	<script src="../resource/js1/js/bootstrap.min.js"></script>
	<script src="../resource/js1/js/jquery.waypoints.min.js"></script>
	<script src="../resource/js1/js/owl.carousel.min.js"></script>
	<script src="../resource/js1/js/jquery.countTo.js"></script>
	<script src="../resource/js1/js/jquery.magnific-popup.min.js"></script>
	<script src="../resource/js1/js/magnific-popup-options.js"></script>
	<script src="../resource/js1/js/main.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#username1").blur(function() {
				$.ajax({
					url : "/bookstore/user/sendUserName.html",
					type : "GET",

					data : "username=" + $("#username1").val(),
					timeout : 5000,
					success : function(data) {
						if (data == "error") {
							$("#usernameMsg").show(1000);
						} else {
							$("#usernameMsg").slideUp(1000);

						}
					},
					error : function() {

					}
				})
			});
			$("#password1").blur(function() {
				var pas = document.getElementById("password1").value;
				if (pas.length < 6) {
					$("#password1Msg").show(1000);
				} else {
					$("#password1Msg").slideUp(1000);
				}
			});
			$("#sendidcode").click(function() {
				if ($("#email").val() == "") {
					$("#sendidcode").attr("disabled", "true");
					$("#sendidcode").val("邮箱地址未填");
					setTimeout(function() {
						$("#sendidcode").removeAttr("disabled");
						$("#sendidcode").val("发送验证码");
					}, 900);
					return;
				}
				var myreg = /^[0-9a-z]+\w*@([0-9a-z]+\.)+[0-9a-z]+$/;
				if (!myreg.test($("#email").val())) {
					$("#sendidcode").attr("disabled", "true");
					$("#sendidcode").val("邮箱格式错误");
					document.getElementById('email').focus();
					setTimeout(function() {
						$("#sendidcode").removeAttr("disabled");
						$("#sendidcode").val("发送验证码");
					}, 900);
					return;
				}
				$("#sendidcode").attr("value", "正在发送");
				$("#sendidcode").attr("disabled", "true");
				$.ajax({
					url : "/bookstore/Code/sendIdCode.html",
					type : "GET",
					//发送数据的第一种格式，字符串...
					data : "email=" + $("#email").val(),
					timeout : 5000,
					success : function(data) {
						$("#sendidcode").attr("value", "验证码已发送");
					},
					error : function() {

					}
				});
			});
		});
		function changeimg() {
			var img = document.getElementById("img1");
			img.src = "../user/getVerifyCodeImage.html" + "?r=" + Math.random();
		}
		function checkPassword() {
			var sName = document.getElementById("username1").value;
			var PassW1 = document.getElementById("password1").value;
			var PassW2 = document.getElementById("password2").value;
			var Vcode = document.getElementById("VerificationCode").value;
			if (sName == null || sName == undefined || sName == '') {
				alert("用户名不能为空哟！");
				document.getElementById('username1').focus();
				return false;
			} else if (PassW1 == null || PassW1 == undefined || PassW1 == '') {
				alert("密码不能为空哟！");
				document.getElementById('password1').focus();
				return false;
			} else if (PassW1.length < 6) {
				alert("密码不能小于6位");
				document.getElementById('password1').focus();
				return false;
			} else if (PassW1 != PassW2) {
				alert("两次输入密码不一致！")
				document.getElementById('password2').focus();
				return false;
			} else if (Vcode == null || Vcode == undefined || Vcode == '') {
				alert("验证码不能为空哟！");
				document.getElementById('VerificationCode').focus();
				return false;
			} else {
				//b=false;
				$.ajax({
					url : "/bookstore/user/regist.html",
					type : "POST",
					data : {
						"email" : $("#email").val(),
						"userName1" : sName,
						"userPassword1" : PassW1,
						"inputCode" : Vcode
					},
					async : false,
					timeout : 5000,
					success : function(data) {
						if (data.trim() == "error1".trim()) {
							alert("用户名已存在");
							document.getElementById('username1').focus();
						} else if (data == "error2") {
							alert("该邮箱已注册，请登录");
							$("input[type=reset]").trigger("click");
							return false;
						} else if (data == "error") {
							alert("验证码错误");
							return false;
						} else if (data == "success") {
							alert("注册成功");
							window.location.href = "../home/moyun.html";
						}
					},
					error : function() {
						alert("错误");
					}
				})
			}
		}
	</script>
	<script type="text/javascript">
		function checkLogin() {
			var sName = document.getElementById("username").value;
			var PassW1 = document.getElementById("password").value;
			var Vcode = document.getElementById("verifyInput").value;
			if (sName == null || sName == undefined || sName == '') {
				alert("用户名不能为空哟！");
				document.getElementById('username').focus();
				return false;
			} else if (PassW1 == null || PassW1 == undefined || PassW1 == '') {
				alert("密码不能为空哟！");
				document.getElementById('password').focus();
				return false;
			} else if (Vcode == null || Vcode == undefined || Vcode == '') {
				alert("验证码不能为空哟！");
				document.getElementById('verifyInput').focus();
				return false;
			} else {
				//b=false;
				$.ajax({
					url : "/bookstore/user/login.html",
					type : "POST",
					data : {
						"userName" : sName,
						"userPassword" : PassW1,
						"verifyCode" : Vcode
					},
					async : false,
					timeout : 5000,
					success : function(data) {
						if (data.trim() == "error1".trim()) {                       	
							alert("用户名不存在");
							document.getElementById('username').focus();
							$("input[type=reset]").trigger("click");
						} else if (data == "error") {
							alert("验证码错误");
							changeimg();
							return false;
						} else if (data == "error2") {
							alert("密码错误");
							changeimg();
							return false;
						} else if (data == "success") {
							window.location.href = "../home/moyun.html";
						}
					},
					error : function() {
						alert("错误");
					}
				})
			}
		}
	</script>
</body>
</html>
