<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../top1.jsp" />
<%
	String myctx = request.getContextPath(); 
%>
<form name="findF" id="findF" role="form"
 action="" method="POST">
<div class="py-5" style="">
    <div class="container">
	<h1>강의목록</h1>
      <div class="row">
        <div class="col-md-12" style="">
          <div class="table-responsive" style="">
            <table class="table">
              <thead>
                <tr>
                  <th width="10%">번호</th>
                  <th width="20%">학년</th>
                  <th width="20%">학기</th>
                  <th width="30%">강의명</th>
                  <th width="20%">수강인원/수강정원</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${cList eq null or empty cList}">
              	<tr>
              		<td colspan="5">개설한 강의가 없습니다.</td>
              	</tr>
              </c:if>
              <c:if test="${cList ne null or not empty cList}">
              <c:forEach var="cl" items="${cList}">
                <tr>
                  <td>1</td>
                  <td>${cl.grade}학년</td>
                  <td>${cl.semester}학기</td>
                  <td>
                  <a href="javascript:search('${cl.lName}', '${cl.lNum}')" >${cl.lName} ${cl.lNum } </a>
                  </td>
                  <td>32/40</td>
                </tr>
              </c:forEach>
              </c:if>
              </tbody>
            </table>
          </div>
          <div class="row">
            <div class="col-md-4" style=""></div>
            <div class="col-md-4 ml-3 text-light" style="">
              <ul class="pagination text-light">
                <li class="page-item"> <a class="page-link" href="#">Prev</a> </li>
                <li class="page-item"> <a class="page-link" href="#">1</a> </li>
                <li class="page-item"> <a class="page-link" href="#">2</a> </li>
                <li class="page-item active"> <a class="page-link" href="#">3</a> </li>
                <li class="page-item"> <a class="page-link" href="#">4</a> </li>
                <li class="page-item"> <a class="page-link" href="#">Next</a> </li>
              </ul>
            </div>
            <div class="col-md-3" style=""></div>
          </div>
        </div>
      </div>
    </div>
  </div>

</form>

<script>


	var search = function(val, val2){
		//alert(val2);
		location.href = 'studentByClass.do?lname='+encodeURIComponent(val)+"&lnum="+val2;
	}
</script>
<jsp:include page="../foot1.jsp" />