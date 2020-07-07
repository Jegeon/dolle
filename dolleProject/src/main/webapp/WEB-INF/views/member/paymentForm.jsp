<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>투어 예약 완료</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<script type="text/javascript">
   function pageMoveListFnc(){
      location.href = "list.do";
   }
   function paymentFnc() {
	   location.href = "paymentCtr.do?reserveIdx=${reserveIdx}";
   }
</script>
<style type="text/css">
.ahreum {
	width: 220px;
	height: 50px;
	font: normal bold 18px Segoe UI;
	color: white;
	background-color: #0D4371;
	border: 0px;
	text-align: center;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<h1 style="text-align: center;">입금</h1>
	<br />
	<div
		style="width: 740px; height: 640px; margin: auto;">
		<div
			style="width: 496px; height: 450px; border: 1px solid black; margin: auto;">
			<div>
				<table style="width: 496px; height: 400px;">
					<tr>
						<td class="ahreum">입금 계좌</td>
						<td>
							${memberVo.tourAccountNum}
						</td>
					</tr>
					<tr>
						<td class="ahreum">
							내 계좌
						</td>
						<td>
							<input type='text'>
						</td>
					</tr>
					<tr>
						<td class="ahreum">
							예금주
						</td>
						<td>
							<input type='text'>
						</td>
					</tr>
					<tr>
						<td class="ahreum">
							인원 수
						</td>
						<td>
							${memberVo.reserveApplyNum}
						</td>
					</tr>
					<tr>
						<td class="ahreum">
							결제 가격
						</td>
						<td>
							${memberVo.reservePrice}
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div style="text-align: center;">
			<div style="margin-top: 20px;">
				테스트용3 ${reserveIdx}
				<button class="ahreum" onclick="paymentFnc();">결제하기</button>
				<button class="ahreum" onclick="">취소하기</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>

</html>