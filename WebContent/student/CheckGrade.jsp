<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String myctx = request.getContextPath();
%>
<jsp:include page="/top.jsp" />
<style>
#test {
	padding-top: 20px;
}
</style>
<div class="container">
	<h1 class="text-center">성적 확인</h1>
	<div class="row">
		<table>
			<tr>
				<td><img style="width:70%" class="pr-3" src="<%=myctx%>/images/star.png"
					style="vertical-align: middle;"></td>
				<td id="test"><label style="font-size: 25px">총학점: 4.5</label></td>
			</tr>
		</table>
	</div>
	<div class="row pt-2">
		<table class="table">
			<thead class="text-center">
				<tr>
					<th style="width: 20%">과목코드</th>
					<th style="width: 35%">과목명</th>
					<th style="width: 15%">교수명</th>
					<th style="width: 30%">점수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${myList eq null or empty myList }">
					<tr>
						<td colspan="4">
							<h4>성적 확인이 가능한 과목이 없습니다.</h4>
						</td>
					</tr>
				</c:if>
				<c:if test="${myList ne null and not empty myList }">
					<c:forEach var="list" items="${myList }">
						<tr style="text-align: center">
							<td>${list.subjectCode }</td>
							<td>${list.lname }</td>
							<td>${list.pname }</td>
							<td>-</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>
	</div>
</div>



<jsp:include page="/foot.jsp" />