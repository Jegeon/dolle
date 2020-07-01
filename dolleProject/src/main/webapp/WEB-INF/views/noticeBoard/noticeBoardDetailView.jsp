<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>공지사항 게시판 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

</head>
<style type="text/css">
#contentWrap {
	width: 1260px;
	height: 1260px;
	margin: 50px auto 50px auto;
	box-sizing: border-box;
	border: 1px solid black;
}

#megaPhone {
	width: 40px;
	height: 40px;
	box-sizing: border-box;
}

#pageTitle{
	font-size: 47px; 
	font-family: 대한민국정부상징체;
}

</style>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id='contentWrap'>
		<img id='megaPhone' alt="megaPhone" src="../resources/images/megaPhone.png">
		<span id='pageTitle'>공지사항</span>
		<div style="width: 1160px; height: 800px; border: 1px solid black; margin: auto;">
			<div id='titleWrap'>
				<span>혜화마을 풍경사진입니다.</span>
			</div>
			
			<div style="border:1px solid black;">
				<span>작성자: 혜화마을이장</span>
			
				<button style="float:right;"><img>윗글</button>
			</div>
			
			<div style="border:1px solid black;">
				<span>작성일: 2020-06-17</span>
				
				<button style="float:right;">아랫글</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>
</html>