<%@page import="com.mvc.vo.Food"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
.navbar-brand {
	margin-top: -10px;
	margin-left: -10px;
}

.badge {
	padding: 1px 9px 2px;
	font-size: 12.025px;
	font-weight: bold;
	white-space: nowrap;
	color: #ffffff;
	background-color: #999999;
	-webkit-border-radius: 9px;
	-moz-border-radius: 9px;
	border-radius: 9px;
}

.badge:hover {
	color: #ffffff;
	text-decoration: none;
	cursor: pointer;
}

.badge-error {
	background-color: #b94a48;
}

.badge-error:hover {
	background-color: #953b39;
}

.badge-warning {
	background-color: #f89406;
}

.badge-warning:hover {
	background-color: #c67605;
}

.badge-success {
	background-color: blue;
}

.badge-success:hover {
	background-color: blue;
}

.badge-info {
	background-color: red;
}

.badge-info:hover {
	background-color: red;
}

.badge-inverse {
	background-color: #333333;
}

.badge-inverse:hover {
	background-color: #1a1a1a;
}

html, body {
	height: 100%;
}

header {
	height: 50px;
}

footer {
	left: 0px;
	bottom: 0px;
	height: 180px;
	width: 100%;
	background: white;
	text-align: center;
}

.eventbar {
	margin-top: 30px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<div class="login-box well">
									<form accept-charset="UTF-8" role="form" method="post"
										action="login.safefood">
										<legend>로그인</legend>
										<div class="form-group">
											<label for="username-email">이메일 or 아이디</label> <input
												name="id" value='' id="username-email"
												placeholder="E-mail or Username" type="text"
												class="form-control" required="required"/>
										</div>
										<div class="form-group">
											<label for="password">비밀번호</label> <input name="pass"
												id="password" value='' placeholder="Password"
												type="password" class="form-control" required="required"/>
										</div>
										<div class="form-group">
											<input type="submit"
												class="btn btn-default btn-login-submit btn-block m-t-md"
												value="Login" />
										</div>
										<span class='text-center'><a
											href="findPass.safefood"
											class="text-sm">비밀번호 찾기</a></span>
										<hr />
										<div class="form-group">
											<a href="join.safefood"
												class="btn btn-default btn-block m-t-md"> 회원가입</a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<header>
	
		<div class="container">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
				style="background-color: white;">
				<div class="container">
					<!-- 지정안하면 네비게이션바 크기가 100%로 확장되어 버림 -->
					<a class="navbar-brand" href="main.safefood"> <img alt=""
						src="resources/img/logo.png" height="40px">
					</a>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-ex11-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- 로고 -->
					</div>
					<div
						class="collapse navbar-collapse  navbar-right navbar-ex11-collapse">
						<c:if test="${!empty id }">
						
							<ul class="nav navbar-nav">
								<li><a href="quiz.safefood">Quiz</a></li>
								<li><a href="qna.safefood">QnA</a></li>
								<li><a href="list.safefood">상품 정보 </a></li>
								<li><a href="myPage.safefood">마이 페이지</a></li>
							</ul>
							<form action="logout.safefood" class="navbar-form navbar-left"
								role="logout">
								<button type="submit" class="btn btn-danger">로그아웃</button>
							</form>

						</c:if>
						<c:if test="${empty id }">
							<ul class="nav navbar-nav">
								<li><a href="#" onclick="warning();">상품 정보 </a></li>
								<li><a href="#" onclick="warning();">마이 페이지</a></li>
								<script>
									function warning() {
										alert("로그인이 필요한 서비스입니다.");
									}
								</script>
							</ul>
							<form action="#" class="navbar-form navbar-left" role="login">
								<button type="button" class="btn btn-success" data-toggle="modal"
									data-target="#myModal">로그인</button>
							</form>
						</c:if>
						
						
						<form action="search.safefood" class="navbar-form navbar-right"
							role="search" method="post">
							<div class="form-group">
								<input type="text" class="form-control" name="search"
									placeholder="통합검색">
							</div>
							<button type="submit" class="btn btn-default">찾기</button>
						</form>
						
					</div>
				</div>
			</nav>
		</div>
		
		<!-- container 끝 -->
	</header>
	<%-- <div class="container" style="margin: auto 0">
		<%@include file="template_translate.jsp" %>
	</div> --%>
	
	<!-- 그림 슬라이드 이벤트 처리 --------------------------------------------------------------->
	<div class="container">
		<div class="eventbar">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- Carousel items -->
				<div class="carousel-inner">
					<div class="item active">
						<img class="d-block w-100" src="resources/img/o1.jpg" alt="o1 slide">
					</div>
					<div class="item">
						<img class="d-block w-100" src="resources/img/o2.png" alt="o2 slide">
					</div>
					<div class="item">
						<img class="d-block w-100" src="resources/img/o3.jpg" alt="o3 slide">
					</div>
					<div class="item">
						<img class="d-block w-100" src="resources/img/o4.jpg" alt="o4 slide">
					</div>
					<div class="item">
						<img class="d-block w-100" src="resources/img/o5.jpg" alt="o5 slide">
					</div>
					<div class="item">
						<img class="d-block w-100" src="resources/img/o6.jpg" alt="o6 slide">
					</div>
					<div class="item">
						<img class="d-block w-100" src="resources/img/o7.jpg" alt="o7 slide">
					</div>
				</div>
				<a class="carousel-control left" href=#carousel-example-generic
					data-slide="prev"></a> <a class="carousel-control right"
					href="#carousel-example-generic" data-slide="next"></a>
			</div>
		</div>
	</div>

	<!-- 그림 슬라이드 이벤트 처리 --------------------------------------------------------------->
	<hr style="border: 1px solid gray;" class="container">
	<br><br><br><br>