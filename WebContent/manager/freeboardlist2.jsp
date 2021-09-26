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
<div class="container">
	<h1 class="text-center">게시글 목록</h1>
	<div class="row">
		<div class="col-md-3">
			<form name="listF" id="listF" action="list.do#bbs" class="m-2">
				<input type="hidden" name="cpage" value="${cpage}">
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6"></div>
		<div class="col-md-6 d-flex justify-content-end align-items-right">
			<form name="findF" id="findF" action="find.do#bbs" class="form-inline">
				<input type="text" name="findKeyword" id="findKeyword"
					placeholder="검색어를 입력하세요" class="form-control" required>
				<div class="input-group-append">
					<button class="btn btn-primary" type="button" id="">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</form>
		</div>
		<div class="col-md-12 pt-3">
		<table id="bbs" class="table table-hover">
			<thead>
				<tr class="text-center">
					<th width="10%">번호</th>
					<th width="20%">제목</th>
					<th width="15%">글쓴이</th>
					<th width="20%">내용</th>
					<th width="15%">날짜</th>
					<th width="20%">수정 | 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${bList eq null or empty bList }">
					<tr>
						<td colspan="6"><span class="text-danger"> 게시글이 없습니다.
						</span></td>
					</tr>
				</c:if>
				<c:if test="${bList ne null and not empty bList }">
					<c:forEach var="b" items="${bList}">
						<tr>
							<td>${b.bNum }</td>
							<td>${b.bTitle }</td>
							<td>${b.bWriter }</td>
							<td>${b.bContents }</td>
							<td>${b.bDate }</td>
							<td>
								<a href="#bbs" id="edit"
									onclick="editBoard('${b.bNum}','${b.bPwd }')">수정</a> 
								| <a href="#bbs" id="" 
									onclick="deleteBoard('${b.bNum}')">삭제</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</div>
	</div>
</div>

<!-- 삭제 폼 -->
<form action="freeboardDelete.do" method="post" name="deleteF" id="deleteF">
	<input type="hidden" id="deleteNum" name="deleteNum">
</form>

<!-- 수정 폼 -->
<form action="freeboardEdit.do" method="post" name="editF" id="editF">
	<input type="hidden" id="editNum" name="editNum">
</form>

<script>
	function deleteBoard(bnum) {
		//alert(bnum);
		if (bnum < 0) {
			alert('삭제할 글을 선택하세요');
			return;
		}

		deleteF.deleteNum.value = bnum;
		deleteF.submit();
	}

	var openwin = null;
	function editBoard(bnum, pwd) {
		if (bnum < 0) {
			alert('수정할 글을 선택하세요');
			return;
		}

		openwin = window.open("check.do?pwd=" + pwd + "&bnum=" + bnum, "check",
				"width=600px, height=300px, left=100px, top=100px");

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