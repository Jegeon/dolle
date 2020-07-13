<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마을 소개 상세</title>
<style type="text/css">


#totalWrap {
	width: 1260px;
	height: 900px;
	margin: auto;
	padding-top: 30px;
	border:1px solid black;
}

#imgWrap {
	width: 740px;
	height: 680px;
	background-color: skyblue;
	float: left;
}

#contentWrap {
	width: 520px;
	height: 680px;
	background-color: pink;
	float: left;
}

#fontImgWrap {
	background-color: gray;
	padding-top: 15px;
	padding-left: 176px;
}

#hhmrgFont {
	width: 183px;
	height: 37px;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id='totalWrap'>
		<div id='imgWrap'>
		
		</div>
		
		<div id='contentWrap'>
			<div id='fontImgWrap'>
				<img id='hhmrgFont' src='/dolleProject/resources/images/hhmrgFont.PNG'
					alt='혜화명륜권'>
			</div>
			
			<div id='contentSmallWrap'>
				<div class='contentLine' id='townIntroduceLine'>
					<div class='contentBtn'>
						<span>마을 소개</span>
					</div>
				</div>
				
				<div class='contentLine' id='townSeeLine'>
					<div class='contentBtn'>
						<span>마을 볼거리</span>
					</div>
				</div>
				
				<div class='contentLine' id='townEatLine'>
					<div class='contentBtn'>
						<span>마을 먹거리</span>
					</div>
				</div>
				
				<div class='contentLine' id='townPlayLine'>
					<div class='contentBtn'>
						<span>마을 놀거리</span>
					</div>
				</div>
				
				<div class='contentLine' id='recommendCourseLine'>
					<div class='contentBtn'>
						<span>추천 코스</span>
					</div>
				</div>
			
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>