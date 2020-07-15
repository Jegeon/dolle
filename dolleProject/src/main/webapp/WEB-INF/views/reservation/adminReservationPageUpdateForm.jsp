<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드 투어 예약페이지 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<!-- 달력관련 다운로드 시작-->
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<!-- 달력관련 다운로드 끝--> 
<script type="text/javascript">
	$(document).ready(function() {
		// 달력 스크립트
		var clareCalendar = {
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
					'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy-mm-dd', //형식(2012-03-03)
			changeMonth : true, //월변경가능
			changeYear : true, //년변경가능
			showMonthAfterYear : true, //년 뒤에 월 표시
			buttonImageOnly : true, //이미지표시
			buttonImage : '/dolleProject/resources/images/starSolid.png', //이미지주소
			showOn : "both", //엘리먼트와 이미지 동시 사용(both,button)
			minDate: 2,
		};
		$("#fromDt").datepicker(clareCalendar);
		$("#toDt").datepicker(clareCalendar);
		$("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
		$("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김  
	});
	
	function pageMoveDeleteFnc() {
		location.href = "reservationPageDelete.do";
	}
	function pageMoveListFnc() {
		location.href = "reservationPage.do";
	}
	
	function validationFnc(){
		var tourStartDateObjValue = document.getElementById("tourStartDate").value;
		var tourEndDateObjValue = document.getElementById("tourEndDate").value;
		var errorStr = "수정이 불가능합니다";
		var errorCode1 = "투어 시작 날짜 입력 필요";
		var errorCode2 = "투어 종료 날짜 입력 필요";
		if (!tourStartDateObjValue) {
			alert(errorStr + " - " + errorCode1);
			return false;
		}
		if (!tourEndDateObjValue) {
			alert(errorStr + " - " + errorCode2);
			return false;
		}
	}
	function carryStartDateTextToDateFnc() {
		var fromDtObj = document.getElementById("fromDt");
		var end_ymd = fromDtObj.value;    
	    var yyyy = end_ymd.substr(0,4);
	    var mm = end_ymd.substr(5,2);
	    var dd = end_ymd.substr(8,2);                        
	    var com_ymd = new Date(yyyy, mm-1, dd);
	    alert(com_ymd);
		var hiddenTourStartDateObj = document.getElementById("tourStartDate");
		hiddenTourStartDateObj.value = fromDtObj.value;
	}
	function carryEndDateTextToDateFnc() {
		var toDtObj = document.getElementById("toDt");
		var end_ymd1 = toDtObj.value;    
	    var yyyy1 = end_ymd1.substr(0,4);
	    var mm1 = end_ymd1.substr(5,2);
	    var dd1 = end_ymd1.substr(8,2);                        
	    var com_ymd1 = new Date(yyyy1, mm1-1, dd1);
	    alert(com_ymd1);
		var hiddenTourEndDateObj = document.getElementById("tourEndDate");
		hiddenTourEndDateObj.value = toDtObj.value;
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

	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 예약페이지 수정</h1>
	<br/>
	<div style="width: 980px; height: 800px; margin: auto;">
		<form action="./reservationPageUpdateCtr.do" method="post" onsubmit='return validationFnc();' enctype="multipart/form-data">
			<div style="width: 400px; height: 740px; border: 1px solid black; float: left;">
				<div style="cursor:pointer;">이미지 넣을 예정</div>
				<input id="fileBtn" type="file" name="file" >
			</div>
			<div style="width: 576px; height: 740px; border: 1px solid black; float: left;">
				<div>
					<table style="width: 576px; height: 740px;">
						<tr>
							<td class="ahreum">투어명</td>
							<td>
								<input type="text" name="tourName" value="${tourVo.tourName}">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 시작일 및 종료일</td>
							<td>
								<input type="text"   
								id="fromDt" size="8" title="시작일자" onchange="carryStartDateTextToDateFnc();"> ~
								<input type="text" 
								id="toDt" size="8" title="종료일자" onchange="carryEndDateTextToDateFnc();">  
								<input type="hidden" id="tourStartDate" name="tourStartDate" value="">
								<input type="hidden" id="tourEndDate" name="tourEndDate" value="">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 출발시간 및 종료시간</td>
							<td>
								<input type="text" name="tourStartTime" value="${tourVo.tourStartTime}"> ~
								<input type="text" name="tourEndTime" value="${tourVo.tourEndTime}">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 최대 인원</td>
							<td>
								<input type="number" name="tourPeopleNum" value="${tourVo.tourPeopleNum}">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 인당 가격</td>
							<td>
								<input type="number" name="tourPrice" value="${tourVo.tourPrice}">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 출발지</td>
							<td>
								<input type="text" name="tourStartingPoint" value="${tourVo.tourStartingPoint}">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 내용</td>
							<td>
								<textarea id="tourContent" name="tourContent" rows="" cols="" placeholder="내용을 입력해주세요."
							 	style="width:270px; height:200px; font-size:17px; box-sizing:border-box;">
							 		${tourVo.tourContent}
					 			</textarea>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div style="margin: auto; clear:both; width: 700px; text-align: center;">
				<input type="hidden" name="tourNo" value="${tourVo.tourNo}">
				<input type="submit" class="ahreum" value="수정하기">
				<button type="button" class="ahreum" onclick="pageMoveUpdateFnc();">삭제하기</button>
				<button type="button" class="ahreum" onclick="pageMoveListFnc();">목록으로</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>