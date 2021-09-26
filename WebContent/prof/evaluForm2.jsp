<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- header -->

<style>
#MOVE_TOP_BTN {
    position: fixed;
    right: 8%;
    bottom: 50px;
    display: none;
    z-index: 999;
    color: black;
	    
}
</style>

<div id="move"></div>
<div id="ddd">
<div class="py-5 mr-4" >
	<div class="container">
		<div class="row">
			<div class="ml-auto col-lg-7 text-center text-lg-left">
				<h1>${lname} 강의 평가</h1>
				<p class="mb-0">
					강의를 수강한 학생들의 강의 평가 목록입니다.<br>
				</p>
			</div>
			<div
				class="col-lg-4 d-flex justify-content-center align-items-center p-3">
				
				
			</div>
		</div>
	</div>
</div>    

<!-- body -->

<div class="py-5" style="">
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="">
				<div class="table-responsive" style="">
					<h5 class="pl-3 text-info">총 수강 인원: ${count}명</h5>
					<table class="table" >
						<thead>
							<tr>
								<th>번호</th>
								<th>학번</th>
								<th>이름</th>
								<th>성별</th>
								<th>전공학과</th>
								<th>학년</th>
								<th>학기</th>
							</tr>
						</thead>
						<tbody>
						<!-- -------------------------- -->
							<c:if test="${list eq null or empty list}">
								<tr><td colspan="5">현재 수강중인 학생이 없습니다.</td></tr>
							</c:if>
							<c:if test="${list ne null and not empty list }">
								<c:forEach var="sl" items="${list}">
								<tr>
									<td>${sl.rn}</td>
									<td>${sl.snum}</td>
									<td>${sl.sname }</td>
									<td>${sl.sgender }</td>
									<td>${sl.major }</td>
									<td>${sl.grade }</td>
									<td>${sl.semester }</td>
								</tr>
								</c:forEach> 
							</c:if>
							<!-- -------------------------------- -->
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</div>
</div>

<!-- 통계 그래프 -->
<div class="container mt-5">
	<div class="row">
		<div class="col-md-3">
			<canvas id="myChart" width="500" height="200"></canvas>
		</div>
		<div class="col-md-4 offset-md-3">
			<canvas id="myChart2" width="500" height="200"></canvas>
		</div>
	</div>
</div>

<!-- 수강후기 -->
<div class="py-5 mr-1 mt-5" style="background-color:#c7ecee;">
	<div class="container">
		<div class="row">
			<div class="text-center mx-auto col-md-12">
				<h1 style="">
					강의 후기<br>
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 p-3 col-md-6">
				<div class="card">
					<div class="card-body p-4" style="">
						<h2>
							<b>잘 들었습니다</b>
						</h2>
						<p>A wonderful serenity has taken possession of my entire
							soul, like these sweet mornings of spring which I enjoy with my
							whole heart.</p>
						<h4>
							<b>J. W. Goethe</b>
						</h4>
						<p class="mb-3">CEO and founder</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 p-3 col-md-6">
				<div class="card">
					<div class="card-body p-4">
						<h2>
							<b>아쉬웠어요</b>
						</h2>
						<p>I should be incapable of drawing a single stroke at the
							present moment; and yet I feel that I never was a greater artist
							than now.</p>
						<h4>
							<b>J. W. Goethe</b>
						</h4>
						<p class="mb-3">CEO and founder</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 p-3">
				<div class="card">
					<div class="card-body p-4">
						<h2>
							<b>재밌었어요</b>
						</h2>
						<p>I throw myself down among the tall grass by the trickling
							stream; and, as I lie close to the earth, a thousand unknown
							plants are noticed by me.</p>
						<h4>
							<b>J. W. Goethe</b>
						</h4>
						<p class="mb-3">CEO and founder</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- footer -->
<div class="py-2" style="">
	<div class="container">
		<div class="row">
			<div class="col-md-8" style=""></div>
			<div class="col-md-4" style="">
				
				<a href="#" id="MOVE_TOP_BTN"><i class="fa fa-chevron-circle-up fa-2x" aria-hidden="true"></i></a>
			</div>
		</div>
	</div>
</div>
<div class="py-5" style="">
	<div class="container"></div>
</div>
</div>
<script>
	// 강의 평가 통계 1
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx,
			{
				type : 'pie',
				data : { // 실제 값을 넣어주자
					labels : [ 'Red', 'Blue', 'Yellow', 'Green' ],
					datasets : [ {
						label : '# of Votes',
						data : [ 12, 19, 3, 5 ],
						backgroundColor : [ '#FF6384', '#36A2EB', '#FFCE56',
								'#55efc4' ],

						borderWidth : 1,
					} ]
				},
				options : {
					responsive : false,

					title : {
						display : true,
						text : '강의평가 통계'
					},

				}
			});

	// 강의 평가 통계 1
	var ctx = document.getElementById('myChart2');
	var myChart = new Chart(ctx,
			{
				type : 'bar',
				data : { // 실제 값을 넣어주자
					labels : [ 'Red', 'Blue', 'Yellow', 'Green' ],
					datasets : [ {
						label : '# of Votes',
						data : [ 12, 19, 3, 5 ],
						backgroundColor : [ '#FF6384', '#36A2EB', '#FFCE56',
								'#55efc4' ],

						borderWidth : 1,
					} ]
				},
				options : {
					responsive : false,
					scales : {
						yAxes : [ {
							ticks : {
								min : 0,
								max : 100,
								stepSize : 20
							}
						} ]
					},

					title : {
						display : true,
						text : '강의평가 통계'
					}
				}
			});
	
	// (TOP) 위로 보내기
	$(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });


	
</script>