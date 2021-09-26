<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String myctx = request.getContextPath();
%>
<table class="table" style="table-align: center">
	<thead>
		<tr>
			<th>과목코드</th>
			<th>과목명</th>
			<th>교수명</th>
			<th>강의실</th>
			<th>학점</th>
			<th>신청</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${subList eq null or empty subList }">
			<tr>
				<td colspan="6"><h2>검색 결과가 없습니다.</h2></td>
			</tr>
		</c:if>
		<c:if test="${subList ne null and not empty subList }">
			<c:forEach var="subvo" items="${subList}">
				<tr>
					<td id="subjectCode">${subvo.subjectCode }</td>
					<td id="lname">${subvo.lname }</td>
					<td id="pname">${subvo.pname }</td>
					<td id="classnum">${subvo.classnum }</td>
					<td id="credit">${subvo.credit }</td>
					<td><button type="button" id="registerClassBtn"
							class="btn btn-outline-success"
							onclick="Register('${subvo.lname}','${loginUser.snum }')">신청</button></td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>

<div id="table2" class="row">
	<div class="col-md-4" style=""></div>
	<div class="col-md-4 ml-3" style="">
		<ul class="pagination justify-content-center">
			<c:if test="${prevBlock>0 }">
				<li class="page-item"><a class="page-link"
					href="searchSubject.do?pagenavi=${prevBlock}"><i
						class="fa fa-angle-left"></i></a></li>
			</c:if>

			<c:forEach var="b" begin="${prevBlock+1}" end="${nextBlock-1}"
				step="1">
				<c:if test="${b<=pageCount }">
					<li class="page-item <c:if test="${cpage==b}"> active</c:if>">
						<a class="page-link" href="searchSubject.do?pagenavi=${b}">${b }</a>
					</li>
				</c:if>
			</c:forEach>

			<c:if test="${nextBlock<=pageCount}">
				<li class="page-item"><a class="page-link"
					href="searchSubject.do?pagenavi=${nextBlock}w"><i
						class="fa fa-angle-right"></i></a></li>
			</c:if>
		</ul>
	</div>
	<div class="col-md-3" style=""></div>
</div>