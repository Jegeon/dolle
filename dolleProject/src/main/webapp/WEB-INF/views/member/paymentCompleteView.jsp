<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>입금 완료</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<script type="text/javascript">
</script>
<style type="text/css">
	div {
		text-align: center;
		margin: auto;
	}
	
	span {
		font-size: 20px;
	}
	
	.btnCss {
		background-color: #0D4371;
		color: #FFFFFF;
		border: 0px;
		outline: 0px;
		font-size: 5px;
		padding: 10px;
	}
	
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
<script type="text/javascript" src="\dolleProject\resources\js\jquery-3.5.1.js"></script>
<script type="text/javascript">
	function completeBtnFnc() {
		location.href = '../member/listOne.do?no=' + $('#noCheck').val();
	}
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div>
		<span>입금이 완료되었습니다.</span>
	</div>
	<br>
	<div>
		<input class='btnCss' type='button' onclick='completeBtnFnc();' value='확인'>
	</div>
	<br>
	<input id='noCheck' type='hidden' value='${_memberVo_.no}'>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>

</html>