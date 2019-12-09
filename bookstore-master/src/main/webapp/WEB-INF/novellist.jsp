<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js h-100" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>作家作品集</title>
<meta name="description"
	content="A high-quality &amp; free Bootstrap admin dashboard template pack that comes with lots of templates and components.">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" id="main-stylesheet" data-version="1.1.0"
	href="<%=path%>/styles/shards-dashboards.1.1.0.min.css">
<link rel="stylesheet" href="<%=path%>/styles/extras.1.1.0.min.css">
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script type="text/javascript">
	function submitinfo() {
		var name = $("#txt_parentdepartment").val();
		var synopsis = $("#txt_statu").val();
		var vip = $("#VInputState option:selected").text()
		var style = $("#style option:selected").text()
		var lable = $("#lable option:selected").text()
		if ((name != "") && (synopsis != "") && (vip != "-请选择-")
				&& (style != "-请选择-") && (lable != "-请选择-")) {
			return true
		} else {
			alert("请先完善所有小说信息...")
			return false
		}
	}
</script>
</head>
<body class="h-100">


	<div class="container-fluid">
		<div class="row">
			<aside class="main-sidebar col-12 col-md-3 col-lg-2 px-0">
				<div class="main-navbar">
					<nav
						class="navbar align-items-stretch navbar-light bg-white flex-md-nowrap border-bottom p-0">
						<a class="navbar-brand w-100 mr-0" href="#"
							style="line-height: 25px;">
							<div class="d-table m-auto">
								<img id="main-logo" class="d-inline-block align-top mr-1"
									style="max-width: 25px;"
									src="<%=path%>/images/shards-dashboards-logo.svg"
									alt="Shards Dashboard"> <span
									class="d-none d-md-inline ml-1">AUTHOR CENTER</span>
							</div>
						</a> <a class="toggle-sidebar d-sm-inline d-md-none d-lg-none"> <i
							class="material-icons">&#xE5C4;</i>
						</a>
					</nav>
				</div>
				<form action="#"
					class="main-sidebar__search w-100 border-right d-sm-flex d-md-none d-lg-none">
					<div class="input-group input-group-seamless ml-3">
						<div class="input-group-prepend">
							<div class="input-group-text"></div>
						</div>
					</div>
				</form>
				<div class="nav-wrapper">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link "
							href="../author/moyun.html"> <i class="material-icons">table_chart</i>
								<span>我的作品</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../author/newchapter.html"> <i class="material-icons">edit</i>
								<span>新建章节</span>
						</a></li>
					</ul>
				</div>
			</aside>
			<main
				class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
			<div class="main-navbar sticky-top bg-white">
				<div class="page-header row no-gutters py-4" style="margin-left: 20px;">
					<div class="col-12 col-sm-4 text-center text-sm-left mb-0">
						<span class="text-uppercase page-subtitle">AUTHOR WORKS</span>
						<h3 class="page-title">我的作品</h3>
					</div>
				</div>
			</div>
			<div class="main-content-container container-fluid px-4">

				<div class="row" style="margin-top: 30px;">
					<div class="col">
						<div class="card card-small mb-4">
							<div class="card-header border-bottom">
								<div class="row">
									<div class="col-sm-6" style="padding-top: 3px;"></div>
									<div class="col-sm-6">
										<button type="button" class="btn btn-primary"
											style="float: right; width: 100px;" data-toggle="modal"
											data-target="#myModal">
											<i class="material-icons">note_add</i> 新建小说
										</button>
										<form action="../author/newnovel.html" method="post"
											onsubmit="return submitinfo()">
											<div class="modal fade" id="myModal" tabindex="-1"
												role="dialog" aria-labelledby="myModalLabel">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<input name="authorInfo.userId" value="${user.userName}"
																hidden="hidden">
															<div class="form-group">
																<label for="fePassword">读者</label> <select
																	id="VInputState" class="form-control"
																	name="novelAttribute">
																	<option selected="">-请选择-</option>
																	<option>免费</option>
																	<option>vip</option>
																</select>
															</div>
															<div class="form-group">
																<label for="txt_parentdepartment">作品名称</label> <input
																	type="text" name="novelName" class="form-control"
																	id="txt_parentdepartment" placeholder="作品名称">
															</div>
															<div class="form-group">
																<label for="txt_departmentlevel">作品类型</label>
																<div>
																	<select class="form-control" name="novelStyle"
																		id="style">
																		<option selected="">-请选择-</option>
																		<option>都市</option>
																		<option>科幻</option>
																		<option>历史</option>
																		<option>现实</option>
																		<option>青春</option>
																		<option>武侠</option>
																		<option>仙侠</option>
																		<option>玄幻</option>
																		<option>悬疑</option>
																		<option>游戏</option>
																		<option>言情</option>
																		<option>轻小说</option>
																	</select>
																</div>
															</div>
															<div class="form-group">
																<label for="txt_departmentlevel">作品标签</label>
																<div>
																	<select class="form-control" name="novelLable"
																		id="lable">
																		<option selected="">-请选择-</option>
																		<option>乡村</option>
																		<option>热血</option>
																		<option>冒险</option>
																		<option>重生</option>
																		<option>穿越</option>
																		<option>年华</option>
																		<option>豪门</option>
																		<option>寓言</option>
																		<option>传说</option>
																		<option>神话</option>
																		<option>情感</option>
																		<option>宅男</option>
																		<option>凡人</option>
																		<option>无敌</option>
																		<option>变身</option>
																		<option>僵尸</option>
																		<option>强者</option>
																	</select>
																</div>
															</div>
															<div class="form-group">
																<label for="txt_statu">作品简介</label>
																<textarea type="text" name="novelSynopsis"
																	class="form-control" id="txt_statu"
																	placeholder="请输入作品简介..."></textarea>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">取消</button>
															<button type="submit" class="btn btn-primary">提交</button>
														</div>
													</div>
												</div>
											</div>

										</form>
									</div>
								</div>
							</div>
							<div class="card-body p-0 pb-3 text-center">
								<table class="table mb-0">
									<tr>
										<th scope="col" class="border-0">序号</th>
										<th scope="col" class="border-0">名称</th>
										<th scope="col" class="border-0">状态</th>
										<th scope="col" class="border-0">类型</th>
										<th scope="col" class="border-0">字数</th>
										<th scope="col" class="border-0">最新更新</th>
									</tr>

									<c:forEach items="${novels}" var="t" varStatus="i">
										<tr>
											<td>${i.index+1}</td>
											<td><a
												href="../author/noveldetails.html?novelId=${t.novelId}"
												>${t.novelName}</a></td>
											<td>${t.novelStatus}</td>
											<td>${t.novelStyle}</td>
											<td>${t.novelCount}</td>
											<td><fmt:formatDate value="${t.updateDate}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="main-footer d-flex p-2 px-3 bg-white border-top">
			</footer> </main>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	<script src="https://unpkg.com/shards-ui@latest/dist/js/shards.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Sharrre/2.0.1/jquery.sharrre.min.js"></script>
	<script src="<%=path%>/scripts/extras.1.1.0.min.js"></script>
	<script src="<%=path%>/scripts/shards-dashboards.1.1.0.min.js"></script>
</body>
</html>