<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>코스 후기 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">

	#fixed_Box{
		width:306px; height:114px; position: absolute; top: 0px; left: 0px; background-color: lightgray;
	}
	
</style>
<script type="text/javascript" src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
// 		alert("dd");
		var reviewNum = 20;
		
		var ulObj = $('#reviewList'); 
		for(var i=0; i<reviewNum+2; i++){	//fixed_Box 2개 포함
			var liObj = $('<li class="reviewList_li"></li>');		
			
			ulObj.append(liObj);		
		}
		
		var liObjList = $('.reviewList_li');
		
		for(var i=0; i<liObjList.length; i++){

			if(i == 0){
// 				liObjList[0].innerHTML += "<div class='fixed_Box' style='width:306px; height:114px; position: absolute; top: 0px; left: 0px; background-color: lightgray;'>";
// 				liObjList[0].innerHTML += '</div>';
// 				liObjList[0].innerHTML += '<span class="innerBox" style="width:306px; height:114px; position: absolute; top: 0px; left: 0px;">'		
// 				liObjList[0].innerHTML += '</span>';
			}
			if(i == 2 || liObjList.length >= 2){
// 				liObjList[0].innerHTML += '<div class="fixed_Box" style="width:306px; height:114px; position: absolute; top: 0px; left: 636px; background-color: lightgray;">';
// 				liObjList[0].innerHTML += '</div>';
// 				liObjList[0].innerHTML += '<span class="innerBox" style="width:306px; height:114px; position: absolute; top: 0px; left: 636px;">';
// 				liObjList[0].innerHTML += '</span>';
			}
			if(i != 0 || i != 2){
				
			}
			
		}
		
		
	});
	
</script>
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
		<div style="float:right; height:50px; width:530px; padding-top:40px;">

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
	
	
	<div style="width:1260px; height:1930px; margin:0 auto;">
	
		<ul id="reviewList" style="position: relative;">
			<!-- 고정 박스  -->
			<li class="reviewList_li">
				<div class="fixed_Box" style="width:306px; height:114px; position: absolute; top: 0px; left: 0px;
 					background-color: #E1E1E1;"> 
				</div>	
				<span class="innerBox" style="width:306px; height:114px; position: absolute; top: 0px; left: 0px;">	
				</span>
			</li>
			<li class="reviewList_li">
				<div class="fixed_Box" style="width:306px; height:114px; position: absolute; top: 0px; left: 636px;
 					background-color: #E1E1E1; ">
				</div>
				<span class="innerBox" style="width:306px; height:114px; position: absolute; top: 0px; left: 636px;">
				</span>
			</li>
			

			<!-- 상세 게시글  -->
			<!-- 행렬 개수 -->
			<c:set var="rowNum" value="5"/>
			<c:set var="colNum" value="4"/>
			<!-- 해-위치값 반복문 -->
			<c:forEach var="rowPos" begin="0" end="${354*rowNum-354}" step="354">
			<!-- 126&354 0&228 -->

				<!-- 열-위치값 반복문 -->
				<c:forEach var="colPos" begin="0" end="${318*colNum-318}" step="318" varStatus="status">
				<!-- 0 318 636 954 -->
					<!-- position 변수 -->
					<c:set var="leftPosition" value="${colPos}"/>
				
					<c:if test="${(status.index / 318) % 2 == 0}">
						<c:set var="TopPosition1" value="${rowPos + 126}"/>
						<c:set var="TopPosition2" value="${rowPos + 354}"/>
					</c:if>
					<c:if test="${(status.index / 318) % 2 == 1}">
						<c:set var="TopPosition1" value="${rowPos}"/>
						<c:set var="TopPosition2" value="${rowPos + 228}"/>
					</c:if>
						
					
					<li class="reviewList_li">
						<div class="photo_Box" style="width:306px; height:342px; position: absolute; top:${TopPosition1}px; left:${leftPosition}px;
							background-color: lightgray; ">
							<img alt="review_photo" src="<c:url value='/img/${reviewList[0].fileStoredName}'/>" style="position: relative; height:100%; width:100%;">
						</div>
						<span class="innerBox" style="width:306px; height:114px; position: absolute; top:${TopPosition2}px; left:${leftPosition}px; 
							background-color: #000; opacity: 0.3;">			
						</span>
						<span class="innerBox_txt" style="width:306px; height:114px; position: absolute; top:${TopPosition2}px; left:${leftPosition}px; 
							color:#fff; opacity: 1;">
							<span style="font: normal bold 22px Segoe UI; margin: 18px 20px 0px; display: block;">
								${reviewList[0].reviewTitle}
							</span>
							<span style="font: normal normal 14px Segoe UI; margin: 8px 20px; display: block;">
								${reviewList[0].memberNickname}
							</span>
							<span style="margin: 0px 20px; display: inline-block; width: 110px; vertical-align: middle;">
								<c:forEach var="starNum" begin="1" end="${reviewList[0].reviewRating}" step="1">
									<img alt="별_full" src="/dolleProject/resources/images/starSolid.png" 
										style="width:16px; height:16px; vertical-align: middle;">
								</c:forEach>
								<c:if test="${reviewList[0].reviewRating != 5}">
									<c:forEach var="starNum" begin="1" end="${5 - reviewList[0].reviewRating}" step="1">
										<img alt="별_blank" src="/dolleProject/resources/images/starBlank.png" 
											style="width:18px; height:16.5px; vertical-align: middle;">
									</c:forEach>
								</c:if>
							</span>
							<span style="width:50px; display: inline-block; margin-left: 20px;">
								<img alt="Icon_heart" src="/dolleProject/resources/images/IconHeart.png"
									style="width: 16px; vertical-align: middle;">
								<span style="font: normal bold 14px Segoe UI; vertical-align: middle;">${reviewList[0].reviewLikeCount}</span>		
							</span>		
							<span style="width:50px; display: inline-block; margin-left: 10px;">
								<img alt="Icon_comment" src="/dolleProject/resources/images/IconComment.png"
									style="width: 16px; vertical-align: middle;">
								<span style="font: normal bold 14px Segoe UI; vertical-align: middle;">${reviewList[0].commentCount}</span>	
							</span>
						</span>
					</li>
				
			
				</c:forEach>
			</c:forEach>
			
		</ul>
		
	</div>
	
	<!-- 페이징 버튼 -->
	<div style="width:1260px; height:205px; margin:0 auto; text-align: center; 
		padding-top: 30px; box-sizing: border-box;">
		<ul id="paging_group" style="width: 600px; display: inline-block; margin-left: 165px;">
			<li class="paging_img" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleLeft.PNG" 
					style="width: 55%;">
			</li>
			<li class="paging_img" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/left.PNG" 
					style="width: 40%;">
			</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #0D4371; color:#fff; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">1</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">2</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">3</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">4</li>
			<li class="paging_num" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
				font-size: 20px; padding-top:8px; box-sizing: border-box;">5</li>
			<li class="paging_img" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/right.PNG" 
					style="width: 42%;">
			</li>
			<li class="paging_img" style="width:40px; height:40px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleRight.PNG" 
					style="width: 55%;">
			</li>
		</ul>
		<button style="width:200px; height:45px;
		font:normal bold 18px Segoe UI; color:white; 
		background-color: #0D4371; float:right; border:0px;
		margin-right: 20px;">글쓰기</button>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>