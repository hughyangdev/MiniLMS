<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String myctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<style>
* {
	font-family: G마켓 산스 TTF;
}
</style>

<head>
<meta charset="UTF-8">
<title>School</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<script>
	$(function() {

		$("#btnLogin").click(function() {
			if (!$('#userid').val()) {
				alert('아이디를 입력하세요');
				$('#userid').focus();
				return;
			}
			if (!$('#pwd').val()) {
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				return;
			}
			$('#loginF').submit();
		});//btnlogin end
	});
</script>
<style>
body {
	background-image: url('c.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
<body>
	<div class="container" style="width: 50%; float: left"></div>
	<div class="container"
		style="width: 50%; float: right; margin-top: 100px">
		<h1 class="text-dark text-center m-5">
			<img src="<%=myctx%>/images/logo_transparent2.jpg" width="50%">
		</h1>
		<form name="loginF" id="loginF" method="post" action="loginEnd.do">
			<div class="row">
				<div class="col-md-6 offset-md-1"
					style="margin-left: auto; margin-right: auto; margin-top: -30px">
					<table class="table p-5" height="center">
						<tr>
							<td colspan="3" class="text-center"
								style="color: white; vertical-align: middle">아이디</td>
							<td><input type="text" name="userid" id="userid"
								placeholder="ID" class="p-2" size="20" style="height: 40px"
								autofocus></td>
						</tr>
						<tr>
							<td colspan="3" class="text-center"
								style="color: white; vertical-align: middle">비밀번호</td>
							<td><input type="password" name="pwd" id="pwd"
								placeholder="Pwd" class="p-2" size="20" style="height: 40px"></td>
						</tr>
						<tr>
							<td colspan="3" class="text-center"
								style="color: white; vertical-align: middle">선택</td>
							<td class="pl-5" style="color: white; vertical-align: middle">
								<label><input type='radio' name='checkIdentify'
									value='student' checked />학생</label> <label><input
									type='radio' name='checkIdentify' value='professor' />교수</label> <label><input
									type='radio' name='checkIdentify' value='manager' />관리자</label>
							</td>
						</tr>
						<tr class="text-center">
							<td colspan="4">
								<button type="button" class="btn btn-dark m-1" id="btnLogin">로
									그 인</button>
								<button type="button" class="btn btn-dark m-1" id="btnnew"
									onClick="location.href='<%=myctx%>/signup.do'">회원가입</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
</body>
</html>