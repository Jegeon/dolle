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
			buttonImage : '/dolleProject/resources/images/calendar.png', //이미지주소
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
		
		var fileObjValue = $("#fileBtn").val();
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
		
		var errorCode10 = "파일 추가 필요";
		
		// 글자수 시작
		if(tourNameObjValue == null || tourNameObjValue.trim() == "" || tourNameObjValue.length == 0){
			alert(errorStr + " - " + errorCode1);
			return false;
		}else if(tourNameObjValue.length > 33){	//글자수 제한
			alert("제목은 33자까지 입력 가능합니다.");
			var tourNameStr = tourNameObjValue.substr(0, 33);
			$("#tourName").val(tourNameStr);
			return false;
		}
		// 글자수 끝
		if(fileObjValue == null || fileObjValue.trim() == "" || fileObjValue.length == 0){
			alert(errorStr + " - " + errorCode10);
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
		// 시작일 < 종료일 문자열로 해결 시작
		if(Number(tourStartDateObjValue.replace(/-/gi,"")) > Number(tourEndDateObjValue.replace(/-/gi,"")) ){
		   alert("종료일은 시작일 이후여야 합니다.");
		   return false;
		} 
		// 시작일 < 종료일 문자열로 해결 종료
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
		// 글자수 시작
		if(tourContentObjValue == null || tourContentObjValue.trim() == "" || tourContentObjValue.length == 0){
			alert(errorStr + " - " + errorCode9);
			return false;
		}else if(tourContentObjValue.length > 1329){	//글자수 제한
			alert("내용은 1329자까지 입력 가능합니다.");
			var tourContentStr = tourContentObjValue.substr(0, 1329);
			$("#tourContent").val(tourContentStr);
			return false;
		}
		// 글자수 끝
		
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
	
	//input[type="file"] 미리보기 제공하기 
	var sel_file;
	var sel_files = [];
	$(document).ready(function(){
		$("#fileBtn").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert(" 이미지만 올릴 수 있습니다.");

				if (/(MSIE|Trident)/.test(navigator.userAgent)) { 
					// ie 일때 input[type=file] init. 
					$("#fileBtn").replaceWith( $("#fileBtn").clone(true) );
				} else {
					// other browser 일때 input[type=file] init. 
					$("#fileBtn").val(""); 
				}
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#uploadImg").attr("src", e.target.result);
				$("#uploadImg").attr("style", "height:100px;");
			}
			reader.readAsDataURL(f);
			
		});
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
		width:200px; 
		height:45px;
		font:normal bold 18px Segoe UI; 
		color:white; 
		background-color: #0D4371;
		border:0px;
		text-align: center;
		vertical-align: middle;
	}
	#tourName {
		width: 368px;
	}
	.lTdPl20 {
		padding-left: 20px;
		padding-right: 20px;
	}
	input {
		height: 30px;
		font-size: 17px;
	}
	.input110 {
		width: 110px;
	}
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div style="width:1260px; height:55px; margin:0 auto; text-align: center;" >
		<h1 class="daehanFont" style="margin: 10px 0px 10px;">가이드 투어 예약페이지 추가</h1>
	</div>
	<div style="width: 610px; height: 820px; margin: auto;">
		<form id="addForm" action="./reservationPageAddCtr.do" method="post" enctype="multipart/form-data">
			<div>
				<table style="width: 610px; height: 740px;">
					<tr>
						<td class="ahreum">투어명</td>
						<td class="lTdPl20">
							<input type="text" id="tourName" name="tourName" value="" placeholder="투어 이름을 입력하세요">
						</td>
					</tr>
					<tr>
						<td class="ahreum">투어 이미지 파일</td>
						<td class="lTdPl20">
							<input id="fileBtn" type="file" name="file">
							<img id="uploadImg">
						</td>
					</tr>
					<tr>
						<td class="ahreum">투어 시작일 및 종료일</td>
						<td class="lTdPl20">
							<input type="text" class="input110"  
							id="fromDt" size="8" title="시작일자" placeholder="투어 시작일" 
							onchange="carryStartDateTextToDateFnc();"> ~
							<input type="text" class="input110"
							id="toDt" size="8" title="종료일자" placeholder="투어 종료일"  
							onchange="carryEndDateTextToDateFnc();">  
							<input type="hidden" id="tourStartDate" name="tourStartDate" value="">
							<input type="hidden" id="tourEndDate" name="tourEndDate" value="">
						</td>
					</tr>
					<tr>
						<td class="ahreum">출발시간 및 종료시간</td>
						<td class="lTdPl20">
							<input type="text" class="input110" id="tourStartTime" name="tourStartTime" value="" placeholder="09:00">
							<span style="margin: 0px 20px;"> ~ </span>
							<input type="text" class="input110" id="tourEndTime" name="tourEndTime" value="" placeholder="18:00">
						</td>
					</tr>
					<tr>
						<td class="ahreum">투어 최대 인원</td>
						<td class="lTdPl20">
							<input type="number" class="input110" id="tourPeopleNum" name="tourPeopleNum" value="" min="1" placeholder="10 (숫자를 입력하세요)">
						</td>
					</tr>
					<tr>
						<td class="ahreum">투어 인당 가격</td>
						<td class="lTdPl20">
							<input type="number" class="input110" id="tourPrice" name="tourPrice" value="" min="0" placeholder="9800 (숫자만 입력하세요)">
						</td>
					</tr>
					<tr>
						<td class="ahreum">투어 출발지</td>
						<td class="lTdPl20">
							<input type="text" style="width: 368px;" id="tourStartingPoint" name="tourStartingPoint" value="" placeholder="출발지를 입력하세요">
						</td>
					</tr>
					<tr>
						<td class="ahreum">투어 내용</td>
						<td class="lTdPl20">
							<textarea id="tourContent" name="tourContent" rows="" cols="" placeholder="내용을 입력해주세요"
							style="width:375px; height:200px; font-size:17px; box-sizing:border-box;
							resize:none; font-family: arial;"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div style="width: 610px; padding-top: 20px; text-align: center;">
				<!-- <input type="hidden" name="tourNo" value=""> -->
				<input type="button" onclick='addFormFnc();' class="ahreum" value="추가하기" style="cursor: pointer;">
				<button class="ahreum" type="button" onclick="pageMoveListFnc();" style="cursor: pointer;">목록으로</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>