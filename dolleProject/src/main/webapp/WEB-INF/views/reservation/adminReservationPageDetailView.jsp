<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드 투어 예약페이지 관리 상세(투어관리)</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = "reservationPage.do";
	}
	function pageMoveDeleteFnc(){
		var confirmStr = "";
		confirmStr = confirm("정말 삭제하시겠습니까?");
		if(confirmStr) {
			location.href = "reservationPageDelete.do?tourNo=${tourVo.tourNo}";	
		}else {
			return false;
		}
	}
	function pageMoveUpdateFnc(){
		var hiddenMemberGradeInputValue = document.getElementById("hiddenMemberGradeInput").value;
		if(hiddenMemberGradeInputValue == "admin") {
			location.href = "reservationPageUpdate.do?tourNo=${tourVo.tourNo}";
		}else {
			alert("관리자 외에는 접근이 불가능합니다");
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
		border-collapse: collapse;
		vertical-align: middle;
	}
	.daehanFont {
		font-size: 30px; 
		font-family: 대한민국정부상징체 ; 
	}
	.ahreum {
		width:200px; 
		height:45px;
		font:normal bold 18px Segoe UI; 
		color:white; 
		background-color: #0D4371;
		border:0px;
		text-align: center;
		vertical-align: middle;
		cursor:pointer;
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

	<!-- 관리자 체크 hidden input 시작 -->
	<input type="hidden" id="hiddenMemberGradeInput" value="${sessionScope._memberVo_.grade}">
	<!-- 관리자 체크 hidden input 끝 -->
	
	<div style="width:1260px; height:55px; margin:0 auto;" >
		<h1 class="daehanFont" style="margin: 10px 0px 10px 129px;">가이드 투어 예약페이지 관리 상세</h1>
	</div>
	<div style="width: 1000px; height: 560px; border-top: 2px solid #707070; margin: auto;">
		<div style="width: 840px; height: 360px; margin-top: 50px;">
			<div style="width: 300px; height: 260px; float: left;">
				<div>
					<img alt="review_photo" src="<c:url value='/img/${tourVo.fileStoredName}'/>" style="position: relative; height:100%; width:100%;">
				</div>
			</div>
			<div style="width: 450px; height: 360px; margin-left: 50px; float: left;">
				<div>
					<table style="width: 450px; height: 360px;">
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
							<td class="uzin">인당 가격</td>
							<td>
								<fmt:formatNumber value="${tourVo.tourPrice}" pattern="#,###" /> 원 / 1인
							</td>
						</tr>
						<tr>
							<td class="uzin">출발지</td>
							<td>${tourVo.tourStartingPoint}</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-left: 20px;">${tourVo.tourContent}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div style="width: 1000px; height: 10px; border-top: 2px solid #707070; margin: 20px auto;"></div>
		
		<div style="margin: auto; clear:both; width: 840px; text-align: center;">
			<button class="ahreum" onclick="pageMoveUpdateFnc();">수정하기</button>
			<button class="ahreum" onclick="pageMoveDeleteFnc();">삭제하기</button>
			<button class="ahreum" onclick="pageMoveListFnc();">목록으로</button>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>