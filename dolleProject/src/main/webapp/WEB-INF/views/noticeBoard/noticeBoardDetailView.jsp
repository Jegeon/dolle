<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>공지사항 게시글 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

</head>
<style type="text/css">
body {
	font-family: Segoe UI;
}

#contentWrap {
	width: 1260px;
	margin: 50px auto 50px auto;
	box-sizing: border-box;
}

#megaPhone {
	width: 40px;
	height: 40px;
	box-sizing: border-box;
}

#pageTitle{
	font-size: 47px; 
	font-family: 대한민국정부상징체;
}

#smallContentWrap {
	width: 1160px; 
	margin: auto;
}

#titleWrap{
	height: 90px;
	box-sizing: border-box;
	padding-top: 35px;
}

#titleSpan {
	font-size: 24px; 
	font-family: 'segoe UI';
}

.contentInfoDiv {
	height: 25px;
}

.contentInfoSpan {
	display: inline-block; 
	padding-top: 4px;
}

.updownSpan {
	float:right; 
	font-size: 17px; 
	margin-right: 10px; 
}

#upSpan {
	padding-right:15px; 
	padding-left: 15px;
}

#downSpan {
	padding-right: 5px;
	padding-left: 8px; 
}

.updownBtn {
	float:right; 
	width: 30px; 
	height: 22px; 
	color: white;
}

#previewDiv {
	box-sizing:border-box;
	padding: 30px;
	width: 1160px; 
	height: 765px;
}

#previewImg {
	width: 100%; 
	height: 100%;
}

#downloadLink {
	float:right; 
	color: black; 
	text-decoration: none; 
	height: 30px; 
	padding-top: 10px;
}

/* #noticeTextarea { */
/* 	width:1160px;  */
/* 	height: 470px;  */
/* 	box-sizing: border-box;  */
/* 	padding:50px;  */
/* 	font-size: 17px; */
/* } */

#noticeDiv {
	width: 1160px;
	box-sizing: border-box;
	padding: 50px;
	font-size: 17px;
	line-height: 25px;
}

#listBtnDiv {
	margin: auto; 
	padding-top: 40px;
}

#listBtnInput {
	width: 230px; 
	height: 40px; 
	background-color: #0D4371; 
	text-align: center;
	vertical-align: middle; 
	color: white; 
	font-weight: bold; 
	font-size: 20px; 
	border: none;
}

.btnPointer {
	cursor: pointer;
}

#fileZone {
	padding-bottom: 30px;
}


</style>

<script type="text/javascript" 
	src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
window.onload = function () {
	
	var fileName = $('#fileStoredName').val();
	
	var refineExtension = fileName.split(".")[1];
	
	fileZoneDiv = $('#fileZone');
	
	if (refineExtension == 'jpg' || refineExtension == 'JPG' 
			|| refineExtension == 'png' || refineExtension == 'PNG'
			|| refineExtension == 'jpeg' || refineExtension == 'JPEG') {
		
		content = '<div id="previewDiv">';
		content	+= '<img id="previewImg" alt="" src=';
		content	+= "<c:url value='/img/${noticeVo.fileNoticeStoredName}'/>";
		content	+= '>';
		content	+= '</div>';
		
		
		fileZoneDiv.html(content);
	}
	
	
	
}
	function upFnc() {
		$('#upForm').submit();
	}
	
	function downFnc() {

		$('#downForm').submit();
// 		location.href = "./noticeUpPage.do?rNum="+rNum;
		
	}
	
	function pageMoveListFnc() {
		
		location.href = './list.do';
	}
	
	function pageMoveUpdateFnc(noticeIdx) {
		
		location.href = './adminUpdate.do?noticeIdx='+noticeIdx;
	}
	
</script>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id='contentWrap'>
		<img id='megaPhone' alt="megaPhone" src="../resources/images/megaPhone.png">
		<span id='pageTitle'>
			공지사항
		</span>
		<div id='smallContentWrap'>
			<div id='titleWrap'>
				<span id='titleSpan'>
					${noticeVo.noticeTitle}
				</span>
			</div>
			
			<div class='contentInfoDiv'>
				<form action="./noticeUpPage.do" id="upForm" method = "post">
					<span class='contentInfoSpan'>
						작성자: ${noticeVo.memberNickname}
					</span>
					
					<c:if test="${rNum ne 1}">
						
						<span class='updownSpan' id='upSpan'>
							윗 글
						</span>
							<img class='updownBtn btnPointer'
								alt="upBtn" src="/dolleProject/resources/images/upBtn.png"
								onclick="upFnc();">
							<input type="hidden" name="rNum" value="${rNum}">
						
					</c:if>
				</form>
			</div>
			
			<div class='contentInfoDiv'>
				<form action="noticeDownPage.do" id="downForm" method = "post">
					<span class='contentInfoSpan'>
						작성일: <fmt:formatDate value="${noticeVo.noticeCreDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span>
					<c:if test="${rNum ne maxRnum}">
						<span class='updownSpan' id='downSpan'>
							아랫 글
						</span>
					
						<img class='updownBtn btnPointer' 
							alt="downBtn" src="/dolleProject/resources/images/downBtn.png"
							onclick="downFnc();">
						<input type="hidden" name="rNum" value="${rNum}">
					</c:if>
				</form>
			</div>
			
			<input type="hidden" id='fileStoredName' value='${noticeVo.fileNoticeStoredName}'>
			
			<div id='fileZone'>
			
			</div>
			
<%-- 			<textarea id='noticeTextarea' rows="25" cols="160" readonly="readonly">${noticeVo.noticeContent}</textarea> --%>
			<div id='noticeDiv'>
				${noticeVo.noticeContent}
			</div>
			
			<div id='listBtnDiv'>
				<input id='listBtnInput' class='btnPointer' value='목록으로'
					onclick='pageMoveListFnc();'>
				<c:if test="${_memberVo_.grade == 'admin'}">
					<input id='listBtnInput' class='btnPointer' value='수정하기'
						onclick='pageMoveUpdateFnc(${noticeVo.noticeIdx});'>
				</c:if>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>
</html>