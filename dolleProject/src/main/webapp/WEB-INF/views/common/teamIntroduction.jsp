<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>팀 소개</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
</head>

<body>
	
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div style="height: 2000px;">
	<!-- 1 번째 div -->
		<div style="width: 1260px; height: 600px; background-image: url('/dolleProject/resources/images/GzoneBackGround.png'); margin: auto;">
			<div style="width: 555px; height: 500px; margin-left: 50px; text-align: center; float: left;">
				<div style="padding-top: 150px;">
					<a style="font-size: 240px; ">共存</a>
				</div>
			</div>
			<div style="width: 555px; height: 500px; margin-left: 50px; float: left;">
				<div style="padding-top: 150px;">
					<span style="font-family: 대한민국정부상징체 ; font-size:40px; line-height: 200%;">
						팀 공존 <br>
					</span>
					<br>
					<span style="font-size: 20px; font-family: 대한민국정부상징체;">
						공존 [공ː존] <br><br>
						1. [명사] 두 가지 이상의 사물이나 현상이 함께 존재함. <br>
						2. [명사] 서로 도와서 함께 존재함. <br>
						<br>
						
						개인이 중요한 만큼 개인과 개인이 모이는 공간의 의미는 더욱 깊습니다. <br>
						팀 공존은 함께 살아가는 세상에서 옛 것과 지금 것의 같이의 가치를, 개인과 개인의 같이의 가치를 생각합니다. <br>
						공간을 아무것도 없는 빈 곳이 아닌,  함께하는 곳으로 만들어갑니다. <br>
					</span>
				</div>
			</div>
		</div>
		
		<!-- 1 번째 div -->
		
		<!-- 2 번째 div -->
		<div id="aim" style="width: 1260px; background-color: lightgrey; margin: auto;">
			<div style="width: 1160px; height: 200px; margin-left: 50px;">
				<div style="text-align: center; padding-top: 50px;">
					<span style="font-family: 대한민국정부상징체 ; font-size:40px; line-height: 200%;">
						기획 의도 <br>
					</span>
				</div> 
			</div>
			<div style="width: 960px; height: 400px; margin-left: 50px; padding-left: 100px; padding-right: 100px;">
				<span style="font-size: 20px; font-family: 대한민국정부상징체; ">
				공존은 성곽마을의 가치를 공유하여 성곽마을의 지속가능한 발전을 꿈꿉니다. 
				<br>
				<br>
				2014년 부터 시작된 서울시 성곽마을 재생사업(Restoration of City Wall Town) 에도 불구하고 방문객들에게 잘 알려지지 않았습니다. 
				<br>
				<br>
				역사와 현재가 공존하는 성곽마을에 대한 정보를 인터넷을 통해 내국인 뿐만 아니라 외국인들에게도 공유하여 접근성을 높이고, 침체된 성곽마을에 열정과 활기를 불어넣습니다.
				</span> 
			</div>
		</div>
		<!-- 2 번째 div -->
		
		<!-- 3 번째 div -->
		<div style="width: 1260px; background-color: white; margin: auto;">
			<div style="width: 1160px; height: 200px; margin-left: 50px;">
				<div style="text-align: center; padding-top: 50px;">
					<span id="teamIntro" style="font-family: 대한민국정부상징체 ; font-size:40px; line-height: 200%;">
						팀원 소개 <br>
					</span>
				</div> 
			</div>
			<div style="text-align: center;">
				<div style="float: left; width: 280px; height: 400px; border: 1px solid #707070;">
					<div style="width: 280px; height: 200px; margin-top: 20px;">
						<img id="uploadImg" alt="upload_image" src="/dolleProject/resources/images/jegeon.png"
						style="height:100%;">
					</div>
					<div style="width: 280px; height: 180px;">
						<div style="margin-top: 30px; color: #0D4371; font-size: 30px; 
						font-family: 대한민국정부상징체 ; ">류제건 (팀장)</div>
						<div style="margin-top: 30px;">팀 소개</div>
						<div style="margin-top: 10px;">투어 예약</div>
					</div>
				</div>
				<div style="float: left; width: 280px; height: 400px; border: 1px solid #707070; margin-left: 44px;">
					<div style="width: 280px; height: 200px; margin-top: 20px;">
						<img id="uploadImg" alt="upload_image" src="/dolleProject/resources/images/ahreum.PNG"
						style="height:100%;">
					</div>
					<div style="width: 280px; height: 180px;">
						<div style="margin-top: 30px; color: #0D4371; font-size: 30px; 
						font-family: 대한민국정부상징체 ; ">원아름</div>
						<div style="margin-top: 30px;">코스 후기 게시판</div>
						<div style="margin-top: 10px;">통계</div>
					</div>
				</div>
				<div style="float: left; width: 280px; height: 400px; border: 1px solid #707070; margin-left: 44px;">
					<div style="width: 280px; height: 200px; margin-top: 20px;">
						<img id="uploadImg" alt="upload_image" src="/dolleProject/resources/images/u.PNG"
						style="height:100%;">
					</div>
					<div style="width: 280px; height: 180px;">
						<div style="margin-top: 30px; color: #0D4371; font-size: 30px; 
						font-family: 대한민국정부상징체 ; ">양우진</div>
						<div style="margin-top: 30px;">마을 소개</div>
						<div style="margin-top: 10px;">공지 사항</div>
					</div>
				</div>
				<div style="float: left; width: 280px; height: 400px; border: 1px solid #707070; margin-left: 44px;">
					<div style="width: 280px; height: 200px; margin-top: 20px;">
						<img id="uploadImg" alt="upload_image" src="/dolleProject/resources/images/yong.png"
						style="height:100%;">
					</div>
					<div style="width: 280px; height: 180px;">
						<div style="margin-top: 30px; color: #0D4371; font-size: 30px; 
						font-family: 대한민국정부상징체 ; ">이용훈</div>
						<div style="margin-top: 30px;">회원관리</div>
						<div style="margin-top: 10px;"></div>
					</div>
				</div>
			</div>
		</div>
	<!-- 3 번째 div -->
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>
</html>