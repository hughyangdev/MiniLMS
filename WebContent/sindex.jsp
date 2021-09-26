<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/top.jsp" />
<script>
	/* 	$(window).load(function() {
	 var m = '${param.m}';

	 $('#topheader .navbar-nav a').click(
	 function(e) {
	 $('#topheader .navbar-nav').find('li.active').removeClass(
	 'active');
	 $(this).parent('li').addClass('active');
	 $('.' + m).parent('li').addClass('active')
	 e.preventDefault();
	 return false;
	 });
	 }) */
</script>

<style type="text/css">
	.fc-right{
		text-align: right;
	}
	.fc-toolbar.fc-header-toolbar{
		font-size: 9pt;
		margin-bottom: 1em;
	}
</style>

<div class="text-left">
	<h1 class="text-center">${msg}</h1>
	<div class="py-5" style="">
		<div class="container">
			<div class="row">
				<div class="col-md-7" style="">
					<div class="row">
						<div class="table-responsive" style="">
							<ul style="list-style-type: square">
								<h4>
									<li>공지사항</li>
								</h4>
							</ul>
							<table class="table" style="font-size:11pt">
								<thead class="text-center">
									<tr>
										<th style="width: 20%">번호</th>
										<th style="width: 45%">제목</th>
										<th style="width: 35%">업로드 날짜</th>
									</tr>
								</thead>
								<tbody class="text-center">
								<c:if test="${notice eq null or empty notice}">
									<tr>
										<td colspan="3">최근 3개의 공지사항 글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${notice ne null and not empty notice }">
									<c:forEach var="n" items="${notice }">
										<tr>
											<td>${n.nnum }</td>
											<td>${n.ntitle }</td>
											<td>${n.ndate }</td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							</table>

						</div>

					</div>
					<div class="row mt-3">
						<ul style="list-style-type: square">
							<h4>
								<li>자유게시판</li>
							</h4>
						</ul>
						<table class="table" style="font-size:11pt">
							<thead class="text-center">
								<tr>
									<th style="width: 20%">번호</th>
									<th style="width: 45%">제목</th>
									<th style="width: 35%">업로드 날짜</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<c:if test="${board eq null or empty board}">
									<tr>
										<td colspan="3">최근 3개의 자유 게시글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${board ne null and not empty board }">
									<c:forEach var="b" items="${board }">
										<tr>
											<td>${b.bNum }</td>
											<td>${b.bTitle }</td>
											<td>${b.bDate }</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-md-5" id="contents">
					<ul style="list-style-type: square">
						<h4>
							<li>학사일정</li>
						</h4>
					</ul>
					<div id="calendar" style="font-size:11pt"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript"> 
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		aspectRatio: 0.9,
		plugins : [ 'interaction','dayGrid' ],
		editable : false,
		eventLimit : true, // allow "more" link when too many events
		//locale : 'ko',
		displayEventTime: true,
		disableDragging: true,
		//nextDayThreshold: '09:00:00',
		header: {
			left: 'title',
			center: '',
			right: 'prev,next'
		},
		events: [ 
			<c:forEach items="${allSchedule}" var="sch">
			{
				title : '${sch.schcontents}',
				start : '${sch.schstartdate}',
				end : '${sch.schenddate}',
				allDay: true
			}, 
			</c:forEach>
			{
				title : '',
				// url : 'http://google.com/',
				start : '',
				end : ''
			}],
	});
	calendar.render();
});

</script>
<jsp:include page="/foot.jsp" />