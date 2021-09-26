<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="prof.domain.*, javax.servlet.http.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String myctx = request.getContextPath();
HttpSession ses = request.getSession();
ProfessorVO pvo = (ProfessorVO) session.getAttribute("ploginUser");
String phone = pvo.getPphone();
String[] hp = phone.split("-");
%>
<jsp:include page="/top1.jsp" />
<div class="py-2" style="">
	<div class="container">
		<div class="row" style="">
			<div class="col-md-8 mx-auto" style="">
				<div class="col-md-12 col-lg-10 offset-lg-1" style="">
					<h3 class="border-light mb-1 pt-1 pb-1 pl-2 text-primary">회원정보
						변경</h3>
					<div class="card">
						<div class="card-body border-bottom" style="">
							<img class="d-block rounded-circle mx-auto"
								src="<%=myctx%>/images/img_avatar1.PNG" height="200" width="200">
							<div class="row"></div>
							<div class="col-md-12 p-4">
								<h4 class="mb-3" contenteditable="true">상세정보 수정</h4>
								<form name="frm" action="infoEditEnd.do" method="POST"
									onsubmit="return check()">

									<div class="form-row">
										<div class="form-group col-md-12">
											<input type="" class="form-control" id="form36"
												placeholder="Name" value="${ploginUser.pname }" readonly>
										</div>
									</div>
									<div class="row">
										<div class="col-4 col-md-4" style="">
											<div class="form-group row">
												<div class="col-12 col-md-12 col-lg-12" style="">
													<input type="text" class="form-control" name="ph1" id="ph1"
														placeholder="ph1" value="<%=hp[0]%>">
												</div>
											</div>
										</div>
										<div class="col-md-4 col-4" style="">
											<div class="form-group row">
												<div class="col-md-12 col-12" style="">
													<input type="text" class="form-control" name="ph2" id="ph2"
														placeholder="ph2" value="<%=hp[1]%>">
												</div>
											</div>
										</div>
										<div class="col-md-4 col-4" style="">
											<div class="form-group row">
												<div class="col-md-12 col-12" style="">
													<input type="text" class="form-control" name="ph3" id="ph3"
														placeholder="ph3" value="<%=hp[2]%>">
												</div>
											</div>
										</div>
									</div>

									<div class="form-group">
										<input type="email" class="form-control" id="email"
											name="email" placeholder="Email"
											value="${ploginUser.pemail }">
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="form42"
											placeholder="Subject" value="${ploginUser.pmajor }" readonly>
									</div>
									<button type="submit" class="btn btn-primary">변경</button>
									<button type="submit" class="btn ml-2 btn-info text-white">취소</button>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<br>

<script>
	function check() {
		if (!frm.ph1.value) {
			alert('번호를 입력하세요.');
			frm.ph1.focus();
			return false;
		}
		if (!frm.ph2.value) {
			alert('번호를 입력하세요.');
			frm.ph2.focus();
			return false;
		}
		if (!frm.ph3.value) {
			alert('번호를 입력하세요.');
			frm.ph3.focus();
			return false;
		}
		if (!frm.email.value) {
			alert('이메일을 입력하세요.');
			frm.email.focus();
			return false;
		}

		return true;
	}
</script>

<jsp:include page="/foot1.jsp" />