<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>투어 예약 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(function () {
    	var date = new Date(); 
		
		var dateRawStr = document.getElementById("tourEndDateStr").childNodes[0].nodeValue;
		var dateStr = dateRawStr.replace(/(\s*)/g, "");
		var endYear = dateStr.substring(0, 4);
		var endMonth = dateStr.substring(5, 7);
		var endDay = dateStr.substring(8, 10);
		
		var date1Input = document.getElementById("tourClosedStartDateInput").value;
		var date2Input = document.getElementById("tourClosedEndDateInput").value;
		var date1Str = date1Input;
		var date2Str = date2Input;
		var date1 = new Date(date1Str);
		var date2 = new Date(date2Str);
		var diffDay = (date2.getTime() - date1.getTime()) / (1000*60*60*24);
		// 	alert("날짜 차이 " + diffDay + " 배열 길이 " + (diffDay + 1));
		disabledDaysArray = new Array(diffDay + 1);
		// 2020-0-00 문자열 형태로 변환
		for (var i = 0; i < disabledDaysArray.length; i++) {
			disabledDaysArray[i] = date1.getFullYear() + "-" + (date1.getMonth()+1) + "-" + (date1.getDate()+i);
			// alert(disabledDaysArray[i]);
		}
		disabledDays = disabledDaysArray;
		
		$("#datepicker").datepicker({ 
			dateFormat: "yy-mm-dd",
			maxDate: new Date(endYear, endMonth-1, endDay),
			minDate: 2,
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],                 
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
            dayNamesMin: ['일','월','화','수','목','금','토'],
            beforeShowDay : disableRange
		});
    });
    
    // 제외할 날짜 배열
	var disabledDays = new Array();

	function disableRange(date) {
		var year = date.getFullYear();
		var month = date.getMonth();
		var dates = date.getDate();
		
		// disabledDays에 해당하면 false를 담아 return -1은 없을 때
		for (var i = 0; i < disabledDays.length; i++) {
			if($.inArray(year + '-' + (month + 1) + '-' + dates, disabledDays) != -1) {
				return [false];
			}
		}
	    
	    var love = document.getElementById("tourStartDateStr").childNodes[0].nodeValue;
	    if (date < new Date(love)){ // 이전일
	        return [false];
	    }
		// 해당하지 않는 날짜는 표시한다.
	    return [true];
	}
 	// 제외 날짜 설정 로직 끝
	
    function calculateFnc() {
    	document.getElementById("predictedTotal").value = document.getElementById("selectedTourPeopleNum").value * ${tourVo.tourPrice};
    }
	function pageMoveListOneFnc(){
		location.href = "listOne.do?tourNo=${tourVo.tourNo}";
	}
	
	function moveByCalendarFnc() {
		var hereInput = document.getElementById("here");
		hereInput.value = $("#datepicker").val();
		location.href = "reservationWithDate.do?tourNo=${tourVo.tourNo}&reserveTourDate=" + $("#datepicker").val();
	}
	
	function failAlertFnc() {
		alert("먼저 달력에서 날짜를 선택해주세요");
	}
</script>
<style type="text/css">
	table, tr, td {
		border-collapse: collapse;
		vertical-align: middle;
	}

	.ui-datepicker{ font-size: 20px; width: 400px; }

    .ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; }
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: blue; }
	
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
		margin-bottom: 10px;
		cursor:pointer;
	}
	
	.noPointer {
		cursor:auto;
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
	.tdBottomPadding {
		padding-bottom: 10px;
	}
	#selectedTourPeopleNum {
		width: 169px;
	}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div style="width:1260px; height:55px; margin:0 auto;" >
		<h1 class="daehanFont" style="margin: 10px 0px 10px 129px;">가이드 투어 예약 상세 날짜 선택</h1>
	</div>	
	<div style="width: 1000px; height: 410px; border-top: 2px solid #707070; margin: auto;">
		<div style="width: 840px; height: 360px; margin:0px auto; margin-top: 50px;">
			<div style="width: 300px; height: 360px; float: left;">
				<div style="width: 300px; height: 260px;">
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
							<a id="tourStartDateStr">
								<fmt:formatDate value="${tourVo.tourStartDate}" pattern="yyyy-MM-dd" />
							</a>
							~
							<a id="tourEndDateStr">
								<fmt:formatDate value="${tourVo.tourEndDate}" pattern="yyyy-MM-dd" />
							</a>
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
	</div>	
	
	<div style="width: 1000px; height: 10px; border-top: 2px solid #707070; margin: 20px auto;"></div>
	
	<div style="width: 740px; height: 600px; margin: auto;">
		<table style="width: 500px; margin: auto;">
			<tr>
				<td>
					<button class="ahreum noPointer">투어 날짜
					</button>
				</td>
				<td class="rightTdleftPadding">
					<input id="here" name="here" type="hidden" value="">
				</td>
			</tr>
			<!-- 달력 구현 부분 -->
			<tr>
				<td style="text-align: center;" colspan="2">
					<div style="width: 400px; margin-left: 100px;">
						<div id="datepicker" onchange="moveByCalendarFnc();"></div>
					</div>
					<br/>
					<fmt:formatDate value="${tourVo.tourClosedStartDate}" pattern="yyyy-MM-dd" />부터
					<fmt:formatDate value="${tourVo.tourClosedEndDate}" pattern="yyyy-MM-dd" />까지 휴무입니다<br>
					<c:if test="${tourVo.tourClosedContent ne null}"><div style="padding-top: 10px; padding-bottom: 10px;">${tourVo.tourClosedContent}</div></c:if>
					<input type="hidden" id="tourClosedStartDateInput" value="<fmt:formatDate value="${tourVo.tourClosedStartDate}" pattern="yyyy-MM-dd" />">
					<input type="hidden" id="tourClosedEndDateInput" value="<fmt:formatDate value="${tourVo.tourClosedEndDate}" pattern="yyyy-MM-dd" />">
				</td>
			</tr>
			<tr>
				<td>
					<button class="ahreum noPointer">예약 현황
					</button>
				</td>
				<td class="tdBottomPadding">달력에서 날짜를 선택해주세요</td>
			</tr>
			<tr>
				<td>
					<button class="ahreum noPointer">투어 인원
					</button>
				</td>
				<td class="tdBottomPadding">
					<input id="selectedTourPeopleNum" type="number" min="0" max="${tourVo.tourPeopleNum}" value="0" onchange="calculateFnc();">
				</td>
			</tr>
			<tr>
				<td>
					<button class="ahreum noPointer">결제 방법
					</button>
				</td>
				<td class="tdBottomPadding">계좌이체</td>
			</tr>
			<tr>
				<td>
					<button class="ahreum noPointer">결제 예상 금액
					</button>
				</td>
				<td id="test" class="tdBottomPadding">
					<input id="predictedTotal" type="text" value="0" disabled="disabled"> 원
				</td>
			</tr>
			<tr>
				<td>
					<button class="ahreum noPointer">결제 계좌
					</button>
				</td>
				<td class="tdBottomPadding">
					${tourVo.tourAccountNum} ${tourVo.tourBank} <br>
					예금주 : ${tourVo.tourDepositor}
				</td>
			</tr>
		</table>
	</div>
	
	<div style="width: 1000px; height: 1px; border-top: 2px solid #707070; margin: 20px auto;"></div>
	
	<div style="text-align: center;">
		<div style="margin-top: 10px; padding-bottom: 10px;">
			<button class="ahreum" onclick="failAlertFnc();">예약 신청 하기</button>
			<button class="ahreum" onclick="pageMoveListOneFnc();">뒤로 가기</button>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>