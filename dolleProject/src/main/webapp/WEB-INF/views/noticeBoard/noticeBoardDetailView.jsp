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
body {
	font-family: Segoe UI;
}

#contentWrap {
	width: 1260px;
	margin: 50px auto 50px auto;
	box-sizing: border-box;
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
		<div style="width: 1160px; height: 1500px; margin: auto;">
			<div id='titleWrap' style="width: 1100px; margin: 30px 0px 30px 0px;">
				<span style="font-size: 24px; font-family: 'segoe UI';">혜화마을 풍경사진입니다.</span>
			</div>
			
			<div style="height: 25px;">
				<span style="display: inline-block; padding-top: 4px;">작성자: 혜화마을이장</span>
			
				<span style="float:right; font-size: 17px; margin-right: 10px; padding-right:15px; padding-left: 15px;">윗 글</span>
				<img style="float:right; width: 30px; height: 22px; color: white;" 
					alt="upBtn" src="/dolleProject/resources/images/upBtn.png">
			</div>
			
			<div style="height: 25px;">
				<span style="display: inline-block; padding-top: 4px;">작성일: 2020-06-17</span>
				
				<span style="float:right; font-size: 17px; margin-right: 10px; padding-left: 8px; padding-right: 5px;">아랫 글</span>
				<img style="float:right; width: 30px; height: 22px; color: white;" 
					alt="upBtn" src="/dolleProject/resources/images/downBtn.png">
			</div>
			
			<div style="width: 1160px; height: 765px;">
				<img alt='' src='/dolleProject/resources/images/gzone.JPG' style="width: 100%; height: 100%;">
			</div>
			
			
			<a href='#' style="float:right; color: black; text-decoration: none; height: 30px; padding-top: 10px;">파일첨부</a>
			
			<textarea style="width:1160px; height: 470px; box-sizing: border-box; padding:50px; font-size: 17px;" rows="25" cols="160">
			
			</textarea>
			
			<div style="margin: auto; width: 230px; padding-top: 40px;">
				<input style="width: 230px; height: 40px; background-color: #0D4371; text-align: center; vertical-align: middle; color: white; font-weight: bold; font-size: 20px; border: none;"value='목록으로'>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>
</html>