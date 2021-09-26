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
<title>School</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$("#back").click(function() {
			location.href = "login.do"
		});
	});
</script>
<style>
* {
	font-family: G마켓 산스 TTF;
}
</style>
<script type="text/javascript">
	/*아이디 중복체크 팝업창 열기 함수*/
	var win = null;
	var win2 = null;
	function openWin() {
		signupForm.flag.value = "false";
		win = window.open("idCheck.do", "idCheck",
				"width=500px, height=300px, left=100px, top=100px");
	}
	function check() {
		if (!signupForm.sname.value) {
			alert('이름을 입력하세요');
			signupForm.sname.focus();
			return;
		}
		
		if (signupForm.a.value != 'admin') {
			if (!signupForm.major.value) {
				alert('전공을 선택하세요');
				signupForm.major.focus();
				return;
			}
		}
		if (!signupForm.id.value) {
			alert('아이디를 입력하세요');
			signupForm.id.focus();
			return;
		}
		if (!signupForm.spwd.value) {
			alert('비밀번호를 입력하세요');
			signupForm.spwd.focus();
			return;
		}
		if (signupForm.pwd2.value != signupForm.spwd.value) {
			alert('비밀번호를 확인하세요');
			signupForm.pwd2.select();
			return;
		}
		if (!signupForm.shp1.value || !signupForm.shp2.value
				|| !signupForm.shp3.value) {
			alert('전화번호를 입력하세요');
			signupForm.shp1.focus();
			return;
		}
		signupForm.submit();
	}
	
	
	$(function() {
		//학생 교수 관리자 값 받고 값이 관리자면 해당 div 숨기기
		$("input[name='a']").click(function() {

			var check_count = $(this).val();
			//alert(check_count);
			if (check_count == 'admin') {
				document.getElementById('rowMajor').style.display = "none";
			} else {
				document.getElementById('rowMajor').style.display = "";
			}
		})
	})
</script>
<style>
#head {
	height: 50px;
	padding-top: 28px;
}

#head h1 {
	margin-left: 450px;
}

.jumbotron {
	background-image: url('images/3-3.jpg');
	height: 300px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="jumbotron text-center text-white" style="margin-bottom: 0">
			<br> <br>
			<h1>TIS University 학사관리 시스템</h1>
		</div>
		<div class="row m-3" id="head">
			<div class="col-md-11">
				<h1>회원가입</h1>
			</div>
			<div class="col-md-1 text-right">
				<button type="button" class="btn btn-info" id="back">HOME</button>
			</div>
		</div>

		<div class="container"
			style="margin-top: 30px; margin-bottom: 30px; padding-left: 200px; padding-right: 200px">
			<form name="signupForm" action="signupEnd.do" method="post">
				<div class="row" style="height: auto;">
					<div class="col-md-12 text-center" style="overflow: auto">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-10">
								<label style="margin-left: 5px; margin-bottom: 0"> <br>
									<input id='student' type='radio' name='a' value='student'
									checked />학생
								</label> <label style="margin-left: 5px; margin-bottom: 0"> <input
									id='professor' type='radio' name='a' value='professor' />교수
								</label> <label style="margin-left: 5px; margin-bottom: 0"> <input
									id='manager' type='radio' name='a' value='admin' />관리자 <br>
								</label>
							</div>
						</div>
						<div class="row m-3">
							<div class="col-md-3">이름</div>
							<div class="col-md-6">
								<input type="text" name="sname" id="sname" placeholder="Name"
									class="form-control">
							</div>
						</div>

						<div class="row m-3">
							<div class="col-md-3">성별</div>
							<div class="col-md-6">
								<div class="col-md-7 text-left" style="padding-left: 3px">
									<label style="margin-right: 5px"> <input type='radio'
										name='gender' value='M' checked />남자
									</label> <label style="margin-left: 5px"> <input type='radio'
										name='gender' value='F' checked />여자
									</label>
									<div class="col-md-5"></div>
								</div>
							</div>
						</div>

						<div class="row m-3" id='rowMajor'>
							<div class="col-md-3">전공</div>
							<div class="col-md-6">
								<select class="from-control col-md-12" style="height: 40px"
									name="major" id="major">
									<option value="">전공선택</option>
									<option value="Korean">국어국문학과</option>
									<option value="english">영어영문학과</option>
									<option value="Politics">정치학과</option>
									<option value="Psychology">심리학과</option>
									<option value="Social Welfare">사회복지학과</option>
									<option value="Child">유아교육학과</option>
									<option value="Architecture">건축학과</option>
									<option value="Engineering">기계공학과</option>
									<option value="Software">소프트웨어학과</option>
									<option value="Life">생활레저학과</option>
									<option value="sports">스포츠산업과</option>
								</select>
							</div>
						</div>

						<div class="row m-3">
							<div class="col-md-3">아이디</div>
							<div class="col-md-6">
								<input type="text" name="id" id="id"
									placeholder="User ID" class="form-control" readonly>
								<!-- hidden data -->
								<input type="hidden" name="flag" value="false">
								<!-- -------------------------------------- -->
							</div>

							<div class="col-md-3">
								<button type="button" onclick="openWin()"
									class="btn btn-success">중복체크</button>
							</div>
						</div>

						<div class="row m-3">
							<div class="col-md-3">비밀번호</div>
							<div class="col-md-6">
								<input type="password" name="spwd" id="spwd"
									placeholder="Password" class="form-control">
							</div>
						</div>

						<div class="row m-3">
							<div class="col-md-3">비밀번호 확인</div>
							<div class="col-md-6">
								<input type="password" name="pwd2" id="pwd2"
									placeholder="Check Password" class="form-control">
							</div>
						</div>

						<div class="row m-3">
							<div class="col-md-3">연락처</div>
							<div class="col-md-2">
								<input type="text" name="shp1" id="shp1" maxlength="4"
									placeholder="hp" class="form-control">
							</div>
							-
							<div class="col-md-2">
								<input type="text" name="shp2" id="shp2" maxlength="4"
									placeholder="hp" class="form-control">
							</div>
							-
							<div class="col-md-2">
								<input type="text" name="shp3" id="shp3" maxlength="4"
									placeholder="hp" class="form-control">
							</div>
						</div>

						<div class="row m-3">
							<div class="col-md-3">이메일</div>
							<div class="col-md-6">
								<input type="text" name="semail" id="semail" placeholder="Email"
									class="form-control">
							</div>
						</div>
						<div class="row m-3">
							<div class="col-md-3">주소</div>
							<div class="col-md-6">
								<input type="text" name="saddr" id="saddr" placeholder="Address"
									class="form-control">
							</div>
						</div>

						<div class="row" style="margin-top: 50px; margin-left: 90px">
							<div class="col-md-10 text-center">
								<button type="button" class="btn btn-warning" onclick="check()">회원가입</button>
								<button type="reset" class="btn btn-danger">다시쓰기</button>
							</div>
						</div>
					</div>
					<!-- col-md-9 end -->
				</div>
				<!-- row end -->
			</form>
		</div>
		<!-- container end -->

	</div>
	<!-- container end -->
</body>
</html>