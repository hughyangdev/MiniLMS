<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/top1.jsp" />
<!-- header -->
<div class="py-1 mr-4" id="move">
	<div class="container">
		<div class="row">
			<div class="ml-auto col-lg-7 text-center text-lg-left ">
				<h1>개설 과목 조회</h1>
				<p class="mb-0">
					전체 개설한 과목 목록입니다.<br>
				</p>
			</div>
			<div
				class="col-lg-4 d-flex justify-content-center align-items-center p-3">
			</div>
		</div>
	</div>
</div>



<!-- nav  -->
<div class="container mt-4" id="bbs">
	<div class="row">
		<div class="col-md-8 pb-2">
			<form name="findF" id="findF" class="form-inline" onsubmit="return false">
				<select name="findType" id="findType" class="form-control m-2">
					<option value="">::검색유형::</option>
					<option value="2">강의명</option>
					<option value="3">교수명</option>
				</select>
				<div class="input-group">
					<input type="text" name="findKeyword" id="findKeyword" class="bbstxt"
						placeholder="검색어를 입력하세요." required class="form-control ">
					<div class="input-group-append">
						<button class="btn btn-primary" type="button" onclick="search()">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
				
			</form>
		</div>
	</div>
</div>


<!-- body -->
<div style="">
	<div class="container">
		<div class="row">
			<div class="col-md-12  shadow-sm" style="">
				<div id="table" class="table-responsive" style="">
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
				</div>
				<div id="table2" class="row">
					<div class="col-md-4" style=""></div>
					<div class="col-md-4 ml-3" style="">
						<ul class="pagination justify-content-center">


							<c:if test="${prevBlock>0 }">
								<li class="page-item"><a class="page-link"
									href="subList.do?cpage=${prevBlock}#move"><i
										class="fa fa-angle-left"></i></a></li>
							</c:if>

							<c:forEach var="b" begin="${prevBlock+1}" end="${nextBlock-1}"
								step="1">
								<c:if test="${b<=pageCount }">
									<li class="page-item <c:if test="${cpage==b}"> active</c:if>">
										<a class="page-link" href="subList.do?cpage=${b}#move">${b }</a>
									</li>
								</c:if>
							</c:forEach>

							<c:if test="${nextBlock<=pageCount}">
								<li class="page-item"><a class="page-link"
									href="subList.do?cpage=${nextBlock}#move"><i
										class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
					<div class="col-md-3" style=""></div>
				</div>
					
			</div>
		</div>
	</div>
</div>
<br>
<br>

<script type="text/javascript">
	var search = function(val) {
		//alert(val);
		if (!findF.findType.value) {
			alert('검색유형을 선택해주세요.');
			findF.findType.focus();
			return;
		}
		
		if(!findF.findKeyword.value){
			alert('검색어를 입력하세요.');
			findF.findKeyword.focus();
			return;
		}
		// 옵션 선택 값 가져오기
		var type = $("#findType option:selected").val();
		
		$('#table').hide();
		$('#table2').hide();
		
		// input값 가져와서 val에 넣어주기
		val = $('#findKeyword').val();
		//alert(val);
		
		$.ajax({
			type:'post',
			url: "subjectShow.do?lName="+encodeURIComponent(val)+"&findType="+type,
			dataType:'html',
			cache: false,
			success:function(res){
				//alert(JSON.stringify(res));
				
				/* $('#findKeyword').val('');
				$('#findType').val('');*/
				
				$('#table').show();
				$('#table').html(res);
				$('.bbstxt').focus(); 
				
				var offset = $("#move").offset();
		        $('html, body').animate({scrollTop : offset.top}, 800);
			},
			error: function(err){
				alert('error:'+err.status);
			}
		})
	}
	
	var pageC = function(b) {
	      //alert(i)
	      $.ajax({
	         type : 'get',
	         url : 'subjectShow.do?cpage=' + b,
	         dataType : 'html',
	         cache : false,
	         success : function(res) {
	            //$('#table2').hide();
	            $('#table').html(res);
	         },
	         error : function(err) {
	            alert('error:' + err.status);
	         }
	      })
	   }

	   var prevB = function(b) {
	      $.ajax({
	         type : 'get',
	         url : 'subjectShow.do?cpage=' + b,
	         dataType : 'html',
	         cache : false,
	         success : function(res) {
	            //$('#table2').hide();
	            $('#table').html(res);
	         },
	         error : function(err) {
	            alert('error:' + err.status);
	         }
	      })
	   }

	   var nextB = function(b) {
	      //alert(i)
	      $.ajax({
	         type : 'get',
	         url : 'subjectShow.do?cpage=' + b,
	         dataType : 'html',
	         cache : false,
	         success : function(res) {
	            //$('#table2').hide();
	            $('#table').html(res);
	         },
	         error : function(err) {
	            alert('error:' + err.status);
	         }
	      })
	   }
	   
	   $("#findF").keyup(function(event) {
		   // Enter 처리 
		   if(event.keyCode == '13') { 
			   if (!findF.findType.value) {
					alert('검색유형을 선택해주세요.');
					findF.findType.focus();
					return;
				}
				
				if(!findF.findKeyword.value){
					alert('검색어를 입력하세요.');
					findF.findKeyword.focus();
					return;
				}
			   
			   var type = $("#findType option:selected").val();

				
				
				$('#table').hide();
				$('#table2').hide();
				
				val = $('#findKeyword').val();
				//alert(val);
			   
			   $.ajax({
					type:'post',
					url: "subjectShow.do?lName="+encodeURIComponent(val)+"&findType="+type,
					dataType:'html',
					cache: false,
					success:function(res){
						//alert(JSON.stringify(res));
						$('#table').show();
						$('#table').html(res);
						$('#findKeyword').val('');
						$('#findType').val('');
						
						// 스크롤 이동
						var offset = $("#move").offset();
				        $('html, body').animate({scrollTop : offset.top}, 600);
					},
					error: function(err){
						alert('error:'+err.status);
					}
				});
			}; 
		});

	   

</script>

<jsp:include page="/foot1.jsp" />