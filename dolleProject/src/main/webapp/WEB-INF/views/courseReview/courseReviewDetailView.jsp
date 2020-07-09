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
</style>
<script type="text/javascript">
	function movePageListFnc(){
		location.href="./list.do"
	}
	
	function movePageUpdateFnc(reviewIdx){
		location.href="./update.do?reviewIdx="+reviewIdx;
	}
</script>
</head>

<body>
	
	<jsp:include page="/WEB-INF/views/Header.jsp"/>


	<div style="width:1260px; height:1600px; margin:0px auto; background:skyblue">
		
		<div id="townBox" class="basicBox titleFont" style="padding: 50px 0px 10px;">	
			<h1>혜화 명륜 마을</h1>
		</div>
		
		<form id="addForm" action="./addCtr.do" method="post" enctype="multipart/form-data">
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
		</form>
			
		<div>댓글쓰기</div>
		<hr>
		<div id="commentWrap">
		</div>
		
		<!-- 댓글쓰기 -->
		<form id="commentForm" action="./addComment.do" method="post">
			<div id="choiseIcon">
			<span>이모티콘 선택</span>
			<ul id="iconList">
			</ul> 
			</div>
		<div>
			<textarea id="writeComment" placeholder="댓글을 작성해주세요."></textarea>
		</div>
		<div>댓글 작성</div>
		</form>
			
			
		
		
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>

</html>