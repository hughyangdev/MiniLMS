<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/top.jsp" />
<%
	String myctx = request.getContextPath();
%>
<div class="container">
	<h1 class="text-center">수강한 강의 리스트</h1>
	<div class="row pt-2 pl-3">
		<h4 class="text-secondary">강의명을 누르면 강의 평가 페이지로 이동합니다.</h4>
	</div>
	<div class="row pt-2">
	<div class="col-md-12">
		<table class="table" style="table-align: center">
			<thead>
				<tr>
					<th>과목코드</th>
					<th>과목명</th>
					<th>교수명</th>
					<th>강의실</th>
					<th>학점</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${aList eq null or empty aList}">
					<tr>
						<td colspan='5'>수강한 과목이 없습니다.</td>
					</tr>
				</c:if> 
				<c:if test="${aList ne null and not empty aList }">
					<c:forEach var="list" items="${aList }">
						<tr>
							<td>${list.subjectCode }</td>
							<td><a href="#"
								onclick="goAccess('${list.lname}', '${list.pname }')">${list.lname }</a></td>
							<td>${list.pname }</td>
							<td>${list.classnum }</td>
							<td>${list.credit }</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>
	</div>
	</div>
</div>

<form id="accessF" action="accessClass.do" method="POST">
	<input type="hidden" id="accessSubject" name="accessSubject"> 
	<input type="hidden" id="accessProf" name="accessProf">
</form>

<jsp:include page="/foot.jsp" />

<script>
	function goAccess(subject, profName) {
		//alert('a');
		accessF.accessSubject.value = subject;
		accessF.accessProf.value = profName;
		accessF.submit();
	}
</script>
