<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>에러 페이지</title>
<style type="text/css">
#errorWrap{
	width: 760px;
	height: 330px;
	margin: auto;
	padding-top: 200px;
}


#imgWrap {
	width:128px;
	margin: auto;
}

#titleWrap {
	width: 540px;
	margin: auto;
	line-height: 50px;
	padding-top: 20px;
}

#contentWrap {
	width: 610px;
	margin: auto;
	line-height: 30px;
}
#titleSpan {
	font-size: 45px;
	text-align: center;
	font-family: '대한민국정부상징체';
}

#contentSpan {
	font-size: 20px;
	text-align: center;
	font-family: '대한민국정부상징체';
}
</style>
</head>

<body>
	<div id='errorWrap'>
		<div id='imgWrap'>
			<img id='errorImg' 
				src='/dolleProject/resources/images/error/close.png' alt='errorImg'>
		</div>
		<div id='titleWrap'>
			<span id='titleSpan'>
				페이지를 찾을 수 없습니다.
				<br>뒤로가기 버튼을 눌러주세요!
			</span>
		</div>
		<div id='contentWrap'>
			<span id='contentSpan'> 
				방문하시려는 페이지의 주소가 잘못 입력되었거나,
				<br> 페이지의 주소가 변경 혹은 삭제되어
				요청하신 페이지를 찾을 수 없습니다.
				<br> 
				입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
			</span>
		</div>
	</div>
</body>
</html>