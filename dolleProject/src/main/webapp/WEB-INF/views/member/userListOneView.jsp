<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mainBorder {
		text-align: center;
		margin: auto;
	}
	
	#backBord {
		background-color: #EBEBEB;
	}
	
	table {
		text-align: center;
		margin: auto;
	}
	
	td {
		color: #000000;
		text-align: left;
		padding: 10px;
	}
	
	table {
		text-align: center;
		margin: auto;
	}
	
	td {
		color: #000000;
		text-align: left;
		font-size: 5px;
		padding: 10px;
	}
	
	.inputCss {
		border: 0px;
		background-color: transparent;
		padding: 10px;
		color: #000000;
	}
		
	.firstSpanCss {
		color: #0D4371;
		font-size: 30px;
		font-weight: bold;
	}
	
	.secondSpanCss {
		color: #0D4371;
		font-weight: bold;
		font-size: 12px;
	}
	
	input:focus {
		border: 0px;
		outline: 0px;
	}
	
</style>
<script type="text/javascript">
	function pageMoveListFnc() {
		var noObj = document.getElementById('noObj');
		
		location.href = '../member/list.do?curPage=1';
	}
	
	function updateMoveFnc() {
		
	}
	
	function deleteMoveFnc() {
		var noObj = document.getElementById('noObj');
		
		location.href = '..//member/deleteCtr.do?mno=' + noObj.value;
	}
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='mainBorder'>
	<div>
		<span class='firstSpanCss'>회원 상세 정보</span>
	</div>
		<div id='backBord'>
			<table>
				<tr>
					<td>
						<span class='secondSpanCss'>이름</span> 
					</td>
					<td>
						<input class='inputCss' type="text" name='name'
						 id='memberName' value='${memberVo.name}' readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>닉네임</span>
					</td>
					<td>
						<input class='inputCss' type='text' name='nickname'
							value='${memberVo.nickname}' readonly='readonly'>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>이메일</span>
					</td>
					<td>
						<input class='inputCss' type="text" name="email" 
							value='${memberVo.email}' readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>연락처</span>
					</td>
					<td>
						<input class='inputCss' type='text' name='phone'
						 	value='${memberVo.phone}' readonly='readonly'>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>생년월일</span>
					</td>
					<td>
						<input class='inputCss' type='text' 
							value='<fmt:formatDate value="${memberVo.birthdate}" pattern="yyyy-MM-dd" />'>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>가입일</span>
					</td>
					<td>
						<input class='inputCss' type='text'
							value='<fmt:formatDate value="${memberVo.createDate}" pattern="yyyy-MM-dd" />'>
					</td>
				</tr>
				<tr>
					<td colspan='2'>
						<input class='btnCss' type="button" value="목록으로" 
							onclick='pageMoveListFnc();'>
						<input class='btnCss' type="button" value="수정하기"
							onclick='updateMoveFnc();'>
						<input class='btnCss' type='button' value='삭제하기'
							onclick='deleteMoveFnc();'>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<input id='noObj' type='hidden' value='${memberVo.no}'>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>

</html>