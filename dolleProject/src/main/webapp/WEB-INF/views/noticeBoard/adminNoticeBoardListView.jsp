<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>공지사항 게시판 관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">


</head>
<style type="text/css">
#contentDiv {
	width: 1260px;
	height: 850px;
	margin: 50px auto 50px auto;
	box-sizing: border-box;
}

#megaPhone {
	width: 40px;
	height: 40px;
	box-sizing: border-box;
}

table, tr, th, td {
	border-collapse: collapse;
	vertical-align: middle;
	text-align: center;
}

tr {
	border-top : 1px solid #ddd;
	border-bottom : 1px solid #ddd;
}

table {
	width: 1260px;
	height: 645px;
}

th {
	font-weight: bold;
	background-color: #F8F4ED;
	border-top: 2px solid #ddd;
	border-bottom: 2px solid #ddd;
}

#tableWrap {
	width: 1260px;
	height: 700px;
	clear: both;
}

#pageTitle{
	font-size: 47px; 
	font-family: 대한민국정부상징체;
}

#searchWrap {
	float: right; 
	height: 50px; 
	width: 400px; 
	padding-top: 60px;
}

#searchOptionWrap{
	width: 140px; 
	padding: 6px 22px; 
	vertical-align: middle; 
	border: 1px solid #B9B9B9; 
	font-size: 14px; 
	font-family: Segoe UI; 
	-webkit-appearance: none; /* 원본 select 버튼 감추기 */ 
	background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;
}

#serachDiv {
	width: 250px; 
	height: 31px; 
	display: inline-block; 
	border: 1px solid #B9B9B9; 
	vertical-align: middle;
}

#searchInput {
	width: 190px; 
	height: 22px; 
	vertical-align: middle; 
	font: normal normal 14px Segoe UI; 
	margin-left: 10px; 
	padding: 2px 0px 1px 10px; 
	border: 0px;
}

#searchBtn {
	margin-top: 2px; 
	vertical-align: middle;
}

.tableLine {
	border-right: 1px solid #ddd;
}

.alignPaddingLeft {
	text-align: left; 
	padding-left: 15px;
}

#clipSize {
	width: 18px;
	height: 18px;
	vertical-align: middle;
}

.noneColorNotice {
	font-size: 17px;
}

.boldTitle {
	font-weight: bold;
	font-size: 17px;
}

.blackLink {
	text-decoration: none;
}

.boldNotice {
	color: #0D4371; 
	font-weight: bold; 
	font-size: 17px;
}

#listBtnDiv {
	margin: auto; 
	width: 230px; 
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



</style>
<script type="text/javascript" 
	src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function pageMoveNoticeAdd() {
		
		location.href = './AdminNoticeAdd.do';
		
	}
	
</script>


<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id='contentDiv'>
		<img id='megaPhone' alt="megaPhone" src="../resources/images/megaPhone.png">
		<span id='pageTitle'>공지사항</span>
		<div id='searchWrap'>

			
			<select id='searchOptionWrap'>
				<option>작성자</option>
				<option>제목</option>
			</select>

			<div id='serachDiv'>
				<input id='searchInput' type="text" value="">
				<img id="searchBtn" alt="검색버튼"
					src="/dolleProject/resources/images/searchBtn.PNG">
			</div>

		</div>
		
		<div id='tableWrap'>
			<table>
				<tr>
					<th class='tableLine' style="width: 100px;">번호</th>
					<th class='tableLine' style="width: 760px;">제목</th>
					<th class='tableLine' style="width: 200px;">작성자</th>
					<th style="width: 200px;">작성일</th>
				</tr>
				
				<c:forEach var="noticeMemberFileVo" items="${noticeMemberFileFixedList}">
					<tr>
						<td class='tableLine boldNotice'>
							공지
						</td>
						<td class='tableLine alignPaddingLeft boldTitle'>
							<a class='blackLink' style="color: #0D4371;" href='./adminDetail.do?noticeIdx=${noticeMemberFileVo.noticeIdx}'>${noticeMemberFileVo.noticeTitle}
								<c:if test="${noticeMemberFileVo.fileExist eq 1}">
									<img id='clipSize' alt='clip' src='/dolleProject/resources/images/fileClip.png'>
								</c:if>
							</a>
						</td>
						<td class='tableLine'>${noticeMemberFileVo.memberNickname}</td>
						<td>
							<fmt:formatDate value="${noticeMemberFileVo.noticeCreDate}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
				</c:forEach>
				
				<c:forEach var="noticeMemberFileVo" items="${noticeMemberFileList}">
					<tr>
						<td class='tableLine noneColorNotice'>${noticeMemberFileVo.noticeIdx}</td>
						<td class='tableLine alignPaddingLeft'>
							<a class='blackLink' href='./adminDetail.do?noticeIdx=${noticeMemberFileVo.noticeIdx}'>
								${noticeMemberFileVo.noticeTitle}
								<c:if test="${noticeMemberFileVo.fileExist eq 1}">
									<img id='clipSize' alt='clip' src='/dolleProject/resources/images/fileClip.png'>
								</c:if>
							</a>
						</td>
						<td class='tableLine'>${noticeMemberFileVo.memberNickname}</td>
						<td><fmt:formatDate value="${noticeMemberFileVo.noticeCreDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div style="width:1260px; height:205px; margin:0 auto; text-align: center; clear: both;">
			<ul style="width: 600px; display: inline-block;">
				<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
					 padding-top:7px; box-sizing: border-box;">
					<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleLeft.PNG" >
				</li>
				<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
					 padding-top:7px; box-sizing: border-box;">
					<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/left.PNG" >
				</li>
				<li style="width:50px; height:50px; display: inline-block; background: #0D4371; color:#fff; border:1px solid #707070; vertical-align: middle;
					font-size: 23px; padding-top:10px; box-sizing: border-box;">1</li>
				<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
					font-size: 23px; padding-top:10px; box-sizing: border-box;">2</li>
				<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
					font-size: 23px; padding-top:10px; box-sizing: border-box;">3</li>
				<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
					font-size: 23px; padding-top:10px; box-sizing: border-box;">4</li>
				<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
					font-size: 23px; padding-top:10px; box-sizing: border-box;">5</li>
				<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
					 padding-top:7px; box-sizing: border-box;">
					<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/right.PNG" >
				</li>
				
				<li style="width:50px; height:50px; display: inline-block; background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
					 padding-top:7px; box-sizing: border-box;">
					<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleRight.PNG" >
				</li>
			</ul>
			
			
			<c:if test="${_memberVo_.grade == 'admin'}">
				<div id='listBtnDiv'>
					<input id='listBtnInput' class='btnPointer' value='공지 작성'
						onclick='pageMoveNoticeAdd();'>
				</div>
			</c:if>
		</div>
		
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	

</body>
</html>