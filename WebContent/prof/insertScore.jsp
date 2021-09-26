<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../top1.jsp" />
<form name="findF" id="findF" role="form"
 action="" method="POST">
<div  class="py-5" style="">
    <div class="container">
	<h1>${lname}</h1>
      <div class="row">
        <div class="col-md-12" style="">
          <div class="table-responsive" style="">
            <table class="table">
              <thead>
                <tr>
                  <th width="10%" class="text-center">번호</th>
                  <th width="10%" class="text-center">학번</th>
                  <th width="10%" class="text-center">성명</th>
                  <th width="10%" class="text-center">대학</th>
                  <th width="20%" class="text-center">전공</th>
                  <th width="20%" class="text-center">점수</th>
                  <th width="20%" class="text-center">점수입력</th>
                </tr>
              </thead>
              <tbody>
              <!-- -------------------------------------------- -->
              <c:if test="${sList eq null or empty sList}">
              	<tr><td colspan="7">수강중인 학생이 없습니다.</td></tr>
              </c:if>
              <c:if test="${sList ne null and not empty sList}">
              	<c:forEach var="std" items="${sList}" varStatus="st">
              	<tr>
                  <td class="text-center">${st.index+1}</td>
                  <td class="text-center">${std.sNum}</td>
                  <td class="text-center">${std.sName}</td>
                  <td class="text-center">${std.uniName}</td>
                  <td class="text-center">${std.major}</td>
                  <td class="text-center">
                  	<input style="vertical-align:middle;" size=3 id="inputScr${st.index}"
                  	value="${std.score}">/100
                  </td>
                  <td class="text-center">
                  	<button class="btn btn-info" id="move" type="button"
                  	onclick="updateScore('${st.index}','${std.sNum}','${lnum}')">등록</button>
                  </td>
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
            <div class="col-md-3 text-right" style="">
            	<button type="button" class="btn btn-primary" onclick="javascript:history.back()">강의목록</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
<!-- 등록 form start-------------------- 
<form name="inf" action="insertScore.do">
	<input type="text" name="infSnum">
	<input type="text" name="infLnum">
	<input type="text" name="infScore">
</form>-->
<!-- 등록 form end------------------------------ -->
<!-- 수정 form start--------------------------------- -->
<form name="ef" action="updateScore.do">
	<input type="hidden" name="efSnum">
	<input type="hidden" name="efLnum">
	<input type="hidden" name="efScore">
</form>
<!-- 수정 form end--------------------------------- -->
<script>
	/* function insertScore(i, sn, ln){
		var sc=$('#inputScr'+i).val();
		//alert('입력한 값: '+sc+" 학번: "+sn+", 강의번호: "+ln);
		inf.infSnum.value=sn;
		inf.infLnum.value=ln;
		inf.infScore.value=sc;
		inf.method='post';
		inf.submit();
	} */
	
	function updateScore(i, sn, ln){
		var sc=$('#inputScr'+i).val();
		ef.efSnum.value=sn;
		ef.efLnum.value=ln;
		ef.efScore.value=sc;
		alert(ef.efScore.value)
		ef.method='POST'
		ef.submit();
	}
	
	
	$('#something').click(function() {
	    location.reload();
	});
	
</script>
<jsp:include page="../foot.jsp" />