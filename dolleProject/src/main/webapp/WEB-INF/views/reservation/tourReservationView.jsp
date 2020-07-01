<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>투어 예약 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
    	var date = new Date(); 
		var dateRawStr = document.getElementById("tourEndDateStr").childNodes[0].nodeValue;
		var dateStr = dateRawStr.replace(/(\s*)/g, "");
		var endYear = dateStr.substring(0, 4);
		var endMonth = dateStr.substring(5, 7);
		var endDay = dateStr.substring(8, 10);
		$("#datepicker").datepicker({ 
			dateFormat: "yy-mm-dd",
			maxDate: new Date(endYear, endMonth-1, endDay),
			minDate: 1
		});
    });
    function calculateFnc() {
    	document.getElementById("predictedTotal").value = document.getElementById("selectedTourPeopleNum").value * ${tourVo.tourPrice};
    }
	function pageMoveListOneFnc(){
		location.href = "listOne.do?tourNo=${tourVo.tourNo}";
	}
	function testFnc() {
		var hereInput = document.getElementById("here");
		hereInput.value = $("#datepicker").val();
		location.href = "reservationWithDate.do?tourNo=${tourVo.tourNo}&reserveTourDate=" + $("#datepicker").val();
	}
</script>
<style type="text/css">
	table, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
	}

    .ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; }
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: blue; }

</style>
</head>

<body>
	<div style="height: 220px; background-color: grey;"></div>
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
							<a>
								<fmt:formatDate value="${tourVo.tourStartDate}" pattern="yyyy-MM-dd" />
							</a>
							~
							<a id="tourEndDateStr">
								<fmt:formatDate value="${tourVo.tourEndDate}" pattern="yyyy-MM-dd" />
							</a>
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
	</div>
	<div style="width: 740px; height: 700px; background-color: lime; margin: auto;">
		<table style="width: 496px; margin: auto;">
			<tr>
				<td>
					<button style="width:220px; height:50px;
						font:normal bold 18px Segoe UI; color:white; 
						background-color: #0D4371; border:0px;">선택한 투어
					</button>
				</td>
				<td>${tourVo.tourName}</td>
			</tr>
			<tr>
				<td colspan="2">
					<button style="width:220px; height:50px;
						font:normal bold 18px Segoe UI; color:white; 
						background-color: #0D4371; border:0px;">투어 날짜
					</button>
				</td>
			</tr>
			<!-- 달력 구현 부분 -->
			<tr>
				<td colspan="2">
					<div id="datepicker" onchange="testFnc();"></div>
					<input id="here" type="text" value="">
				</td>
			</tr>
			<tr>
				<td>
					<button style="width:220px; height:50px;
						font:normal bold 18px Segoe UI; color:white; 
						background-color: #0D4371; border:0px;">예약 현황
					</button>
				</td>
				<td>변하는 값 / ${tourVo.tourPeopleNum}</td>
			</tr>
			<tr>
				<td>
					<button style="width:220px; height:50px;
						font:normal bold 18px Segoe UI; color:white; 
						background-color: #0D4371; border:0px;">투어 인원
					</button>
				</td>
				<td>
					<input id="selectedTourPeopleNum" type="number" min="0" max="${tourVo.tourPeopleNum}" value="" onchange="calculateFnc();">
				</td>
			</tr>
			<tr>
				<td>
					<button style="width:220px; height:50px;
						font:normal bold 18px Segoe UI; color:white; 
						background-color: #0D4371; border:0px;">결제 방법
					</button>
				</td>
				<td>계좌이체</td>
			</tr>
			<tr>
				<td>
					<button style="width:220px; height:50px;
						font:normal bold 18px Segoe UI; color:white; 
						background-color: #0D4371; border:0px;">결제 예상 금액
					</button>
				</td>
				<td id="test"><input id="predictedTotal" type="text" value=""> 원</td>
			</tr>
			<tr>
				<td>
					<button style="width:220px; height:50px;
						font:normal bold 18px Segoe UI; color:white; 
						background-color: #0D4371; border:0px;">결제 계좌
					</button>
				</td>
				<td>${tourVo.tourStartingPoint}</td>
			</tr>
		</table>
	</div>
	<div style="text-align: center;">
		<div style="margin-top: 20px;">
			<button style="width:220px; height:50px;
			font:normal bold 18px Segoe UI; color:white; 
			background-color: #0D4371; border:0px;">예약 신청 하기</button>
			<button style="width:220px; height:50px;
			font:normal bold 18px Segoe UI; color:white; 
			background-color: #0D4371; border:0px;" onclick="pageMoveListOneFnc();">뒤로 가기</button>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>