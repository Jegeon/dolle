<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
	#mainDiv {
		text-align: center;
		margin: 0px auto;
	}

	table {
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
		margin: 0px auto;
		width: 715px;
	}
	
	th, td {
		border: 1px solid black;
		padding: 5px;
	}
	
	.spanCss {
		color: #0D4371;
		font-size: 30px;
		font-weight: bold;
	}
	
	#searchForm {
		text-align: center;
	}
	
	.divCss {
		text-align: center;
		margin: auto;
	}
	
	.btnCss {
		background-color: #0D4371;
		color: #FFFFFF;
		border: 0px;
		outline: 0px;
		font-size: 5px;
		padding: 10px;
	}
	
</style>
<script type="text/javascript" src="/dolleProject/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function memberDeletFnc() {
		var checkNo = document.getElementsByName('checkNo');
		for (var i = 0; i < checkNo.length; i++) {
			if (checkNo[i].checked == true) {
				if (confirm('정말 삭제하시겠습니까?') == true) {
					location.href = '../member/deleteCtr.do?mno=' + checkNo[i].value;
				} else {
					return;
				}
			}
		}
	}

	function memberAddFnc() {
		location.href = '../member/add.do';
	}
	
	function goPageFnc(pageNum){
		var curPage = $('#curPage');
		curPage.val(pageNum);
		
		var pagingForm = $('#pagingForm');
		pagingForm.submit();
	}
	
	function submitFnc() {
		var pagingForm = $('#searchForm');
		pagingForm.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='mainDiv'>
		<div style='padding: 15px;'>
			<span class='spanCss'>회원목록</span>
		</div>
	<form id='searchForm' action="./list.do" method="post" style=' padding:10px 0px 10px;'>
		<select id='searchOption' name='searchOption' style='margin-left: 385px;'>
		<c:choose>
			<c:when test="${searchMap.searchOption eq 'all'}">
				<option value="all" selected="selected">이름+이메일</option>
				<option value="name">이름</option>
				<option value="email">이메일</option>
			</c:when>
			
			<c:when test="${searchMap.searchOption eq 'name'}">
				<option value="all">이름+이메일</option>
				<option value="name" selected="selected">이름</option>
				<option value="email">이메일</option>
			</c:when>

			<c:when test="${searchMap.searchOption eq 'email'}">
				<option value="all">이름+이메일</option>
				<option value="name">이름</option>
				<option value="email" selected="selected">이메일</option>
			</c:when>
		</c:choose>
		</select>
<!-- 			<input type="hidden" id='curPage' name='curPage'  -->
<%-- 			value="${pagingMap.memberPaging.curPage}"> --%>
		<input type="text" id='keyword' 
			name="keyword" value="${searchMap.keyword}"
			placeholder="회원이름 or 이메일 검색">
		<input type="submit" value="검색">
	</form>	
	<form name='deletForm' action='../member/deleteCtr.do?mno='>
		<div class='divCss' style='padding: 10px;'>
			<table>
				<tr>
					<th>선택</th><th>이메일</th>
					<th>이름</th>	<th>닉네임</th>
					<th>핸드폰</th><td>생년월일</td>
					<th>가입일</th>
				</tr>
			<c:choose>
				<c:when test="${empty memberList}">
					<tr>
						<td colspan="7" style="text-align: center;">
							등록된 회원이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="memberVo" items="${memberList}">
					<c:if test="${memberVo.grade == 'user' || memberVo.grade != 'admin'}">
						<tr>
							<td>
								<input type='checkbox' name='checkNo' value='${memberVo.no}'>
							</td>
							<td>
								${memberVo.email}
							</td>
							<td>
								<a href='../member/memberlistOne.do?no=${memberVo.no}'>${memberVo.name}</a>
							</td>
							<td>
								${memberVo.nickname}
							</td>
							<td>
								${memberVo.phone}
							</td>
							<td>
								<fmt:formatDate value="${memberVo.birthdate}"
									pattern="yyyy-MM-dd"/>
							</td>
							<td>
								<fmt:formatDate value="${memberVo.createDate}"
									pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>
		</div>
	</form>
		<div>
			<input class='btnCss' type='button' onclick='memberDeletFnc();' value='삭제'>
		<!-- 	페이징 버튼 -->
<!-- 			<div style="width:1260px; height:205px; margin:0 auto; text-align: center;  -->
<!-- 				padding-top: 30px; box-sizing: border-box;"> -->
				<ul id="pagingGroup" style="width: 600px; display: inline-block; padding: 0px 0px 10px;">
					<li class="pagingImg" onclick="goPageFnc(1);"
						 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
						 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
						 padding-top:7px; box-sizing: border-box;">
						<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleLeft.PNG" 
							style="width: 55%;">
					</li>
					<li class="pagingImg" onclick="goPageFnc(${pagingMap.memberPaging.prevPage});"
						 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
						 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
						 padding-top:7px; box-sizing: border-box;">
						<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/left.PNG" 
							style="width: 40%;">
					</li>
					<c:forEach var="num" 
						begin="${pagingMap.memberPaging.blockBegin}" 
						end="${pagingMap.memberPaging.blockEnd}">
						
						<c:if test="${pagingMap.memberPaging.curPage eq num}">
							<li class="pagingNum" onclick="goPageFnc(${num});"
								style="cursor: pointer; width:40px; height:40px; display:inline-block; 
								background: #0D4371; color:#fff; border:1px solid #707070; vertical-align: middle; 
								font-size: 20px; padding-top:8px; box-sizing: border-box;">
								<c:out value="${num}"/>
							</li>
						</c:if>
						<c:if test="${pagingMap.memberPaging.curPage ne num}">
							<li class="pagingNum" onclick="goPageFnc(${num});"
								 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
								 background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
								font-size: 20px; padding-top:8px; box-sizing: border-box;">
								<c:out value="${num}"/>
							</li>
						</c:if>
					</c:forEach>
		
					<li class="pagingImg" onclick="goPageFnc(${pagingMap.memberPaging.nextPage});"
					 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
					 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
						 padding-top:7px; box-sizing: border-box;">
						<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/right.PNG" 
							style="width: 42%;">
					</li>
					<li class="pagingImg" onclick="goPageFnc(${pagingMap.memberPaging.totPage});"
						 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
						 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
						 padding-top:7px; box-sizing: border-box;">
						<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleRight.PNG" 
							style="width: 55%;">
					</li>
				</ul>
				<input class='btnCss' type='button' onclick='memberAddFnc();' value='회원 추가'>
				
				<!-- 페이징정보 전달 -->
				<form action="./list.do" id='pagingForm' method="get">
					<input type="hidden" id='curPage' name='curPage' 
						value="${pagingMap.memberPaging.curPage}">
					<input type="hidden" id='pagingSearchOption' name='searchOption' 
						value="${searchMap.searchOption}">	
					<input type="hidden" id='pagingKeyword' name='keyword' 
						value="${searchMap.keyword}">
				</form>
			</div>
		</div>
<!-- 	</div> -->
	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>
</html>