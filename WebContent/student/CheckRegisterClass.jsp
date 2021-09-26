<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/top.jsp" />
<%
	String myctx = request.getContextPath();
%>
<script>
	$(function() {

		/*$('#deleteMyClass').click(function() {
			var result = confirm('삭제 한 후에는 되돌릴 수 없습니다. 삭제하시겠습니까?');
			if (result) {
				//yes
			} else {
				location.replace("javascript:history.back()");
			}
		});//event end
		 */
	});//end
</script>
<div class="container">
	<h1 class="text-center">수강신청 확인</h1>
	<!--<div class="row pt-2">
		<h4 class="text-secondary">[${loginUser.sname}]의 수강 신청 리스트</h4>
	</div>-->
	<div class="row pt-2 pl-3">
		<h4 class="text-warning">확정 상태일때는 수강신청 취소가 불가합니다.</h4>
	</div>
	<div class="row pt-2 pl-3">
		<h4>
			신청한 과목 개수: <span class="text-info"> ${countAll }</span> 
			, 신청학점:<span class="text-info"> ${totalCredit }</span>
		</h4>
	</div>

	<div class="row pt-2">
		<!-- 검색폼 
		<div class="">
			<select style="height: 40px; width: 100px">
				<option>전체</option>
				<option>확인중</option>
				<option>확정</option>
			</select>
		</div>
		<div class="col-md-5">
			<div class="input-group">
				<input type="text" class="form-control" id="snum"
					placeholder="신청한 과목 검색">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button" id="searchNum">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div> -->
		<div class="col-md-12 pt-2">
			<table class="table" style="table-align: center">
				<thead>
					<tr>
						<th>과목코드</th>
						<th>과목명</th>
						<th>교수명</th>
						<th>강의실</th>
						<th>학점</th>
						<th>신청 상태</th>
						<th>신청 취소</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${rList eq null or empty rList }">
						<tr>
							<td colspan="6">
								<h4>신청한 과목이 없습니다.</h4>
							</td>
						</tr>
					</c:if>
					<c:if test="${rList ne null and not empty rList }">
						<c:forEach var="list" items="${rList }">
							<tr>
								<td>${list.subjectCode }</td>
								<td>${list.lname }</td>
								<td>${list.pname }</td>
								<td>${list.classnum }</td>
								<td>${list.credit }</td>
								<td><c:if test="${list.rstate eq 0 }">확인중</c:if> 
									<c:if
										test="${list.rstate  eq 1 }">확정</c:if></td>
								<td><c:if test="${list.rstate eq 0 }">
										<button type="button" class="btn btn-outline-danger"
											id="deleteMyClass"
											onclick="deleteClass('${loginUser.snum}','${list.lname }')">취소</button>
									</c:if> <c:if test="${list.rstate  eq 1 }">
										<p class="text-danger">불가</p>
									</c:if></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<form id="deleteClassF" action="deleteClass.do">
	<input type="hidden" id="deleteClassSubName" name="deleteClassSubName">
	<input type="hidden" id="deleteClassSnum" name="deleteClassSnum">
</form>

<script>
	function deleteClass(snum, lname) {
		deleteClassF.deleteClassSubName.value = lname;
		deleteClassF.deleteClassSnum.value = snum;

		deleteClassF.submit();
	}
</script>

<jsp:include page="/foot.jsp" />