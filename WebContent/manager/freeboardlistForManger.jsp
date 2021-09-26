<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/top.jsp" />
<div class="container p-2">
	<div class="row">
		<h1 class="text-center">게시글 목록</h1>
	</div>
	<div class="row">
		<h3 class="text-center text-secondary">관리자는 삭제만 가능합니다.</h3>
	</div>
	<div class="row">
		<div class="col-md-3">
			<form name="listF" id="listF" action="list.do#bbs" class="m-2">
				<input type="hidden" name="cpage" value="${cpage}">
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<form name="findF" id="findF" action="find.do#bbs"
				class="form-inline">
				<input type="text" name="findKeyword" id="findKeyword"
					placeholder="검색어를 입력하세요" class="form-control m-2" required>
				<button class="btn btn-primary">검색</button>
			</form>
		</div>
		<table id="bbs" class="table">
			<thead>
				<tr class="text-center">
					<th width="10%">번호</th>
					<th width="20%">제목</th>
					<th width="15%">글쓴이</th>
					<th width="20%">내용</th>
					<th width="15%">날짜</th>
					<th width="20%">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${bList eq null or empty bList }">
					<tr>
						<td colspan="5"><span class="text-danger"> 게시글이 없습니다.
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
							<td><a href="#bbs" onclick="deleteBoard('${b.bNum}')">삭제</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>

<!-- 삭제 폼 -->
<form action="freeboardDelete.do" method="post" name="deleteF"
	id="deleteF">
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

<jsp:include page="/foot.jsp" />