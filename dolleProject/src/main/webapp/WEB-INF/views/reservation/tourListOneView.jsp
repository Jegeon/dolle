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
	function pageMoveListFnc(){
		location.href = "list.do";
	}
	function pageMoveReservationFnc(){
		var hiddenMemberNoInputValue = document.getElementById("hiddenMemberNoInput").value;
		if(hiddenMemberNoInputValue != "") {
			location.href = "reservation.do?tourNo=${tourVo.tourNo}";
		}else {
			alert("예약을 위해 로그인이 필요합니다");
			var confirmStr = "";
			confirmStr = confirm("로그인 페이지로 이동하시겠습니까?");
			if(confirmStr) {
				location.href = "../auth/login.do";	
			}
		}
	}
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

	<!-- 로그인 체크 hidden input 시작 -->
	<input type="hidden" id="hiddenMemberNoInput" value="${sessionScope._memberVo_.no}">
	<!-- 로그인 체크 hidden input 끝 -->
	
	<h1>가이드 투어 예약 상세</h1>
	<br/>
	<div style="width: 740px; height: 300px; border: 1px solid black; margin: auto;">
		<div style="width: 240px; height: 180px; border: 1px solid black; float: left;">
			<div style="cursor:pointer;">이미지 넣을 예정</div>
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
						<td>인당 가격</td><td>${tourVo.tourPrice}원 / 1인</td>
					</tr>
					<tr>
						<td>출발지</td><td>${tourVo.tourStartingPoint}</td>
					</tr>
					<tr>
						<td colspan="2">${tourVo.tourContent}</td>
					</tr>
				</table>
			</div>
		</div>
		<div style="margin-top: 20px;">
			<button style="width:220px; height:50px;
			font:normal bold 18px Segoe UI; color:white; 
			background-color: #0D4371; border:0px;" onclick="pageMoveListFnc();">목록으로</button>
			<button style="width:220px; height:50px;
			font:normal bold 18px Segoe UI; color:white; 
			background-color: #0D4371; border:0px;" onclick="pageMoveReservationFnc();">예약하기</button>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>