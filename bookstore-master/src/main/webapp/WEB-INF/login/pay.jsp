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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoYun</title>

<link rel="stylesheet" type="text/css"
	href="${basePath }resource/pay/css/amazeui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${basePath }resource/pay/css/main.css" />

</head>
<body>
	<div class="pay">
		<!--主内容开始编辑-->
		<div class="tr_recharge">
			<div class="tr_rechtext">
				<p class="te_retit">
					<img src="${basePath }resource/pay/images/coin.png" alt="" />充值中心
				</p>
				<p>墨韵书城欢迎你的光临</p>
			</div>
			<form action="doPay.html" class="am-form" id="doc-vld-msg">
				<div class="tr_rechbox">
					<div class="tr_rechhead">
						<img src="${basePath }resource/pay/images/ys_head2.jpg" />
						<p>
							充值帐号： <a>${user.userName}</a>
						</p>
						<div class="tr_rechheadcion">
							<img src="${basePath }resource/pay/images/coin.png" alt="" /> <span>当前状态：<span>非会员</span></span>
						</div>
					</div>
					<div class="tr_rechli am-form-group">
						<ul class="ui-choose am-form-group" id="uc_01">
							<li><label class="am-radio-inline"> <input
									type="radio" value="" name="docVlGender" required
									data-validation-message="请选择一项充值额度"> 10￥/1月
							</label></li>
							<li><label class="am-radio-inline"> <input
									type="radio" name="docVlGender"
									data-validation-message="请选择一项充值额度"> 25￥/3月
							</label></li>

							<li><label class="am-radio-inline"> <input
									type="radio" name="docVlGender"
									data-validation-message="请选择一项充值额度"> 45￥/半年
							</label></li>
							<li><label class="am-radio-inline"> <input
									type="radio" name="docVlGender"
									data-validation-message="请选择一项充值额度"> 120￥/终生
							</label></li>
						</ul>
					</div>
					<div class="tr_rechcho am-form-group">
						<span>充值方式：</span> <label class="am-radio"> <input
							type="radio" name="radio1" value="" data-am-ucheck required
							data-validation-message="请选择一种充值方式"><img
							src="${basePath }resource/pay/images/wechatpay.png">
						</label> <label class="am-radio" style="margin-right: 30px;"> <input
							type="radio" name="radio1" value="" data-am-ucheck
							data-validation-message="请选择一种充值方式"><img
							src="${basePath }resource/pay/images/zfbpay.png">
						</label>
					</div>
					<div class="tr_rechnum">
						<span>应付金额：</span>
						<p class="rechnum" id="realPay">0.00元</p>
					</div>
				</div>
				<div class="tr_paybox">
					<input type="submit" value="确认支付" class="tr_pay am-btn" id="submit" />
					<span>温馨提示：支付过程中遇到问题请联系工作人员。</span>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript"
		src="${basePath }resource/pay/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${basePath }resource/pay/js/amazeui.min.js"></script>
	<script type="text/javascript"
		src="${basePath }resource/pay/js/ui-choose.js"></script>
	<script type="text/javascript">
		$('.ui-choose').ui_choose();
		var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
		uc_01.click = function(index, item) {
			console.log('click', index, item.text())
		}
		uc_01.change = function(index, item) {
			console.log('change', index, item.text())
		}
		$(function() {
			$('#uc_01 li:eq(3)').click(function() {
				$('.tr_rechoth').show();
				$('.tr_rechoth').find("input").attr('required', 'true')
				$('.rechnum').text('120.00元');
			})
			$('#uc_01 li:eq(0)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('10.00元');
				$('.othbox').val('');
			})
			$('#uc_01 li:eq(1)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('25.00元');
				$('.othbox').val('');
			})
			$('#uc_01 li:eq(2)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('45.00元');
				$('.othbox').val('');
			})
		})

		$(function() {
			$('#submit')
					.click(
							function() {
								var realPay = $("#realPay").text();
								alert(realPay);
								$
										.ajax({
											url : "${basePath}user/getChapterInfo1.html",
											type : "POST",
											data : {
												"realPay" : realPay
											},
											async : false,
											timeout : 5000,
											success : function(data) {
												if (data == true) {
													window.location.href = "${basePath}user/loginSuccess.html";
												}
											}
										})
							})
		})
	</script>
	<div style="text-align: center;"></div>
</body>
</html>