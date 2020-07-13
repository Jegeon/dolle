<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>코스후기 게시판 관리</title>
<style>
	table,tr,td,th {
		border: 1px solid black;
	}
</style>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	function deleteFnc(){
		var checkVal = confirm("정말 삭제하시겠습니까?");
		if(checkVal == true){
			$("#adminForm").attr("action", "./multiDelete.do");
			$("#adminForm").submit();	
			$("#adminForm").attr("action", "./adminList.do");
		}
	}
</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<h1>코스 후기 게시판</h1>
	<div>
		<span>마을</span><span>혜화 명륜</span>
		<span>코스</span><span>혜화 명륜 성곽 코스</span>
	</div>
	
	게시글개수 --개씩
	제목+내용 검색 
	
	<form id="adminForm" action="./adminList.do" method="post">
		<table style="">
			<tr>
				<th>선택</th>		
				<th>글번호(정렬)</th>		
				<th>제목</th>		
				<th>작성자</th>		
				<th>조회수(정렬)</th>		
				<th>별점(정렬)</th>
				<th>등록일(정렬)</th>
				<th>댓글수(정렬)</th>
			</tr>		
			<c:forEach var="reviewVo" items="${reviewList}">
				<tr>
					<td><input type="checkbox" name="checkIdx" value="${reviewVo.reviewIdx}"></td>		 
					<td>${reviewVo.reviewIdx}</td>		
					<td>${reviewVo.reviewTitle}</td>		
					<td>${reviewVo.memberNickname}</td>
					<td>${reviewVo.reviewReadCount}</td>		
					<td>${reviewVo.reviewRating}</td>		
	 				<td><fmt:formatDate value="${reviewVo.reviewCreDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td> 
					<td>${reviewVo.commentCount}</td> 
				</tr>	
			</c:forEach>
		</table>
	</form> 
	
	<input type="button" onclick="deleteFnc();" value="삭제">

	페이징버튼

	1-10 / 전체 페이지 : 27
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>

</html>