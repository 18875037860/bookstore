<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="zxx">
<head>
<title>MoYun</title>
<meta http-equiv="Conten-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords" content="">

<link href="../resource/findpassword/css/style.css" rel='stylesheet'
	type='text/css' />
<script src="../resource/js/jquery-3.4.1.min.js"></script>
<script src="../resource/js/jquery.form.js"></script>
<script src="../resource/js1/js/jquery.easing.1.3.js"></script>
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<style type="text/css">
.content {
	border-radius: 5px;
	background: "#00CC99";
	width: 550px;
	height: 450px;
	margin: 10px auto; 
	border: 1px solid lightgray;
}

input[type="text"], input[type="password"], input[type="email"] {
	padding-left: 10px;
	width: 170px;
	height: 25px;
	border: solid 1px lightgrey;
	border-radius: 3px;
}

.left {
	display: inline-block;
	text-align: left;
	width: 170px;
}

.in {
	line-height: 50px;
	text-align: left;
	width: 550px;
	margin: 0 20px;
	font-size: 10pt;
}

a {
	font-size: 9pt;
	text-decoration: none;
	color: grey;
}

a:hover {
	color: blue;
}

hr {
	margin: 10px 20px;
	border: none; //
	border-bottom: 1px dotted lightgrey;
}

.bottom {
	float: right;
	padding-right: 150px;
	line-height: 60px;
}

input[type="submit"] {
	background: rgba(22, 115, 11, 0.38);
	border: 0 none;
	width: 90px;
	height: 30px;
	border-radius: 3px;
	color: white;
}

input[type="submit"]:hover {
	background: rgb(77, 140, 70);
}

input[type="button"]:hover {
	background: rgb(77, 140, 70);
}

input[type="button"] {
	background: rgba(22, 115, 11, 0.38);
	border: 0 none;
	width: 90px;
	height: 23px;
	border-radius: 3px;
	color: white;
}

input[type="reset"] {
	background: rgb(179, 176, 176);
	border: 0 none;
	width: 90px;
	height: 30px;
	border-radius: 3px;
	color: white;
}

input[type="reset"]:hover {
	background: rgb(200, 200, 200);
}

.tip {
	text-align: center;
	font-size: 10pt;
	color: grey;
	background: white;
	width: 530px;
	height: 90px;
	margin: 0px auto;
	padding-left: 10px;
	background: lightgrey;
}

body {
	background-image: url(../resource/images/images/2.jpg);
}

.warning {
	color: red;
}

#usernameMsg {
	display: none;
	width: 200px;
	height: 30px;
}
}
</style>
</head>

<body>
	<h1>FIND PASSWORD</h1>
	<div class="content">
		<form action="#" method="post" onsubmit="return false">

			<div class="in">
				<br> <span class="left" style="font-size: 20px">邮箱：</span> <input
					type="text" required="required" placeholder="请输入邮箱" name="email"
					id="email" style="width: 200px; height: 30px;" /> <span
					id="usernameMsg" class="warning" hidden="hidden">用户名已存在</span>

			</div>
			<div class="in">
				<span class="left" style="font-size: 20px">新密码：</span> <input
					type="password" required="required" placeholder="请输入密码"
					name="password" id="password" style="width: 200px; height: 30px;" />
			</div>
			<div class="in">
				<span class="left" style="font-size: 20px">再次输入新密码：</span> <input
					type="password" required="required" placeholder="输入密码"
					name="password2" style="width: 200px; height: 30px;" id="password2" />
			</div>
			<div class="in">
				<span class="left" style="font-size: 20px">验证码：</span> <input
					type="text" required="required" placeholder="请点击按钮发送验证码"
					name="idcode" id="VFcode" style="width: 200px; height: 30px;" /> <span><input
					type="button" value="发送验证码" id="getVerifyCode"
					style="width: 100px; height: 35px;"></span>
			</div>
			<hr>
			<div class="bottom">
				<input type="submit" value="更改密码"
					style="width: 100px; height: 35px;" onclick="return checkPost()">
				<input type="reset" value="重置" style="width: 100px; height: 35px;">
			</div>
		</form>

	</div>
	<div class="tip">提示：请在收到验证码后尽快完成验证，有任何问题请联系我们，墨韵书城为您服务。</div>
	<div class="copy-wthree">
		<p>Copyright &copy; 2019.Company name All rights reserved.</p>
	</div>

	<script type="text/javascript">
		$(function() {
			$("#getVerifyCode").click(function() {
				if ($("#email").val() == "") {
					$("#getVerifyCode").attr("disabled", "true");
					$("#getVerifyCode").val("邮箱地址未填");
					setTimeout(function() {
						$("#getVerifyCode").removeAttr("disabled");
						$("#getVerifyCode").val("发送验证码");
					}, 900);
					return;
				}
				var myreg = /^[0-9a-z]+\w*@([0-9a-z]+\.)+[0-9a-z]+$/;
				if (!myreg.test($("#email").val())) {
					$("#getVerifyCode").attr("disabled", "true");
					$("#getVerifyCode").val("邮箱格式错误");
					setTimeout(function() {
						$("#getVerifyCode").removeAttr("disabled");
						$("#getVerifyCode").val("发送验证码");
					}, 900);
					return;
				}
				$("#getVerifyCode").attr("value", "正在发送");
				$("#getVerifyCode").attr("disabled", "true");
				$.ajax({
					url : "/bookstore/user/sendIdCode.html",
					type : "GET",
					//发送数据的第一种格式，字符串...
					data : "email=" + $("#email").val(),
					timeout : 5000,
					success : function(data) {
						$("#getVerifyCode").attr("value", "邮件已发送");
					},
					error : function() {
						alert("错误!");
					}
				});
			});
		})
		function checkPost() {
			var sName = document.getElementById("email").value;
			var PassW1 = document.getElementById("password").value;
			var PassW2 = document.getElementById("password2").value;
			var Vcode = document.getElementById("VFcode").value;
			if (sName == null || sName == undefined || sName == '') {
				alert("邮箱不能为空！");
				document.getElementById('email').focus();
				return false;
			} else if (PassW1.length < 6) {
				alert("密码不能小于6位");
				document.getElementById('password').focus();
				return false;
			} else if (PassW1 != PassW2) {
				alert("两次输入密码不一致！")
				document.getElementById('password2').focus();
				return false;
			} else if (Vcode == null || Vcode == undefined || Vcode == '') {
				alert("验证码不能为空！");
				document.getElementById('VFcode').focus();
				return false;
			} else {
				$.ajax({
					url : "/bookstore/user/findpassword.html",
					type : "POST",
					data : {
						"email" : sName,
						"newPassword" : PassW1,
						"verifyCode" : Vcode
					},
					async : false,
					timeout : 5000,
					success : function(data) {
						if (data.trim() == "error1".trim()) {				                       	
							alert("邮箱不存在，请注册");
							document.getElementById('username').focus();
							$("input[type=reset]").trigger("click");							
						} else if (data == "error") {
							alert("验证码错误");
							return false;
						} else if (data == "success") {
							alert("找回密码成功，请登录");
							window.location.href = "../user/signin.html";
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