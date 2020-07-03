<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
	#mainBorder {
		text-align: center;
		margin: auto;
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
	
	.inputBtn {
		border: 0px;
		outline: 0px;
		background-color: #FFFFFF;
	}
	
	.inputCss {
		border: 0px;
		background-color: transparent;
		padding: 10px;
		color: #000000;
	}
	
	input:focus {
		border: 0px;
		outline: 0px;
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
	
	#backBord {
		background-color: #EBEBEB;
	}
	
	.btnCss {
		background-color: #0D4371;
		color: #FFFFFF;
		border : 0px;
		outline: 0px;
		margin: 10px;
	}
</style>
<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = "list.do";
	}
	
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id='mainBorder'>
		<div>
			<span class='firstSpanCss'>내 정보</span>
		</div>
		<table>
			<tr>
				<td>
					<input class='inputBtn' type='button' value='가입 정보'>
				</td>
				<td>
					<input class='inputBtn' type='button' value='예약 현황'>
				</td>
				<td>
					<input class='inputBtn' type='button' value='내가 쓴 글'>
				</td>
			</tr>
		</table>
		<div id='backBord'>
			<form action="./update.do" method="get">
				<input type="hidden" name='no' value='${memberVo.no}'>
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
				</table>
				<input class='btnCss' type="submit" value="수정하기">
				<input class='btnCss' type="button" value="이전페이지" 
						onclick="pageMoveListFnc();">
			</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>