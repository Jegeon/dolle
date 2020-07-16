<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드 투어 예약 일정 조회 달력</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
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
	
	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 예약 일정 조회 달력</h1>
	
	<%-- 가져오는 데이터 확인 ${tourList} --%>
	<br/>
<!-- 	<div style="width: 740px; height: 1200px; margin: auto;"> -->
<!-- 		<table> -->
<%-- 			<c:forEach var='reservationVo' items='${tourReservationList}'> --%>
<!-- 				<tr> -->
<!-- 					<td class='daehanFont' style="text-align: right;"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${reservationVo.reserveTourDay eq '토'}"> --%>
<!-- 								<a style="color: #3B9DDA;"> -->
<%-- 									<fmt:formatDate value="${reservationVo.reserveTourDate}" pattern="d"/>${reservationVo.reserveTourDay} --%>
<!-- 								</a> -->
<%-- 							</c:when> --%>
<%-- 							<c:when test="${reservationVo.reserveTourDay eq '일'}"> --%>
<!-- 								<a style="color: #EF4044;"> -->
<%-- 									<fmt:formatDate value="${reservationVo.reserveTourDate}" pattern="d"/>${reservationVo.reserveTourDay} --%>
<!-- 								</a> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<fmt:formatDate value="${reservationVo.reserveTourDate}" pattern="d"/>${reservationVo.reserveTourDay} --%>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 					</td> -->
<!-- 					<td style="width: 500px; padding-left: 20px;"> -->
<%-- 						<c:if test="${reservationVo.reserveApplyNumSum eq 0}"></c:if> --%>
<%-- 						<c:if test="${reservationVo.reserveApplyNumSum ne 0}"> --%>
<%-- 							<c:forEach var='tourVo' items='${tourList}'> --%>
<%-- 								<c:if test="${tourVo.tourNo eq 1}">${tourVo.tourStartTime} ~ ${tourVo.tourEndTime}</c:if> --%>
<%-- 							</c:forEach> --%>
<%-- 							${reservationVo.tourNo}${reservationVo.tourName} (${reservationVo.reserveApplyNumSum}명) --%>
<%-- 						</c:if> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table> -->
<!-- 	</div> -->

	<div style="width: 1260px; height: 600px; background-image: url('/dolleProject/resources/images/GzoneBackGround.png'); text-align:center; margin: auto;">
		<div style="font-size: 40px; font-family: 대한민국정부상징체; padding-top: 200px;">
			페이지 준비중입니다. 다른 페이지를 둘러보세요!
		</div>
	</div>
	
	<div style="margin-bottom: 20px;">
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>
</html>