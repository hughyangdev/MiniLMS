<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<style>
	pre{
		font-family: G마켓 산스 TTF;
		font-size: 100%;
		margin: auto;
	}
</style>

<div class="container">
	<h1 class="text-center">공지사항 내용</h1>
	<h5 class="text-center text-info">[ 글번호: ${notice.nnum}번 ]</h5>
	
	<div class="container">
		<div class="row pt-2">
		<div class="col-md-12">
			<div class="table-responsive">
			<table class="table table-hover" id="bbs" style="vertical-align: middle">
				<thead></thead>
				<tbody>
					<tr>
						<td width="20%" style="vertical-align: middle"><b>글번호</b></td>
						<td width="30%" style="vertical-align: middle">${notice.nnum}</td>
						<td width="20%" style="vertical-align: middle"><b>작성일</b></td>
						<td width="30%" style="vertical-align: middle">
						<fmt:formatDate value="${notice.ndate}" pattern="yyyy-MM-dd" />		
						</td>
					</tr>
					<tr>
						<td width="20%"><b>글쓴이</b></td>
						<td width="30%">${notice.nwriter }</td>
						<td width="20%"><b>조회수</b></td>
						<td width="30%">${notice.readnum }</td>
					</tr>
					<tr>
						<td width="20%"><b>첨부파일</b></td>
						<td colspan="3">
						<a href="#" onclick="down()">${notice.originFilename}</a> 
						[
						<fmt:formatNumber value="${notice.filesize}" pattern="###,###" />
						]bytes
						</td>
					</tr>
					<tr>
						<td width="20%"><b>제목</b></td>
						<td colspan="3">${notice.ntitle}</td>
					</tr>
					<tr>
						<td width="20%"><b>글 내용</b></td>
						<td colspan="3">
						<pre>${notice.ncontents}</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-center">
							<button type="submit" onclick="edit(${notice.nnum})" class="btn btn-outline-success mr-2">글 수정</button>
							<button type="submit" onclick="del(${notice.nnum})" class="btn btn-outline-danger mr-2">글 삭제</button>
							<button type="button" onclick="list()" class="btn btn-outline-info">목록보기</button>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
		</div>
	</div>

</div>

<form id="delF" name="delF" method="GET">
	<input type="hidden" name="del" id="del"></form>
<form id="editF" name="editF" method="POST">
	<input type="hidden" name="edit" id="edit"></form>
	
<!-- 파일 다운로드를 위한 폼 --------------------- -->
<form id="ff" action="../Upload">
	<input type="hidden" name="fname" value="${notice.nreference}">
	<input type="hidden" name="origin_fname" value="${notice.originFilename}">
</form>
<!-- ------------------------------------ -->

<script type="text/javascript">
	var down = function(){
		$('#ff').submit();
	}

	var list = function(){
		location.href = 'noticeList.do';
	}
	
	var del = function(delNum){
		//alert(delNum);
		var del = delF.del.value = delNum;
		//alert('delNum='+del);
		var yn = confirm(del+"번 글을 삭제할까요?");
		if(!yn) return;
		delF.action = 'noticeDel.do';
		delF.submit();
	}
	
	var edit = function(editNum){
		var edit = editF.edit.value = editNum;
		var yn = confirm(edit+"번 글을 수정할까요?");
		if(!yn) return;
		editF.action = 'noticeEdit.do';
		editF.submit(); 
	}
	
</script>

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