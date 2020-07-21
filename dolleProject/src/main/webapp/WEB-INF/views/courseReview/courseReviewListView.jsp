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

	#title{
		font-size:30px; font-family: 대한민국정부상징체 ; margin: 55px 0px 20px 82px;
	}
	
	#subTitle{
		width:200px; border-bottom: 4px solid #FFCC00; text-align: center; 
		margin-left:300px; padding-bottom:4px; display: inline-block;
	}
	
	.fixedBox{
 		width:306px; height:114px; background-color: #E1E1E1; 
   		background: url('/dolleProject/resources/images/reviewList/640기와3.jpg') no-repeat 53% 64% 
	}
	
	.innerBox{
		width:306px; height:114px; 
	}
	
	.innerBoxBG{
		background-color:#000; opacity:0.3;
 	}  

	.titleOverFlow{
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    width: 264px;
	    height: 28px;
	}
	
	/* 이미지박스 리스트 */
	.photo_Box{
		cursor:pointer;
		background-color: lightgray;
		overflow:hidden; 
		width:306px; height:342px; 
		position: absolute; 
	}
	.innerBox_txt{
		color:#fff; opacity:1; width:306px; height:114px; position: absolute; cursor:pointer;
	}
	
	/* 정렬 */
	#orderOption{
		width:120px; padding: 6px 22px; vertical-align: middle;
						border: 1px solid #B9B9B9; 
						font-size:14px; font-family: Segoe UI;
						-webkit-appearance: none; /* 원본 select 버튼 감추기 */
						background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;
	}
	
	/* 검색 */
	#searchOption{
	width:140px; padding: 6px 22px; vertical-align: middle;
						border: 1px solid #B9B9B9; 
						font-size:14px; font-family: Segoe UI;
						-webkit-appearance: none; /* 원본 select 버튼 감추기 */
						background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;
	}
	#keywordBox{
    	width:250px; height:31px; display:inline-block;
					 border:1px solid #B9B9B9; vertical-align:middle;
    }
    #keyword{
    	width:190px; height:22px; vertical-align: middle;
							font: normal normal 14px Segoe UI; margin-left:10px;
							padding: 2px 0px 1px 10px; border: 0px;
    }
    #searchBtn{
    	margin-top:2px; vertical-align: middle;	
    }
    
    /* 검색결과 없는 경우 */
    #noSearchBox{
   		margin:0px auto; width:1245px; height:514px; border:2px solid #EBEBEB ; text-align: center;
    }
    #noSearch{
    	padding:130px 0px 26px; width:150px; height:150px; margin:0px auto;
    }
    
    /* 페이징 */
    #pagingBox{
    	width:1260px; height:205px; margin:0 auto; text-align: center; 
		padding-top: 30px; box-sizing: border-box;
    }
    #pagingGroup{
    	width: 600px; display: inline-block; margin-left: 165px;
    }
    .pagingImg{
    	cursor: pointer; width:40px; height:40px; display: inline-block; 
				 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;
    }
    .pagingNum{
   		cursor: pointer; width:40px; height:40px; display:inline-block; border:1px solid #707070;
    	vertical-align: middle; font-size: 20px; padding-top:8px; box-sizing: border-box;
    }
    
    /* 별점 */
    .starBox{
   		margin: 0px 20px; display: inline-block; width: 120px; vertical-align: middle;
    }
    .starFull{
    width:16px; height:16px; vertical-align: middle; margin-right: 2px;
    	   
    }
    .starBlank{
    	width:18px; height:16.5px; vertical-align: middle; margin-right: 2px;
    }
    
	/*  0 318 636 954 */
	.firstCol{position: absolute;  left: 0px;}
	.secondCol{position: absolute;	left: 318px;}
	.thirdCol{position: absolute; left: 636px;}
	.forthCol{position: absolute; left: 954px;}
	
	/* 126&354 0&228 */
	.firstRow{top: 0px;}
	.secondRow{top: 318px;}
	.thirdRow{top: 636px;}
	.forthRow{top: 954px;}
	.fifthRow{top: 1272px;}
	
	
	/* 이미지 세로 가로 길이가 넓은 것에 따라 가변 */
	.height100percent{
		position: relative;
		height: 342px;
	}
	.width100percent{
		position: relative;
		width: 306px;
	}
	
	/* 글쓰기 버튼 */
	#writeBtn{
		width:200px; height:45px; font:normal bold 18px Segoe UI; color:white; 
		background-color: #0D4371; float:right; border:0px; margin-right: 20px;
	}
	
</style>
<script type="text/javascript" src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		var reviewIdxArr = new Array();
		$(".reviewIdxList").each(function(index){
			var reviewIdxVal = $(this).val();
			reviewIdxArr[index] = reviewIdxVal;
		});	
		
		//뒤로가기의 경우, 데이터를 가져오게 하기 위해 사용
		$.ajax({
			type:"POST",
			data : 'reviewIdxArr=' + reviewIdxArr,
			url: './checkList.do', 
			success: function(data){
// 				alert("성공");
// 				alert(data.readCountList[0]s.REVIEW_READ_COUNT);
				for (var i = 0; i < data.readCountList.length; i++) {				
					var readCount = data.readCountList[i].REVIEW_READ_COUNT;
					$("#readCount"+i).html(readCount);
				}
				
				for (var i = 0; i < data.cmtCountList.length; i++) {				
					var cmtCount = data.cmtCountList[i].COMMENT_COUNT;
					$("#cmtCount"+i).html(cmtCount);
				}
				
				//출력 이미지가 가로가 더 긴 이미지면 세로 100%기준으로 맞춘다.
				//출력 이미지가 세로가 더 긴 이미지면 가로 100%기준으로 맞춘다.
				for(var i=1; i<=20; i++){
					var width = $("#photoImg"+i).css("width");
					var widthVal = Number(width.substr(0, width.length-2));
					var height = $("#photoImg"+i).css("height");
					var heightVal = Number(height.substr(0, height.length-2));
//		 			alert(i+" : "+widthVal+" : "+heightVal);
					if(widthVal >= heightVal){
						$("#photoImg"+i).attr("class", "height100percent");
					}else{
						$("#photoImg"+i).attr("class", "width100percent");
					}
				}
				
			},
			error : function(){
// 				alert("실패");
				//검색 결과가 없는 경우 
				var html = "";
				html += "<div id='noSearchBox'>";
				html += "<div id='noSearch'>";
				html += "<img style='width:150px;' alt='error' src='/dolleProject/resources/images/error/close.png'>";
				html += "</div>";
				html += "<h1 style='font: normal normal 28px 대한민국정부상징체;'>검색된 결과가 없습니다.</h1>";
				html += "</div>";
				
				var reviewList = $("#reviewList"); 
				reviewList.before($(html));
				
				//글쓰기버튼 이전 위치에 초기검색 리스트로 돌아가는 버튼 추가
				var listBackBtn = $("<button id='writeBtn' onclick='listBackFnc();'>목록으로</button>"); 
				listBackBtn.insertAfter($("#writeBtn"));
			}
		});
			
		
		
		//정렬옵션 select 태그 생성 
		var orderOptionVal = $("#orderOptionVal").val();
		if(orderOptionVal == "newest"){
			$("#orderOption").val("newest").prop("selected", true);
		}else if(orderOptionVal == "starNum"){
			$("#orderOption").val("starNum").prop("selected", true);
		}else if(orderOptionVal == "readCnt"){
			$("#orderOption").val("readCnt").prop("selected", true);
		}
		
		//검색옵션 select 태그 생성 
		var searchOptionVal = $("#searchOptionVal").val();
		if(searchOptionVal == "both"){
			$("#searchOption").val("both").prop("selected", true);
		}else if(searchOptionVal == "title"){
			$("#searchOption").val("title").prop("selected", true);
		}else if(searchOptionVal == "content"){
			$("#searchOption").val("content").prop("selected", true);
		}else if(searchOptionVal == "writer"){
			$("#searchOption").val("writer").prop("selected", true);
		}
		
		//별점 출력 
		$(".starBox").each(function(index){
			var starNum = $("#starNum"+index).val();
			for(i=0; i<starNum; i++){
				var starFull = $('<img class="starFull" alt="별_full" src="/dolleProject/resources/images/starSolid.png">');
				$(this).append(starFull);
			}
			for(i=0; i<5-starNum; i++){
				var starBlank = $('<img class="starBlank" alt="별_blank" src="/dolleProject/resources/images/starBlank.png">');
				$(this).append(starBlank);
			}
		});
		
		
		//가져올 결과가 없으면 페이지 버튼 지우기 
		var listSize = $("#listSize").val();
		if(listSize == 0){
			$("#pagingGroup").remove();
		}
		//첫페이지 마지막페이지일때 다음버튼 없애기
		var curPage = $("#curPage").val();
		var totPage = $("#totPage").val();
		if(curPage == 1){
			$("#firstPageBtn").remove();
			$("#prePageBtn").remove();
		}
		if(curPage == totPage){
			$("#lastPageBtn").remove();
			$("#nextPageBtn").remove();
		}
		
		
	});
	
	function goPageFnc(pageNum){
		var curPage = $('#curPage');
		curPage.val(pageNum);
		
		var pagingForm = $('#pagingForm');
		pagingForm.submit();
	}
	
	function submitFnc(){
		var orderSearchForm = $('#orderSearchForm');
		orderSearchForm.submit();
	}
	
	function pageMoveFnc(){
		var loginUser = $("#reviewMemberIdx").val();
		if(loginUser == null || loginUser.trim() == "" || loginUser.length == 0){
			alert("로그인 후 작성해주세요.");
 			//관련없는것들은 절대경로로 
			location.href="<%=request.getContextPath()%>/auth/login.do" 
		}else{
			location.href="./add.do";
		}
	}
	
	function listBackFnc(){
		location.href="<%=request.getContextPath()%>/courseReview/list.do" 
	}
	
	function detailPageFnc(reviewIdx){
// 		alert(reviewIdx);
		location.href="./detail.do?reviewIdx="+reviewIdx;
	}
	
</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div style="width:1260px; height:130px; margin:0 auto;" >
		<h1 id="title">코스 후기 게시판</h1>
		<div id="subTitle">
			<span style="font: normal bold 22px Segoe UI">혜화 명륜 마을</span>
		</div>
		
		<!-- 정렬선택과 검색창 -->
		<div style="float:right; height:50px; width:530px; padding-top:40px;">
			<form id='orderSearchForm' action="./list.do" method="post">
				<input id="orderOptionVal" type="hidden" value="${orderOption}">
				<select id="orderOption" name="orderOption" onchange="submitFnc();">
					<option value="newest">최신순</option>
					<option value="starNum">별점순</option>
					<option value="readCnt">조회순</option>
				</select>

				<input id="searchOptionVal" type="hidden" value="${searchOption}">
				<select id="searchOption" name="searchOption">
					<option value="both">제목+내용</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>	
				</select>
			
				<div id="keywordBox">
					<input id="keyword" name="keyword" type="text" value="${keyword}">
					<img id="searchBtn" alt="검색버튼" onclick="submitFnc();"
					 src="/dolleProject/resources/images/searchBtn.PNG"> 
				</div>
			</form>
		</div>
	</div>
	
	
	<input id="listSize" type="hidden" value="${listSize}"> 
	<c:if test="${listSize / 4 <= 1}">
		<c:set var="listHeight" value="514"/>
	</c:if>
	<c:if test="${listSize / 4 <= 2 and listSize / 4 > 1}">
		<c:set var="listHeight" value="868"/>
	</c:if>
	<c:if test="${listSize / 4 <= 3 and listSize / 4 > 2}">
		<c:set var="listHeight" value="1222"/>
	</c:if>
	<c:if test="${listSize / 4 <= 4 and listSize / 4 > 3}">
		<c:set var="listHeight" value="1576"/>
	</c:if>
	<c:if test="${listSize / 4 <= 5 and listSize / 4 > 4}">
		<c:set var="listHeight" value="1930"/>
	</c:if>
	
	<div style="width:1260px; height:${listHeight}px; margin:0 auto;">
	
		<ul id="reviewList" style="position: relative;">
			<!-- 고정 박스  -->
			<c:if test="${listSize >= 1}">
				<li class="reviewList_li">
					<div class="fixedBox firstCol firstRow"> 
					</div>	
					<span class="innerBox firstCol firstRow">	
					</span>
				</li>
			</c:if>
			<c:if test="${listSize >= 3}">
				<li class="reviewList_li">
					<div class="fixedBox thirdCol firstRow">
					</div>
					<span class="innerBox thirdCol firstRow">
					</span>
				</li>
			</c:if>
			
			
			<c:forEach var="reviewVo" items="${reviewList}" varStatus="listIndex">
				<input class="reviewIdxList" type="hidden" value="${reviewVo.reviewIdx}">
			<!-- 상세 게시글  -->
			<!-- 행렬 개수 -->
					<c:if test="${listIndex.count >= 1 and listIndex.count <= 4}">
						<c:set var="rowNum" value="1"/>
					</c:if>
					<c:if test="${listIndex.count >= 5 and listIndex.count <= 8}">
						<c:set var="rowNum" value="2"/>
					</c:if>
					<c:if test="${listIndex.count >= 9 and listIndex.count <= 12}">
						<c:set var="rowNum" value="3"/>
					</c:if>
					<c:if test="${listIndex.count >= 13 and listIndex.count <= 16}">
						<c:set var="rowNum" value="4"/>
					</c:if>
					<c:if test="${listIndex.count >= 17 and listIndex.count <= 20}">
						<c:set var="rowNum" value="5"/>
					</c:if>
					
					<c:if test="${listIndex.count % 4 == 1}">
						<c:set var="leftPosition" value="0"/>
						<c:set var="TopPosition1" value="${(354*rowNum-354) + 126}"/>
						<c:set var="TopPosition2" value="${(354*rowNum-354) + 354}"/>
					</c:if> 
					<c:if test="${listIndex.count % 4 == 2}"> 
						<c:set var="leftPosition" value="318"/>
						<c:set var="TopPosition1" value="${(354*rowNum-354)}"/>
						<c:set var="TopPosition2" value="${(354*rowNum-354) + 228}"/>
					</c:if>
					<c:if test="${listIndex.count % 4 == 3}">
						<c:set var="leftPosition" value="636"/>
						<c:set var="TopPosition1" value="${(354*rowNum-354) + 126}"/>
						<c:set var="TopPosition2" value="${(354*rowNum-354) + 354}"/>
					</c:if>
					<c:if test="${listIndex.count % 4 == 0}">
						<c:set var="leftPosition" value="954"/>
						<c:set var="TopPosition1" value="${(354*rowNum-354)}"/>
						<c:set var="TopPosition2" value="${(354*rowNum-354) + 228}"/>
					</c:if> 
					
					
					<li class="reviewList_li" onclick="detailPageFnc(${reviewVo.reviewIdx});">
						<div class="photo_Box"
							style="top:${TopPosition1}px; left:${leftPosition}px;">
							<img id="photoImg${listIndex.count}" alt="review_photo" src="<c:url value='/img/${reviewVo.fileStoredName}'/>">
						</div>
						<span class="innerBox" style="width:306px; height:114px; position: absolute; top:${TopPosition2}px; left:${leftPosition}px; 
							background-color: #000; opacity: 0.3;">			
						</span>
						<div class="innerBox_txt" style="top:${TopPosition2}px; left:${leftPosition}px;">
							<div style="font: normal bold 22px Segoe UI; margin: 18px 20px 0px; display: block;">
								<p class="titleOverFlow">${reviewVo.reviewTitle}</p>
							</div>
							<span style="font: normal normal 14px Segoe UI; margin: 8px 20px; display: block;">
								${reviewVo.memberNickname}
							</span>
							<span class="starBox">
								<input id="starNum${listIndex.index}" type="hidden" value="${reviewVo.reviewRating}">
							</span>
							<span style="width:50px; display: inline-block; margin-left: 20px;">
								<img alt="Icon_eye" src="/dolleProject/resources/images/eye.png"
									style="width:16px; height:18px; vertical-align:middle;">
								<span id="readCount${listIndex.index}" style="font: normal bold 14px Segoe UI; vertical-align: middle;">${reviewVo.reviewReadCount}</span>		
							</span>		
							<span style="width:50px; display: inline-block; margin-left: 10px;">
								<img alt="Icon_comment" src="/dolleProject/resources/images/IconComment.png"
									style="width: 16px; vertical-align: middle;">
								<span id="cmtCount${listIndex.index}" style="font: normal bold 14px Segoe UI; vertical-align: middle;">${reviewVo.commentCount}</span>	
							</span>
						</div>
					</li>
				
			</c:forEach>
		</ul>
		
	</div>
	
	
	
	<!-- 페이징 버튼 -->
	<div id="pagingBox">
		<input id="totPage" type="hidden" value="${pagingMap.reviewPaging.totPage}">
		<ul id="pagingGroup">
			<li id="firstPageBtn" class="pagingImg" onclick="goPageFnc(1);">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleLeft.PNG" 
					style="width: 55%;">
			</li>
			<li id="prePageBtn" class="pagingImg" onclick="goPageFnc(${pagingMap.reviewPaging.prevPage});">
				<img id="leftBtn" alt="leftBtn" src="/dolleProject/resources/images/left.PNG" 
					style="width:40%;">
			</li>
			<c:forEach var="num" 
				begin="${pagingMap.reviewPaging.blockBegin}" 
				end="${pagingMap.reviewPaging.blockEnd}">
				
				<c:if test="${pagingMap.reviewPaging.curPage eq num}">
					<li class="pagingNum" onclick="goPageFnc(${num});" style="background: #0D4371; color:#fff; border:1px solid #707070;">
						<c:out value="${num}"/>
					</li>
				</c:if>
				<c:if test="${pagingMap.reviewPaging.curPage ne num}">
					<li class="pagingNum" onclick="goPageFnc(${num});" style="background: #FFFFFF; border:1px solid #707070;">
						<c:out value="${num}"/>
					</li>
				</c:if>
			</c:forEach>

			<li id="nextPageBtn" class="pagingImg" onclick="goPageFnc(${pagingMap.reviewPaging.nextPage});">
				<img id="doubledRightBtn" alt="doubledRightBtn" src="/dolleProject/resources/images/right.PNG" style="width:42%;">
			</li>
			<li id="lastPageBtn" class="pagingImg" onclick="goPageFnc(${pagingMap.reviewPaging.totPage});">
				<img id="rightBtn" alt="rightBtn" src="/dolleProject/resources/images/doubleRight.PNG" style="width:55%;">
			</li>
		</ul>
		<input id="reviewMemberIdx" type="hidden" value="${_memberVo_.no}">
		<button id="writeBtn" onclick="pageMoveFnc();">
			글쓰기
		</button>
		
		<!-- 페이징정보 전달 -->
		<form action="./list.do" id='pagingForm' method="get">
			<input type="hidden" id='curPage' name='curPage' 
				value="${pagingMap.reviewPaging.curPage}">
			<input type="hidden" id='pagingOrderOption' name='orderOption' 
				value="${orderOption}">
			<input type="hidden" id='pagingSearchOption' name='searchOption' 
				value="${searchOption}">	
			<input type="hidden" id='pagingKeyword' name='keyword' 
				value="${keyword}">
		</form>
	</div>

	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>

</html>
