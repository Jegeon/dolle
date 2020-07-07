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
	입금이 완료되었습니다
	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>

</html>