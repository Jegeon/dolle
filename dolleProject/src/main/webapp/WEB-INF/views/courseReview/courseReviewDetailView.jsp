<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>코스후기게시판 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
	body{
		font-family: Segoe UI;
	}
	
	.basicBox{
		width:900px; margin:0px auto;
	}
	
	.titleFont{
		font:normal bold 22px Segoe UI;
	}
	
	.floatRight{
		float: right;
	}
	
	.floatClear{
		clear: both;
	}
	
	#changePhotoBtn{
		width: 150px; height: 30px; border: 1px solid #6B6B6B; font-size: 12px;
	}
	
	.inputBtn{
		width:200px; height:40px; font:normal bold 16px Segoe UI; color:white; 
		 border:0px; margin-right: 20px; background-color: #0D4371;
	}
	
	.inputTitle{
		font:normal bold 18px Segoe UI;
	}
	
	/* 리뷰 */
	.reviewTitle{
		color: #707070;
		font:normal bold 25px Segoe UI;
	}
	.reviewContent{
		color: #000;
		font:normal normal 18px Segoe UI;
	}
	.reviewSide{
		color: #707070;
		font:normal normal 14px Segoe UI;
	}	
	#commentContent{
		margin-top: 20px;
	    widtH: 1060px;
	    height: 100px;
	    font-size: 14px;
	    padding: 12px 20px;
	    box-sizing: border-box;
	}
	
	.marginRight5{
		margin-right: 5px;
	}
	.marginRight15{
		margin-right: 15px;
	}
	
	/* 댓글 */
	.commentHeader{
		margin-left: 20px;
		font: normal bold 16px Segoe UI;		
	}
	.commentBtn{
		float: right;
		margin-right: 20px;
	}
	.commentBox{
		margin: 20px;
	}
	
	/* 댓글쓰기 */
	#choiseEmoTitle{
		font-weight: bold;
	    font-size: 14px;
	    color: gray;
	    width: 100px;
	    vertical-align: top;
	    display: inline-block;
	    padding-top: 25px;
	}
	#writeCommentBtn{
		width:190px; height:40px; padding-left:28px; 
		font:normal bold 16px Segoe UI; color:white; 
		border:0px; background-color: #0D4371;
		margin:8px 10px; float:right;
		background-image: url('/dolleProject/resources/images/edit.png'); 
		background-repeat: no-repeat;
		background-position: 20px 5px; background-size: 32px
	}
	
	.EmoLi{
		width: 48px;
		height: 48px;
		text-align: center;
		display: inline-block;
/*  	border: 3px solid #FFCC00;  */	/* 클릭시 테두리 변경 */
 		border: 3px solid #fff; /* 클릭 전 기본 테두리  */
		border-radius: 40px;
		-moz-border-radius: 40px;
		-khtml-border-radius: 40px;
		-webkit-border-radius: 40px;
		
	}
	.EmoLi > img {
		width:40px; height:40px;
	}
</style>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() { 
		//여기 부분 코드 깔끔하게 고치기 -> index남발한 것과 배열 1로 시작하는거랑 inputhidden으로 바꾸기
		var commentList = $(".commentBox").get();
// 		alert("index: "+commentList.length);
		for(var i=1; i<=commentList.length; i++){
			var emoticonVal = $("#commentEmoticon"+i).val();
// 			alert(i+" : "+emoticonVal);
			//댓글 이미지 출력
			var imagesAddress = "/dolleProject/resources/images/"
			$("#commentImg"+i).attr("src",imagesAddress+emoticonVal+".png");
			$("#commentImg"+i).css("width","35px");
		}
		
		
		//댓글 작성시 - 기본 이미지 smile로 설정
		$("#commentEmoticon").val("smile");
		$("#smileEmo").css("border", "3px solid #FFCC00");
		
		
		//댓글 개수에 따른 박스 높이 지정
		var commentCnt = $("#commentCnt").val(); 
		var bodyHeight = 1400;	//댓글 없을 때 기본 높이
		for(var i=0; i<commentCnt; i++){
			bodyHeight += 140;
		}
		$("#bodyWrap").css("height", bodyHeight+"px");
		
		
		//첫글이거나 마지막글이면 버튼 나타나지 않도록
		var lastRowNum = $("#lastRowNum").val();
		var currentRowNum = $("#rnum").val();
		if(currentRowNum == 1){
			$("#leftBtn").remove();
		}else if(currentRowNum == lastRowNum){
			$("#rightBtn").remove();
		}
		
		//댓글에서도 첫&마지막페이지에서 버튼 나타나지 않도록
		var cmtCurrent = $("#cmtCurPage").val();
		var lastCmtPage = $("#lastCmtPage").val();
		if(cmtCurrent == 1){
			$("#cmtLeftBtn").remove();
		}else if(cmtCurrent == lastCmtPage){
			$("#cmtRightBtn").remove();
		}
		
	});

	function movePageListFnc(){
		location.href="./list.do"
	}
	
	function movePageUpdateFnc(reviewIdx){
		location.href="./update.do?reviewIdx="+reviewIdx;
	}
	
	function changeBorderFnc(li){
		var liList = $("#EmoList").children();
		
		for(var i=0; i<liList.length; i++){
// 			alert(liList[i].id);
			if(li.id == liList[i].id){	//클릭한 객체는 테두리 변경
				li.style.border = "3px solid #FFCC00";

				//선택한 이모티콘 파일명 저장
				var selectEmoVal = liList[i].children[0].getAttribute("alt");
// 				var selectEmoVal = liList[i].children[0].getAttribute("src").split("/")[4];
				$("#commentEmoticon").val(selectEmoVal);
			}else{	//그 외는 기본 테두리 
				liList[i].style.border = "3px solid #FFF";
			}
		}
	}
	
	function commentCheckFnc(){
		var writerIdx = $("#commentMemberIdx").val();
		if( writerIdx == null || writerIdx.trim() == "" || writerIdx.length == 0){
			alert("로그인 후 작성해주세요.");
			location.href="<%=request.getContextPath()%>/auth/login.do";
			return false;
		}
		return true;
	}
	
	function deleteCommnetFnc(index){
		var reviewIdxVal = $("#commentReviewIdx").val();
		var memberIdxVal = $("#commentMemberIdx").val();
		var commentIdxVal = $("#commentIdx"+index).val();

		var checkDelete = confirm("정말 삭제하시겠습니까?");
		if(checkDelete == true){
			location.href="./deleteCommentCtr.do?reviewIdx="+reviewIdxVal+"&commentIdx="+commentIdxVal+"&memberIdx="+memberIdxVal;		
		}
	}
	
	//수정버튼 클릭시 
	function makeUpdateBoxFnc(index){
// 		alert($("#check"+index).text());
		if($("#check"+index).text() == 0){
			$("#commentBox"+index).append($("<textarea id='commentContent' name='commentContent'></textarea>"));		
			$("#check"+index).text(1);

			var commentIdx = $("#commentIdx"+index).val();
// 			alert("comIdx"+commentIdx);
			$("#updateBtn"+index).attr("onClick","updateFnc("+commentIdx+")");
		}else{
			alert("이미 텍스트박스 있음");
// 			$("#commentContent").remove();
// 			$("#check"+index).text(0);
		}
	}
	
	function updateFnc(commentIdx){
// 		alert(commentIdx);
		var checkUpdate = confirm("이대로 수정하시겠습니까?");
		if(checkUpdate == true){
			$("#commentIdx").val(commentIdx);
			var formObj = $("#updateCommentForm");
			formObj.submit();
		}else{
// 			$("#commentContent").remove();
		}
	}
	
	//리뷰 이전글 다음글
	function prePageFnc(reviewIdx){
		var rnumVal = $("#rnum").val();
		location.href="./pageMove.do?reviewIdx="+reviewIdx+"&rnum="+rnumVal+"&channel=-1";
	}
	function nextPageFnc(reviewIdx){
		var rnumVal = $("#rnum").val();
		location.href="./pageMove.do?reviewIdx="+reviewIdx+"&rnum="+rnumVal+"&channel=1";
	}
	
	//댓글 이전리스트, 다음리스트
	function cmtLeftFnc(reviewIdx){
		var cmtCurPage = Number($("#cmtCurPage").val())-1; 
		location.href="./detail.do?reviewIdx="+reviewIdx+"&cmtCurPage="+cmtCurPage;
	}
	function cmtRightFnc(reviewIdx){
		var cmtCurPage = Number($("#cmtCurPage").val())+1; 
		location.href="./detail.do?reviewIdx="+reviewIdx+"&cmtCurPage="+cmtCurPage;
	}
	
</script>
</head>

<body>
	
	<jsp:include page="/WEB-INF/views/Header.jsp"/>


	<div id="bodyWrap" style="width:1260px; margin:0px auto;">
		
		<div id="townBox" class="basicBox titleFont" style="padding: 50px 0px 10px;">	
			<h1>혜화 명륜 마을</h1>
		</div>
		
		<div id="uploadImageBox" class="basicBox" style="text-align: center;">	
			<img id="uploadImg" alt="upload_image" src="<c:url value='/img/${reviewMCFVo.fileStoredName}'/>"
				style="height:600px;">
		</div>
		
		<div class="floatRight" style="margin: 10px 190px 40px;">
		
		</div>
		
		<div id="ratingBox" class="basicBox floatClear" style="padding-bottom: 20px;">
		
		</div>
		
		<!-- 이번페이지 다음페이지 버튼 -->
		<input id="rnum" name="rnum" type="hidden" value="${rnum}">
		<input id="lastRowNum" name="lastRowNum" type="hidden" value="${lastRowNum}">
		<div id="leftBtn" onclick="prePageFnc(${reviewMCFVo.reviewIdx});" style="float:left;">
			<img alt="leftBtn" src="/dolleProject/resources/images/left.PNG">
		</div>
		<div id="rightBtn" onclick="nextPageFnc(${reviewMCFVo.reviewIdx});" style="float:right;">
			<img alt="rightBtn" src="/dolleProject/resources/images/right.PNG">
		</div>
		
		<div class="basicBox reviewTitle" style="padding-bottom: 20px;">
			${reviewMCFVo.reviewTitle}
		</div>
		
		<div class="basicBox reviewContent" style="padding-bottom: 20px; float:left; width:474px; margin-left: 180px;">
			<span class="marginRight15">${reviewMCFVo.reviewRating}</span>
			<span class="">${reviewMCFVo.memberNickname}</span>
		</div>

		<div style="float:left; width: 450px;">
			<div class="basicBox reviewSide" style="padding-bottom: 10px;">
				<span class="marginRight5">조회수</span>
				<span class="marginRight15">${reviewMCFVo.reviewReadCount}</span> 
				<span class="marginRight5">좋아요</span>
				<span>${reviewMCFVo.reviewLikeCount}</span>
			</div>
			
			<div class="basicBox reviewSide" style="padding-bottom: 10px;">
				<span class="marginRight5">등록일</span>
				<span class="marginRight15">
					<fmt:formatDate value="${reviewMCFVo.reviewCreDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</span>
				<span class="marginRight5">수정일</span>
				<span>
					<fmt:formatDate value="${reviewMCFVo.reviewModDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</span> 
			</div>
		</div>		
		
		<div class="basicBox reviewContent" style="padding: 20px 0px 40px 0px; clear:both;">
			${reviewMCFVo.reviewContent}
		</div>
		
		<div class="basicBox" style="float:left; padding-left:656px; padding-bottom: 20px;">
			<input class="inputBtn" type="button" onclick="movePageListFnc();" value="목록으로">
			<input class="inputBtn" type="button" onclick="movePageUpdateFnc(${reviewMCFVo.reviewIdx});" value="수정">
		</div>
		
		<div id="commentWrap" style="width:1100px; margin:70px auto 20px;">	
			<input id="cmtCurPage" name="cmtCurPage" type="hidden" value="${cmtCurPage}">
			<input id="lastCmtPage" name="lastCmtPage" type="hidden" value="${lastCmtPage}">
			<span class="commentHeader">댓글쓰기</span>
			<span class="commentBtn">
				<span class="marginRight15">${cmtCurPage} / ${lastCmtPage}</span>
				<button id="cmtLeftBtn" onclick="cmtLeftFnc(${reviewMCFVo.reviewIdx});" style="width:25px; height:25px;">&lt;</button>
				<button id="cmtRightBtn" onclick="cmtRightFnc(${reviewMCFVo.reviewIdx});" style="width:25px; height:25px;">&gt;</button>
			</span>
			<hr>
			
			<form id="updateCommentForm" action="./updateCommentCtr.do" method="post">
				<input id="commentReviewIdx" name="commentReviewIdx" type="hidden" value="${reviewMCFVo.reviewIdx}">
				<input id="commentIdx" name="commentIdx" type="hidden" value="">
				<input id="commentCnt" type="hidden" value="${commentCnt}">
				
				<c:forEach var="commentVo" items="${commentList}" varStatus="index">
					<input id="commentIdx${index.count}" type="hidden" value="${commentVo.commentIdx}">
					<div id="commentBox${index.count}" class="commentBox">
						<!-- 체크용(숨김) -->
						<input id="check${index.count}" type="hidden" value="0">
						<input id="commentEmoticon${index.count}" type="hidden" value="${commentVo.commentEmoticon}">
						
						<span><img id="commentImg${index.count}" alt="emoticon" style="width:35px;"></span>
						<span style="margin-left:10px; font-size:14px;">${commentVo.memberNickname}</span>
						<div style="margin:12px 0px;">${commentVo.commentContent}</div>
						<span style="font-size:12px; color:gray;">
							<fmt:formatDate value="${commentVo.creDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</span>
						<span style="font-size:12px; color:gray;">
							<fmt:formatDate value="${commentVo.modDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</span>

						
						<c:if test="${_memberVo_.no eq commentVo.commentMemberIdx}">
							<div style="float:right;">						
								<button id="updateBtn${index.count}" type="button" onclick="makeUpdateBoxFnc(${index.count});">수정</button>
								<button type="button" onclick="deleteCommnetFnc(${index.count});">삭제</button>
							</div>
						</c:if>
					</div>
					<hr>
				</c:forEach>
			</form>
		</div>
		
		<!-- 댓글쓰기 -->
		<div style="padding:0px 80px;">
			<form id="commentForm" action="./addCommentCtr.do" method="post" onsubmit="return commentCheckFnc();">
				<input id="commentReviewIdx" name="commentReviewIdx" type="hidden" value="${reviewMCFVo.reviewIdx}">
				<input id="commentMemberIdx" name="commentMemberIdx" type="hidden" value="${_memberVo_.no}">
				<input id="commentEmoticon" name="commentEmoticon" type="hidden" value="">
				<div id="choiseEmo" style="float:right; margin-bottom:4px;">
					<div id="choiseEmoTitle">이모티콘 선택</div>
					<ul id="EmoList" style="display:inline-block; margin-right:10px;">
						<li id="smileEmo" class="EmoLi" onclick="changeBorderFnc(this);">
							<img alt="smile" style="margin-top: 4px; "
							 src="/dolleProject/resources/images/smile.png">
						</li>
						<li id="bigSmileEmo" class="EmoLi" onclick="changeBorderFnc(this);">
							<img alt="bigSmile" style="margin-top: 4px;"
							 src="/dolleProject/resources/images/bigSmile.png">
						</li>
						<li id="sadEmo" class="EmoLi" onclick="changeBorderFnc(this);">
							<img alt="sad" style="margin-top: 4px;"
							 src="/dolleProject/resources/images/sad.png">
						</li>
						<li id="likeEmo" class="EmoLi" onclick="changeBorderFnc(this);">
							<img alt="like" style="margin-top: 2px;"
							 src="/dolleProject/resources/images/like.png">
						</li>
						<li id="interviewEmo" class="EmoLi" onclick="changeBorderFnc(this);">
							<img alt="interview" style="margin-top: 6px;"
							 src="/dolleProject/resources/images/interview.png">
						</li>
						<li id="starEmo" class="EmoLi" onclick="changeBorderFnc(this);">
							<img alt="star" style="margin-top: 6px;"
							 src="/dolleProject/resources/images/star.png">
						</li>
						<li id="heartEmo" class="EmoLi" onclick="changeBorderFnc(this);">
							<img alt="heart" style="margin-top: 6px;"
							 src="/dolleProject/resources/images/heart.png">
						</li>
					</ul> 
				</div>
				<div>
					<textarea id="commentContent" name="commentContent" placeholder="댓글을 작성해주세요."
						style="width:1090px;height:100px;font-size: 16px; padding: 12px 20px; box-sizing: border-box;"></textarea>
				</div>
				<input id="writeCommentBtn" type="submit" value="댓글 작성"></input>
			</form>
		</div>
			
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>

</html>