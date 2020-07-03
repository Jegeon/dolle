<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>투어 예약 완료</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<script type="text/javascript">

</script>
<style type="text/css">
	.ahreum {
		width:220px; 
		height:50px;
		font:normal bold 18px Segoe UI; 
		color:white; 
		background-color: #0D4371;
		border:0px;
		text-align: center;
	}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<h1 style="text-align: center;">예약이 성공적으로 신청되었습니다</h1>
	<br/>
	<div style="width: 740px; height: 640px; border: 1px solid black; margin: auto;">
		<div style="width: 496px; height: 450px; border: 1px solid black; margin: auto;">
			<div>
				<table style="width: 496px; height: 400px;">
					<tr>
						<td colspan="2" style="text-align: center;">${tourVo.tourName}</td>
					</tr>
					<tr>
						<td class="ahreum">투어 예약 신청 번호</td>
						<td>
							${reservationVo.reserveNo}
						</td>
					</tr>
					<tr>
						<td class="ahreum">투어 예약 날짜</td>
						<td>
							<fmt:formatDate value="${reservationVo.reserveTourDate}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<tr>
						<td class="ahreum">투어 예약 시간</td><td>${tourVo.tourStartTime} ~ ${tourVo.tourEndTime}</td>
					</tr>
					<tr>
						<td class="ahreum">투어 예약 인원</td><td>${reservationVo.reserveApplyNum}</td>
					</tr>
					<tr>
						<td class="ahreum">결제 가격</td><td>${tourVo.tourPrice * reservationVo.reserveApplyNum}</td>
					</tr>
					<tr>
						<td class="ahreum">결제 방법</td><td>계좌이체</td>
					</tr>
					<tr>
						<td class="ahreum">예약 승인 상태</td>
						<c:if test="${reservationVo.reserveDepositState eq 'standby'}">
							<td>대기 중</td>
						</c:if>
						<c:if test="${reservationVo.reserveDepositState eq 'active'}">
							<td>승인 완료</td>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
		<div style="text-align: center;">
			<a>내 정보 페이지에서 입금 완료시 예약이 승인됩니다.</a>
		</div>
		<div style="text-align: center;">
			<div style="margin-top: 20px;">
				<button class="ahreum" onclick="pageMoveListFnc();">목록으로</button>
				<button class="ahreum" onclick="pageMoveReservationFnc();">예약하기</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>