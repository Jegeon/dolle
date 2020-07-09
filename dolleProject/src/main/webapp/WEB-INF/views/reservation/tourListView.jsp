<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>투어 예약 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<script type="text/javascript">

</script>
<style type="text/css">
	button {
		width : 150px;
	}
	table, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
		vertical-align: middle;
	}
	.daehanFont {
		font-size: 30px; 
		font-family: 대한민국정부상징체 ; 
	}
	.ahreum {
		width:220px; 
		height:50px;
		font:normal bold 18px Segoe UI; 
		color:white; 
		background-color: #0D4371;
		border:0px;
		text-align: center;
		vertical-align: middle;
	}
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	관리자용 예약 관리 테스트 링크 이동 버튼
	<button onclick="location.href='../reservation/reservationSchedule.do'">예약일정</button>adminReservationScheduleView<br>
	<button onclick="location.href='../reservation/reservationListAll.do'">예약현황(전체)</button>adminReservationListAllView<br>
	<button onclick="location.href='../reservation/reservationListStandby.do'">예약현황(미입금자)</button>adminReservationListStandbyView<br>
	<button onclick="location.href='../reservation/reservationListCanceled.do'">예약현황(취소자)</button>adminReservationListCanceledView<br>
	<button onclick="location.href='../reservation/reservationSchedule.do'">예약페이지 관리</button>adminReservationPageView<br>
	
	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 예약</h1>
	<br/>
	<c:forEach var="tourVo" items="${tourList}">
		<div style="width: 740px; height: 360px; margin: auto;">
			<div style="width: 240px; height: 260px; border: 1px solid black; float: left;">
				<div onclick="location.href='../reservation/listOne.do?tourNo=${tourVo.tourNo}'" style="cursor:pointer;">
					이미지 넣을 예정
					<br>
					여기 누르면 링크 이동
				</div>
			</div>
			<div style="width: 496px; height: 260px; border: 1px solid black; float: left;">
				<div>
					<table style="width: 496px; height: 260px;">
						<tr>
							<td class="daehanFont" colspan="2" style="text-align: center;">${tourVo.tourName}</td>
						</tr>
						<tr>
							<td class="ahreum">기간</td>
							<td>
								<fmt:formatDate value="${tourVo.tourStartDate}" pattern="yyyy-MM-dd" />
								~
								<fmt:formatDate value="${tourVo.tourEndDate}" pattern="yyyy-MM-dd" />
							</td>
						</tr>
						<tr>
							<td class="ahreum">시간</td><td>${tourVo.tourStartTime} ~ ${tourVo.tourEndTime}</td>
						</tr>
						<tr>
							<td class="ahreum">모집 인원</td><td>${tourVo.tourPeopleNum}</td>
						</tr>
						<tr>
							<td class="ahreum">출발지</td><td>${tourVo.tourStartingPoint}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>