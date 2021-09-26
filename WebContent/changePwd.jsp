<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String myctx = request.getContextPath();
%>
<jsp:include page="/top.jsp" />
<div class="container">
	<div class="row">
		<div class="mr-4 col-md-2 col-lg-3"></div>
		<div class="col-lg-5 col-md-7">
			<div class="border col-md-12 p-5 pb-4 mb-5" style="">
				<h3 class="text-primary mb-4 pb-1">비밀번호 변경</h3>
				<form name="editPwdF" id="editPwdF" action="prof/changePwdEnd.do"
					method="POST">
					<div class="form-group">
						<input class="form-control" id="currentPwd" name="currentPwd"
							placeholder="현재 비밀번호" value="${ploginUser.ppwd }">
					</div>
					<div class="form-group">
						<input class="form-control" id="newPwd" name="newPwd"
							placeholder="새 비밀번호">
					</div>
					<div class="form-group">
						<input class="form-control" id="checkPwd" name="checkPwd"
							placeholder="비밀번호 확인">
					</div>
					<button type="button" id="btnCheck" name="btnCheck"
						class="btn mt-2 btn-block p-2 btn-primary">
						<b>비밀번호 변경</b>
					</button>
					<button type="button"
						class="btn mt-2 btn-block btn-right p-2 btn-light">
						<b>취소</b>
					</button>
				</form>
			</div>
		</div>
		<div class="col-md-3 ml-4"></div>
	</div>
</div>
<script>
	$(function() {

		$("#btnCheck").click(function() {
			//var obj = $('#forCheck').val();
			//alert(obj);
			if (!$('#currentPwd').val()) {
				alert('현재 비밀번호를 입력하세요');
				$('#currentPwd').focus();
				return;
			}
			if (!$('#newPwd').val()) {
				alert('새로운 비밀번호를 입력하세요');
				$('#newPwd').focus();
				return;
			}
			if (!$('#checkPwd').val()) {
				alert('확인할 비밀번호를 입력하세요');
				$('#checkPwd').focus();
				return;
			}
			
			if ($('#newPwd').val() != $('#checkPwd').val()) {
				alert('변경할 비밀번호가 일치하지 않습니다.');
				return;
			}
			$('#editPwdF').submit();
		});//btnCheck end

	});
</script>


<jsp:include page="/foot.jsp" />