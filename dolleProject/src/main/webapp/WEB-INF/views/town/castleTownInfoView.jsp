<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>성곽마을이란?</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
#totalWrap {
	width: 1260px;
	height: 800px;
	margin: auto;
	padding-top: 30px;
}

#imgWrap {
	width: 698px;
	height: 680px;
	float: left;
	box-sizing: border-box;
	margin-right: 42px;
}

#contentWrap {
	width: 520px;
	height: 680px;
	float: left;
}

#leftImg {
	width: 698px;
	height: 680px;
}

#fontImgWrap {
	padding-top: 120px;
	padding-left: 140px;
}

#castleTownTitleImg {
	width: 250px;
}

#contentStyle {
	font-family: 'Seogoe UI';
	font-size:  16px;
	font-weight: 700;
}

#spanWrap {
	padding-top: 40px;
	line-height: 30px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id='totalWrap'>
	
		<div id='imgWrap'>
			<img id='leftImg' 
				src='/dolleProject/resources/images/townIntroduce/castleTown.jpg' alt='leftImg'>
		</div>
		
		<div id='contentWrap'>
			<div id='fontImgWrap'>
				<img id='castleTownTitleImg'
					src='/dolleProject/resources/images/townIntroduce/castleTownTitle.png' alt='castleTownTitleImg'>
			</div>
			<div id='spanWrap'>
				<span id='contentStyle'>
					한양 도성 주변'성곽마을'은 자연지형에 순응하여 도성과 조화를 이루는
					세계적으로 유례없는 유산의 가치를 보유하고 있습니다.<br>
					<br>역사문화와 생활문화가 공존하는 성곽마을에서는 다양한 공동체 활동이
					이루어지고 있으며,<br>
					<br>최근 이러한 특색있는 장소와 공간에 대한 시민들의 관심이 고조되고 있습니다.
					<br>
					<br>9개 권역으로 나눠진 성곽마을을 둘러보세요.
					
				</span>
			</div>
		</div>
	
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>