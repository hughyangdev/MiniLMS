<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/top1.jsp" />
<!-- header -->
<div class="py-1 mr-4" id="bbs">
	<div class="container bbstxt" id="move1">
		<div class="row">
			<div class="ml-auto col-lg-7 text-center text-lg-left">
				<h1>나의 강의 관리</h1>
				<p class="mb-0">
					${ploginUser.pname} 교수님 강의 목록입니다. 강의 평가를 위해 해당 강의를 선택해주세요.<br>
				</p>
			</div>   
			<div
				class="col-lg-4 d-flex justify-content-center align-items-center p-3">
				<form class="form-inline" id="findF" name="findF" onsubmit="return false">
					<div class="input-group">
						<input type="text" class="form-control" id="findKeyword"
							placeholder="강의명을 입력하세요.">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="search(${ploginUser.pnum})">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
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
							<thead style="text-align:center">
								<tr>
									<th style="width: 10%">번호</th>
									<th style="width: 25%">전공명</th>
									<th style="width: 40%">강의명</th>
									<th style="width: 15%">교수명</th>
									<th style="width: 10%">학점<br></th>
								</tr>
							</thead>
							<tbody>
							<!-- -------------------------- -->
							<c:if test="${myClassList eq null or empty myClassList}">
								<tr><td colspan="5">데이터가 없습니다.</td></tr>
							</c:if>
							<c:if test="${myClassList ne null and not empty myClassList }">
								<c:forEach var="cl" items="${myClassList}">
								<tr>
									<td id="lNum">${cl.rn}</td>
									<td>${cl.majorName}</td>
									<td><button class="btn" id="lname" name="lname" onclick="show(${cl.lNum},'${cl.lName}')">${cl.lName}</button></td>
									<td>${cl.pname }</td> 
									<td>${cl.credit }학점</td> 
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
								<li class="page-item">
									<a class="page-link" href="evaluation.do?cpage=${prevBlock}"><i class="fa fa-angle-left" ></i></a>
								</li>
								</c:if>
								
								
								<c:forEach var="b" begin="${prevBlock+1}" end="${nextBlock-1}" step="1">
								<c:if test="${b<=pageCount}">
								<li class="page-item <c:if test="${cpage==b}"> active</c:if>">
									<a class="page-link" href="evaluation.do?cpage=${b}#bbs">${b }</a>
								</li>
								</c:if>
								</c:forEach>
								
								<c:if test="${nextBlock<=pageCount}">
								<li class="page-item"><a class="page-link" href="evaluation.do?cpage=${nextBlock}"><i class="fa fa-angle-right"></i></a>
								</li>
								</c:if>
							</ul>
						</div>
						<div class="col-md-3" style="" id="#move"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="a"></div>

<script>
	// 강의 평가 ajax 처리
	function show(val, val2, b){
		//alert(val);
		
		var lname = val2;//$(".lname").val();
		
		if(b == null) b = 0
		
		$.ajax({
			type: 'get',
			url: 'evaluShow.do?lNum='+val+"&lname="+encodeURIComponent(lname)+"&cpage="+b,
					
			dataType: 'html',
			cache: false,
			success: function(res){
				$('#a').html(res);
				//alert(JSON.stringify(res))
				
				// 해당 과목 학생 목록으로 스크롤 해주기
				var offset = $("#move").offset();
		        $('html, body').animate({scrollTop : offset.top}, 800);
			},
			error: function(err){
				alert('error:'+err.status);
			}
		})
		
		


	}
	
	// 검색 ajax 처리
	var search = function(val){
		alert(val)
		if(!findF.findKeyword.value){
			alert('검색어를 입력하세요.');
			findF.findKeyword.focus();
			return;
		}
		
		// input값 가져와서 searchName에 넣어주기
		var searchName = $('#findKeyword').val();
		
		// 파라미터값 받아와서 lNum에 넣어주기
		var pnum = val;
		//alert(searchName);
		//alert(pnum)
		
		// 테이블 숨기기
		$('#table').hide();
		$('#table2').hide();
		
		
		
		$.ajax({
			type:'get',
			url:"evaluSearch.do?pnum="+pnum+"&searchName="+encodeURIComponent(searchName),
			dataType: 'html',
			cache: false,
			success: function(res){
				//alert(res);
				$('#table').show();
				$('#table').html(res);
				$('#findKeyword').val('');
				// 페이지 이동했을 때 학생 목록 숨기기
				$('#ddd').hide();
				
				// 스크롤 이동
				var offset = $("#move1").offset();
		        $('html, body').animate({scrollTop : offset.top}, 600);
				
			}, 
			error: function(err){
				alert('error:'+err.status);
			}
		}) 
 	}  
	
	// 페이징 처리
	var pageC = function(b) {  
	      //alert(i)
	      $.ajax({
	         type : 'get',
	         url : 'evaluSearch.do?cpage=' + b,
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

	
	
	
	// 엔터 처리
	$("#findF").keyup(function(e) {
		if(e.keyCode == '13') {
			if(!findF.findKeyword.value){
				alert('검색어를 입력하세요.');
				findF.findKeyword.focus();
				return;
			}
			
			// 테이블 숨기기
			$('#table').hide();
			$('#table2').hide();
			
			searchName = $('#findKeyword').val();
			
			$.ajax({
				type:'get',
				url:"evaluSearch.do?pnum=${ploginUser.pnum}&searchName="+encodeURIComponent(searchName),
				dataType: 'html',
				cache: false,
				success: function(res){
					//alert(res);
					$('#table').show();
					$('#table').html(res);
					$('#findKeyword').val('');
					
					// 페이지 이동했을 때 학생 목록 숨기기
					$('#ddd').hide();
					
					// 스크롤 이동
					var offset = $("#move1").offset();
			        $('html, body').animate({scrollTop : offset.top}, 600);
					
				}, 
				error: function(err){
					alert('error:'+err.status);
				}
			})
		} 
	})


		
</script>


<jsp:include page="/foot1.jsp" />