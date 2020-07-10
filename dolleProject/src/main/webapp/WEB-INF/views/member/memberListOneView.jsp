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
	}
	
	.resCss {
		border: 1px solid black;
		font-size: 10px;
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
</style>
<script type="text/javascript">
	var updateMove = '';
	
	var subInfo = '';
	var reservation = '';
	var myWriting = '';
	
	var subTest = '';

	function updateMoveFnc() {
		updateMove = document.updateMove;
		
		updateMove.submit();
	}

	function pageMoveListFnc(){
		location.href = "list.do";
	}
	
	function subInfoFnc() {
		subTest = document.getElementById('subTest');
		
		subInfo = document.getElementById('subInfo');
		reservation = document.getElementById('reservation');
		myWriting = document.getElementById('myWriting');
		
		subInfo.style.display = 'table';
		reservation.style.display = 'none';
		myWriting.style.display = 'none';
		
	}
	
	function reservationFnc() {
		subTest = document.getElementById('subTest');
		
		subInfo = document.getElementById('subInfo');
		reservation = document.getElementById('reservation');
		myWriting = document.getElementById('myWriting');
		
		subInfo.style.display = 'none';
		reservation.style.display = 'table';
		myWriting.style.display = 'none';
		
	}
	
	function myWritingFnc() {
		subInfo = document.getElementById('subInfo');
		reservation = document.getElementById('reservation');
		myWriting = document.getElementById('myWriting');
		
		subInfo.style.display = 'none';
		reservation.style.display = 'none';
		myWriting.style.display = 'table';
	}
	
	function testFnc(data) {
		
		location.href = './payment.do?reserveIdx=' + data;
	}
	
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id='mainBorder'>
		<div>
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
			<form name='updateMove' action="./update.do" method="get">
				<input type="hidden" name='no' value='${memberVo.no}'>
				<table id='subInfo' class='tableCenter'>
					<tr>
						<td>
							<span class='secondSpanCss'>이름</span> 
						</td>
						<td>
							<input class='inputCss' type="text" name='name'
							 id='memberName' value='${memberVo.name}' readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>
							<span class='secondSpanCss'>닉네임</span>
						</td>
						<td>
							<input class='inputCss' type='text' name='nickname'
								value='${memberVo.nickname}' readonly='readonly'>
						</td>
					</tr>
					<tr>
						<td>
							<span class='secondSpanCss'>이메일</span>
						</td>
						<td>
							<input class='inputCss' type="text" name="email" 
								value='${memberVo.email}' readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>
							<span class='secondSpanCss'>연락처</span>
						</td>
						<td>
							<input class='inputCss' type='text' name='phone'
							 	value='${memberVo.phone}' readonly='readonly'>
						</td>
					</tr>
					<tr>
						<td colspan='2'>
							<input class='btnCss' type="button" value="수정하기"
								onclick='updateMoveFnc();'>
							<input class='btnCss' type="button" value="이전페이지" 
								onclick='pageMoveListFnc();'>
						</td>
					</tr>
				</table>
				<table id='reservation' class='tableCenter'
					style='display: none; border: 1px solid black; border-collapse: collapse;'>
					<tr class='resCss'>
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
					<c:forEach var='memberVo' items='${reservationList}'>
						<tr class='resCss'>
							<td class='resCss idxNum'>
								${memberVo.reserveIdx}
<%-- 								<input name='testIdx' type='hidden' value='${memberVo.reserveIdx}'> --%>
							</td>
							<td class='resCss'>
								${memberVo.tourName}
							</td>
							<td class='resCss'>
								<fmt:formatDate value="${memberVo.reserveApplyDate}" pattern="yyyy-MM-dd" />
							</td>
							<td class='resCss'>
								<c:if test="${memberVo.reserveDepositState == 'standby'}">
									<button type="button" onclick='testFnc(${memberVo.reserveIdx});'>입금 하기</button>
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
				</table>
				<table id='myWriting' class='tableCenter'
					style='display: none; border: 1px solid black;
					border-collapse: collapse;'>
					<tr class='resCss'>
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
					<c:forEach var='memberVo' items='${tourReviewList}'>
						<tr class='resCss'>
							<th class='resCss'>
								${memberVo.reviewIdx}
							</th>
							<th class='resCss'>
								${memberVo.reviewTitle}
							</th>
							<th class='resCss'>
								${memberVo.nickname}
							</th>
							<th class='resCss'>
								<fmt:formatDate value="${memberVo.reviewCreDate}" pattern="yyyy-MM-dd" />
							</th>
							<th>
								<c:forEach begin='1' end="${memberVo.reviewRating}">
									<img alt="별_full" src="/dolleProject/resources/images/starSolid.png" 
												style="width:18px; height:16.5px;">
								</c:forEach>
								<c:forEach begin="${memberVo.reviewRating}" end='4'>
									<img alt="별_blank" src="/dolleProject/resources/images/starBlank.png"
									 style="width:18px; height:16.5px; vertical-align: middle;">
								</c:forEach>
							</th>
							<th class='resCss'>
								${memberVo.reviewReadCount}
							</th>
							<th class='resCss'>
								${memberVo.reviewLikeCount}
							</th>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>