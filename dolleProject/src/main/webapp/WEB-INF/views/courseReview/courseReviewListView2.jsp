<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>코스 후기 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">

</style>
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

				<select style="width:120px; padding: 6px 22px; vertical-align: middle;
						border: 1px solid #B9B9B9; 
						font-size:14px; font-family: Segoe UI;
						-webkit-appearance: none; /* 원본 select 버튼 감추기 */
						background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;">
					<option>최신순</option>
				</select>
				<select style="width:140px; padding: 6px 22px; vertical-align: middle;
						border: 1px solid #B9B9B9; 
						font-size:14px; font-family: Segoe UI;
						-webkit-appearance: none; /* 원본 select 버튼 감추기 */
						background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;">
					<option>제목+내용</option>
				</select>

			<div style="width:250px; height:31px; display:inline-block; border: 1px solid #B9B9B9; vertical-align: middle;">
				<input type="text" value="" style="width:190px; height:22px; vertical-align: middle;
						font: normal normal 14px Segoe UI; margin-left:10px; padding: 2px 0px 1px 10px;
						border: 0px;">
				<img id="searchBtn" alt="검색버튼" src="/dolleProject/resources/images/searchBtn.PNG" style="margin-top:2px; vertical-align: middle;"> 
			</div>
			
		</div>
	</div>
	
	<div style="width:1260px; height:2630px; margin:0 auto; background-color:yellow;">
	
		<ul style="position: relative;">
			<li class="reviewList">
				<div class="fixed_Box" style="width:244px; height:90px; position: absolute; top: 0px; left: 0px;
					background-color: lightgray;">
				</div>	
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 0px; left: 0px;">		
					<span>1</span>
				</span>
			</li>
			<li class="reviewList">
				<div class="photo_Box" style="width:244px; height:267px; position: absolute; top: 0px; left: 254px;
					background-color: lightgray; ">
					<img alt="review_photo" src="/dolleProject/resources/images/test.jpg" style="position: relative; height:100%; width:100%;">
				</div>
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 177px; left: 254px; 
					background-color: #000; opacity: 0.3;">			
				</span>
				<span class="innerBox_txt" style="width:244px; height:90px; position: absolute;top: 177px; left: 254px; 
					color:#fff; font: normal bold 25px Segoe UI; opacity: 2;">
					2
				</span>
			</li>
			<li class="reviewList">
				<div class="fixed_Box" style="width:244px; height:90px; position: absolute; top: 0px; left: 508px;
					background-color: lightgray; ">
				</div>
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 0px; left: 508px;">		
					<span>3</span>
				</span>
			</li>
			<li class="reviewList">
				<div class="photo_Box" style="width:244px; height:267px; position: absolute; top: 0px; left: 762px;
					background-color: lightgray; ">
					<img alt="review_photo" src="/dolleProject/resources/images/test.jpg" style="position: relative; height:100%; width:100%;">
				</div>
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 177px; left: 762px;
					background-color: #000; opacity: 0.3; ">
					4
				</span>
			</li>
			<li class="reviewList">
				<div class="fixed_Box" style="width:244px; height:90px; position: absolute; top: 0px; left: 1016px;
					background-color: lightgray; ">
				</div>
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 0px; left: 1016px;">		
					<span>5</span>
				</span>
			</li>
			
			
			<li class="reviewList">
				<div class="photo_Box" style="width:244px; height:267px; position: absolute; top: 100px; left: 0px;
					background-color: lightgray; ">
					<img alt="review_photo" src="/dolleProject/resources/images/test.jpg" style="position: relative; height:100%; width:100%;">
				</div>
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 277px; left: 0px;
					background-color: #000; opacity: 0.3; ">
					6
				</span>
			</li>
			<li class="reviewList">
				<div class="photo_Box" style="width:244px; height:267px; position: absolute; top: 277px; left: 254px;
					background-color: lightgray; ">
					<img alt="review_photo" src="/dolleProject/resources/images/test.jpg" style="position: relative; height:100%; width:100%;">
				</div>
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 454px; left: 254px;
					background-color: #000; opacity: 0.3; ">
					7
				</span>
			</li>
			<li class="reviewList">
				<div class="photo_Box" style="width:244px; height:267px; position: absolute; top: 100px; left: 508px;
					background-color: lightgray; ">
					<img alt="review_photo" src="/dolleProject/resources/images/test.jpg" style="position: relative; height:100%; width:100%;">
				</div>
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 277px; left: 508px;
					background-color: #000; opacity: 0.3; ">
					8
				</span>
			</li>
			<li class="reviewList">
				<div class="photo_Box" style="width:244px; height:267px; position: absolute; top: 277px; left: 762px;
					background-color: lightgray; ">
					<img alt="review_photo" src="/dolleProject/resources/images/test.jpg" style="position: relative; height:100%; width:100%;">
				</div>
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 454px; left: 762px;
					background-color: #000; opacity: 0.3; ">
					9
				</span>
			</li>
			<li class="reviewList">
				<div class="photo_Box" style="width:244px; height:267px; position: absolute; top: 100px; left: 1016px;
					background-color: lightgray; ">
					<img alt="review_photo" src="/dolleProject/resources/images/test.jpg" style="position: relative; height:100%; width:100%;">
				</div>
				<span class="innerBox" style="width:244px; height:90px; position: absolute; top: 277px; left: 1016px;
					background-color: #000; opacity: 0.3; ">
					10
				</span>
			</li>
		</ul>
		
	</div>
	
	<!-- 페이징 버튼 -->
	<div style="width:1260px; height:205px; margin:0 auto; background-color:skyblue; text-align: center;">
		<ul style="width: 600px; display: inline-block; margin-left: 165px;">
			<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleLeft.PNG" >
			</li>
			<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/left.PNG" >
			</li>
			<li style="width:50px; height:50px; display: inline-block; background: #0D4371; color:#fff; border:1px solid #707070; vertical-align: middle;
				font-size: 23px; padding-top:10px; box-sizing: border-box;">1</li>
			<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 23px; padding-top:10px; box-sizing: border-box;">2</li>
			<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 23px; padding-top:10px; box-sizing: border-box;">3</li>
			<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 23px; padding-top:10px; box-sizing: border-box;">4</li>
			<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 23px; padding-top:10px; box-sizing: border-box;">5</li>
			<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/right.PNG" >
			</li>
			<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleRight.PNG" >
			</li>
		</ul>
		<button style="width:220px; height:50px;
		font:normal bold 18px Segoe UI; color:white; 
		background-color: #0D4371; float:right; border:0px;">글쓰기</button>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>