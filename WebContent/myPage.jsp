<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String myctx = request.getContextPath();
%>
<jsp:include page="/top1.jsp" />
<div class="py-1 mb-5" style="">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-12">
				<h3 class="border-light mb-1 pt-1 pb-1 pl-2">
					마이페이지<br>
				</h3>
				<div class="card">
					<div class="card-body border-bottom">
						<img class="d-block rounded-circle mx-auto"
							src="<%=myctx%>/images/img_avatar1.PNG" height="200" style=""
							width="200
10
20">
						<h5 class="card-title text-center pt-3">${ploginUser.pname}</h5>
						<p class="card-text border-bottom pb-3 ml-2" style="height: 100px">
							<br>
						</p>
						<ul class="list-group">
							<li
								class="list-group-item d-flex justify-content-between align-items-center border-0 border-bottom">
								${ploginUser.pmajor}<i class="fa fa-graduation-cap"></i>
							</li>
							<li
								class=" border-0 list-group-item d-flex justify-content-between align-items-center">
								${ploginUser.pemail }<i class="fa fa-envelope-o"></i>
							</li>
							<li
								class=" border-0 list-group-item d-flex justify-content-between align-items-center">
								${ploginUser.pphone }<i class="fa fa-phone"></i>
							</li>
						</ul>
					</div>
					<div class="card-body text-center">
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
			</div>


			<div class="col-md-12 col-lg-8">
				<div class="row">
					<div class="col-md-12 mt-2 pt-1">
						<ul class="nav pb-1">
							<li class="nav-item text-primary ml-2">회원정보 설정</li>
						</ul>
						<!-- 반응형일 때 UI -->
						<div class="row">
							<div class="col-md-12 mt-3 d-block d-md-none">
								<a class="btn btn-outline-primary ml-5 mr-3 mb-4" href="#">기본정보
									변경<br>
								</a><a class="btn btn-outline-primary mr-3 mb-4" href="#">비밀번호
									변경<br>
								</a><a class="btn btn-outline-primary mb-4" href="#">탈퇴하기<br></a>
							</div>
						</div>
						<!-- 일반형일 때 UI -->
						<div class="d-none d-sm-none d-md-block">
							<div class="row h-25 border m-1 mb-2"
								style="height: 200px !important">
								<div
									class="col-md-8 text-left text-lowercase mt-3 mb-2 pl-4 pt-5"
									style="">
									<h2 class="">
										기본정보&nbsp;<small class="text-muted">&nbsp;</small>
									</h2>
									<h6 class="">프로필사진, 이메일, 전화번호 등을 수정합니다.</h6>
								</div>
								<div class="col-md-3 pl-5 pt-5 px-1 mt-4" style="">
									<a class="btn btn-outline-primary btn-lg text-nowrap"
										href="changeInfo.do">수정</a>
								</div>
							</div>
							<div class="row h-25 border m-1 mb-2"
								style="height: 200px !important">
								<div
									class="col-md-8 text-left text-lowercase mt-3 mb-2 pt-5 pl-4"
									style="">
									<h2 class="">비밀번호 변경</h2>
									<h6 class="">비밀번호를 변경합니다.</h6>
								</div>
								<div class="col-md-3 pl-5 pt-5 mt-4" style="">
									<a class="btn btn-outline-primary btn-lg text-nowrap"
										href="changePwd.do">수정</a>
								</div>
							</div>
							<div class="row h-25 border m-1 mb-2"
								style="height: 200px !important">
								<div
									class="col-md-8 text-left text-lowercase mt-3 mb-2 pt-5 pl-4"
									style="">
									<h2 class="">탈퇴하기</h2>
									<h6 class="">회원을 탈퇴합니다.</h6>
								</div>
								<div class="col-md-3 pl-5 pt-5 mt-4" style="">
									<a class="btn btn-outline-primary btn-lg text-nowrap" href="#">탈퇴</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>


<jsp:include page="/foot1.jsp" />