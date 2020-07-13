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
	
	.marginRight5{
		margin-right: 5px;
	}
	.marginRight15{
		margin-right: 15px;
	}
	
	/* 댓글 */
	.commentHeader{
		margin-left: 20px;
		font:normal bold 16px Segoe UI;		
	}
	.commentBtn{
		width: 10px;
	}
	.commentBox{
		margin-left: 20px;
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
			$("#commentImg"+i).css("width","50px");
		}
		
		
		//댓글 작성시 - 기본 이미지 smile로 설정
		$("#commentEmoticon").val("smile");
		$("#smileEmo").css("border", "3px solid #FFCC00");
		
		
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
			$("#updateBtn"+index).attr("onclick","updateFnc("+commentIdx+");");
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
		}
	}
		
	
</script>
</head>

<body>
	
	<jsp:include page="/WEB-INF/views/Header.jsp"/>


	<div style="width:1260px; height:1600px; margin:0px auto;">
		
		<div id="townBox" class="basicBox titleFont" style="padding: 50px 0px 10px;">	
			<h1>혜화 명륜 마을</h1>
		</div>
		
		<div id="uploadImageBox" class="basicBox" style="text-align: center;">	
			<img id="uploadImg" alt="upload_image" src="<c:url value='/img/${reviewMCFVo.fileStoredName}'/>"
				style="width:100%; height:600px;">
		</div>
		
		<div class="floatRight" style="margin: 10px 190px 40px;">
		
		</div>
		
		<div id="ratingBox" class="basicBox floatClear" style="padding-bottom: 20px;">
		
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
					<fmt:formatDate value="${reviewMCFVo.reviewCreDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
				</span>
				<span class="marginRight5">수정일</span>
				<span>
					<fmt:formatDate value="${reviewMCFVo.reviewModDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
				</span> 
			</div>
		</div>		
		
		<div class="basicBox reviewContent" style="padding-bottom: 20px; clear:both;">
			${reviewMCFVo.reviewContent}
		</div>
		
		<div class="basicBox" style="float:left; padding-left:656px;">
			<input class="inputBtn" type="button" onclick="movePageListFnc();" value="목록으로">
			<input class="inputBtn" type="button" onclick="movePageUpdateFnc(${reviewMCFVo.reviewIdx});" value="수정">
		</div>
		
		<div id="commentWrap" style="width:1100px; margin:70px auto;">	
			<span class="commentHeader">댓글쓰기</span>
			<span>
				<button class="commentBtn" style="width:25px; height:25px;">&lt;</button>
				<button class="commentBtn" style="width:25px; height:25px;">&gt;</button>
			</span>
			<hr>
			<form id="updateCommentForm" action="./updateCommentCtr.do" method="post">
				<input id="commentReviewIdx" name="commentReviewIdx" type="hidden" value="${reviewMCFVo.reviewIdx}">
				<input id="commentIdx" name="commentIdx" type="hidden" value="">
				
				<c:forEach var="commentVo" items="${commentList}" varStatus="index">
					<input id="commentIdx${index.count}" type="hidden" value="${commentVo.commentIdx}">
					<div id="commentBox${index.count}" class="commentBox">
						<!-- 체크용(숨김) -->
<%-- 						<div id="check${index.count}" style="color:#fff;">0</div> --%>
						<input id="check${index.count}" type="hidden" value="0">
						<input id="commentEmoticon${index.count}" type="hidden" value="${commentVo.commentEmoticon}">
						
						<span><img id="commentImg${index.count}" alt="emoticon" src=""></span>
						<span>${commentVo.memberNickname}</span>
						<div>${commentVo.commentContent}</div>
						<span>${commentVo.creDate}</span>
						<span>${commentVo.modDate}</span>

					</div>	
					<c:if test="${_memberVo_.no eq commentVo.commentMemberIdx}">
						<button id="updateBtn${index.count}" type="button" onclick="makeUpdateBoxFnc(${index.count});">수정</button>
						<button type="button" onclick="deleteCommnetFnc(${index.count});">삭제</button>
					</c:if>
					<hr>
				</c:forEach>
			</form>
		</div>
		
		<!-- 댓글쓰기 -->
		<form id="commentForm" action="./addCommentCtr.do" method="post" onsubmit="return commentCheckFnc();">
			<input id="commentReviewIdx" name="commentReviewIdx" type="hidden" value="${reviewMCFVo.reviewIdx}">
			<input id="commentMemberIdx" name="commentMemberIdx" type="hidden" value="${_memberVo_.no}">
			<input id="commentEmoticon" name="commentEmoticon" type="hidden" value="">
			<div id="choiseEmo">
			<span>이모티콘 선택</span>
			<ul id="EmoList">
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
					style="width:700px;height:300px;"></textarea>
			</div>
			<input type="submit" value="댓글 작성"></input>
		</form>
			
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>

</html>