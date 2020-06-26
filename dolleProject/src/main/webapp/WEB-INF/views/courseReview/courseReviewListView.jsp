<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>코스 후기 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div style="width:1260px; height:130px; margin:0 auto;">
		<h1 style="font-size:30px; font-family: 대한민국정부상징체 ; margin: 55px 0px 20px 82px;">코스 후기 게시판</h1>
		<div style="width:200px; border-bottom: 4px solid #FFCC00; text-align: center; 
		margin-left:300px; padding-bottom:4px; display: inline-block;">
			<span style="font: normal bold 22px Segoe UI">혜화 명륜 마을</span>
		</div>
		<!-- 정렬선택과 검색창 -->
		<div style="float:right; height:50px; width:570px; padding-top: 30px;">
<!-- 			<div style="margin:5px; display:inline-block;"> -->
				<select style="width:120px; padding: 6px 22px; vertical-align: middle;
						border: 1px solid #B9B9B9; 
						font-size:14px; font-family: Segoe UI;
						background: url('./img/selectDownBtn.PNG') no-repeat 50% 50%;">
					<option>최신순</option>
				</select>
				<select style="width:140px; padding: 6px 22px; vertical-align: middle;
						border: 1px solid #B9B9B9; 
						font-size:14px; font-family: Segoe UI;">
					<option>제목+내용</option>
				</select>
<!-- 			</div> -->
			<input type="text" value="" style="width:240px; height:30px; vertical-align: middle;
					font: normal normal 14px Segoe UI; padding: 2px 20px 1px;
					border: 1px solid #B9B9B9; 
/* 					background-image : url('image.gif');  */
/* 					background-position:top right;  */
/* 					background-repeat:no-repeat;" */
					>
			<!-- 이미지파일 테스트  -->
<!-- 			<img alt="dlalwl" src="/img/selectDownBtn.PNG"> -->
		</div>
	</div>
	
	<div style="width:1260px; height:2630px; margin:0 auto; background-color:yellow;">
	
	</div>
	
	<div style="width:1260px; height:205px; margin:0 auto; background-color:skyblue;">
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		<button style="width:220px; height:50px;
		font:normal bold 18px Segoe UI; color:white; 
		background-color: #0D4371">글쓰기</button>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>