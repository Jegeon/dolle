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
		//기본 이미지 smile로 설정
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
	
</script>
</head>

<body>
	
	<jsp:include page="/WEB-INF/views/Header.jsp"/>


	<div style="width:1260px; height:1600px; margin:0px auto;">
		
		<div id="townBox" class="basicBox titleFont" style="padding: 50px 0px 10px;">	
			<h1>혜화 명륜 마을</h1>
		</div>
		
<!-- 		<form id="addForm" action="./addCtr.do" method="post" enctype="multipart/form-data"> -->
			<div id="uploadImageBox" class="basicBox" style="text-align: center;">	
				<img id="uploadImg" alt="upload_image" src="<c:url value='/img/${reviewMCFVo.fileStoredName}'/>"
					style="height:583px;">
			</div>
			
			<div class="floatRight" style="margin: 10px 190px 40px;">
			
			</div>
			
			<div id="ratingBox" class="basicBox floatClear" style="padding-bottom: 20px;">
			
			</div>
			
			<div class="basicBox" style="padding-bottom: 20px;">
				${reviewMCFVo.reviewTitle}
			</div>
			
			<div class="basicBox" style="padding-bottom: 20px;">
				${reviewMCFVo.reviewRating}
				${reviewMCFVo.memberNickname}
			</div>
			
			<div class="basicBox" style="padding-bottom: 20px;">
				${reviewMCFVo.reviewReadCount}
				${reviewMCFVo.reviewLikeCount}
			</div>
			
			<div class="basicBox" style="padding-bottom: 20px;">
				등록일 <fmt:formatDate value="${reviewMCFVo.reviewCreDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
				수정일 <fmt:formatDate value="${reviewMCFVo.reviewModDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
			</div>
			
			<div class="basicBox" style="padding-bottom: 20px;">
				${reviewMCFVo.reviewContent}
			</div>
			
			<div class="basicBox" style="float:left; padding-left:600px;">
				<input class="inputBtn" type="button" onclick="movePageListFnc();" value="목록으로">
				<input class="inputBtn" type="button" onclick="movePageUpdateFnc(${reviewMCFVo.reviewIdx});" value="수정">
			</div>
<!-- 		</form> -->
			
		<div>댓글쓰기</div>
		<hr>
		<div id="commentWrap">
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