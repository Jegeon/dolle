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
		border-collapse: collapse;
		vertical-align: middle;
	}
	.daehanFont {
		font-size: 30px; 
		font-family: 대한민국정부상징체 ; 
	}
	.uzin {
		border: 1px solid #A5A5A5;
		border-radius: 4px;
		width:150px;
		height: 33px;
		float: left;
		box-sizing:border-box;
		margin-top:10px;
		margin-left: 20px;
		padding-top: 7px;
		font-size: 15px;
		font-weight: 600;
		font-family: Arial;
		text-align: center;
		vertical-align: middle;
	}
	.titleColor {
		color: #0D4371;
	}
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div style="width:1260px; height:55px; margin:0 auto;" >
		<h1 class="daehanFont" style="margin: 10px 0px 10px 129px;">가이드 투어 예약</h1>
	</div>		
	
	<c:forEach var="tourVo" items="${tourList}">
		<div style="width: 1000px; height: 360px; border-top: 2px solid #707070; margin: auto; cursor:pointer;" onclick="location.href='../reservation/listOne.do?tourNo=${tourVo.tourNo}'">
			<div style="width: 840px; height: 260px; margin:0px auto; margin-top: 50px;">
				<div style="width: 300px; height: 260px; float: left;">
					<div style="width: 300px; height: 260px;">
						<img alt="review_photo" src="<c:url value='/img/${tourVo.fileStoredName}'/>" style="position: relative; height:100%; width:100%;">
					</div>
				</div>
				<div style="width: 450px; height: 260px; margin-left: 50px; float: left;">
					<div>
						<table style="width: 450px; height: 260px;">
							<tr>
								<td class="daehanFont titleColor" colspan="2" style="text-align: center;">
									${tourVo.tourName}
								</td>
							</tr>
							<tr>
								<td class="uzin">기간</td>
								<td>
									<fmt:formatDate value="${tourVo.tourStartDate}" pattern="yyyy-MM-dd" />
									~
									<fmt:formatDate value="${tourVo.tourEndDate}" pattern="yyyy-MM-dd" />
								</td>
							</tr>
							<tr>
								<td class="uzin">시간</td>
								<td>${tourVo.tourStartTime} ~ ${tourVo.tourEndTime}</td>
							</tr>
							<tr>
								<td class="uzin">모집 인원</td>
								<td>${tourVo.tourPeopleNum} 명</td>
							</tr>
							<tr>
								<td class="uzin">출발지</td>
								<td>${tourVo.tourStartingPoint}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div style="width: 1000px; height: 10px; border-top: 2px solid #707070; margin: auto;"></div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>