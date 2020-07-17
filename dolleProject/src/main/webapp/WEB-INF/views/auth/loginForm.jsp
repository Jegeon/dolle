<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
		color: red;
		text-align: left;
		font-size: 5px;
		padding: 3px;
		width: 200px;
	}
	
	form {
		padding: 10px;
		margin-top: 10px;
	}
	
	input:focus {
		outline:2px solid #0D4371;
	}

	.spanCss {
		color: #0D4371;
		font-size: 30px;
		font-weight: bold;
	}
	
	.textInput {
		text-align: left;
		width: 96%;
		height: 22px;
		
	}
	
	.aCss {
		font-size: 12px;
		text-decoration: none;
	}
	
	#backBord {
		background-color: #EBEBEB;
	}
	
	#loginBtn {
		background-color: #0D4371;
		color: #FFFFFF;
		border : 0px;
		outline: 0px;
		height: 25px;
		width: 100%;
	}
	
</style>
<script type="text/javascript">
	var loginCheck = '';
	var emailObj = '';
	var emailCheck = '';
	var pwdObj = '';
	var pwdCheck = '';

	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; //이메일
	
	function loginButton() {
		loginCheck = document.loginCheck;
		
		emailObj = document.getElementById('emailObj');
		emailCheck = document.getElementById('emailCheck');
		var emailHid = document.getElementsByName('emailHid');
		
		pwdObj = document.getElementById('pwdObj');
		pwdCheck = document.getElementById('pwdCheck');
		var pwdHid = document.getElementsByName('pwdHid');
		
		//이메일 유효성
		if (emailObj.value == "") {
			emailCheck.innerHTML = '이메일을 입력해주세요.';
			emailObj.style.outlineColor = '#FF0000';
			emailObj.focus();
			return false;
		} else {
			emailObj.style.outlineColor = '#0D4371';
			emailCheck.innerHTML = '';
		}
		
		// 이메일 형식 유효성
		if (!reg_email.test(emailObj.value)) {
			emailCheck.innerHTML = '이메일 형식이 올바르지 않습니다.';
			emailObj.style.outlineColor = '#FF0000';
			emailObj.focus();
			return false;
		} else {
			emailObj.style.outlineColor = '#0D4371';
			emailCheck.innerHTML = '';
		}
		
		//비밀번호 유효성
		if (pwdObj == "") {
			pwdCheck.innerHTML = '비밀번호을 입력해주세요.';
			pwdObj.style.outlineColor = '#FF0000';
			pwdObj.focus();
			return false;
		} else {
			pwdObj.style.outlineColor = '#0D4371';
			pwdCheck.innerHTML = '';
		}
		
		// 이메일, 비밀번호 있는지 체크
		for (var i = 0; i < emailHid.length; i++) {
			if (emailHid[i].value == emailObj.value && pwdHid[i].value == pwdObj.value) {
				loginCheck.submit();
				return false;
			}
		}
		alert('가입되어 있지 않은 회원이거나 입력하신 정보가 다릅니다.');
	}
	
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='mainBorder'>
		<div style='padding: 15px;'>
			<span class='spanCss'>로그인</span>
		</div>
		<div id='backBord'>
			<form name='loginCheck' action="loginCtr.do" method="post">
				<table>
					<tr>
						<td>
							<input id='emailObj' class='textInput' placeholder='이메일'
							 type="text" name="email" value="">
						</td>
					</tr>
					<tr>
						<td id='emailCheck'>
						</td>
					</tr>
					<tr>
						<td>
							<input id='pwdObj' class='textInput' placeholder='비밀번호'
							 type="password" name='password'>
						</td>
					</tr>
					<tr>
						<td id='pwdCheck'>
						</td>
					</tr>
					<tr>
						<td>
							<input id='loginBtn' onclick='loginButton();' type="button" value="로그인">
						</td>
					</tr>
					<tr>
						<td>
							<hr>
						</td>
					</tr>
					<tr>
						<td>
							<a class='aCss' href='../auth/emailform.do'>이메일 찾기</a>/
							<a class='aCss' href='../auth/pwdform.do'>비밀번호 찾기</a>
							<a class='aCss' href='../member/add.do'>회원가입</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<c:forEach items="${userList}" var='memberVo'>
		<input name='emailHid' type='hidden' value='${memberVo.email}'>
		<input name='pwdHid' type='hidden' value='${memberVo.password}'>
	</c:forEach>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>
</html>