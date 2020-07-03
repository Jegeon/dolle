<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	}
	
	.aCss {
		font-size: 5px;
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
		height: 100%;
		width: 100%;
	}
	
</style>
<script type="text/javascript">
	var loginCheck = '';
	var emailObj = '';
	var emailCheck = '';
	var pwdObj = '';
	var pwdCheck = '';

	function loginButton() {
		loginCheck = document.loginCheck;
		
		email = loginCheck.email.value;
		emailObj = document.getElementById('emailText');
		emailCheck = document.getElementById('emailCheck');
		
		password = loginCheck.password.value;
		pwdObj = document.getElementById('pwdText');
		pwdCheck = document.getElementById('pwdCheck');
		
		//이메일 유효성
		if (email == "") {
			emailCheck.innerHTML = '이메일을 입력해주세요.';
			emailObj.style.outlineColor = '#FF0000';
			emailObj.focus();
			return false;
		} else {
			emailObj.style.outlineColor = '#0D4371';
			emailCheck.innerHTML = '';
		}
		
		//비밀번호 유효성
		if (password == "") {
			pwdCheck.innerHTML = '비밀번호을 입력해주세요.';
			pwdObj.style.outlineColor = '#FF0000';
			pwdObj.focus();
			return false;
		} else {
			pwdObj.style.outlineColor = '#0D4371';
			pwdCheck.innerHTML = '';
		}
		
		// 이메일, 비밀번호 있는지 체크
		
		if (email != "" && password != "") {
			loginCheck.submit();
		}
	}
	
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id='mainBorder'>
		<div>
			<span class='spanCss'>로그인</span>
		</div>
		<div id='backBord'>
			<form name='loginCheck' action="loginCtr.do" method="post">
				<table>
					<tr>
						<td>
							<input id='emailText' class='textInput' placeholder='이메일'
							 type="text" name="email" value="">
						</td>
					</tr>
					<tr>
						<td id='emailCheck'>
						</td>
					</tr>
					<tr>
						<td>
							<input id='pwdText' class='textInput' placeholder='비밀번호'
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
							<a class='aCss' href=''>이메일 찾기</a>/
							<a class='aCss' href=''>비밀번호 찾기</a>
							<a class='aCss' href=''>회원가입</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>
</html>