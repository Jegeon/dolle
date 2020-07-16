<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 목록</title>
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
	
	.btnCss {
		background-color: #0D4371;
		color: #FFFFFF;
		border: 0px;
		outline: 0px;
		font-size: 5px;
		padding: 10px;
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
		<div style='padding: 15px;'>
			<span class='spanCss'>관리자 목록</span>
		</div>
		<form name='deletForm' action='../member/deleteCtr.do?mno='>
		<div style='padding: 10px;'>
			<table>
				<tr>
					<th>선택</th><th>이메일</th>
					<th>이름</th>	<th>닉네임</th>
					<th>핸드폰</th><td>생년월일</td>
					<th>담당마을</th>
				</tr>
				<c:forEach var="memberVo" items="${adminList}">
				<c:if test="${memberVo.grade == 'admin'}">
					<tr>
						<td>
							<input type='checkbox' name='checkNo' value='${memberVo.no}'>
						</td>
						<td>
							${memberVo.email}
						</td>
						<td>
							<a href='../member/adminlistOne.do?no=${memberVo.no}'>${memberVo.name}</a>
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
							${memberVo.townName}
						</td>
					</tr>
				</c:if>
				</c:forEach>
			</table>
		</div>
		<div style='padding: 15px; margin-left: 580px;'>
			<input class='btnCss' type='button' onclick='memberDeletFnc();' value='삭제'>
		</div>
		</form>
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>
</html>