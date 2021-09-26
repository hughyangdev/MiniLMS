<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/top2.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="mr-4 py-3" id="move">
		<div class="container">
			<div class="row">
				<div class="ml-auto col-lg-7 text-center text-lg-left ">
					<h1>전체 교수 목록</h1>
					<p class="mb-0">교수님의 회원상태, 탈퇴 관리를 할 수 있습니다.</p>
				</div>
				<div
					class="col-lg-4 d-flex justify-content-center align-items-center p-3">
				</div>
			</div>
		</div>
	</div>


	<div class="py-1">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>교번</th>
									<th>교수명</th>
									<th>전공</th>
									<th>아이디</th>
									<th>가입일</th>
									<th class="">회원상태</th>
									<th class="text-center">관리</th>
								</tr>
							</thead>
							<tbody>
							<!-- -------------------------- -->
							<c:if test="${profList eq null or empty profList}">
								<tr>
									<td colspan="5">데이터가 없습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${profList ne null and not empty profList }">
								<c:forEach var="pl" items="${profList}">
								<tr>
									<td>${pl.pnum }</td>
									<td>${pl.pname }</td>
									<td>${pl.pmajor }</td>
									<td>${pl.pid}</td>
									<td>${pl.pindate}</td>
									<td>${pl.paccstate}</td>
									<td class="<i class=&quot;fa fa-cog&
										quot; aria-hidden=&quot;true&quot;></i> text-center"><a><i
											class="fa fa-cog" aria-hidden="true"></i></a></td>
								</tr>
								</c:forEach>
							</c:if>
							<!-- -------------------------------- -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<ul class="pagination">
						<c:if test="${prevBlock>0 }">
								<li class="page-item"><a class="page-link"
									href="profList.do?cpage=${prevBlock}#move"><i
										class="fa fa-angle-left"></i></a></li>
							</c:if>

							<c:forEach var="b" begin="${prevBlock+1}" end="${nextBlock-1}"
								step="1">
								<c:if test="${b<=pageCount }">
									<li class="page-item <c:if test="${cpage==b}"> active</c:if>">
										<a class="page-link" href="profList.do?cpage=${b}#move">${b }</a>
									</li>
								</c:if>
							</c:forEach>

							<c:if test="${nextBlock<=pageCount}">
								<li class="page-item"><a class="page-link"
									href="profList.do?cpage=${nextBlock}#move"><i
										class="fa fa-angle-right"></i></a></li>
							</c:if>
					</ul>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>
</body>
</html>


<jsp:include page="/foot2.jsp" />