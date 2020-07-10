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

	<!-- 관리자 체크 hidden input 시작 -->
	<input type="hidden" id="hiddenMemberGradeInput" value="${sessionScope._memberVo_.grade}">
	<!-- 관리자 체크 hidden input 끝 -->
	
	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 예약페이지 관리 상세(투어관리)</h1>
	<br/>
	<div style="width: 740px; height: 460px; margin: auto;">
		<div style="width: 240px; height: 380px; border: 1px solid black; float: left;">
			<div style="cursor:pointer;">이미지 넣을 예정</div>
		</div>
		<div style="width: 496px; height: 380px; border: 1px solid black; float: left;">
			<div>
				<table style="width: 496px; height: 380px;">
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
						<td class="ahreum">인당 가격</td><td>${tourVo.tourPrice}원 / 1인</td>
					</tr>
					<tr>
						<td class="ahreum">출발지</td><td>${tourVo.tourStartingPoint}</td>
					</tr>
					<tr>
						<td colspan="2">${tourVo.tourContent}</td>
					</tr>
				</table>
			</div>
		</div>
		<div style="margin: auto; clear:both; width: 700px; text-align: center;">
			<button class="ahreum" onclick="pageMoveUpdateFnc();">수정하기</button>
			<button class="ahreum" onclick="pageMoveDeleteFnc();">삭제하기</button>
			<button class="ahreum" onclick="pageMoveListFnc();">목록으로</button>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>