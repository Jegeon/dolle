<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>코스후기 게시판 관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style>
	
	table,tr,td,th {
		box-sizing: border-box;
		border-collapse: collapse;
	}
	th{
		background-color: #F8F4ED;
		height: 35px;
		font-weight: bold;
		padding-top: 9px;
		border-top: 1px solid #B9B9B9;
		border-bottom: 1px solid #B9B9B9;
	}
	td{
		height: 30px;
		padding-top: 5px;
		border-top: 1px solid #B9B9B9;
		border-bottom: 1px solid #B9B9B9;
	}
	.tableLine{
		border-right: 1px solid #B9B9B9;
	}	
		
	.alignCenter{
		text-align: center;
	}
	.alignLeft{
		text-align: left;
		padding-left: 5px;
	}
	.alignRight{
		text-align: right;
		padding-right: 5px;
	}
	
	.subTitle{
		font: normal bold 18px Segoe UI;
   		margin-right: 15px;
	}
	.subContent{
		font: normal normal 18px Segoe UI;
	}
	
	#deleteBtn{
		width: 49px;
	    height: 30px;
	    background-color: #0D4371;
	    border: none;
	    font-weight: 600;
	    color: #fff;
	}
	
	.titleOverFlow{
		white-space: nowrap;
	    width: 680px;
	    overflow: hidden;
	    text-overflow: ellipsis;
    }
</style>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		var pageScale = $("#pageScale").val();
		for(var i=1; i<=pageScale;i++){
			$("#title"+i).attr("onmouseover","mouseOverFnc("+i+")");
			$("#title"+i).attr("onmouseleave","mouseLeaveFnc("+i+")");
			$("#title"+i).css("cursor","pointer");
		}
		
		
	});
	
	//제목에 마우스 올렸을시 이벤트
	function mouseOverFnc(index){
		var trOneObj = $("#tr"+index);
		trOneObj.css("background-color","#eee");
	}
	function mouseLeaveFnc(index){
		var trOneObj = $("#tr"+index);
		trOneObj.css("background-color","#fff");
	}	
	
	function goPageFnc(pageNum){
		var curPage = $('#curPage');
		curPage.val(pageNum);
		
		var pagingForm = $('#pagingForm');
		pagingForm.submit();
	}
	
	function submitFnc(){
		var adminForm = $('#adminForm');
		adminForm.submit();
	}
	
	function moveDetailFnc(reviewIdx){
		location.href="<%=request.getContextPath()%>/courseReview/detail.do?reviewIdx="+reviewIdx;
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
	
	function deleteFnc(){
		var checkVal = confirm("정말 삭제하시겠습니까?");
		if(checkVal == true){
			$("#adminForm").attr("action", "./multiDelete.do");
			$("#adminForm").submit();	
			$("#adminForm").attr("action", "./adminList.do");
		}
	}
</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
<div style="width:1290px; margin: 0px auto;">
	
	
	
	<div style="margin-left:20px; font-size:30px; font-family:대한민국정부상징체; padding:10px 0px 20px;">
		<h1>코스 후기 게시판</h1>
	</div>
	<div style="margin-left:20px;">
		<span class="subTitle">마을</span>
		<span class="subContent">혜화 명륜</span>
	</div>
	<div style="margin-left:20px;">	
		<span class="subTitle">코스</span>
		<span class="subContent">혜화 명륜 성곽 코스</span>
	</div>
	
	
	<form id="adminForm" action="./adminList.do" method="post" style="width:1260px; margin:20px auto 0px;">
		<!-- 정렬개수 -->
		게시글개수 
		<select id="pageScale" name="pageScale" onchange="submitFnc();" 
		style="width:85px; padding: 6px 22px; vertical-align: middle;
			border: 1px solid #B9B9B9; 
			font-size:14px; font-family: Segoe UI;
			-webkit-appearance: none; /* 원본 select 버튼 감추기 */
			background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;">
			<c:choose>
				<c:when test="${pageScale eq 10}">
					<option value="10" selected="selected">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
				</c:when>
				<c:when test="${pageScale eq 20}">
					<option value="10">10</option>
					<option value="20" selected="selected">20</option>
					<option value="30">30</option>
				</c:when>
				<c:when test="${pageScale eq 30}">
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30" selected="selected">30</option>
				</c:when>
			</c:choose>	
		</select>
		개씩
	
			<!-- 정렬선택과 검색창 -->
		<div style="float:right; width:524px;" >
			<select id="orderOption" name="orderOption" onchange="submitFnc();"
				style="width:120px; padding: 6px 22px; vertical-align: middle; 
					border: 1px solid #B9B9B9; 
					font-size:14px; font-family: Segoe UI;
					-webkit-appearance: none; /* 원본 select 버튼 감추기 */
					background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;">
				
				<c:choose>
					<c:when test="${orderOption eq 'newest'}">
						<option value="newest" selected="selected">최신순</option>
						<option value="starNum">별점순</option>
						<option value="readCnt">조회순</option>
					</c:when>
					<c:when test="${orderOption eq 'starNum'}">
						<option value="newest">최신순</option>
						<option value="starNum" selected="selected">별점순</option>
						<option value="readCnt">조회순</option>
					</c:when>
					<c:when test="${orderOption eq 'readCnt'}">
						<option value="newest">최신순</option>
						<option value="starNum">별점순</option>
						<option value="readCnt" selected="selected">조회순</option>
					</c:when>
				</c:choose>		
				
			</select>

			<select id="searchOption" name="searchOption"  
				style="width:140px; padding: 6px 22px; vertical-align: middle;
					border: 1px solid #B9B9B9; 
					font-size:14px; font-family: Segoe UI;
					-webkit-appearance: none; /* 원본 select 버튼 감추기 */
					background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;">
				<c:choose>
					<c:when test="${searchOption eq 'both'}">
						<option value="both" selected="selected">제목+내용</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</c:when>
					<c:when test="${searchOption eq 'title'}">
						<option value="both">제목+내용</option>
						<option value="title" selected="selected">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</c:when>
					<c:when test="${searchOption eq 'content'}">
						<option value="both">제목+내용</option>
						<option value="title">제목</option>
						<option value="content" selected="selected">내용</option>
						<option value="writer">작성자</option>
					</c:when>
					<c:when test="${searchOption eq 'writer'}">
						<option value="both">제목+내용</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer" selected="selected">작성자</option>
					</c:when>
				</c:choose>		
			</select>
		
			<div style="width:250px; height:31px; display:inline-block;
				 border:1px solid #B9B9B9; vertical-align:middle;">
				<input id="keyword" name="keyword" type="text" value="${keyword}"
					 style="width:190px; height:22px; vertical-align: middle;
						font: normal normal 14px Segoe UI; margin-left:10px;
						padding: 2px 0px 1px 10px; border: 0px;">
				<img id="searchBtn" alt="검색버튼" onclick="submitFnc();"
				 src="/dolleProject/resources/images/searchBtn.PNG"
				 style="margin-top:2px; vertical-align: middle;"> 
			</div>
		</div>
		
		<!-- 검색결과가 없는 경우 -->
		<c:if test="${reviewList.size() == 0 }">
			<div style="margin:0px auto; width:1245px; height:514px; border:2px solid #EBEBEB ; text-align: center;">
				<div style="padding:130px 0px 26px; width:150px; height:150px; margin:0px auto;">
					<img style="width:150px;" alt="error" src="/dolleProject/resources/images/error/close.png">
				</div>
				<h1 style="font: normal normal 28px 대한민국정부상징체;">검색된 결과가 없습니다.</h1>
			</div>
		</c:if>
		
		<!-- 검색결과가 있는 경우 -->
		<c:if test="${reviewList.size() != 0 }">
		<table style="margin:0px auto; margin-top:10px; margin-bottom:5px; width:1260px;">
			<tr>
				<th class="alignCenter tableLine" style="width:48px;">선택</th>		
				<th class="alignCenter tableLine" style="width:60px;">글번호</th>		
				<th class="alignCenter tableLine">제목</th>		
				<th class="alignCenter tableLine" style="width:130px;">작성자</th>		
				<th class="alignCenter tableLine" style="width:60px;">조회수</th>		
				<th class="alignCenter tableLine" style="width:50px;">별점</th>
				<th class="alignCenter tableLine" style="width:162px;">등록일</th>
				<th class="alignCenter" style="width:60px;">댓글수</th>
			</tr>	
			
			<c:forEach var="reviewVo" items="${reviewList}" varStatus="index">
				<tr id="tr${index.count}">
					<td class="alignCenter tableLine">
						<input type="checkbox" name="checkIdx" value="${reviewVo.reviewIdx}">
					</td>		 
					<td class="alignCenter tableLine">
						${reviewVo.reviewIdx}
					</td>		
					<td id="title${index.count}" class="alignLeft tableLine"
					 onclick="moveDetailFnc(${reviewVo.reviewIdx});">
						<p class="titleOverFlow">${reviewVo.reviewTitle}</p>
					</td>		
					<td class="alignCenter tableLine">
						${reviewVo.memberNickname}
					</td>
					<td class="alignRight tableLine">
						${reviewVo.reviewReadCount}
					</td>		
					<td class="alignRight tableLine">
						${reviewVo.reviewRating}
					</td>		
	 				<td class="alignCenter tableLine">
	 					<fmt:formatDate value="${reviewVo.reviewCreDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	 				</td> 
					<td class="alignRight">
						${reviewVo.commentCount}
					</td> 
				</tr>	
			</c:forEach>
		</table>
		</c:if>
		
		<input id="deleteBtn" type="button" onclick="deleteFnc();" value="삭제">
	</form> 
	

</div>
	
	<!-- 페이징 버튼 -->
	<div style="width:1260px; height:205px; margin:0 auto; text-align: center; 
		padding-top: 30px; box-sizing: border-box;">
		<ul id="pagingGroup" style="width: 600px; display: inline-block; margin-left: 165px;">
			<li class="pagingImg" onclick="goPageFnc(1);"
				 style="cursor: pointer; width:35px; height:35px; display: inline-block; 
				 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleLeft.PNG" 
					style="width: 55%;">
			</li>
			<li class="pagingImg" onclick="goPageFnc(${pagingMap.adminPaging.prevPage});"
				 style="cursor: pointer; width:35px; height:35px; display: inline-block; 
				 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/left.PNG" 
					style="width: 40%;">
			</li>
			<c:forEach var="num" 
				begin="${pagingMap.adminPaging.blockBegin}" 
				end="${pagingMap.adminPaging.blockEnd}">
				
				<c:if test="${pagingMap.adminPaging.curPage eq num}">
					<li class="pagingNum" onclick="goPageFnc(${num});"
						style="cursor: pointer; width:35px; height:35px; display:inline-block; 
						background: #0D4371; color:#fff; border:1px solid #707070; vertical-align: middle; 
						font-size: 20px; padding-top:6px; box-sizing: border-box;">
						<c:out value="${num}"/>
					</li>
				</c:if>
				<c:if test="${pagingMap.adminPaging.curPage ne num}">
					<li class="pagingNum" onclick="goPageFnc(${num});"
						 style="cursor: pointer; width:35px; height:35px; display: inline-block; 
						 background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
						font-size: 20px; padding-top:6px; box-sizing: border-box;">
						<c:out value="${num}"/>
					</li>
				</c:if>
			</c:forEach>

			<li class="pagingImg" onclick="goPageFnc(${pagingMap.adminPaging.nextPage});"
			 style="cursor: pointer; width:35px; height:35px; display: inline-block; 
			 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/right.PNG" 
					style="width: 42%;">
			</li>
			<li class="pagingImg" onclick="goPageFnc(${pagingMap.adminPaging.totPage});"
				 style="cursor: pointer; width:35px; height:35px; display: inline-block; 
				 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleRight.PNG" 
					style="width: 55%;">
			</li>
		</ul>
		<input id="reviewMemberIdx" type="hidden" value="${_memberVo_.no}">
		<button onclick="pageMoveFnc();"
			style="width:180px; height:40px; font:normal bold 18px Segoe UI; color:white; 
			background-color: #0D4371; float:right; border:0px; margin-right: 20px;">
			글쓰기
		</button>
		
		<!-- 페이징정보 전달 -->
		<form action="./adminList.do" id='pagingForm' method="get">
			<input type="hidden" id='curPage' name='curPage' 
				value="${pagingMap.adminPaging.curPage}">
			<input type="hidden" id='pagingOrderOption' name='orderOption' 
				value="${orderOption}">
			<input type="hidden" id='pagingSearchOption' name='searchOption' 
				value="${searchOption}">	
			<input type="hidden" id='pagingKeyword' name='keyword' 
				value="${keyword}">
			<input type="hidden" name='pageScale' 
				value="${pageScale}">
		</form>
	</div>


	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>

</html>