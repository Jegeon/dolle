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
			minDate: 1,
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
		var closedStartDateObjValue = document.getElementById("closedStartDate").value;
		var closedEndDateObjValue = document.getElementById("closedEndDate").value;
		var closedContentObjValue = document.getElementById("closedContent").value;
		var errorStr = "수정이 불가능합니다";
		var errorCode1 = "휴무일 시작 날짜 입력 필요";
		var errorCode2 = "휴무일 종료 날짜 입력 필요";
		if (!closedStartDateObjValue) {
			alert(errorStr + " - " + errorCode1);
			return false;
		}
		if (!closedEndDateObjValue) {
			alert(errorStr + " - " + errorCode2);
			return false;
		}
		// 글자수 시작
		if(closedContentObjValue.length > 166){	//글자수 제한
			alert("내용은 166자까지 입력 가능합니다.");
			var closedContentStr = closedContentObjValue.substr(0, 166);
			$("#closedContent").val(closedContentStr);
			return false;
		}
		// 글자수 끝
	}
	function carryStartDateTextToDateFnc() {
		var fromDtObj = document.getElementById("fromDt");
		var end_ymd = fromDtObj.value;    
	    var yyyy = end_ymd.substr(0,4);
	    var mm = end_ymd.substr(5,2);
	    var dd = end_ymd.substr(8,2);                        
	    var com_ymd = new Date(yyyy, mm-1, dd);
		var hiddenclosedStartDateObj = document.getElementById("closedStartDate");
		hiddenclosedStartDateObj.value = fromDtObj.value;
	}
	function carryEndDateTextToDateFnc() {
		var toDtObj = document.getElementById("toDt");
		var end_ymd1 = toDtObj.value;    
	    var yyyy1 = end_ymd1.substr(0,4);
	    var mm1 = end_ymd1.substr(5,2);
	    var dd1 = end_ymd1.substr(8,2);                        
	    var com_ymd1 = new Date(yyyy1, mm1-1, dd1);
		var hiddenclosedEndDateObj = document.getElementById("closedEndDate");
		hiddenclosedEndDateObj.value = toDtObj.value;
	}
</script>
<style type="text/css">
	button {
		width : 150px;
	}
	table, tr, th, td {
		border: 1px solid black;
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
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 휴무일 변경</h1>
	<br/>
	<div style="width: 600px; height: 700px; margin: auto;">
		<form action="./reservationPageCloseCtr.do" method="post" onsubmit='return validationFnc();'>
			<input type="hidden" name="closedNo" value="${closedDayVo.closedNo}" disabled="disabled">
			<input type="hidden" name="tourNo" value="${closedDayVo.tourNo}" disabled="disabled">
			<div>
				<table style="width: 576px; height: 200px;">
					<tr>
						<td class="ahreum">휴무 시작일 및 종료일</td>
						<td style="padding-left: 20px;">
							<input type="text"   
							id="fromDt" size="8" title="시작일자" onchange="carryStartDateTextToDateFnc();"> ~
							<input type="text" 
							id="toDt" size="8" title="종료일자" onchange="carryEndDateTextToDateFnc();">  
							<br>
							기존 휴무일 : 
							<fmt:formatDate value="${closedDayVo.closedStartDate}" pattern="yyyy-MM-dd" /> ~
							<fmt:formatDate value="${closedDayVo.closedEndDate}" pattern="yyyy-MM-dd" />
							<input type="hidden" id="closedStartDate" name="closedStartDate" value="">
							<input type="hidden" id="closedEndDate" name="closedEndDate" value="">
						</td>
					</tr>
					<tr>
						<td class="ahreum">휴무 내용</td>
						<td style="padding-left: 20px;">
							<textarea id="closedContent" name="closedContent" rows="" cols="" placeholder="내용을 입력해주세요."
						 	style="width:300px; height:100px; font-size:17px; box-sizing:border-box;">
						 		${closedDayVo.closedContent}
				 			</textarea>
						</td>
					</tr>
				</table>
			</div>
			
			<div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
				<div>
					<button class="ahreum" onclick="location.href='../reservation/reservationPageClose.do'">휴무일 변경하기</button>
					<button class="ahreum" type="button" onclick="pageMoveListFnc();">뒤로가기</button>
				</div>
			</div>
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>
</html>