<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Dolle</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<script src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<link href="/dolleProject/resources/css/bootstrap.css" rel="stylesheet">
<script src="/dolleProject/resources/js/bootstrap.js"></script>


<style type="text/css">
#firstContext {
	width: 100%;
	height: 753px;
	padding-top: 30px;
}

#secondContext {
	width: 100%;
	height: 800px;
	text-align: center;
}

#thirdContext {
	width: 100%;
	height: 790px;
}

.titleFont {
	font-family: "대한민국정부상징체", sans-serif;
	font-weight: bold;
	font-size: 54px;
	padding-right: 40px;
}

.subTitleFont {
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

#townSubTitlePng {
	width: 330px;
}

#btnDiv {
	width: 900px;
	margin: auto;
	padding-top: 50px;
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

#mapOutWrap {
	width: 1000px;
	margin: auto;
}

#mapWrap {
	width:1000px; 
	height: 680px; 
	float: left;
	position: relative;
	overflow: hidden;
	margin-top : 50px;
}

#map {
	width: 100%;
	height: 100%;
	position: relative;
	overflow: hidden;
}

.custom_zoomcontrol {
	position:absolute;
	top:50px;
	right:10px;
	width:36px;
	height:80px;
	overflow:hidden;
	z-index:1;
	background-color:#f5f5f5;
} 
.custom_zoomcontrol span {
	display:block;
	width:36px;
	height:40px;
	text-align:center;
	cursor:pointer;
}     
.custom_zoomcontrol span img {
	width:15px;
	height:15px;
	padding:12px 0;
	border:none;
}             
.custom_zoomcontrol span:first-child{
	border-bottom:1px solid #bfbfbf;
} 
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3879fe614fdead130ef178b2e460ef17&libraries=services"></script>
<script type="text/javascript">
	window.onload = function() {
		
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(37.576022, 126.987104), //지도의 중심좌표.
			level : 6
		//지도의 레벨(확대, 축소 정도)
		};
	
		//전역
		map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		//전역으로 맵의 레벨을 가져오기
		level = map.getLevel();
		
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		
		//마커 찍으려는 주소
		var myAddress = ["종로구 명륜10길 12", "성북구 성북로29길 24"
			, "성북구 삼선교로4길 186 ", "종로구 이화장길 70-11"
			, "종로구 창신길 62", "중구 장충단로 204"
			, "중구 신당동 832", "종로구 통일로12길 30-23"
			, "종로구 창의문로 145"];
		
		function myMarker(number, address){
			geocoder.addressSearch(
				address,
				function(result, status){
					//정상적으로 검색이 완료됐으면
					if(status === daum.maps.services.Status.OK) {
						
// 						var coords = new daum.maps.LatLng(
// 							result[0].y, result[0].x);
						
						//결과값으로 받은 위치를 마커로 표시합니다.
// 						var marker = new daum.maps.Marker({
// 							map : map,
// 							position : coords
// 						});
						
						//인포윈도우로 장소에 대한 설명을 표시합니다.
// 						var infowindow = new daum.maps.infoWindow(
// 								{
// 									// content : '<div style="width:50px;text-align:center;padding:3px 0;">|</div>'
// 									content : '<div stlye="color:red;">' + number + '</div>'
							
// 								});
// 						infowindow.open(map, marker);
						
						//커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다.
						var content = '<div class="customoverlay">'
							+ '<img style="width:35px; height:35px;"'
							+ ' src="/dolleProject/resources/images/marker/0'
							+ number 
							+ 'Marker.png" alt="marker">'
							+ '</div>';
							
						//커스텀 오버레이가 표시될 위치입니다
						var position = new daum.maps.LatLng(
								result[0].y, result[0].x);
						
						//커스텀 오버레이를 생성합니다.
						var customOverlay = new daum.maps.CustomOverlay(
								{
									map : map,
									position : position,
									content : content,
									yAnchor : 1
								});
						
						//지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
// 						map.setCenter(coords);
					}
				});
		}
		
		for (var i = 0; i < myAddress.length; i++) {
			myMarker(i + 1, myAddress[i]);
		}
		
		
	}
	
	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
	function loginMoveFnc() {
		var formObj = document.getElementById('simpleForm');

		formObj.submit();
	}

	function moveTownSeePageFnc() {
		location.href = "./town/nineInfoDetail.do?menu=see";
	}

	function moveTownEatPageFnc() {
		location.href = "./town/nineInfoDetail.do?menu=eat";
	}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<!-- 	<form action="auth/login.do" id='simpleForm' method="get"> -->
	<!-- 		<input type="button" value="로그인 화면으로 이동" onclick="loginMoveFnc();"> -->
	<!-- 	</form> -->

	<div id="firstContext">
		<div style="margin: 10px 0px 23px 100px;">
			<span class="titleFont">함께 돌래?</span>
			<span class="subTitleFont">성곽마을에서 다양한 볼거리, 먹거리들을 즐겨보세요</span>
		</div>
		<div style="margin-bottom: 28px;">
			
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
				data-slide="prev"> <img class="glyphicon glyphicon-chevron-left"
				src="/dolleProject/resources/images/mainImg/mainPrevious.png"
				aria-hidden="true" style=""> <span class="sr-only">
					Previous </span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <img
				class="glyphicon glyphicon-chevron-right"
				src="/dolleProject/resources/images/mainImg/mainNext.png"
				aria-hidden="true"> <span class="sr-only"> Next </span>
			</a>
		</div>
	</div>
	<div id="secondContext">
		<div id='mapOutWrap'>
			<span class="titleFont">성곽 마을 지도</span>
			<div id='mapWrap'>
				<div id='map'></div>
				<div class="custom_zoomcontrol radius_border">
				<span onclick="zoomIn()">
					<img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
						alt="확대">
				</span> 
				<span onclick="zoomOut()">
					<img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
						alt="축소">
				</span>
			</div>
			</div>
		</div>
	</div>

	<div id="thirdContext">
		<div id='thirdSmallContext'>
			<div id='titleDiv'>
				<img id='townTitlePng'
					src="/dolleProject/resources/images/mainImg/townTitle.png"
					alt="체험. 행사. 음식">
			</div>

			<div id='subTitleDiv'>
				<img id='townSubTitlePng'
					src="/dolleProject/resources/images/mainImg/townSubTitle.png"
					alt="다양한 볼거리 먹거리">
			</div>

			<div id='btnDiv'>
				<img id='townSeePng'
					src="/dolleProject/resources/images/mainImg/townSeePageBtn.png"
					alt="볼거리 버튼" onclick='moveTownSeePageFnc();'> <img
					id='townEatPng'
					src="/dolleProject/resources/images/mainImg/townEatPageBtn.png"
					alt="먹거리 버튼" onclick='moveTownEatPageFnc();'>
			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>
</html>