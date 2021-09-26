<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/top1.jsp" />
<%
	String myctx = request.getContextPath();
%>

<!-- Header -->
<div class="py-1 mr-4" style="" >
    <div class="container">
      <div class="row">
        <div class="ml-auto col-lg-7 text-center text-lg-left">
          <h1>수강 신청 관리</h1>
          <p class="mb-0">학생들의 수강신청 내역을 확인할 수 있습니다.</p>
        </div>
        <div class="col-lg-4 d-flex justify-content-center align-items-center p-3" style=""></div>
      </div>
    </div>
  </div>
  
<!-- body -->
<div class="py-5 "style="">
		<div class="container">
			<div class="row">
				<div class="col-md-12" style="">
					<div id="table" class="table-responsive" style="">
						<table class="table">
							<thead>
								<tr>
									<th style="width: 10%">번호</th>
									<th style="width: 15%">강의명</th>
									<th style="width: 10%">학생명</th>
									<th style="width: 10%">학년</th>
									<th style="width: 10%">강의실<br></th>
									<th style="width: 10%">신청 상태<br></th>
									<th style="width: 10%">신청 처리<br></th>
									
								</tr>
							</thead>
							<tbody>
							<!-- -------------------------- -->
							<c:if test="${rList eq null or empty rList}">
								<tr><td colspan="5">데이터가 없습니다.</td></tr>
							</c:if>
							<c:if test="${rList ne null and not empty rList }">
								<c:forEach var="rl" items="${rList}">							
								
								<tr>
									<td>${rl.rn }</td>
									<td>${rl.lname }</td>
									<td>${rl.sname }</td>
									<td>${rl.grade }학년</td> 
									<td>${rl.classnum }호</td> 
									<td><c:if test="${rl.rstate eq 0 }">신청중</c:if> <c:if
										test="${rl.rstate  eq 1 }">신청완료</c:if></td>
									<td><c:if test="${rl.rstate eq 0 }">
									<button type="button" class="btn btn-outline-danger"
									              onclick="changeRstate('${rl.lnum}','${rl.snum }')">수락</button>
									    </c:if>
									    <c:if test="${rl.rstate eq 1 }">
									    	<button type="button" class="btn btn-outline-info"
									              onclick="returnRstate('${rl.lnum}','${rl.snum }')">취소</button>
									    </c:if>
									</td>
									              
									 
								</tr>
								</c:forEach> 
							</c:if>
							<!-- -------------------------------- -->
							</tbody>
						</table>
					</div>
					<div id="table2" class="row">
						<div class="col-md-4" style=""></div>
						<div class="col-md-4 ml-3" style="">
							<ul class="pagination justify-content-center">
							
								
								<li class="page-item">
									<a class="page-link" href="#"><i class="fa fa-angle-left" ></i></a>
								</li>
								
								
								<li class="page-item">
									<a class="page-link" href="#">1</a>
								</li>
								
								<li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a>
								</li>
							</ul>
						</div>
						<div class="col-md-3" style="" id="#move"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 수강 신청 상태 변경하는 form --- -->
	<form id="changeRstateF" action="changeRstate.do">
		<input type="hidden" id="lnum" name="lnum">
		<input type="hidden" id="snum" name="snum">
	</form>
	<!-- ------------------------ -->
	<!-- 수강 신청 취소 form ---------- -->
	<form id="returnRstateF" action="returnRstate.do">
		<input type="hidden" id="lnum" name="lnum">
		<input type="hidden" id="snum" name="snum">
	</form>
	<!-- ------------------------- -->
	
	
	<script>
		function returnRstate(lnum, snum){
			//alert(lnum)
			//alert(snum)
			
			if(confirm("수강신청을 취소할까요?") == true){
				alert("안녕")	
				returnRstateF.lnum.value = lnum;
				returnRstateF.snum.value = snum;
				
				returnRstateF.submit();
			} else {
				return;
			}
		}
	
	
		function changeRstate(lnum, snum){
			//alert(pnum);
			//alert(snum);
			
			changeRstateF.lnum.value = lnum;
			changeRstateF.snum.value = snum;
			
			changeRstateF.submit();
		}
	</script>




<jsp:include page="/foot1.jsp" />