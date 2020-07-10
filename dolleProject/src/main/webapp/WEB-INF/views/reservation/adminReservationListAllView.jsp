<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드 투어 예약자 관리</title>
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
	
	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 예약자 관리 - 예약 현황</h1>
	
	<%-- 가져오는 데이터 확인 ${tourReservationListAll} --%>
 	
	<br/>
	<div style="width: 800px; height: 1200px; margin: auto;">
		<table id='reservation' class='tableCenter' style='border: 1px solid black; border-collapse: collapse;'>
			<tr>
				<td style="width: 90px;">
					예약 번호
				</td>
				<td style="width: 90px;">
					이름
				</td>
				<td class='resCss'>
					이메일
				</td>
				<td style="width: 140px;">
					예약한 투어 이름
				</td>
				<td style="width: 90px;">
					예약 날짜
				</td>
				<td style="width: 90px;">
					예약 인원
				</td>
				<td style="width: 90px;">
					입금 여부
				</td>
				<td style="width: 90px;">
					입금 시간
				</td>
			</tr>
			<c:forEach var='reservationVo' items='${tourReservationListAll}'>
				<tr class='resCss'>
					<td class='resCss idxNum'>
						${reservationVo.reserveNo}
					</td>
					<td class='resCss'>
						${reservationVo.memberName}
					</td>
					<td class='resCss'>
						${reservationVo.memberEmail}
					</td>
					<td class='resCss'>
						<c:if test="${reservationVo.tourNo eq 1}">
							성균관유생의하루
						</c:if>
					</td>
					<td class='resCss'>
						<fmt:formatDate value="${reservationVo.reserveTourDate}" pattern="yyyy-MM-dd" />
					</td>
					<td class='resCss'>
						${reservationVo.reserveApplyNum}
					</td>
					<td class='resCss'>
						<c:if test="${reservationVo.reserveDepositState == 'standby'}">
							미입금
						</c:if>
						<c:if test="${reservationVo.reserveDepositState == 'paid'}">
							승인 대기
						</c:if>
						<c:if test="${reservationVo.reserveDepositState == 'active'}">
							예약 완료
						</c:if>
						<c:if test="${reservationVo.reserveDepositState == 'canceled'}">
							예약 취소
						</c:if>
					</td>
					<td class='resCss'>
						<fmt:formatDate value="${reservationVo.reserveDepositDate}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>
</html>