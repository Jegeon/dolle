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
	width: 200px;
	height: 45px;
	font: normal bold 18px Segoe UI;
	color: white;
	background-color: #0D4371;
	border: 0px;
	text-align: center;
	vertical-align: middle;
}
td, tr {
	border: 1px solid black;
}
.vMiddlePL20 {
	padding-left: 20px;
	vertical-align: middle;
}
.daehanFont {
		font-size: 30px; 
		font-family: 대한민국정부상징체 ; 
	}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<h1 class="daehanFont" style="margin: 10px 0px 10px 0px; text-align: center;">입금</h1>
	<br />
	<div
		style="width: 740px; height: 500px; margin: auto;">
		<div
			style="width: 496px; height: 300px; border: 1px solid black; margin: auto;">
			<div>
				<table style="width: 496px; height: 300px;">
					<tr>
						<td class="ahreum">입금 계좌</td>
						<td class="vMiddlePL20">
							${memberVo.tourAccountNum}
						</td>
					</tr>
					<tr>
						<td class="ahreum">
							내 계좌
						</td>
						<td class="vMiddlePL20">
							<input type='text'>
						</td>
					</tr>
					<tr>
						<td class="ahreum">
							예금주
						</td>
						<td class="vMiddlePL20">
							<input type='text'>
						</td>
					</tr>
					<tr>
						<td class="ahreum">
							인원 수
						</td>
						<td class="vMiddlePL20">
							${memberVo.reserveApplyNum} 명
						</td>
					</tr>
					<tr>
						<td class="ahreum">
							결제 가격
						</td>
						<td class="vMiddlePL20">
							<fmt:formatNumber value="${memberVo.reservePrice}" pattern="#,###" /> 원
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div style="text-align: center;">
			<div style="margin-top: 20px;">
				<button class="ahreum" onclick="paymentFnc();">결제하기</button>
				<button class="ahreum" onclick="">취소하기</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>

</html>