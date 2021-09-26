<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/top.jsp" />
<style>
input {
	margin-right: 10px;
}
</style>
<div class="container">
	<h1 class="text-center">[${subject }] 평가</h1>
	<div class="row pt-2 pl-3">
		<h4 class="text-secondary">교수: ${prof }</h4>
	</div>
	<div class="row pt-2">
		<div class="col-md-12">
		<div class="table-responsive" style="width:100%">
			<table class="table" style="table-align: center">
				<thead>
					<tr>
						<th>번호</th>
						<th>질문</th>
						<th colspan="5">점수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${aList eq null or empty aList }">
						<tr>
							<td colspan="7">해당 과목에 대한 질문 리스트가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${aList ne null and not empty aList }">
						<c:forEach var="i" items="${aList }">
							<tr>
								<td>${i.acnum }</td>
								<td style="text-align: left">${i.question }</td>
								<td><label><input type="radio"
										name="chk_access_${i.acnum }" value="1">1</label></td>
								<td><label><input type="radio"
										name="chk_access_${i.acnum }" value="2">2</label></td>
								<td><label><input type="radio"
										name="chk_access_${i.acnum }" value="3">3</label></td>
								<td><label><input type="radio"
										name="chk_access_${i.acnum }" value="4">4</label></td>
								<td><label><input type="radio"
										name="chk_access_${i.acnum }" value="5">5</label></td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td rowspan="2" style="vertical-align: middle">기타사항</td>
						<td colspan="6">
							<textarea rows="3" cols="70" id="complain"
								name="complain"></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
	</div>

	<div class="row">
		<button type="button" class="btn btn-success" style="margin: auto"
			onclick="accessEnd()">제출하기</button>
	</div>
</div>

<form name="accessEndF" action="accessEnd.do" method="POST">
	<input type="hidden" id="subjectName" name="subjectName" value="${subject }"> 
	<input type="hidden" id="profName" name="profName" value="${prof }"> 
	<input type="hidden" name="aListSize" id="aListSize" value="${aListSize }">
</form>

<script>
	function accessEnd() {
		/* for (var i = 1; i <= 10; i++) {
			if (!accessEndF.chk_access_i) {
				alert("질문" + i + "에 점수를 입력하십시오");
				return;
			}
		} */
		accessEndF.submit();
	}
</script>

<jsp:include page="/foot.jsp" />