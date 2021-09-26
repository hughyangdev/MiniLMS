<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/top2.jsp" />

<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4/locales-all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@4/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@4/main.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@4/main.min.css">

<style type="text/css">
	#contents{
		width: 90%;
		margin: 0 auto;
	}
	body{
		font-family: G마켓 산스 TTF;
	}
</style>
<div class="container">
<div class="text-left">
	<h1 class="text-center">학사일정 작성</h1>
</div>

    <%-- <jsp:include page="/calendarTest2.jsp" /> --%>


<div id="contents">

<br>

	<div id="centerBtn" class="text-right">

		<a data-toggle="modal" href="#addPlan"><button class="btn btn-outline-primary">일정 등록</button></a>
		<a data-toggle="modal" href="#modiPlan"><button class="btn btn-outline-success" onclick="location.href='#modiPlan'">일정 수정</button></a>
		<a data-toggle="modal" href="#delPlan"><button class="btn btn-outline-danger" onclick="location.href='#delPlan'">일정 삭제</button></a>

	</div>
	
	<!-- 일정 추가 Modal -->
	<div class="modal fade" id="addPlan" role="dialog">
		<div class="modal-dialog modal-dialog-centered">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
				<div class="row d-flex justify-content-center align-items-center">
					<button type="button" class="close" data-dismiss="modal" style="margin: 0 auto">×</button>
					<h3 class="modal-title">일정 등록</h3>
				</div>
				</div>
				<div class="modal-body">
					<form action="scheduleInsert.do" method="post">
						<table style="width: 100%; margin: 0 auto; border-collapse: separate; 
							border-spacing: 0px 30px; text-align: left; padding-left: 30px">
							<tr>
								<td>일정명</td>
								<td><input type="text" name="schcontents" id="schcontents"
									size="20" /></td>
							</tr>
							<tr>
								<td>일정 시작 날짜</td>
								<td><input type="date" name="schstartdate" id="schstartdate"
									size="20" /></td>
							</tr>
							<tr>
								<td>일정 종료 날짜</td>
								<td><input type="date" name="schenddate" id="schenddate"
									size="20" /></td>
							</tr>
							<!-- <input type="button" value="달력" onclick="$('#date3').datepicker('show');" /> -->
							<tr>
								<td><button class="btn btn-primary">일정 등록</button></td>
							</tr>
						</table>
						<br>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div> <!-- modal-dialog end -->
	</div> <!-- modal end -->


	<!-- 일정 수정 Modal -->
	<div class="modal fade" id="modiPlan" role="dialog">
		<div class="modal-dialog modal-dialog-centered">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
				<div class="row d-flex justify-content-center align-items-center">
					<button type="button" class="close" data-dismiss="modal" style="margin: 0 auto">×</button>
					<h3 class="modal-title">일정 수정</h3>
				</div>
				</div>
				<div class="modal-body">
					<h4>등록되어 있는 일정 목록</h4>
					<br>
					<c:if test="${allSchedule eq null or empty allSchedule}">
						<span class="text-info">등록된 일정이 존재하지 않습니다.</span>
					</c:if>
					<c:forEach var="sch" items="${allSchedule}" varStatus="st">
						<table style="width: 100%; margin: 0 auto; border-collapse: separate; 
							border-spacing: 0px 10px; text-align: left; padding-left: 30px">
								<tr><td><span>일정번호 : ${sch.schnum }</span></td></tr>
								<tr>
									<td>일정명 :</td>
									<td><input type="text" name="schcontentsEd" id="schcontentsEd${st.count }" value="${sch.schcontents}"></td>
								</tr>
								<tr>
									<td>일정 시작 날짜 :</td>
									<td><input type="date" name="schstartdateEd" id="schstartdateEd${st.count }" value="${sch.schstartdate}"></td>
								</tr>
								<tr>
									<td>일정 종료 날짜 :</td>
									<td><input type="date" name="schenddateEd" id="schenddateEd${st.count }" value="${sch.schenddate}"></td>
								</tr>
								<tr>
									<td>
										<button type="button" class="btn btn-success" id="btnModify" 
											onclick="scheduleEdit('${sch.schnum}', '${st.count }')">해당 일정 수정</button>
									</td>
								</tr>
						</table>
						<hr>
					</c:forEach>
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 일정 삭제 Modal -->
	<div class="modal fade" id="delPlan" role="dialog">
		<div class="modal-dialog modal-dialog-centered">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
				<div class="row d-flex justify-content-center align-items-center">
					<button type="button" class="close" data-dismiss="modal" style="margin: 0 auto">×</button>
					<h3 class="modal-title">일정 삭제</h3>
				</div>
				</div>
				<div class="modal-body">
					<h4>등록되어 있는 일정 목록</h4>
					<br>
					
					<c:if test="${allSchedule eq null or empty allSchedule}">
						<span class="text-info">등록된 일정이 존재하지 않습니다.</span>
					</c:if>
					<c:forEach var="sch" items="${allSchedule}">
					<div style="text-align: left; padding-left: 30px">
						<span>일정명 : ${sch.schcontents }</span><br>
						<span>일정시작시간 : ${sch.schstartdate }</span><br>
						<span>일정종료시간 : ${sch.schenddate }</span><br>
						<span>일정번호 : ${sch.schnum }</span><br>
						<button type="button" class="btn btn-danger" id="btnDelete" onclick="scheduleDel('${sch.schnum}')">해당 일정 삭제</button>
					</div><hr>
					</c:forEach>
					
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<!-- 삭제, 수정 폼 -->
<form name="delF">
	<input type="hidden" name="schnumDel" id="schnumDel">
</form>
<form name="editF">
	<input type="hidden" name="schnumE" id="schnumE">
	<input type="hidden" name="schcontentsE" id="schcontentsE">
	<input type="hidden" name="schstartdateE" id="schstartdateE">
	<input type="hidden" name="schenddateE" id="schenddateE">
</form>

<script type="text/javascript"> 
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins : [ 'interaction','dayGrid' ],
		editable : true,
		eventLimit : true, // allow "more" link when too many events
		//locale : 'ko',
		displayEventTime: true,
		disableDragging: true,
		//nextDayThreshold: '09:00:00',
		events : [ 
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

<script type="text/javascript">
	function scheduleDel(num){
		//alert(num);
		var yn = confirm(num+"번 일정을 삭제할까요?");
		if(!yn) return;
		delF.schnumDel.value = num;
		delF.method = 'post';
		delF.action = 'scheduleDelete.do';
		delF.submit();
	} //scheduleDel()--------
	
	function scheduleEdit(num, cnt){
		var yn = confirm(num+"번 일정을 수정할까요?");
		if(!yn) return;
		editF.schnumE.value = num;
		editF.schcontentsE.value = $('#schcontentsEd'+cnt).val();
		editF.schstartdateE.value = $('#schstartdateEd'+cnt).val();
		editF.schenddateE.value = $('#schenddateEd'+cnt).val();
		editF.method = 'post';
		editF.action = 'scheduleUpdate.do';
		editF.submit();
	} //scheduleEdit()------
</script>
	
<br>

	<div id="calendar" style="height: 100%"></div>

<br>

</div>
</div>
<jsp:include page="/foot2.jsp" />
