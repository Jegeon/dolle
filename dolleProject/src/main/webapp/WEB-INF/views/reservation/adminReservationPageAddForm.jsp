<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드 투어 예약페이지 추가</title>
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
	
	function pageMoveListFnc() {
		location.href = "reservationPage.do";
	}
	function validationFnc(){
		alert("check작동");
		
		// ObjValue 모음 시작
		var tourNameObjValue = $("#tourName").val();
		var tourStartDateObjValue = $("#tourStartDate").val();
		var tourEndDateObjValue = $("#tourEndDate").val();
		var tourStartTimeObjValue = $("#tourStartTime").val();
		var tourEndTimeObjValue = $("#tourEndTime").val();
		var tourPeopleNumObjValue = $("#tourPeopleNum").val();
		var tourPriceObjValue = $("#tourPrice").val();
		var tourStartingPointObjValue = $("#tourStartingPoint").val();
		var tourContentObjValue = $("#tourContent").val();
		// ObjValue 모음 끝
		
		var errorStr = "추가가 불가능합니다";
		var errorCode1 = "투어 이름 입력 필요";
		var errorCode2 = "투어 시작일 입력 필요";
		var errorCode3 = "투어 종료일 입력 필요";
		var errorCode4 = "투어 출발시간 입력 필요";
		var errorCode5 = "투어 종료시간 입력 필요";
		var errorCode6 = "투어 인원 입력 필요";
		var errorCode7 = "투어 가격 입력 필요";
		var errorCode8 = "투어 출발지 입력 필요";
		var errorCode9 = "투어 내용 입력 필요";
		
		if (tourNameObjValue == null || tourNameObjValue == "" || tourNameObjValue.length == 0) {
			alert(errorStr + " - " + errorCode1);
			return false;
		}
		if (tourStartDateObjValue == null || tourStartDateObjValue == "" || tourStartDateObjValue.length == 0) {
			alert(errorStr + " - " + errorCode2);
			return false;
		}
		if (!tourEndDateObjValue || tourEndDateObjValue=="") {
			alert(errorStr + " - " + errorCode3);
			return false;
		}
		if (!tourStartTimeObjValue || tourStartTimeObjValue=="") {
			alert(errorStr + " - " + errorCode4);
			return false;
		}
		if (!tourEndTimeObjValue || tourEndTimeObjValue=="") {
			alert(errorStr + " - " + errorCode5);
			return false;
		}
		if (!tourPeopleNumObjValue || tourPeopleNumObjValue==0) {
			alert(errorStr + " - " + errorCode6);
			return false;
		}
		if (!tourPriceObjValue || tourPriceObjValue==0) {
			alert(errorStr + " - " + errorCode7);
			return false;
		}
		 if (!tourStartingPointObjValue || tourStartingPointObjValue=="") {
					alert(errorStr + " - " + errorCode8);
					return false;
			}
		 if (!tourContentObjValue || tourContentObjValue=="") {
					alert(errorStr + " - " + errorCode9);
					return false;
			}
		
		return true;
	}
	
	function addFormFnc(){
		if(validationFnc() == true){
			$("#addForm").submit();
		}
	}
	
	function carryStartDateTextToDateFnc() {
		var fromDtObj = document.getElementById("fromDt");
		var end_ymd = fromDtObj.value;    
	    var yyyy = end_ymd.substr(0,4);
	    var mm = end_ymd.substr(5,2);
	    var dd = end_ymd.substr(8,2);                        
	    var com_ymd = new Date(yyyy, mm-1, dd);
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

	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 예약페이지 추가</h1>
	<br/>
	<div style="width: 980px; height: 800px; margin: auto;">
		<form id="addForm" action="./reservationPageAddCtr.do" method="post">
			<div style="width: 400px; height: 740px; border: 1px solid black; float: left;">
				<div style="cursor:pointer;">이미지 넣을 예정</div>
			</div>
			<div style="width: 576px; height: 740px; border: 1px solid black; float: left;">
				<div>
					<table style="width: 576px; height: 740px;">
						<tr>
							<td class="ahreum">투어명</td>
							<td>
								<input type="text" id="tourName" name="tourName" value="" placeholder="투어 이름을 입력하세요">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 시작일 및 종료일</td>
							<td>
								<input type="text"   
								id="fromDt" size="8" title="시작일자" placeholder="투어 시작일" 
								onchange="carryStartDateTextToDateFnc();"> ~
								<input type="text" 
								id="toDt" size="8" title="종료일자" placeholder="투어 종료일"  
								onchange="carryEndDateTextToDateFnc();">  
								<input type="hidden" id="tourStartDate" name="tourStartDate" value="">
								<input type="hidden" id="tourEndDate" name="tourEndDate" value="">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 출발시간 및 종료시간</td>
							<td>
								<input type="text" id="tourStartTime" name="tourStartTime" value="" placeholder="09:00"> ~
								<input type="text" id="tourEndTime" name="tourEndTime" value="" placeholder="18:00">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 최대 인원</td>
							<td>
								<input type="number" id="tourPeopleNum" name="tourPeopleNum" value="" placeholder="10 (숫자를 입력하세요)">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 인당 가격</td>
							<td>
								<input type="number" id="tourPrice" name="tourPrice" value="" placeholder="9800 (숫자만 입력하세요)">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 출발지</td>
							<td>
								<input type="text" id="tourStartingPoint" name="tourStartingPoint" value="" placeholder="출발지를 입력하세요">
							</td>
						</tr>
						<tr>
							<td class="ahreum">투어 내용</td>
							<td>
								<textarea id="tourContent" name="tourContent" rows="" cols="" placeholder="내용을 입력해주세요"
								style="width:270px; height:200px; font-size:17px; box-sizing:border-box;"></textarea>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div style="margin: auto; clear:both; width: 700px; text-align: center;">
				<!-- <input type="hidden" name="tourNo" value=""> -->
				<input type="button" onclick='addFormFnc();' class="ahreum" value="추가하기">
				<button class="ahreum" type="button" onclick="pageMoveListFnc();">목록으로</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>