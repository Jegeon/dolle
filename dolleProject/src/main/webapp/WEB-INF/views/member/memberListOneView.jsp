<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
	#mainBorder {
		text-align: center;
		margin: auto;
	}
	
	#backBord {
		background-color: #EBEBEB;
	}
	
	table {
		text-align: center;
		margin: auto;
	}
	
	td {
		color: #000000;
		text-align: left;
		font-size: 5px;
		padding: 10px;
		background-color: #FFFFFF;
	}
	
	.formCss {
		padding: 20px;
	}
	
	.thCss {
		background-color: #F8F4ED;
	}
	
	.resCss {
		border: 1px solid black;
		font-size: 20px;
		padding: 5px;
		text-align: center;
	}
	
	.inputBtn {
		border: 0px;
		outline: 0px;
		background-color: #FFFFFF;
	}
	
	.inputCss {
		border: 0px;
		background-color: transparent;
		padding: 10px;
		color: #000000;
	}
	
	input:focus {
		border: 0px;
		outline: 0px;
	}
		
	.firstSpanCss {
		color: #0D4371;
		font-size: 30px;
		font-weight: bold;
	}
	
	.secondSpanCss {
		color: #0D4371;
		font-weight: bold;
		font-size: 12px;
	}
	
	.btnCss {
		background-color: #0D4371;
		color: #FFFFFF;
		border : 0px;
		outline: 0px;
		margin: 10px;
	}
	
	.tdCss {
		background-color: #EBEBEB;
	}
</style>
<script type="text/javascript" src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	var updateMove = '';
	var reserve = '';
	
	var subInfo = '';
	var reservation = '';
	var myWriting = '';
	
	var subTest = '';
	
	function updateMoveFnc() {
		updateMove = document.updateMove;
		
		updateMove.submit();
	}
	
	function pageMoveListFnc(){
		location.href = "../";
	}
	
	function subInfoFnc() {
		subTest = document.getElementById('subTest');
		
		subInfo = document.getElementById('subInfo');
		reservation = document.getElementById('reservation');
		myWriting = document.getElementById('myWriting');
		
		subInfo.style.display = 'table';
		reservation.style.display = 'none';
		myWriting.style.display = 'none';
		$('#addBtn').attr('style', 'display:none');
		$('#revBtn').attr('style', 'display:none');
		
	}
	
	function reservationFnc() {
		subTest = document.getElementById('subTest');
		
		subInfo = document.getElementById('subInfo');
		reservation = document.getElementById('reservation');
		myWriting = document.getElementById('myWriting');
		
		subInfo.style.display = 'none';
		reservation.style.display = 'table';
		myWriting.style.display = 'none';
		
		if (parseInt($('#totalCnt').val()) > (parseInt($('#endNum').val()) - 5)) {
			$('#addBtn').attr('style', 'display:unset');
		}
		$('#revBtn').attr('style', 'display:none');
	}
	
	function myWritingFnc() {
		subInfo = document.getElementById('subInfo');
		reservation = document.getElementById('reservation');
		myWriting = document.getElementById('myWriting');
		
		subInfo.style.display = 'none';
		reservation.style.display = 'none';
		myWriting.style.display = 'table';
		
		$('#addBtn').attr('style', 'display:none');
		if (parseInt($('#reviewTotalCnt').val()) > (parseInt($('#endCnt').val()) - 5)) {
			$('#revBtn').attr('style', 'display:unset');
		}
	}
	
	function testFnc(data) {
		location.href = './payment.do?reserveIdx=' + data;
	}
	
	$(document).ready(function(){
		
		$('#deleteBtn').on('click', function() {
			if (confirm('정말 탈퇴하시겠습니까?') == true) {
				location.href = '../member/deleteCtr.do?mno=' + $('#memberNo').val();
			} else {
				return;
			}
		});
		
		
		$('#addBtn').on('click', function() {
			var form = {
					no: $('#memberNo').val(),
					begin: 1,
					end: $('#endNum').val()
			}
			
			for (var i = 0; i < (parseInt($('#endNum').val()) - 5); i++) {
				if (parseInt($('#totalCnt').val()) > 5) {
					$('#reservation tr:last').remove();
				}
			}
			
			$.ajax({
				url : "../member/check.do",
				type: "POST",
				data: form,
				success:function(data){
					for (var i = 0; i < data.resList.length; i++) {
						
						if (data.resList[i].reserveDepositState == 'standby') {
							reserve = "<button type='button' onclick='testFnc(${memberVo.reserveIdx});'>입금 하기</button>";
						} else if (data.resList[i].reserveDepositState == 'paid') {
							reserve = "승인 대기";
						} else if (data.resList[i].reserveDepositState == 'active') {
							reserve = "예약 완료";
						} else if (data.resList[i].reserveDepositState == 'canceled') {
							reserve = "예약 취소";
						}
						
					var date = new Date(data.resList[i].reserveApplyDate);
					var year = date.getFullYear();          //yyyy
					var month = date.getMonth() + 1;          //M
					    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
					var day = date.getDate();                   //d
					    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
					var formatDate = year + '/' + month + '/' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
					
					$('#reservation tr:last').after("<tr class='resCss'>"
							+ "<td class='resCss idxNum tdCss'>"+data.resList[i].reserveIdx+"</td>"
							+ "<td class='resCss'>"+data.resList[i].tourName+"</td>"
							+ "<td class='resCss'>"+formatDate+"</td>"
							+ "<td class='resCss'>" + reserve
							+ "</td></tr>")
					}
					if ($('#totalCnt').val() < (parseInt($('#endNum').val())) || $('#totalCnt').val() <= 5) {
						$('#addBtn').attr('style', 'display:none');
					}
					
					$('#endNum').val(parseInt($('#endNum').val()) + 5);
					
				},
				error: function(){
					alert("error");
				}
			});			
			
		});
		
		$('#revBtn').on('click', function() {
			var form = {
					no: $('#memberNo').val(),
					begin: 1,
					end: $('#endCnt').val()
			}
			
			for (var i = 0; i < (parseInt($('#endCnt').val()) - 5); i++) {
				if ($('#reviewTotalCnt').val() > 5) {
					$('#myWriting tr:last').remove();
				}
			}
			
			$.ajax({
				url : "../member/revi.do",
				type: "POST",
				data: form,
				success:function(data){
					for (var i = 0; i < data.tourList.length; i++) {
						var date = new Date(data.tourList[i].reviewCreDate);
						var year = date.getFullYear();          //yyyy
						var month = date.getMonth() + 1;          //M
						    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
						var day = date.getDate();                   //d
						    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
						var formatDate = year + '/' + month + '/' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
						
						var starList = new Array();
						for (var n = 0; n < data.tourList[i].reviewRating; n++) {
							starList[n] = $('#fullStar').val();
						}
						
						for (var m = 5; m >= data.tourList[i].reviewRating; m--) {
							starList[m] = $('#blankStar').val();
						}
						
						$('#myWriting tr:last').after("<tr class='resCss'><td class='resCss'>"
								+ data.tourList[i].reviewIdx + "</td><td class='resCss'>"
								+ data.tourList[i].reviewTitle + "</td><td class='resCss'>"
								+ data.tourList[i].nickname + "</td><td class='resCss'>"
								+ formatDate + "</td><td>"
								+ starList[0] + starList[1] + starList[2] + starList[3] + starList[4]
								+ "</td><td class='resCss'>" + data.tourList[i].reviewReadCount + "</td>"
								+ "<td class='resCss'>" + data.tourList[i].reviewLikeCount + "</td></tr>")
					}
					if ($('#reviewTotalCnt').val() < parseInt($('#endCnt').val()) || $('#reviewTotalCnt').val() <= 5) {
						$('#revBtn').attr('style', 'display:none');
					}
					
					$('#endCnt').val(parseInt($('#endCnt').val()) + 5);
					
				},
				error: function(){
					alert("error");
				}
			});
			
		});
	}); 
	
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<input type="hidden" id="begin" value="5">
	<input type="hidden" id="end" value="10">
	<div id='mainBorder'>
		<div style='padding: 15px;'>
			<span class='firstSpanCss'>내 정보</span>
		</div>
		<table>
			<tr>
				<td>
					<input class='inputBtn' type='button'
						onclick='subInfoFnc();'	value='가입 정보'>
					<input id='subTest' type='hidden' value='${memberVo.no}'>
				</td>
				<td>
					<input class='inputBtn' type='button'
						onclick='reservationFnc();'	value='예약 현황'>
				</td>
				<td>
					<input class='inputBtn' type='button'
						onclick='myWritingFnc();' value='내가 쓴 글'>
				</td>
			</tr>
		</table>
		<div id='backBord'>
			<form class='formCss' name='updateMove' action="./update.do" method="get">
				<input id='memberNo' type="hidden" name='no' value='${memberVo.no}'>
				<table id='subInfo' class='tableCenter'>
					<tr>
						<td class='tdCss'>
							<span class='secondSpanCss'>이름</span> 
						</td>
						<td class='tdCss'>
							<input class='inputCss' type="text" name='name'
							 id='memberName' value='${memberVo.name}' readonly="readonly">
						</td>
					</tr>
					<tr>
						<td class='tdCss'>
							<span class='secondSpanCss'>닉네임</span>
						</td>
						<td class='tdCss'>
							<input class='inputCss' type='text' name='nickname'
								value='${memberVo.nickname}' readonly='readonly'>
						</td>
					</tr>
					<tr>
						<td class='tdCss'>
							<span class='secondSpanCss'>이메일</span>
						</td>
						<td class='tdCss'>
							<input class='inputCss' type="text" name="email" 
								value='${memberVo.email}' readonly="readonly">
						</td>
					</tr>
					<tr>
						<td class='tdCss'>
							<span class='secondSpanCss'>연락처</span>
						</td>
						<td class='tdCss'>
							<input class='inputCss' type='text' name='phone'
							 	value='${memberVo.phone}' readonly='readonly'>
						</td>
					</tr>
					<tr>
						<td colspan='2' class='tdCss'>
							<input class='btnCss' type="button" value="수정하기"
								onclick='updateMoveFnc();'>
							<input class='btnCss' type="button" value="이전페이지" 
								onclick='pageMoveListFnc();'>
							<input id='deleteBtn' class='btnCss' type='button' value='회원탈퇴'>
						</td>
					</tr>
				</table>
				<table id='reservation' class='tableCenter'
					style='display: none; border: 1px solid black; border-collapse: collapse;'>
					<tr id='testTr' class='resCss thCss'>
						<th class='resCss'>
							예약신청번호
						</th>
						<th class='resCss'>
							투어이름
						</th>
						<th class='resCss'>
							신청일
						</th>
						<th class='resCss'>
							예약/입금
						</th>
					</tr>
				<c:choose>
				<c:when test="${empty reservationList}">
					<tr>
						<td colspan="4" style="text-align: center;">
							등록된 게시글이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var='memberVo' items='${reservationList}' begin='0' end='4' varStatus="status">
						<tr class='resCss'>
							<td class='resCss idxNum'>
								${memberVo.reserveIdx}
							</td>
							<td class='resCss'>
								${memberVo.tourName}
							</td>
							<td class='resCss'>
								<fmt:formatDate value="${memberVo.reserveApplyDate}" pattern="yyyy-MM-dd" />
							</td>
							<td class='resCss'>
								<c:if test="${memberVo.reserveDepositState == 'standby'}">
									<button type='button' onclick='testFnc(${memberVo.reserveIdx});'>입금 하기</button>
								</c:if>
								<c:if test="${memberVo.reserveDepositState == 'paid'}">
									승인 대기
								</c:if>
								<c:if test="${memberVo.reserveDepositState == 'active'}">
									예약 완료
								</c:if>
								<c:if test="${memberVo.reserveDepositState == 'canceled'}">
									예약 취소
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
				</c:choose>
				</table>
				<input id='addBtn' style='display: none;' class='btnCss' type='button' value='더보기'> 
				<table id='myWriting' class='tableCenter'
					style='display: none; border: 1px solid black;
					border-collapse: collapse;'>
					<tr class='resCss thCss'>
						<th class='resCss'>
							번호
						</th>
						<th class='resCss'>
							제목
						</th>
						<th class='resCss'>
							작성자
						</th>
						<th class='resCss'>
							작성일
						</th>
						<th class='resCss'>
							별점
						</th>
						<th class='resCss'>
							조회수
						</th>
						<th class='resCss'>
							댓글수
						</th>
					</tr>
					<c:choose>
						<c:when test="${empty tourReviewList}">
							<tr>
								<td colspan="7" style="text-align: center;">
									등록된 게시글이 없습니다.
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var='memberVo' items='${tourReviewList}' begin='0' end='4' varStatus="status">
								<tr class='resCss'>
									<td class='resCss'>
										${memberVo.reviewIdx}
									</td>
									<td class='resCss'>
										${memberVo.reviewTitle}
									</td>
									<td class='resCss'>
										${memberVo.nickname}
									</td>
									<td class='resCss'>
										<fmt:formatDate value="${memberVo.reviewCreDate}" pattern="yyyy-MM-dd" />
									</td>
									<td>
										<c:forEach begin='1' end="${memberVo.reviewRating}">
											<img alt="별_full" src="/dolleProject/resources/images/starSolid.png" 
														style="width:18px; height:16.5px;">
										</c:forEach>
										<c:forEach begin="${memberVo.reviewRating}" end='4'>
											<img alt="별_blank" src="/dolleProject/resources/images/starBlank.png"
											 style="width:18px; height:16.5px;">
										</c:forEach>
									</td>
									<td class='resCss'>
										${memberVo.reviewReadCount}
									</td>
									<td class='resCss'>
										${memberVo.reviewLikeCount}
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<input id='revBtn' style='display: none;' class='btnCss' type='button' value='더보기'> 
			</form>
		</div>
	</div>
	<input id='totalCnt' type='hidden' value='${totalCnt}'>
	<input id='endNum' type='hidden' value='10'>
	<input id='reviewTotalCnt' type='hidden' value='${reviewTotalCnt}'>
	<input id='endCnt' type='hidden' value='10'>
	<input id='reviewRating' type='hidden' value='${memberVo.reviewRating}'>
	<input id='fullStar' type='hidden' value="<img alt='별_full' src='/dolleProject/resources/images/starSolid.png'	style='width:18px; height:16.5px;'>">
	<input id='blankStar' type='hidden' value="<img alt='별_blank' src='/dolleProject/resources/images/starBlank.png' style='width:18px; height:16.5px;'>">
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>


</html>