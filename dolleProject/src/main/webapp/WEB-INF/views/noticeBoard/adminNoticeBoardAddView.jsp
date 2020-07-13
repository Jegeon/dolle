<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>공지사항 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
</head>

<style type="text/css">

#contentWrap {
	width: 1260px;
	margin: 50px auto 50px auto;
	box-sizing: border-box;
}

#pageTitle{
	font-size: 47px;
	font-family: 대한민국정부상징체;
	padding-left: 465px;
}

#smallContentWrap {
	width: 1160px; 
	height: 600px; 
	margin: auto;
}

.leftTitleDiv {
	height: 30px; 
	padding-top: 15px;
}

#titleInputDiv {
	height: 30px; 
	padding-top: 10px;
}

#nicknameDiv {
	height: 30px;
	padding-top :19px;
}

#fileAddDiv {
	height: 30px;
	padding-top: 13px;
}


#contentDiv {
	padding-top: 15px;
}

.addUnderBtn {
	width: 140px;
	height: 28px;
	margin-right: 40px;
}

#smallerContentWrap {
	width: 700px; 
	height: 600px; 
	margin: auto; 
	padding-top: 40px; 
	box-sizing: border-box;
}

#leftTitleWrap{
	width: 100px; 
	height: 455px; 
	float: left;
}

#InputWrap {
	width: 594px; 
	height: 455px; 
	float: left;
}

#titleInput {
	height: 20px; 
	width:450px;
}

#checkSpan {
	padding-left: 10px;
}

#btnWrap {
	width: 700px; 
	height: 100px; 
	clear: left;
}

#btnSmallWrap {
	padding-top: 40px;
}

#addUnderBtnMargin {
	margin-left: 100px;
}

.validTitle::-webkit-input-placeholder {
  color: red;
  font-weight: bold;
}
.validTitle:-ms-input-placeholder {
  color: red;
  font-weight: bold;
}
.validContent::-webkit-input-placeholder {
  color: red;
  font-weight: bold;
}
.validContent:-ms-input-placeholder {
  color: red;
  font-weight: bold;
}

#contentTextArea {
	padding: 10px 10px 10px 10px;
}

</style>
<script type="text/javascript" 
	src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

	function pageMoveAdminListFnc() {
		location.href='./adminList.do';
	}
	
	function noticeBoardValidationFnc() {
		var inputForm = document.inputForm;
		var titleInput = $('#titleInput');
		var titleVal = titleInput.val();
		var contentTextArea = $('#contentTextArea');
		var contentVal = contentTextArea.val();
		
		if(titleVal == '' && contentVal == ''){
			titleInput.css("border", "1px solid red");
			contentTextArea.css("border", "1px solid red");
			titleInput.attr("class", "validTitle");
			contentTextArea.attr("class", "validContent");
			return false;
		}
		if (titleVal == '') {
			titleInput.css("border", "1px solid red");
			titleInput.attr("class", "validTitle");
			return false;
		}
		
		if (contentVal == '') {
			contentTextArea.css("border", "1px solid red");
			contentTextArea.attr("class", "validContent");
			return false;
		}
		
		inputForm.submit();
		
		
	}
	

</script>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='contentWrap'>
		<span id='pageTitle'>
			공지사항 글 쓰기
		</span>
		<div id='smallContentWrap'>
			<div id='smallerContentWrap'>
				<div id='leftTitleWrap'>
					<div class='leftTitleDiv'>
						<span>제목</span>
					</div>
					<div class='leftTitleDiv'>
						<span>작성자</span>
					</div>
					<div class='leftTitleDiv'>
						<span>파일첨부</span>
					</div>
					<div class='leftTitleDiv'>
						<span>내용</span>
					</div>
				</div>
				
				<form name='inputForm' action='./adminNoticeAddCtr.do' method='post'
					enctype="multipart/form-data">
					<div id='InputWrap'>
						<div id='titleInputDiv'>
							<input type="text" name='noticeTitle' id='titleInput' placeholder="제목을 입력해주세요.">
							<span id='checkSpan'>상단고정</span>
							<input type="checkbox" name='fixed' value='fixed'>
						</div>
						
						<div id='nicknameDiv'>
							<span>${_memberVo_.nickname}</span>
						</div>
						
						<div id='fileAddDiv'>
							<input type="file" name="file" value="파일 추가">
						</div>
						
						<div id='contentDiv'>
							<textarea id='contentTextArea' name='noticeContent' placeholder="내용을 입력해주세요." rows="20" cols="80"></textarea>
						</div>
					</div>
					
					<div id='btnWrap'>
						<div id='btnSmallWrap'>
							<button class='addUnderBtn' id='addUnderBtnMargin' type="button" onclick='pageMoveAdminListFnc();'>목록으로</button>
							<button class='addUnderBtn' type="button" onclick='noticeBoardValidationFnc();'>추가</button>
							<button class='addUnderBtn' type="reset">다시쓰기</button>

							<input type="hidden" name="noticeMemberIdx" value="${_memberVo_.no}">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>