<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Dolle</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<script src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<link href="/dolleProject/resources/css/bootstrap.css" rel="stylesheet">
<script src="/dolleProject/resources/js/bootstrap.js"></script>

<style type="text/css">
	#firstContext{
		width: 100%;
		height: 753px;
		padding-top: 50px;
	}
	#secondContext{
		padding-top: 90px;
		width: 100%;
		height: 900px;
		text-align: center;
	}
	#thirdContext{
		width: 100%;
		height: 790px;
	}
	
	.titleFont{
		font-family: "대한민국정부상징체", sans-serif;
		font-weight: bold;
		font-size: 54px;
	}
	.subTitleFont{
		font-family: "대한민국정부상징체", sans-serif;
		font-weight: bold;
		font-size: 18px;
	}
	
	#thirdSmallContext {
		width: 1260px;
		background-color: white;
		margin: auto;
		padding-top: 90px;
	}
	
	#titleDiv {
		width: 300px;
		margin: auto;
	}
	
	#townTitlePng {
		width: 300px;
	}
	
	#subTitleDiv {
		width: 330px;
		margin: auto;
		padding-top: 15px;
	}
	
	#townSubTitlePng{
		width: 330px;
	}
	
	#btnDiv {
		width: 900px;
		margin: auto;
		padding-top : 50px;
	}
	
	#townSeePng {
		width: 420px;
		float: left;
		margin-right: 30px;
		cursor: pointer;
	}
	
	#townEatPng {
		width: 420px;
		float: left;
		margin-left: 30px;
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	function loginMoveFnc(){
		var formObj = document.getElementById('simpleForm');
		
		formObj.submit();
	}
	
	function moveTownSeePageFnc(){
		location.href="./town/nineInfoDetail.do?menu=see";
	}
	
	function moveTownEatPageFnc(){
		location.href="./town/nineInfoDetail.do?menu=eat";
	}
</script>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
<!-- 	<form action="auth/login.do" id='simpleForm' method="get"> -->
<!-- 		<input type="button" value="로그인 화면으로 이동" onclick="loginMoveFnc();"> -->
<!-- 	</form> -->
	
	<div id="firstContext">
	1
	</div>
	<div id="secondContext">
		<div style="margin: 10px 0px 23px 0px;">
			<span class="titleFont">함께 돌래?</span>
		</div>
		<div style="margin-bottom: 28px;">	
			<span class="subTitleFont">성곽마을에서 다양한 볼거리, 먹거리들을 즐겨보세요</span>
		</div>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" class=""></li>
				<li data-target="#myCarousel" data-slide-to="2" class=""></li>
				<li data-target="#myCarousel" data-slide-to="3" class=""></li>
				<li data-target="#myCarousel" data-slide-to="4" class=""></li>
				<li data-target="#myCarousel" data-slide-to="5" class=""></li>
				<li data-target="#myCarousel" data-slide-to="6" class=""></li>
				<li data-target="#myCarousel" data-slide-to="7" class=""></li>
				<li data-target="#myCarousel" data-slide-to="8" class=""></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="first-slide"
						src="/dolleProject/resources/images/mainImg/main01Jpg.jpg"
						alt="First slide">
				</div>
				<div class="item">
					<img class="second-slide"
						src="/dolleProject/resources/images/mainImg/main02Png.png"
						alt="Second slide">
				</div>
				<div class="item">
					<img class="third-slide"
						src="/dolleProject/resources/images/mainImg/main03Png.png"
						alt="Third slide">
				</div>
				<div class="item">
					<img class="fourth-slide"
						src="/dolleProject/resources/images/mainImg/main04Png.png"
						alt="Fourth slide">
				</div>
				<div class="item">
					<img class="fifth-slide"
						src="/dolleProject/resources/images/mainImg/main05Png.png"
						alt="Fifth slide">
				</div>
				<div class="item">
					<img class="sixth-slide"
						src="/dolleProject/resources/images/mainImg/main06Png.png"
						alt="Sixth slide">
				</div>
				<div class="item">
					<img class="seventh-slide"
						src="/dolleProject/resources/images/mainImg/main07Png.png"
						alt="Seventh slide">
				</div>
				<div class="item">
					<img class="eighth-slide"
						src="/dolleProject/resources/images/mainImg/main08Png.png"
						alt="Eighth slide">
				</div>
				<div class="item">
					<img class="ninth-slide"
						src="/dolleProject/resources/images/mainImg/main09Png.png"
						alt="Ninth slide">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> 
				
				
				<img class="glyphicon glyphicon-chevron-left" src="/dolleProject/resources/images/mainImg/mainPrevious.png"
					aria-hidden="true" style="">
				
				<span class="sr-only">
					Previous
				</span>
			</a> 
			
			<a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> 
				

				<img class="glyphicon glyphicon-chevron-right" src="/dolleProject/resources/images/mainImg/mainNext.png"
					aria-hidden="true">
				
				<span class="sr-only">
					Next
				</span>
			</a>
		</div>
		
	</div>
	
	<div id="thirdContext">
		<div id='thirdSmallContext'>
			<div id='titleDiv'>
				<img id='townTitlePng' 
					src="/dolleProject/resources/images/mainImg/townTitle.png" alt="체험. 행사. 음식">
			</div>
			
			<div id='subTitleDiv'>
				<img id='townSubTitlePng'
					src="/dolleProject/resources/images/mainImg/townSubTitle.png" alt="다양한 볼거리 먹거리">
			</div>
			
			<div id='btnDiv'>
				<img id='townSeePng'
					src="/dolleProject/resources/images/mainImg/townSeePageBtn.png" alt="볼거리 버튼"
					onclick='moveTownSeePageFnc();'>
				<img id='townEatPng'
					src="/dolleProject/resources/images/mainImg/townEatPageBtn.png" alt="먹거리 버튼"
					onclick='moveTownEatPageFnc();'>
			</div>
		</div>
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>
</html>