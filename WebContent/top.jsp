<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String myctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>School</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4/locales-all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@4/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@4/main.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@4/main.min.css">

<style>
#nav2 {
	display: none;
}

@media ( max-width : 991px) {
	#nav {
		display: none;
	}
	#nav2 {
		display: block;
	}
}

body {
	font-family: G마켓 산스 TTF;
}
</style>

</head>
<body>
	<div class="container" id="topheader">
		<div class="jumbotron text-center"
			style="margin-bottom: 0; padding: 0; background-color: black">

			<div id="demo" class="carousel slide" data-ride="carousel"
				style="margin-bottom: 0">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner" style="height: 50%">
					<div class="carousel-item active">
						<img class="img-fluid" src="<%=myctx%>/images/festival.jpg"
							alt="test1">
						<div class="carousel-caption">
							<h3 style="color: #990000; font-weight: bold">2020 TIS 축제</h3>
							<p style="font-weight: bold">기간: 2020-08-11(화) ~
								2020-08-14일(금)</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="img-fluid" src="<%=myctx%>/images/3-3.jpg" alt="test2">
						<div class="carousel-caption">
							<h3>2020년도 2학기 수강신청</h3>
							<span class="text-left">1차 신청기간: 2020-8-11(화) ~ 2020
								-8-14(금)<br> 1차 신청 결과 확인: 2020-08-17(월) ~ 2020-8- 19(수)<br>
								2차 신청기간: 2020-8-11(화) ~ 2020-8-14-(금)<br> 2차 신청 결과 확인:
								2020-8-17(월) ~ 2020-8-19(수)
							</span>
						</div>
					</div>
					<div class="carousel-item">
						<img class="img-fluid" src="<%=myctx%>/images/corona.jpg"
							alt="test3">
						<div class="carousel-caption">
							<!-- <h3>사회적 거리두기</h3>
                <p>We had such a great time in LA!</p> -->
						</div>
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>

		<!-- navbar ----------------------- -->
		<!-- Grey with black text -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark" id="nav">
			<div class="navbar-collapse collapse dual-collapse2 order-1 order-md-0">
				<ul class="navbar-nav">
					<li class="nav-item active">
						<a class="nav-link"
							href="<%=myctx%>/student/index.do">Home</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" 
							data-toggle="dropdown" href="#">수강신청</a>
						<div class="dropdown-menu bg-dark">
							<a class="dropdown-item bg-dark" style="color: white"
								href="<%=myctx%>/registerClass.do">수강신청</a> 
							<a	class="dropdown-item bg-dark" style="color: white"
								href="<%=myctx%>/checkregisterClass.do">수강신청 확인</a> 
							<a class="dropdown-item bg-dark" style="color: white"
								href="<%=myctx%>/CheckTimeTable.do">시간표 확인</a>
						</div></li>
					<li class="nav-item">
						<a class="nav-link m1" href="<%=myctx%>/accessMyClass.do?m=m1">강의평가</a></li>
					<li class="nav-item">
						<a class="nav-link"	href="<%=myctx%>/CheckGrade.do">성적확인</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" 
							data-toggle="dropdown" href="#">휴/복학</a>
						<div class="dropdown-menu bg-dark">
							<a class="dropdown-item bg-dark" style="color: white"
								href="<%=myctx%>/registerRest.do">휴학신청</a> 
							<a class="dropdown-item bg-dark" style="color: white"
								href="<%=myctx%>/checkregisterRest.do">신청확인</a>
							<a class="dropdown-item bg-dark" style="color: white" 
								href="#">복학 날짜 확인</a>
						</div></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" 
							data-toggle="dropdown" href="#">게시판</a>
						<div class="dropdown-menu bg-dark">
							<a class="dropdown-item bg-dark" style="color: white"
								href="<%=myctx%>/freeboard.do">게시글 작성 </a> 
							<a class="dropdown-item bg-dark" style="color: white"
								href="<%=myctx%>/freeboardlist.do">게시글 목록</a>
						</div></li>
					<li class="nav-item">
						<a class="nav-link" href="<%=myctx%>/admin/noticeList.do">공지사항</a></li>
				</ul>
			</div>
			
			<div class="navbar-collapse collapse order-3 dual-collapse2">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link">${loginUser.sname }님 로그인중</a></li>
					<li class="nav-item">
						<a class="nav-link"	
							href="<%=myctx%>/student/mypage.do">MYPAGE</a></li>
					<li class="nav-item">
						<a class="nav-link"
							href="<%=myctx%>/logout.do">LOGOUT</a></li>
				</ul>
			</div>

		</nav>

		<!-- 반응형 sidebar -->
		<div id="nav2">
			<nav class="navbar bg-dark navbar-dark">
				<!-- Brand -->
				<ul class="navbar-nav" style="flex-direction: row">
					<li class="nav-item active">
						<a class="nav-link"	href="<%=myctx%>/student/index.do">Home</a></li>
					<li class="nav-item pl-3">
						<a class="nav-link">${loginUser.sname }님 로그인중</a></li>
					<li class="nav-item pl-3">
						<a class="nav-link" href="<%=myctx%>/student/mypage.do">MYPAGE</a></li>
					<li class="nav-item pl-3">
						<a class="nav-link" href="<%=myctx%>/logout.do">LOGOUT</a></li>
				</ul>

				<!-- Toggler/collapsibe Button -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>

				<!-- Navbar links -->
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" 
								href="#">수강신청</a>
							<div class="dropdown-menu bg-dark">
								<a class="dropdown-item bg-dark" style="color: white"
									href="<%=myctx%>/registerClass.do">수강신청</a>
								<a class="dropdown-item bg-dark" style="color: white"
									href="<%=myctx%>/checkregisterClass.do">수강신청 확인</a>
								<a class="dropdown-item bg-dark" style="color: white" 
									href="<%=myctx%>/CheckTimeTable.do">시간표 확인</a>
							</div></li>
						<li class="nav-item">
							<a class="nav-link" href="<%=myctx%>/accessMyClass.do?m=m1">강의평가</a></li>
						<li class="nav-item">
							<a class="nav-link" href="<%=myctx%>/CheckGrade.do">성적확인</a></li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" 
								data-toggle="dropdown" href="#">휴/복학</a>
							<div class="dropdown-menu bg-dark">
								<a class="dropdown-item bg-dark" style="color: white"
									href="<%=myctx%>/registerRest.do">휴학신청</a> 
								<a class="dropdown-item bg-dark" style="color: white"
									href="<%=myctx%>/checkregisterRest.do">신청확인</a>
								<a class="dropdown-item bg-dark" style="color: white" 
									href="#">복학 날짜 확인</a>
							</div></li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" 
								href="#">게시판</a>
							<div class="dropdown-menu bg-dark">
								<a class="dropdown-item bg-dark" style="color: white" 
									href="<%=myctx%>/freeboard.do">게시글 작성</a> 
								<a class="dropdown-item bg-dark" style="color: white"
									href="<%=myctx%>/freeboardlist.do">게시글 목록</a>
							</div></li>
						<li class="nav-item">
							<a class="nav-link" href="<%=myctx%>/admin/noticeList.do">공지사항</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>

	<!-- ----------------------- -->
	<div class="container" style="margin-top: 30px; margin-bottom: 30px;">
		<div class="row" style="height: auto;">
			<div class="col-md-12 text-center" style="overflow: auto">