<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp" />
<style>
.table {
	margin: auto;
}
.table td{
	margin: 0 auto;
}
</style>
<script>
	$(function() {

		$('#searchNum').click(function() {
			var search = document.getElementById('snum').value;
			//alert(search);
			if (!search) {
				alert('검색할 학번을 입력하세요');
				$('snum').focus();
				return;
			}
			$.ajax({
				type : "POST",
				url : "searchStudentNum.do",
				data : "studentNum=" + search,
				dataType : "html",
				cache : false,
				success : function(res) {
					//alert(res);
					$('#resultSearchNum').html(res);
				},
				error : function(err) {
					alert("error: " + err.status);
				}
			});
		});// button function end

		$('#searchSub').click(function() {
			var searchSub = document.getElementById('subject').value;
			var searchType = document.getElementById('searchType').value;

			//alert(searchSub);
			//alert(searchType);
			if(searchType.value=="type") {
				alert('검색 유형을 선택하세요');
				return;
			}
			/* else if(!searchSub) {
				alert('검색할 과목을 입력하세요');
				$('#subject').focus();
				return;
			} */

			$.ajax({
				type : "POST",
				url : "searchSubject.do",
				data : "subName=" + searchSub + "&subType="+searchType,
				dataType : "html",
				cache : false,
				success : function(res) {
					//alert(res);
					$('#classList').html(res);
				},
				error : function(err) {
					alert("error: " + err.status);
				}
			});
		})
	});// function end
</script>
<div class="container">
	<h1 class="text-center">수강신청</h1>
	<div class="py-3" style="">
		<div class="container">
			<form name="registerSubInfoF">
				<div class="row pt-2">
					<div class="col-md-12" style="">
						<div class="table-responsive" style="">
							<table class="table" style="table-align: center">
								<tr>
									<td style="vertical-align: middle; width: 10%">학년</td>
									<td id="gradeSelect" style="vertical-align: middle; width: 15%">
										<select class="form-control" id="test">
											<option id="fir" value="1">1</option>
											<option id="Se" value="2">2</option>
											<option id="Thi" value="3">3</option>
											<option id="Four" value="4">4</option>
										</select></td>
									<td style="vertical-align: middle; width: 10%">학기</td>
									<td id="semSelect" style="vertical-align: middle; width: 15%">
										<select class="form-control" id="test">
											<option id="Sfir" value="1">1</option>
											<option id="SSe" value="2">2</option>
										</select></td>
									<td style="vertical-align: middle; width: 15%">학번 검색</td>
									<td style="vertical-align: middle; width: 35%">
									<div class="input-group">
										<input type="text" class="form-control" id="snum"
											placeholder="Search">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button" id="searchNum">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div></td>
								</tr>
							</table>
						</div>

						<div class="row">
							<div class="col-md-12" style="">
								<div class="table-responsive" id="resultSearchNum" style=""></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" style="">
						<div class="table-responsive" style="">
						<table class="table" style="table-align: center">
							<tr>
								<td style="vertical-align: middle">검색 유형</td>
								<td><select class="form-control"
									 name="searchType" id="searchType">
										<option value="type">검색유형</option>
										<option value="subject">과목</option>
										<option value="professor">교수</option>
								</select></td>
								<td>
									<div class="input-group">
										<input type="text" class="form-control" id="subject"
											placeholder="Search">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button" id="searchSub">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</td>
							</tr>
						</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>


	<!-- 과목 리스트 -->
	<div class="row">
		<div id="classList" class="col-md-12"></div>
	</div>
</div>

<!-- 신청 폼 -->

<form id="RegisterEndF" action="registerClassEnd.do" method="post">
	<input type="hidden" id="RegisterSubName" name="RegisterSubName">
	<input type="hidden" id="RegisterStudentNum" name="RegisterStudentNum">
</form>

<script>
	function Register(lname, snum) {

		if (registerSubInfoF.forCheck.value == false) {
			alert('본인인증이 완료되지 않았습니다.');
			return;
		}

		if (RegisterEndF.RegisterSubName.value == null) {
			alert('신청할 과목을 선택하세요.')
			return;
		}

		RegisterEndF.RegisterSubName.value = lname;
		RegisterEndF.RegisterStudentNum.value = snum;

		RegisterEndF.submit();
	}
</script>
<jsp:include page="/foot.jsp" />