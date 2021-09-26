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
					<h1>��ü �л� ���</h1>
					<p class="mb-0">�л��� ȸ������, Ż�� ������ �� �� �ֽ��ϴ�.</p>
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
									<th>�й�</th>
									<th>�л���</th>
									<th>������</th>
									<th>�г�</th>
									<th>�б�</th>
									<th>���̵�</th>
									<th>������</th>
									<th class="">ȸ������</th>
									<th class="text-center">����</th>
								</tr>
							</thead>
							<tbody>
							<!-- -------------------------- -->
							<c:if test="${studentList eq null or empty studentList}">
								<tr>
									<td colspan="5">�����Ͱ� �����ϴ�.</td>
								</tr>
							</c:if>
							
							<c:if test="${studentList ne null and not empty studentList }">
								<c:forEach var="sl" items="${studentList}">
								<tr>
									<td>${sl.snum }</td>
									<td>${sl.sname }</td>
									<td>${sl.major }</td>
									<td>${sl.semester }</td>
									<td>${sl.grade }</td>
									<td>${sl.sid}</td>
									<td>${sl.sindate}</td>
									<td>${sl.saccstate}</td>
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
				<div class="col-md-4 pl-5">
					<ul class="pagination">
						<c:if test="${prevBlock>0 }">
								<li class="page-item"><a class="page-link"
									href="studentList.do?cpage=${prevBlock}#move"><i
										class="fa fa-angle-left"></i></a></li>
							</c:if>

							<c:forEach var="b" begin="${prevBlock+1}" end="${nextBlock-1}"
								step="1">
								<c:if test="${b<=pageCount }">
									<li class="page-item <c:if test="${cpage==b}"> active</c:if>">
										<a class="page-link" href="studentList.do?cpage=${b}#move">${b }</a>
									</li>
								</c:if>
							</c:forEach>

							<c:if test="${nextBlock<=pageCount}">
								<li class="page-item"><a class="page-link"
									href="studentList.do?cpage=${nextBlock}#move"><i
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