<%@page import="student.domain.*, prof.domain.*, manager.domain.* "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
</div>