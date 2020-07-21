<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>코스 후기 작성</title>
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
		width: 130px; height: 24px; border: 1px solid #6B6B6B; font-size: 12px;
		margin-right: 5px; vertical-align: top;
	}
	#fileBtn{
		width: 200px;
	}
	.inputBtn{
		width:200px; height:40px; font:normal bold 16px Segoe UI; color:white; 
		 border:0px; margin-right: 20px; background-color: #0D4371;
	}
	
	.inputTitle{
		font:normal bold 18px Segoe UI;
	}
	
	
	/*  */
.dropbtn {
  width: 200px;
  height: 40px;
  padding: 2px;
  font-size: 16px;
  border: none;
  border: 1px solid #767676;
  background-color: #fff;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #fff;
  min-width: 150px;
  margin-left: 1px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

/* .dropdown:hover .dropbtn {background-color: #ddd;} */


/* 공백 시 빨간색 변경 */
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
	
	
</style>
<script type="text/javascript" src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	//클릭시 input ratingNum의 값이 바뀜
	function ratingFnc(num){
		$("#reviewRating").val(num);
		var starNum = $("#reviewRating").val();
		var blankNum  = 5 - starNum;
		
		//별점을 선택하세요 안내 문구 삭제 
		if(starNum != 0){
			$("#choiseTxt").remove();
		}
		
		$("#ratingStar").children().remove();

		var $imgObj = $('<img alt="별_full" src="/dolleProject/resources/images/starBlank.png"'
				+'style="width:20px; height:20px;"></img>');
		
		for(var i=0; i<starNum ; i++){
			$("#ratingStar").append('<img alt="별_full"'
					+'src="/dolleProject/resources/images/starSolid.png"'
					+'style="width:20px; height:20px; padding:0px 2px;"></img>');
		}
		for(var i=0; i<blankNum ; i++){
			$("#ratingStar").append('<img alt="별_full"'
					+'src="/dolleProject/resources/images/starBlank.png"'
					+'style="width:20px; height:20px; padding:0px 2px;"></img>');
		}
		
		
	}
	
	//유효성 체크
	function validCheckFnc(){
		var loginUser = $("#reviewMemberIdx").val();
		if(loginUser == null || loginUser.trim() == "" || loginUser.length == 0){
			alert("로그인 후 작성해주세요.");
			location.href="<%=request.getContextPath()%>/auth/login.do";
		}
		
		var file = $("#fileBtn").val();
		if(file == null || file.trim() == "" || file.length == 0){
			alert("파일을 선택해주세요.");
			return false;
		}

		var noChoise  = $("#reviewRating").val();
		$("#choiseTxt").remove();
		if(noChoise == 0){
			$("#ratingBox").append('<span id="choiseTxt" style="color:red; font-size:14px; margin-left:15px;">'
					+'별점을 선택해주세요.</span>');
			return false;
		}
		
		var title  = $("#reviewTitle").val();
		if(title == null || title.trim() == "" || title.length == 0){
			$("#reviewTitle").css("border", "1px solid red");
			$("#reviewTitle").attr("class","validTitle");
			return false;
		}else if(title.length > 50){	//글자수 제한
			alert("제목은 50자까지 입력 가능합니다.");
			var titleStr = title.substr(0, 50);
			$("#reviewTitle").val(titleStr);
			return false;
		}
		
		var str  = $("#reivewContent").val();
		content = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');		//엔터키 처리
		if(content == null || content.trim() == "" || content.length == 0){
			$("#reivewContent").css("border", "1px solid red");
			$("#reivewContent").attr("class","validContent");
			return false;
		}else if(content.length > 1329){	//글자수 제한
			alert("더 이상 작성할 수 없습니다.");
			var contentStr = content.substr(0, 1325);
			var lastStr = contentStr.substr(contentStr.length-1, 1);
			if(lastStr == '<'){
				contentStr = contentStr + "br/>";
			}else if(lastStr == 'b'){
				contentStr = contentStr + "r/>";
			}else if(lastStr == 'r'){
				contentStr = contentStr + "/>";
			}else if(lastStr == '/'){
				contentStr = contentStr + ">";
			}
		
			var replaceStr = contentStr.replace(/<br\s?\/?>/g,"\n");
			$("#reivewContent").val(replaceStr);
			return false;
		
		}else if(content.length <= 1329){	//글자수 통과 
// 			alert(content.length);
			//마지막 글자 contentStr.substr(contentStr.length-1, 1)
			var lastStr = content.substr(content.length-1, 1);
// 			alert(lastStr, " + ", content.length);
			if(lastStr == '<'){
				content = content + "br/>";
			}else if(lastStr == 'b'){
				content = content + "r/>";
			}else if(lastStr == 'r'){
				content = content + "/>";
			}else if(lastStr == '/'){
				content = content + ">";
			}
			
			$("#reivewContent").val(content);
			return true;
		}
		
		return true;
	}
	
	
	function changeBasicPhotoFnc(){
		alert("기본사진으로 변경");
		$("#uploadImg").attr("src", "/dolleProject/resources/images/test.jpg");
	}
	
	//input[type="file"] 미리보기 제공하기 
	var sel_file;
	var sel_files = [];
	$(document).ready(function(){
		$("#fileBtn").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert(" 이미지만 올릴 수 있습니다.");

				if (/(MSIE|Trident)/.test(navigator.userAgent)) { 
					// ie 일때 input[type=file] init. 
					$("#fileBtn").replaceWith( $("#fileBtn").clone(true) );
				} else {
					// other browser 일때 input[type=file] init. 
					$("#fileBtn").val(""); 
				}
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#uploadImg").attr("src", e.target.result);
				$("#uploadImg").attr("style", "height:583px;");
			}
			reader.readAsDataURL(f);
			
		});
	}
	
	
	
	
	function addFormFnc(){
		if(validCheckFnc() == true){
			$("#addForm").submit();
		}
	}
	
	function movePageListFnc(){
		var grade = $("#memberGrade").val();
		if(grade == null || grade.trim() == "" || grade.length == 0){
			alert("로그인 후 작성해주세요.");
			location.href="<%=request.getContextPath()%>/auth/login.do" 
		}else if(grade == "user"){
			location.href="<%=request.getContextPath()%>/courseReview/list.do"
		}else if(grade == "admin"){
			location.href="<%=request.getContextPath()%>/courseReview/adminList.do"
		}
	}

	//다시 쓰기
	function clearFnc(){
		$("#reviewTitle").val("");
		$("#reivewContent").val("");
	}
	
</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	
	<input id="memberGrade" type="hidden" value="${_memberVo_.grade}">
	
	<div style="width:1260px; height:1600px; margin:0px auto;">
		
		<div id="townBox" class="basicBox titleFont" style="padding: 50px 0px 25px;">	
			<h1>혜화 명륜 마을</h1>
		</div>
		
		<form id="addForm" action="./addCtr.do" method="post" enctype="multipart/form-data">
			<div id="uploadImageBox" class="basicBox" style="text-align: center; overflow: hidden;">	
				<img id="uploadImg" alt="upload_image" src="/dolleProject/resources/images/test.jpg"
					style="width:100%;">
			</div>
			
			<div class="floatRight" style="margin: 10px 180px 40px;">
<!-- 				<span style="margin-right:10px; font-size:12px;">기본 사진으로 변경</span> -->
				<input id="changePhotoBtn" type="button" onclick="changeBasicPhotoFnc();" value="기본 사진으로 변경">
				<input id="fileBtn" type="file" name="file">
			</div>
			
			<div id="ratingBox" class="basicBox floatClear" style="padding-bottom: 20px;">
				<div class="inputTitle" style="padding-bottom:5px;">
					<span>별점</span>
				</div>
				
				<!-- 클릭한 평점 -->
				<input id="reviewRating" name="reviewRating" type="hidden" value="0">
				<input id="reviewMemberIdx" name="reviewMemberIdx" type="hidden" value="${_memberVo_.no}">
				
				<div class="dropdown">
					<button class="dropbtn" type="button">
						<span id="ratingStar" style="padding-top:3px; padding-left:10px; box-sizing:border-box; 
									display:inline-block; vertical-align:middle;">
						<c:forEach begin="1" end="5">
							<img alt="별_full" src="/dolleProject/resources/images/starBlank.png" 
										style="width:20px; height:20px;">
						</c:forEach>
						</span>
						<span style="padding-top:3px; padding-left:8px; box-sizing:border-box; display:inline-block; vertical-align:middle;">
						<img alt="drop_btn" src="/dolleProject/resources/images/selectBtn.PNG" 
										style="width:30px; height:18px;">
						</span>				
					</button>
					<div class="dropdown-content">
						<a onclick="ratingFnc(5);">
							<c:forEach begin="1" end="5">
								<img alt="별_full" src="/dolleProject/resources/images/starSolid.png" 
											style="width:19px; height:19px;">
							</c:forEach>
						</a>
					    <a onclick="ratingFnc(4);">
						    <c:forEach begin="1" end="4">
								<img alt="별_full" src="/dolleProject/resources/images/starSolid.png" 
											style="width:19px; height:19px;">
							</c:forEach>
						    <c:forEach begin="1" end="1">
								<img alt="별_full" src="/dolleProject/resources/images/starBlank.png" 
											style="width:20px; height:20px;">
							</c:forEach>	
						</a>
					   <a onclick="ratingFnc(3);">
						    <c:forEach begin="1" end="3">
								<img alt="별_full" src="/dolleProject/resources/images/starSolid.png" 
											style="width:19px; height:19px;">
							</c:forEach>
						    <c:forEach begin="1" end="2">
								<img alt="별_full" src="/dolleProject/resources/images/starBlank.png" 
											style="width:20px; height:20px;">
							</c:forEach>	
						</a>
						<a onclick="ratingFnc(2);">
							<c:forEach begin="1" end="2">
								<img alt="별_full" src="/dolleProject/resources/images/starSolid.png" 
											style="width:19px; height:19px;">
							</c:forEach>
						    <c:forEach begin="1" end="3">
								<img alt="별_full" src="/dolleProject/resources/images/starBlank.png" 
											style="width:20px; height:20px;">
							</c:forEach>	
						</a>
						<a onclick="ratingFnc(1);">
							<c:forEach begin="1" end="1">
								<img alt="별_full" src="/dolleProject/resources/images/starSolid.png" 
											style="width:19px; height:19px;">
							</c:forEach>
						    <c:forEach begin="1" end="4">
								<img alt="별_full" src="/dolleProject/resources/images/starBlank.png" 
											style="width:20px; height:20px;">
							</c:forEach>	
						</a>
						
					</div>					
				</div>
				
<!-- 				<span>별점을 선택해주세요.</span> -->
			</div>
			
			<div class="basicBox" style="padding-bottom: 20px;">
				<div class="inputTitle" style="padding-bottom:5px;">
					<span>제목</span>
				</div>
				<input id="reviewTitle" name="reviewTitle" type="text"  onchange="clearFnc(this.value);"
					placeholder="제목을 입력해주세요." style="width:900px; height:45px; font-size:16px; padding:10px 48px; box-sizing:border-box;">
			</div>
			
			<div class="basicBox" style="padding-bottom: 20px;">
				<div class="inputTitle" style="padding-bottom:5px;">
					<span>내용</span>
				</div>
				<textarea id="reivewContent" name="reviewContent" placeholder="내용을 입력해주세요." 
					style="width:900px; height:470px; font-size:17px; padding:50px; box-sizing:border-box; resize: none;"></textarea>
			</div>
			
				
			<div class="basicBox" style="text-align: center;">
				<input class="inputBtn" type="button" onclick="movePageListFnc();" value="목록으로">
				<input class="inputBtn" type="button" onclick="addFormFnc();" value="등록">
				<input class="inputBtn" type="button" onclick="clearFnc();" value="다시 쓰기">	
			</div>
			
		</form>
		
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>

</html>