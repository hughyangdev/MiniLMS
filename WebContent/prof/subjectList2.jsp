<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<table class="table">
			<thead style="text-align: center">
				<tr>
					<th style="width: 10%">번호</th>
					<th style="width: 25%">전공명</th>
					<th style="width: 40%">강의명</th>
					<th style="width: 15%">교수명</th>
					<th style="width: 10%">강의실<br></th>
				</tr>
			</thead>
			<tbody>
				<!-- -------------------------- -->
				<c:if test="${classList eq null or empty classList}">
					<tr>
						<td colspan="5">데이터가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${classList ne null and not empty classList }">
					<c:forEach var="cl" items="${classList}">
						<tr>
							<td>${cl.lNum}</td>
							<td>${cl.majorName}</td>
							<td>${cl.lName}</td>
							<td>${cl.pname }</td>
							<td>${cl.classNum }</td>
						</tr>
					</c:forEach>
				</c:if>
				<!-- -------------------------------- -->
			</tbody>
		</table>
	<div>
		<div class="col-md-4 ml-3" style="">
			<ul class="pagination justify-content-center" style="width:1050px;">


				<c:if test="${prevBlock2>0 }">
					<li class="page-item"><a class="page-link"
						href="#" onclick="prevB(${prevBlock2})"><i
							class="fa fa-angle-left"></i></a></li>
				</c:if>

				<c:forEach var="b" begin="${prevBlock2+1}" end="${nextBlock2-1}"
					step="1">
					<c:if test="${b<=pageCount2 }">
						<li class="page-item <c:if test="${cpage==b}"> active</c:if>">
							<a class="page-link" onclick="pageC(${b})">${b }</a>
						</li>
					</c:if>
				</c:forEach>

				<c:if test="${nextBlock2<=pageCount2}">
					<li class="page-item"><a class="page-link"
						href="#" onclick="nextB(${nextBlock2})"><i class="fa fa-angle-right"></i></a></li>
				</c:if>
			</ul>
		</div>
		<div class="col-md-3" style=""></div>
	</div>
