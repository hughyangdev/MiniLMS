<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/top.jsp" />
<%
	String myctx = request.getContextPath();
%>
<script>
	$(function() {

		$('#deleteMyRest').click(function() {
			var result = confirm('취소 한 후에는 되돌릴 수 없습니다. 취소하시겠습니까?');
			if (result) {
				//yes
			} else {
				location.replace("");
			}
		});//event end

	});//function end

	function RestCancel(num) {
		df.snum.value = num;
		df.method = "post";
		df.submit();
	}
</script>
<div class="container">
	<h1 class="text-center">휴학신청 확인</h1>
	<div class="row pt-2 pl-3">
		<h4 class="text-warning">신청이 확인되면 수정과 취소는 불가합니다.</h4>
	</div>
	<div class="row pt-2">
		<div class="col-md-12">
			<table class="table" style="table-align: center">
				<thead>
					<tr>
						<th>학번</th>
						<th>이름</th>
						<th>신청 날짜</th>
						<th>신청 기간</th>
						<th>신청 상태</th>
						<th>취소</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${rvo eq null or empty rvo }">
						<tr>
							<td colspan="6"><h4 class="">신청한 휴학정보가
									없습니다.</h4></td>
						</tr>
					</c:if>
					<c:if test="${rvo ne null and not empty rvo }">
						<tr>
							<td>${loginUser.snum }</td>
							<td>${loginUser.sname }</td>
							<td>${rvo.registerDate }</td>
							<td>${rvo.ssyear }학년-${rvo.sssemester }학기</td>
							<td><c:if test="${rvo.resultState eq 0 }">확인중</c:if> <c:if
									test="${rvo.resultState  eq 1 }">확정</c:if></td>
							<c:if test="${rvo.resultState eq 0 }">
								<td>
									<button type="button" class="btn btn-outline-danger"
										id="deleteMyRest" onclick="RestCancel('${loginUser.snum}')">취소</button>
								</td>
							</c:if>
							<c:if test="${rvo.resultState  eq 1 }">
								<td><p class="text-danger">불가</p></td>
							</c:if>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<form name="df" action="deleteRest.do">
	<input type="hidden" name="snum">
</form>

<jsp:include page="/foot.jsp" />