<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script>
 	$(function(){
 		<c:choose>
			<c:when test="${loginUser ne null and not empty loginUser}">
				$('#nwriter').val('${loginUser.sname}');
			</c:when>
			<c:when test="${ploginUser ne null and not empty ploginUser}">
				$('#nwriter').val('${ploginUser.pname}');
			</c:when>
			<c:when test="${mloginUser ne null and not empty mloginUser}">
				$('#nwriter').val('${mloginUser.mname}');
			</c:when>
		</c:choose>
		$('#noticeF').on('submit', function(){
			if(! $('#ntitle').val()){
				alert('제목을 입력하세요.');
				$('#ntitle').focus();
				return false;
			}
			if(! $('#ncontents').val()){
				alert('내용을 입력하세요.');
				$('#ncontent').focus();
				return false;
			}
			/* $('#noticeF').submit(); */
			return true;
		})
	});
	
	/* function check(){
		if(! noticeF.ntitle.value ){
			alert('제목을 입력하세요.');
			noticeF.ntitle.focus();
			return;
		}
		if(! noticeF.ncontents.value ){
			alert('내용을 입력하세요.');
			noticeF.ncontents.focus();
			return;
		}
		noticeF.submit();
	} */
	
</script>
<body>
<div class="container">
	<h1 class="text-center">공지사항 작성</h1>

	<div class="container">
	<div class="row pt-2">
		<div class="col-md-12 text-left" style="">
			<form name="noticeF" id="noticeF" action="noticeInsert.do" method="POST"
				enctype="multipart/form-data"> <!-- prodInsert.do -->
				<div class="table-responsive" style="">
				<table class="table mt-4" style="vertical-align:middle">
				<thead></thead>
				<tbody>
					<tr>
						<td width="20%" style="vertical-align:middle"><b>제 목</b></td>
						<td width="80%">
							<input type="text" name="ntitle" id="ntitle" 
								placeholder="Title" style="width:50%" class="form-control">
						</td>
					</tr>
					<tr>
						<td width="20%" style="vertical-align:middle"><b>작성자</b></td>
						<td width="80%">
							<input type="text" name="nwriter" id="nwriter" 
								readonly placeholder="Writer" style="width:50%" class="form-control">
						</td>
					</tr>
					<tr>
						<td width="20%"><b>내 용</b></td>
						<td width="80%"><textarea name="ncontents" id="ncontents"
							rows="10" cols="50" placeholder="Content" 
							style="width:100%" class="form-control"></textarea></td>
					</tr>
					
					<tr>
						<td width="20%" style="vertical-align:middle">첨부파일</td>
						<td width="80%">
						<input type="file" name="nreference" id="nreference"><br>
					</td>
					</tr>

					<tr>
						<td colspan="2" class="text-center">
							<button type="submit" class="btn btn-outline-success">글 등록</button>
							<button type="reset" class="btn btn-outline-danger">다시쓰기</button>
						</td>
					</tr>
				</tbody>
				</table>
				</div>
			</form>
		</div>
	</div>
	</div>
</div>

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
