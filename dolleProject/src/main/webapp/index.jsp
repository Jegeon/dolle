<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Dolle</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
	#firstContext{
		width: 100%;
		height: 753px;
		background-color: skyblue;
	}
	#secondContext{
		padding-top: 70px;
		width: 100%;
		height: 900px;
		background-color: #EFEAE2;
		text-align: center;
	}
	#thirdContext{
		width: 100%;
		height: 980px;
		background-color: skyblue;
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
</style>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	function loginMoveFnc(){
		var formObj = document.getElementById('simpleForm');
		
		formObj.submit();
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
		<div id="imagesBox" style="background-color: yellow; width:1903px; height:760px;">
			
		</div>
	</div>
	<div id="thirdContext">
	3
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>
</html>