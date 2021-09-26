<%@page import="student.domain.*, prof.domain.*,manager.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Latest compiled and minified CSS -->
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
<div class="container">
	<!-- idCheckResult.jsp : 아이디 사용 여부 결과를 알려주는 페이지 -->
	<c:if test="${checkPwd ne loginUser.spwd }">
		<h3>일치하지 않는 비밀번호 입니다.</h3>
		<div class="row p-3">
			<form name="" action="verificationCheck.do" method="POST">
				<div class="col-md-4">
					<label>비밀번호:</label>
				</div>
				<div class="col-md-4">
					<input type="text" name="Whatpwd" id="Whatpwd"
						class="form-control m-1" placeholder="User PWD"
						autofocus="autofocus">
				</div>
				<div class="col-md-4">
					<button class="btn btn-outline-primary m-1">확인</button>
				</div>
			</form>
		</div>
	</c:if>
	<c:if test="${checkPwd eq loginUser.spwd }">
		<h3>본인인증 완료</h3>
		<button class="btn btn-danger" onclick="setTrue()">닫기</button>
	</c:if>
</div>
<script>
	var setTrue = function() {
		opener.document.getElementById('forCheck').value = true;
		opener.document.getElementById('identifyComplete').innerHTML = "<p class='text-success' style='margin:10px'>본인인증 완료</p>";
		self.close();
	}
</script>
