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

input[type="checkbox"]{
}
</style>
<script type="text/javascript" 
	src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

	function pageMoveAdminListFnc() {
		location.href='./adminList.do';
	}
	
	function resetNoticeFnc() {
		
	}
</script>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='contentWrap'>
		<span id='pageTitle'>
			공지사항 글 쓰기
		</span>
		<div id='smallContentWrap'>
			<div style="width: 700px; height: 600px; margin: auto; padding-top: 40px; box-sizing: border-box;">
				<div style="width: 100px; height: 455px; float: left;">
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
				
				<form action='./AdminNoticeAddCtr.do' method='post'>
					<div style="width: 594px;height: 455px; float: left;">
						<div id='titleInputDiv'>
							<input type="text" style="height: 20px; width:450px;">
							<span style="padding-left: 10px;">상단고정</span>
							<input type="checkbox" name='fixed' value='fixed'>
						</div>
						
						<div id='nicknameDiv'>
							<span>${_memberVo_.nickname}</span>
						</div>
						
						<div id='fileAddDiv'>
							<button type="button">파일 추가</button>
						</div>
						
						<div id='contentDiv'>
							<textarea rows="20" cols="80"></textarea>
						</div>
					</div>
					
					<div style="width: 700px; height: 100px; clear: left;">
						<div style="padding-top: 40px;">
							<button class='addUnderBtn' style="margin-left: 100px;" type="button" onclick='pageMoveAdminListFnc();'>목록으로</button>
							<button class='addUnderBtn' type="submit">추가</button>
							<button class='addUnderBtn' type="reset" onclick='resetNoticeFnc();'>다시쓰기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>