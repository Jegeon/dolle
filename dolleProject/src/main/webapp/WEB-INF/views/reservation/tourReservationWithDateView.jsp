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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
			minDate: 1,
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],                 
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
            dayNamesMin: ['일','월','화','수','목','금','토'],
            beforeShowDay : disableRange
		});
		var urlStr = window.location.href.slice(-10);
		$('#datepicker').datepicker('setDate', urlStr); 
		$("#selectedDateInput").val(urlStr);
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
		// 해당하지 않는 날짜는 표시한다.
	    return [true];
	}
 	// 제외 날짜 설정 로직 끝
    
    function calculateFnc() {
    	document.getElementById("predictedTotal").value = document.getElementById("selectedTourPeopleNumInput").value * ${tourVo.tourPrice};
    }
	function pageMoveListOneFnc(){
		location.href = "listOne.do?tourNo=${tourVo.tourNo}";
	}
	function validationFnc(){
		var selectedTourPeopleNum = document.getElementById("selectedTourPeopleNumInput").value;
		if (selectedTourPeopleNum == 0) {
			alert("예약이 불가능합니다");
			return false;
		}
	}
	function testFnc() {
		var hereInput = document.getElementById("selectedDateInput");
		hereInput.value = $("#datepicker").val();
		location.href = "reservationWithDate.do?tourNo=${tourVo.tourNo}&reserveTourDate=" + $("#datepicker").val();
	}
</script>
<style type="text/css">
	table, tr, td {
		border: 1px solid black;
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
		width:220px; 
		height:50px;
		font:normal bold 18px Segoe UI; 
		color:white; 
		background-color: #0D4371;
		border:0px;
		text-align: center;
		vertical-align: middle;
	}
	.tdLeftWidthLimit {
		width:220px;
	}
	.tdRightWidthLimit {
		width:276px;
	}
	.rightTdleftPadding {
		padding-left: 10px;
	}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
		
	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 예약 상세 날짜 선택</h1>
	<br/>
	<!-- 여기 div 는 투어 상세 정보가 뜨는 곳 시작 -->
	<div style="width: 740px; height: 440px; margin: auto;">
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
						<td class="rightTdleftPadding">
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
						<td class="ahreum">시간</td>
						<td class="rightTdleftPadding">${tourVo.tourStartTime} ~ ${tourVo.tourEndTime}</td>
					</tr>
					<tr>
						<td class="ahreum">모집 인원</td>
						<td class="rightTdleftPadding">${tourVo.tourPeopleNum} 명</td>
					</tr>
					<tr>
						<td class="ahreum">인당 가격</td>
						<td class="rightTdleftPadding">
							<fmt:formatNumber value="${tourVo.tourPrice}" pattern="#,###" /> 원 / 1인
						</td>
					</tr>
					<tr>
						<td class="ahreum">출발지</td>
						<td class="rightTdleftPadding">${tourVo.tourStartingPoint}</td>
					</tr>
					<tr>
						<td colspan="2">${tourVo.tourContent}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- 여기 div 는 투어 상세 정보가 뜨는 곳 끝 -->
	
	<form action="./reservationForm.do" method="post" onsubmit='return validationFnc();'>
		<!-- 여기 div 는 사용자 입력 (날짜, 투어 인원)을 받는 부분 시작 -->
		<div style="width: 740px; height: 700px; margin: auto;">
			<table style="width: 496px; margin: auto;">
				<tr>
					<td class="tdLeftWidthLimit">
						<button class="ahreum" disabled="disabled">
							선택한 투어
						</button>
					</td>
					<td class="tdRightWidthLimit rightTdleftPadding">${tourVo.tourName}</td>
				</tr>
				<tr>
					<td>
						<button class="ahreum">투어 날짜
						</button>
					</td>
					<td class="rightTdleftPadding">
						<input id="selectedDateInput" name="reserveTourDate" type="text" value="">
					</td>
				</tr>
				<!-- 달력 구현 부분 -->
				<tr>
					<td style="text-align: center;" colspan="2">
						<div style="width: 400px; margin: auto;">
							<div id="datepicker" onchange="testFnc();"></div>
						</div>
						<br/>
						<fmt:formatDate value="${tourVo.tourClosedStartDate}" pattern="yyyy-MM-dd" />부터
						<fmt:formatDate value="${tourVo.tourClosedEndDate}" pattern="yyyy-MM-dd" />까지 휴무입니다<br>
						<c:if test="${tourVo.tourClosedContent ne null}"><div style="padding-top: 10px; padding-bottom: 5px;">${tourVo.tourClosedContent}</div></c:if>
						<input type="hidden" id="tourClosedStartDateInput" value="<fmt:formatDate value="${tourVo.tourClosedStartDate}" pattern="yyyy-MM-dd" />">
						<input type="hidden" id="tourClosedEndDateInput" value="<fmt:formatDate value="${tourVo.tourClosedEndDate}" pattern="yyyy-MM-dd" />">
					</td>
				</tr>
				<tr>
					<td>
						<button class="ahreum" disabled="disabled">예약 현황
						</button>
					</td>
					<td class="rightTdleftPadding">${tourVo.tourReservedNum}/ ${tourVo.tourPeopleNum}</td>
				</tr>
				<tr>
					<td>
						<button class="ahreum" disabled="disabled">투어 인원
						</button>
					</td>
					<td class="rightTdleftPadding">
						<c:choose>
							<c:when test="${0 eq tourVo.tourReservedNum}">
								<input id="selectedTourPeopleNumInput" name="reserveApplyNum" type="number" min="1" max="${tourVo.tourPeopleNum}" value="" placeholder="${tourVo.tourPeopleNum}" onchange="calculateFnc();">
							</c:when>
							<c:when test="${tourVo.tourReservedNum eq tourVo.tourPeopleNum}">
								<input id="selectedTourPeopleNumInput" name="reserveApplyNum" type="number" disabled="disabled" value="0" onchange="calculateFnc();">
							</c:when>
							<c:otherwise>
								<input id="selectedTourPeopleNumInput" name="reserveApplyNum" type="number" min="1" max="${tourVo.tourPossibleNum}" value="" placeholder="${tourVo.tourPossibleNum}" onchange="calculateFnc();">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>
						<button class="ahreum" disabled="disabled">결제 방법
						</button>
					</td>
					<td class="rightTdleftPadding">계좌이체</td>
				</tr>
				<tr>
					<td>
						<button class="ahreum" disabled="disabled">결제 예상 금액
						</button>
					</td>
					<td id="test" class="rightTdleftPadding">
						<input id="predictedTotal" name="reservePrice" type="text" value="" readonly="readonly"> 원
					</td>
				</tr>
				<tr>
					<td>
						<button class="ahreum" disabled="disabled">결제 계좌
						</button>
					</td>
					<td class="rightTdleftPadding">
						${tourVo.tourAccountNum} ${tourVo.tourBank} <br>
						예금주 : ${tourVo.tourDepositor}
					</td>
				</tr>
			</table>
		</div>
		<!-- 여기 div 는 사용자 입력 (날짜, 투어 인원)을 받는 부분 끝 -->
		
		<!-- 여기 div 는 form의 submit이 있는 부분 시작 -->
		<div style="text-align: center;">
			<div style="margin-top: 10px; padding-bottom: 10px;">
				<input type="hidden" name="tourNo" value="${tourVo.tourNo}">
				<input type="hidden" name="memberNo" value="${sessionScope._memberVo_.no}">
				<input type="submit" class="ahreum" value="예약 신청 하기">
				<button type="button"class="ahreum" onclick="pageMoveListOneFnc();">뒤로 가기</button>
			</div>
		</div>
		<!-- 여기 div 는 form의 submit이 있는 부분 끝 -->
	</form>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>