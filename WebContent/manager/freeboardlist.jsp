<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
response.setHeader("Pragma","No-cache"); //HTTP 1.0 
response.setDateHeader ("Expires", 0); 
	response.setHeader("Cache-Control","no-cache");
%>    
<jsp:include page="/top2.jsp" />

<style type="text/css">
	#lst1{
		position: relative;
		left: 2px;
		margin: 0;
		background-color: #efefef;
		border: 1px solid silver;
	}
	#lst2{
		margin: 0;
		padding: 8px;
		list-style: none;
	}
</style>

<script type="text/javascript">
	$(function(){
		// 출판사 목록 가져오기
		getPublishs();
		// 모든 도서 정보 가져오기
		getAllNotice();
	})
	
	var getPublishs = function(){
		$.ajax({
			type: 'GET',
			url: 'bookPublish.jsp',
			dataType: 'html',
			cache: false,
			success:function(res){
				//alert(res);
				$('#sel').html(res);
			},
			error:function(err){
				//alert('error: '+err.status);
			}
		})
	} //getPublishs()----------
	
	var bookInfoByPub = function(val){
		//alert(val);
		// 자바스크립트에서 URI부분의 한글 인코드 처리해주는 함수 => encodeURIComponent() 함수 사용
		$.ajax({
			type: 'GET',
			url: 'bookTitle.jsp?publish='+encodeURIComponent(val),
			dataType: 'html',
			cache: false,
			success:function(res){
				//alert(res);
				$('#sel2').html(res);
			},
			error:function(err){
				//alert('error: '+err.status);
			}
		})
	} //bookInfoByPub()------------
	
	var getNotice = function(val){
		//alert(val);
		if(!val){
			val = $('#notice').val(); // 검색어를 val에 넣어주자.
		}
		if(!val){
			alert('검색어를 입력하세요.');
			$('#notice').focus();
			return;
		}
		$.ajax({
			type: 'GET',
			url: 'noticeAll.jsp?ntitle='+encodeURIComponent(val),
			dataType: 'html',
			cache: false,
			success:function(res){
				//alert(res);
				$('#notice_data').html(res);
			},
			error:function(err){
				//alert('error: '+err.status);
			}
		})
	} //getNotice()----------
	
	// 모든 도서정보 가져오기 ==> jquery의 $.ajax() 함수를 이용해 Ajax 통신을 해보자.
	/*
		$.ajax({
			type: '요청메소드',
			url: '서버페이지',
			data: 'post방식일 때 전송할 파라미터 데이터', // name=hong&addr=seoul
			dataType: '응답유형',
			cache: true|false,
			success: function(res){
				// 응답이 성공적으로 왔을 경우(readyState==4, status==200)
				// 응답이 매개변수 res로 들어온다.
			},
			error: function(e){
				// 에러가 발생했을 경우. 에러객체가 매개변수로 들어옴
			}
		})
	*/
	var goDel = function(visbn){
		//alert('del: '+visbn);
		$.ajax({
			type: 'GET',
			url: 'bookDel.jsp?isbn='+visbn,
			dataType: 'xml',
			cache: false,
			success: function(res){
				//alert(res);
				var str = $(res).find('result').text();
				//alert(str);
				if(parseInt(str)>0){
					//alert('삭제 성공');
					getAllNotice();
				}else{
					alert('삭제 실패');
				}
			},
			error: function(err){
				alert('error: '+err.status);
			}
		})
	} //goDel()----------
	
	var goEdit = function(visbn){
		//alert('edit: '+visbn);
		$.ajax({
			type: 'POST',
			url: 'bookInfo.jsp',
			data: "isbn="+visbn, // 요청 데이터. POST 방식일 경우 data 속성값으로 데이터를 넘긴다.
			dataType: 'xml',
			success: function(res){
				//alert(res);
				// 응답 데이터 추출하기 (isbn, title, price, publish, pubDate, bimage)
				var visbn = $(res).find('isbn').text();
				var vtitle = $(res).find('title').text();
				var vprice = $(res).find('price').text();
				var vpublish = $(res).find('publish').text();
				var vpubDate = $(res).find('pubDate').text();
				var vbimage = $(res).find('bimage').text();
				$('#isbn').val(visbn);
				$('#title').val(vtitle);
				$('#price').val(vprice);
				$('#publish').val(vpublish);
				$('#published').val(vpubDate);
				var str = "<img style='width:80%;margin:auto' src='../images/"+vbimage+"' class='img img-thumbnail img-responsive'>";
				$('#bimage').html(str);
			},
			error: function(err){
				//alert('error: '+err.status);
			}
		})
	} //goEdit()---------
	
	var goEditEnd = function(){
		//alert('a');
		// 폼 객체의 serialize()함수를 이용하여 파라미터 데이터를 만든다.
		var paramData = $('#editF').serialize();
		//alert(paramData);
		$.ajax({
			type: 'POST',
			url: 'bookUpdate.jsp',
			data: paramData,
			dataType: 'xml',
			cache: false,
			success: function(res){
				//alert(res);
				var str = $(res).find('result').text();
				if(parseInt(str)>0){
					alert('수정 성공');
					getAllNotice();
				}else{
					alert('수정 실패');
				}
			},
			error: function(err){
				//alert('error: '+err.status);
			}
		})
	} //goEditEnd()---------
	
	var getAllNotice = function(){
		$.ajax({
			type: 'get',
			url: 'noticeAll.jsp',
			dataType: 'html', // text, xml, html, json, ... 응답유형을 지정할 수 있다.
			cache: false,
			success: function(res){
				//alert(res);
				$('#notice_data').html(res);
			},
			error: function(err){
				alert('error: '+err.status);
			}
		})
	} //getAllNotice()-----------
	
	var autoComp = function(val){
		//console.log("val="+val);
		$.ajax({
			type: 'POST',
			url: 'autoComplete.jsp',
			data: 'findKeyword='+val, // 요청 파라미터
			dataType: 'html',
			cache: false,
			success: function(res){
				//alert(res);
				$('#lst2').html(res);
				$('#lst1').show(100);
				$('#lst2').show(100);
			},
			error: function(err){
				//alert('error: '+err.status);
			}
		})
	} //autoComp()--------
	
	var setting = function(val){
		$('#notice').val(val);
		$('#lst1').hide(100);
		$('#lst2').hide(100);
	} //setting()--------
	
	// Naver Open Api를 이용해 도서 정보 검색하기
	$(function(){
		$('#openBtn').click(function(){
			var keyword = $('#notice').val();
			if(!keyword){
				alert('검색어를 입력하세요');
				$('#notice').focus();
				return;
			}
			var url = "naverOpenApiResult.jsp?query="+encodeURIComponent(keyword);
			send(url, keyword);
		})
	});
	
	var send = function(url, keyword){
		$.ajax({
			type: 'get',
			url: url,
			dataType: 'json',
			cache: false,
			success: function(res){
				//alert(JSON.stringify(res));
				//alert(res.total);
				var total = parseInt(res.total);
				showDataList(res.items, total);
				var display = 20; // 한 페이지 당 보여줄 목록 갯수
				showPageList(total, keyword, display);
			},
			error: function(err){
				//alert('error: '+err.status);
			}
		})
	} //send()---------
	
	var showDataList = function(items, total){
		
		var str = "<h2>"+$('#notice').val()+" 검색 결과: "+total+"개</h2>";
			str+= "<table class='table'>";
			str+= "<tr>";
			$.each(items, function(i, book){
				str+= "<td width='25%'>";
				str+= "<a href='"+book.link+"' target='_blank'>";
				str+= "<img src='"+book.image+"' class='img-fluid'>";
				str+= "</a>";
				str+= "<h4>"+book.title+"</h4>";
				str+= "<p>저  자: "+book.author+"<br>";
				str+= "출판사: "+book.publisher+"<br>";
				str+= "출판일: "+book.pubdate+"<br>";
				str+= "정  가: "+book.price+"원<br>";
				if(book.discount){
					str+= "<span class='text-danger'>할인가: "+book.discount+"원</span><br>";
				}
				str+= "</p>"
				str+= "</td>";
				if(i%4==3){
					str+= "</tr><tr>"; // 줄바꿈
				}
			}); // $.each() end
			str+= "</tr>";
			str+= "</table>";
			$('#localBook').hide(500);
			$('#openApiBook').html(str).show(500);
	} //showDataList()--------
	
	var showPageList = function(total, keyword, display){
		if(total>200){
			total = 200;
		}
		// int pageCount = (total-1) / display + 1; <= 자바에서 페이지수 구하기
		var pageCount = Math.floor((total-1) / display + 1); //결과가 실수로 나옴 -> 나머지를 버려야 함
		//alert(pageCount);
		var str = "<ul class='pagination justify-content-center'>";
		/*	i		start		display
			[1]		1			20
			[2]		21			20
			[3]		41			20
			
			start = (i-1)*display+1;
			start = (i*display)-(display-1);
		*/
		for(var i=1; i<=pageCount; i++){
			var start = (i-1)*display+1;
			str+= "<li class='page-item' id='a"+start+"'><a class='page-link' onclick='show("+start+", \""+keyword+"\")'>"+i;
			str+= "</a></li>"; 
		}
			str+= "</ul>";
		$('#openApiBook').append(str);
		
	} //showPageList()-----------
	
	var show = function(start, query){
		//alert(start+"/"+query);
		$("li[id^='a']").removeClass('active');
		$('#a'+start).addClass('active');
		var url = "naverOpenApiResult.jsp?query="+encodeURIComponent(query)+"&start="+start+"&display=20";
		send(url, query);
	} //show()-----------
	
</script>

<!--onload시 공지사항 목록 가져오기  -->
<body onload="getPublishs()">
<div class="container">
	<h1 class="text-center">게시글 목록</h1>
	<div class="text-right">
		<form name="findF" id="findF" role="form" 
			action="" method="POST" class="form-inline">
			<div class="input-group">
			<input type="text" name="freeboard" id="freeboard"
				onkeyup="autoComp(this.value)" class="form-control" placeholder="검색어를 입력하세요">         
			<!-- ---------------------------- -->
			<div id="lst1" class="listbox" style="display:none">
			<div id="lst2" class="blist" style="display:none">
			</div>
			</div>
			<!-- ---------------------------- -->
			<div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fa fa-search"></i>
                </button>
            </div>
			<!-- <button type="button" onclick="getNotice()" class="btn btn-outline-primary">검색</button> -->
			</div>
		</form>
	</div> <br>
	
	<div id="localBook">

	<%-- <div class="row">
		<div class="col-md-3 offset-md-9 p-3 m-3">
			<!-- pageSize 관련 form 시작 --------------- -->
			<form name="listF" id="listF" action="list.do#bbs">
				<!-- hidden data cpage 값 넘기기 --------- -->
				<input type="hidden" name="cpage" value="">${cpage}
				<!-- --------------------------------- -->
				<select name="pageSize" class="form-control" onchange="submit()">
					<option value="5">::페이지 사이즈 선택::</option>
					<c:forEach var="ps" begin="5" end="20" step="5">
						<option value="">페이지 사이즈 </option> ${ps}
					</c:forEach>
				</select>	
			</form>
			<!-- ----------------------------------- -->
		</div> <!-- col end -->
	</div> <!-- row end --> --%>
<div class="container">
	<div class="row">
	<div class="col-md-12">
	<div class="table-responsive" style="">
	<table class="table table-hover" id="bbs">
		<thead>
		<tr>
			<th width="15%">글번호</th>
			<th width="25%">제  목</th>
			<th width="15%">작성자</th>
			<th width="15%">날  짜</th>
			<th width="15%">조회수</th>
			<th width="15%">수정|삭제</th>
		</tr>
		</thead>
		<div id="freeboard_data"></div>
		<!-- ---------------------- -->
		<%-- <c:if test="${boardArr==null || empty boardArr }">
		(boardArr.size()==0) ==> empty boardArr
			<tr><td colspan="5">데이터가 없습니다.</td></tr>
		</c:if>
		<c:choose>
				<c:when></c:when>
			</c:choose> 
		태그라이브러리에서 if~else~
		<c:if test="${boardArr!=null && not empty boardArr }">--%>
		<c:forEach var="i" begin="1" end="5">  
		<tbody>
			<tr>
				<td>a</td><%-- ${board.idx} --%>
				<td>
				<a href="#">a</a><%-- view.do?idx=${board.idx} ${board.subject} --%>
					
					<%-- <c:if test="${board.filesize>0}">
						<img src="../images/attach.png" width="16px">
					</c:if> --%>
					
				</td>
				<td>a</td> <%-- ${board.name} --%>
				<td>a
					<%-- <fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd" /> --%>
					<!-- 날짜 포맷 -->
				</td>
				<td>a</td> <%-- ${board.readnum} --%>
				<td><a>수정</a>|<a>삭제</a></td>
			</tr>
			</c:forEach>
		<%-- </c:if> --%>
		<!-- ---------------------- -->
		<%-- <tr>
			<td colspan="3" class="text-center">
			<ul class="pagination justify-content-center">
			<!-- begin: 시작값, end: 끝값, step: 증가치 -->
			<c:forEach var="i" begin="1" end="${pageCount}" step="1">
				<li class="page-item <c:if test="${cpage==i}">active</c:if>" >
					<a class="page-link" href="list.do?cpage=${i}#bbs">${i}</a>
				</li>
			</c:forEach>
			</ul>
			</td>
			<td colspan="2" class="text-center">총 게시글 수: 
			<span class="text-primary">a</span>개 ${totalCount}
			<br>
			<span>현재페이지</span>/<span>총페이지수</span>
			</td>
		</tr> --%>
		</tbody>
	</table>
	</div>
	<div class="row">
    	<div class="col-md-4" style=""></div>
        <div class="col-md-4 text-light" style="">
	        <ul class="pagination text-light">
		        <li class="page-item"> <a class="page-link" href="#">Prev</a> </li>
		        <li class="page-item active"> <a class="page-link" href="#">1</a> </li>
		        <li class="page-item"> <a class="page-link" href="#">2</a> </li>
		        <li class="page-item"> <a class="page-link" href="#">3</a> </li>
		        <li class="page-item"> <a class="page-link" href="#">4</a> </li>
		        <li class="page-item"> <a class="page-link" href="#">Next</a> </li>
	        </ul>
        </div>
        <div class="col-md-4" style=""></div>
    </div>
	</div>
	</div>
	
</div>

	</div> <!-- #localBook end -->
</div> <!-- container end -->

<!-- ------------------------------- -->
<div id="openApiBook" class="container">

</div>


<!-- https://apis.daum.net/search/book -->
<!-- 53c73f32f6c4150ca5aa184ba6250d8e -->

<!-- https://apis.daum.net/search/book?apikey=53c73f32f6c4150ca5aa184ba6250d8e&q=다음카카오&output=json -->

<jsp:include page="/foot2.jsp" />
