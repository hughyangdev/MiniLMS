<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
	<c:when test="${loginUser ne null and not empty loginUser}">
		<jsp:include page="/top.jsp" />
	</c:when>
	<c:when test="${ploginUser ne null and not empty ploginUser}">
		<jsp:include page="/top1.jsp" />
	</c:when>
	<c:when test="${mloginUser ne null and not empty mloginUser}">
		<jsp:include page="/top2.jsp" />
	</c:when>
</c:choose>

<style type="text/css">
	
</style>

<script type="text/javascript">
/* 	$(function(){
		getAllNotice();
	}) */
	
/* 	var getAllNotice = function(){
			$.ajax({
				type: 'GET',
				url: 'noticeAll.do',
				dataType: 'html',
				cache: false,
				success: function(res){
					//alert(res);
					$('#notice_data').html(res);
				},
				error: function(err){
					alert('error: '+err.status);
				}
			})
		} */
	
</script>

<div class="container">
	<h1 class="text-center">공지사항 목록</h1>
	<div class="row pt-2">
		<div class="col-md-6">
			<form name="listF" id="listF" action="noticeList.do#bbs">
				<input type="hidden" name="cpage" id="cpage" value="${cpage}">
			</form>
		</div>
		<div class="col-md-6 d-flex justify-content-end align-items-right">
			<form class="form-inline" name="findF" id="findF" role="form"
				action="" method="POST">
				<div class="input-group">
					<input type="text" name="findKeyword" id="findKeyword" 
						class="form-control" placeholder="검색어를 입력하세요">
					<div class="input-group-append">
						<button class="btn btn-primary" type="button" id="allNotice">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div> <br> <!-- 제목 및 검색 부분 -->

	<div class="container">
		<div class="row">
		<div class="col-md-12">
			<div class="table-responsive" style="">
			<table class="table table-hover" id="bbs">
				<thead>
					<tr>
						<th width="15%">글번호</th>
						<th width="35%">제  목</th>
						<th width="15%">작성자</th>
						<th width="20%">날  짜</th>
						<th width="15%">조회수</th>
					</tr>
				</thead>
				<!-- <tbody id="notice_data">
				
				</tbody> -->
				<tbody>
				<c:if test="${noticeArr eq null or empty noticeArr}">
					<tr>
						<td colspan="5">
							<h4 class="text-center">등록된 공지사항이 없습니다.</h4></td>
					</tr>
				</c:if>
				<c:if test="${noticeArr ne null and not empty noticeArr}">
					<c:forEach var="notice" items="${noticeArr}">
					<tr>
						<td>${notice.nnum}</td>
						<td>
						<a href="noticeView.do?nnum=${notice.nnum}">${notice.ntitle}</a>
						
						<c:if test="${notice.filesize>0}">
							<img src="../images/attach.png" width="15px">
						</c:if>
							
						</td>
						<td>${notice.nwriter}</td>
						<td>
							<fmt:formatDate value="${notice.ndate}" pattern="yyyy-MM-dd" />
						</td>
						<td>${notice.readnum}</td>
					</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
			</div>
			
			<div class="row">
		    	<div class="col-md-4" style=""></div>
		        <div class="col-md-4 text-light" style="">
			        <ul class="pagination text-light">
			        <c:if test="${prevBlock>0}">
			        	<li class="page-item">
			        		<a class="page-link" 
			        		href="notice.do?cpage=${prevBlock}#bbs">
			        		<i class="fa fa-angle-left"></i></a>
			        	</li>
			        </c:if>
			        <c:forEach var="i" begin="${prevBlock+1}" end="${nextBlock-1 }" step="1">
			        	<c:if test="${i<=pageCount}">
			        		<li class="page-item <c:if test="${cpage==i}">active</c:if>">
			        			<a class="page-link" href="noticeList.do?cpage=${i}#bbs">${i}</a>
			        		</li>
			        	</c:if>
			        </c:forEach>
				    <c:if test="${nextBlock <= pageCount}">
				    	<li class="page-item">
				    		<a class="page-link" 
				    		href="notice.do?cpage=${nextBlock}#bbs">
				    		<i class="fa fa-angle-right"></i></a>
				    	</li>
				    </c:if>
			        </ul>
		        </div>
		        <div class="col-md-4" style="">
		        	총 글 수: <span class="text-primary">${totalCount}</span>개 <br>
		        	페이지: <span class="text-secondary">${cpage}</span> / 
		        	<span class="">${pageCount}</span> 
		        </div>
		    </div>
		</div>
		</div>
		
	</div> <!-- table container end -->

	</div> <!-- #localBook end -->

<c:choose>
	<c:when test="${loginUser ne null and not empty loginUser}">
		<jsp:include page="/foot.jsp" />
	</c:when>
	<c:when test="${ploginUser ne null and not empty ploginUser}">
		<jsp:include page="/foot1.jsp" />
	</c:when>
	<c:when test="${mloginUser ne null and not empty mloginUser}">
		<jsp:include page="/foot2.jsp" />
	</c:when>
</c:choose>
