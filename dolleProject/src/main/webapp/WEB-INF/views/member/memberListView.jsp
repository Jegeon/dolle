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
	}
	
	th, td {
		border: 1px solid black;
		padding: 5px;
	}
</style>
<script type="text/javascript">
	function memberDeletFnc() {
		var checkNo = document.getElementsByName('checkNo');
		for (var i = 0; i < checkNo.length; i++) {
			if (checkNo[i].checked == true) {
				location.href = '../member/deleteCtr.do?mno=' + checkNo[i].value;
			}
		}
	}

	function memberAddFnc() {
		location.href = '../member/add.do';
	}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='mainDiv'>
		<div style='padding: 10px;'>
			<h1>회원목록</h1>
		</div>
			<form id='searchingForm' action="./list.do" method="post">
		<select id='searchOption' name='searchOption'>
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
		<div style='padding: 10px;'>
			<table>
				<tr>
					<th>선택</th><th>이메일</th>
					<th>이름</th>	<th>닉네임</th>
					<th>핸드폰</th><td>생년월일</td>
					<th>가입일</th>
				</tr>
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
			</table>
		</div>
		</form>
		<div>
			<input type='button' onclick='memberDeletFnc();' value='삭제'>
			<jsp:include page="/WEB-INF/views/common/memberPaging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
			<input type='button' onclick='memberAddFnc();' value='회원 추가'>
			<form action="./list.do" id='pagingForm' method="get">
				<input type="hidden" id='curPage' name='curPage' 
					value="${pagingMap.memberPaging.curPage}">
			</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>
</html>