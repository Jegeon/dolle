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
		width : 74px;
	}
	table, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<h1>가이드 투어 예약</h1>
	<br/>
	<c:forEach var="tourVo" items="${tourList}">
		<div style="width: 740px; height: 220px; border: 1px solid black; margin: auto;">
			<div style="width: 240px; height: 180px; border: 1px solid black; float: left;">
				<div onclick="location.href='../reservation/listOne.do?tourNo=${tourVo.tourNo}'" style="cursor:pointer;">이미지 넣을 예정</div>
			</div>
			<div style="width: 496px; height: 180px; border: 1px solid black; float: left;">
				<div>
					<table style="width: 496px; height: 180px;">
						<tr>
							<td colspan="2" style="text-align: center;">${tourVo.tourName}</td>
						</tr>
						<tr>
							<td>기간</td>
							<td>
								<fmt:formatDate value="${tourVo.tourStartDate}" pattern="yyyy-MM-dd" />
								~
								<fmt:formatDate value="${tourVo.tourEndDate}" pattern="yyyy-MM-dd" />
							</td>
						</tr>
						<tr>
							<td>시간</td><td>${tourVo.tourStartTime} ~ ${tourVo.tourEndTime}</td>
						</tr>
						<tr>
							<td>모집 인원</td><td>${tourVo.tourPeopleNum}</td>
						</tr>
						<tr>
							<td>출발지</td><td>${tourVo.tourStartingPoint}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>