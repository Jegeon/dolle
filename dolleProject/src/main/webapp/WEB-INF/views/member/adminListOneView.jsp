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
	
	.btnCss {
		background-color: #0D4371;
		color: #FFFFFF;
		border : 0px;
		outline: 0px;
		margin: 10px;
	}
	
</style>
<script type="text/javascript">
	function pageMoveListFnc() {
		var noObj = document.getElementById('noObj');
		
		location.href = '../member/adminlist.do?no=' + noObj.value;
	}
	
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='mainBorder'>
	<div style='padding: 15px'>
		<span class='firstSpanCss'>관리자 정보</span>
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
						<span class='secondSpanCss'>담당마을</span>
					</td>
					<td>
						<input class='inputCss' type='text' name='townName'
						 	value='${memberVo.townName}' readonly='readonly'>
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
						<input class='inputCss' type='text' name='birthdate'
						 	value='<fmt:formatDate value="${memberVo.birthdate}" pattern="yyyy-MM-dd" />'
						 	readonly='readonly'>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>가입일</span>
					</td>
					<td>
						<input class='inputCss' type='text' name='createDate'
						 	value='<fmt:formatDate value="${memberVo.createDate}" pattern="yyyy-MM-dd" />'
						 	readonly='readonly'>
						
					</td>
				</tr>
				<tr>
					<td>
						<input class='btnCss' type="button" value="목록으로" 
							onclick='pageMoveListFnc();'>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<input id='noObj' type='hidden' value='${memberVo.no}'>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>

</html>