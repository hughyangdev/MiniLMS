<%@page
	import="student.persistence.StudentDAOMyBatis, java.util.*, student.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var openwin = null;
	$(function() {
		$('#CheckOwnInfo')
				.click(
						function() {
							openwin = window
									.open("verification.do", "verification",
											"width=600px, height=300px, left=100px, top=100px");
						});
	});
</script>
<c:if test="${list eq null} ">
	<table class="table" style="vertical-align: middle">
		<tr>
			<td colspan="2" style="vertical-align: middle">검색 결과:</td>
			<td colspan="4"><h3 class="text-dander">존재하는 학생 정보가 없습니다.</h3></td>
		</tr>
	</table>
</c:if>

<c:if test="${list ne null}">

	<c:if test="${loginUser.snum eq list.snum }">

		<table class="table" style="table-align: center">
			<tr>
				<td colspan="2" style="vertical-align: middle">검색결과</td>
				<td colspan="4">이름: ${list.sname } 전공: ${list.major }
					<button type="button" class="btn btn-warning" id="CheckOwnInfo">본인인증</button>
					<input type="hidden" id="forCheck" value="false">
					<div id="identifyComplete"></div>
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${loginUser.snum ne list.snum }">
		<table class="table table-bordered" style="table-align: center">
			<tr>
				<td colspan="6" style="vertical-align: middle"><p
						style="color: red">검색 결과: 본인 이외에 사람은 수강신청을 할 수 없습니다.</p></td>
			</tr>
		</table>
	</c:if>
</c:if>







