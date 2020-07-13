<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>아홉 마을 소개</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
.markerLine {
	width: 500px;
	height: 40px;
	margin-top: 35px;
}

.markerTownWrap {
	width: 200px;
	height: 40px;
	float: left;
	margin-left: 32px;
}

.markerImg {
	width: 40px;
	height: 40px;
	float: left;
	cursor: pointer;
}

.townName {
	border: 1px solid #A5A5A5;
	border-radius: 4px;
	width:150px;
	height: 33px;
	float: left;
	box-sizing:border-box;
	margin-top:7px;
	padding-top: 7px;
	cursor: pointer;
}

.townNameSpan {
	font-size: 15px;
	font-weight: 600;
	font-family: Arial;
}

.threeText {
	padding-left: 50px;
}

.fiveText {
	padding-left: 37px;
}

#nineTownInfo {
	width:244px; 
	height: 49px;
}

#infoTitleWrap {
	width: 244px; 
	height: 49px; 
	margin:auto; 
	padding-top: 90px; 
	padding-right: 10px;
}

#townBtn {
	width:520px; 
	height: 680px; 
	float:left;
}

#mapWrap {
	width:740px; 
	height: 680px; 
	float: left;
	position: relative;
	overflow: hidden;
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

#markerWrap {
	width:500px; 
	height:400px; 
	margin:auto; 
	padding-top: 30px;
}

#totalWrap {
	width: 1260px; 
	height: 700px; 
	margin: auto;
	padding-top: 15px;
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
		
		$('#town01Name').mouseover(function() {
			$('#town01Name').css("backgroundColor","#0D4371");
			$('#town01Name').css("color", "#ffffff");
		});
		$('#town01Name').mouseleave(function() {
			$('#town01Name').css("backgroundColor","#ffffff");
			$('#town01Name').css("color", "#000000");
		});
		
		$('#town02Name').mouseover(function() {
			$('#town02Name').css("backgroundColor","#0D4371");
			$('#town02Name').css("color", "#ffffff");
		});
		$('#town02Name').mouseleave(function() {
			$('#town02Name').css("backgroundColor","#ffffff");
			$('#town02Name').css("color", "#000000");
		});
		
		$('#town03Name').mouseover(function() {
			$('#town03Name').css("backgroundColor","#0D4371");
			$('#town03Name').css("color", "#ffffff");
		});
		$('#town03Name').mouseleave(function() {
			$('#town03Name').css("backgroundColor","#ffffff");
			$('#town03Name').css("color", "#000000");
		});
		
		$('#town04Name').mouseover(function() {
			$('#town04Name').css("backgroundColor","#0D4371");
			$('#town04Name').css("color", "#ffffff");
		});
		$('#town04Name').mouseleave(function() {
			$('#town04Name').css("backgroundColor","#ffffff");
			$('#town04Name').css("color", "#000000");
		});
		
		$('#town05Name').mouseover(function() {
			$('#town05Name').css("backgroundColor","#0D4371");
			$('#town05Name').css("color", "#ffffff");
		});
		$('#town05Name').mouseleave(function() {
			$('#town05Name').css("backgroundColor","#ffffff");
			$('#town05Name').css("color", "#000000");
		});
		
		$('#town06Name').mouseover(function() {
			$('#town06Name').css("backgroundColor","#0D4371");
			$('#town06Name').css("color", "#ffffff");
		});
		$('#town06Name').mouseleave(function() {
			$('#town06Name').css("backgroundColor","#ffffff");
			$('#town06Name').css("color", "#000000");
		});
		
		$('#town07Name').mouseover(function() {
			$('#town07Name').css("backgroundColor","#0D4371");
			$('#town07Name').css("color", "#ffffff");
		});
		$('#town07Name').mouseleave(function() {
			$('#town07Name').css("backgroundColor","#ffffff");
			$('#town07Name').css("color", "#000000");
		});
		
		$('#town08Name').mouseover(function() {
			$('#town08Name').css("backgroundColor","#0D4371");
			$('#town08Name').css("color", "#ffffff");
		});
		$('#town08Name').mouseleave(function() {
			$('#town08Name').css("backgroundColor","#ffffff");
			$('#town08Name').css("color", "#000000");
		});
		
		$('#town09Name').mouseover(function() {
			$('#town09Name').css("backgroundColor","#0D4371");
			$('#town09Name').css("color", "#ffffff");
		});
		$('#town09Name').mouseleave(function() {
			$('#town09Name').css("backgroundColor","#ffffff");
			$('#town09Name').css("color", "#000000");
		});
		
		
		
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
	
	function move01Marker() {
		var moveLatLon = new kakao.maps.LatLng(37.590806, 126.992314);
		
		map.setLevel(level - 3);
		map.panTo(moveLatLon);
	}
	
	function move02Marker() {
		var moveLatLon = new kakao.maps.LatLng(37.593548, 126.991672);
		
		map.setLevel(level - 3);
		map.panTo(moveLatLon);
	}
	
	function move03Marker() {
		var moveLatLon = new kakao.maps.LatLng(37.580506, 127.010088);
		
		map.setLevel(level - 3);
		map.panTo(moveLatLon);
	}
	
	function move04Marker() {
		var moveLatLon = new kakao.maps.LatLng(37.578626, 127.005050);
		
		map.setLevel(level - 3);
		map.panTo(moveLatLon);
	}
	
	function move05Marker() {
		var moveLatLon = new kakao.maps.LatLng(37.574407, 127.010851);
		
		map.setLevel(level - 3);
		map.panTo(moveLatLon);
	}
	
	function move06Marker() {
		var moveLatLon = new kakao.maps.LatLng(37.563174, 127.007311);
		
		map.setLevel(level - 3);
		map.panTo(moveLatLon);
	}
	
	function move07Marker() {
		var moveLatLon = new kakao.maps.LatLng(37.556006, 127.007064);
		
		map.setLevel(level - 3);
		map.panTo(moveLatLon);
	}
	
	function move08Marker() {
		var moveLatLon = new kakao.maps.LatLng(37.573796, 126.961173);
		
		map.setLevel(level - 3);
		map.panTo(moveLatLon);
	}
	
	function move09Marker() {
		var moveLatLon = new kakao.maps.LatLng(37.592463, 126.964120);
		
		map.setLevel(level - 3);
		map.panTo(moveLatLon);
	}
	
	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
	function moveNonePageFnc() {
		
 		alert("준비중입니다. 다른 마을을 둘러보세요!!");
		  
	}
	
	function move01PageFnc() {
		
		location.href = './nineInfoDetail.do';
	}
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='totalWrap'>
	
		<div id='mapWrap'>
			<div id='map'>
			</div>

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
		
		<div id='townBtn'>
			<div id='infoTitleWrap'>
				<img id='nineTownInfo' src="/dolleProject/resources/images/nineTownInfo.png" alt="아홉마을소개">
			</div>
			
			<div id='markerWrap'>
				<div class='markerLine' id='firstLine'>
					<div class='markerTownWrap'>
						<img class='markerImg' src='/dolleProject/resources/images/marker/01Marker.png'
							 onClick="move01Marker();">
						<div onclick="move01PageFnc();" id='town01Name' class='townName fiveText'>
							<span class='townNameSpan'>혜화명륜권</span>
						</div>
					</div>
					
					<div class='markerTownWrap'>
						<img class='markerImg' src='/dolleProject/resources/images/marker/06Marker.png'
							 onClick="move06Marker();">
						<div onclick="moveNonePageFnc();" id='town06Name' class='townName threeText'>
							<span class='townNameSpan'>성북권</span>
						</div>
					</div>
				</div>
				
				<div class='markerLine' id='secondLine'>
					<div class='markerTownWrap'>
						<img class='markerImg' src='/dolleProject/resources/images/marker/02Marker.png'
							onClick="move02Marker();">
						<div onclick="moveNonePageFnc();" id='town02Name' class='townName threeText'>
							<span class='townNameSpan'>삼선권</span>
						</div>
					</div>
					
					<div class='markerTownWrap'>
						<img class='markerImg' src='/dolleProject/resources/images/marker/07Marker.png'
							onClick="move07Marker();">
						<div onclick="moveNonePageFnc();" id='town07Name' class='townName fiveText'>
							<span class='townNameSpan'>이화충신권</span>
						</div>
					</div>
				</div>
				
				<div class='markerLine' id='thirdLine'>
					<div class='markerTownWrap'>
						<img class='markerImg' src='/dolleProject/resources/images/marker/03Marker.png'
							onClick="move03Marker();">
						<div onclick="moveNonePageFnc();" id='town03Name' class='townName threeText'>
							<span class='townNameSpan'>창신권</span>
						</div>
					</div>
					
					<div class='markerTownWrap'>
						<img class='markerImg' src='/dolleProject/resources/images/marker/08Marker.png'
							onClick="move08Marker();">
						<div onclick="moveNonePageFnc();" id='town08Name' class='townName threeText'>
							<span class='townNameSpan'>광희권</span>
						</div>
					</div>
				</div>
				
				<div class='markerLine' id='fourthLine'>
					<div class='markerTownWrap'>
						<img class='markerImg' src='/dolleProject/resources/images/marker/04Marker.png'
							onClick="move04Marker();">
						<div onclick="moveNonePageFnc();" id='town04Name' class='townName threeText'>
							<span class='townNameSpan'>다산권</span>
						</div>
					</div>
					
					<div class='markerTownWrap'>
						<img class='markerImg' src='/dolleProject/resources/images/marker/09Marker.png'
							onClick="move09Marker();">
						<div onclick="moveNonePageFnc();" id='town09Name' class='townName threeText'>
							<span class='townNameSpan'>행촌권</span>
						</div>
					</div>
				</div>
				
				<div class='markerLine' id='fifthLine'>
					<div class='markerTownWrap'>
						<img class='markerImg' src='/dolleProject/resources/images/marker/05Marker.png'
							onClick="move05Marker();">
						<div onclick="moveNonePageFnc();" id='town05Name' class='townName threeText'>
							<span class='townNameSpan'>부암권</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
	
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>