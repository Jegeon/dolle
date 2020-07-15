<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드 투어 예약페이지 관리(투어관리)</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
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

	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 예약페이지 관리(투어관리, 추가, 수정, 삭제 등 가능)</h1>
	<br/>
	<c:forEach var="tourVo" items="${tourList}">
		<div style="width: 740px; height: 360px; margin: auto;">
			<div style="width: 240px; height: 260px; border: 1px solid black; float: left;">
				<div onclick="location.href='../reservation/reservationPageDetail.do?tourNo=${tourVo.tourNo}'" style="cursor:pointer;">
					<div>
					이미지 넣을 예정
					<img alt="review_photo" src="<c:url value='/img/${tourVo.fileStoredName}'/>" style="position: relative; height:100%; width:100%;">
				</div>
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
	
	<div style="text-align: center; margin-bottom: 20px;">
		<div>
			<button class="ahreum" onclick="location.href='../reservation/reservationPageAdd.do'">투어 만들기</button>
			<button class="ahreum" onclick="location.href='../reservation/reservationPageClose.do'">휴무일 변경하기</button>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>
</html>