<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<style type="text/css">
	#mainBorder {
		text-align: center;
		margin: auto;
		height: 465px;
		margin-top: 100px;
	}
	
	table {
		text-align: center;
		margin: auto;
	}
	
	td{
		text-align: left;
		padding: 3px;
	}
	
	span {
		font-size: 5px;
		color: #0D4371;
	}
	
	.spanCss {
		color: #0D4371;
		font-size: 30px;
		font-weight: bold;
	}
	
	input::placeholder {
		font-size: 5px;
	}
	
	#backBord {
		background-color: #EBEBEB;
	}
	
	.tdCss {
		font-size: 5px;
		color: red;
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
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; //이메일

	function pwdFindFnc() {
		var cnt= 0;
		
		var nameObj = document.getElementById('nameObj');
		var emailObj = document.getElementById('emailObj');
		
		var nameCheck = document.getElementById('nameCheck');
		var emailCheck = document.getElementById('emailCheck');
		
		var nameHid = document.getElementsByName('nameHid');
		var emailHid = document.getElementsByName('emailHid');
		
		// 이름 빈칸 검사
		if (nameObj.value == '') {
			nameCheck.innerHTML = "이름을 입력해주세요.";
			nameObj.focus();
			return false;
		} else {
			nameCheck.innerHTML = "";
			cnt++;
		}
		
		// 이메일 빈칸 검사
		if (emailObj.value == '') {
			emailCheck.innerHTML = '이메일을 입력하세요.';
			emailObj.focus();
			return false;
		} else {
			emailCheck.innerHTML = '';
			cnt++;
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
			cnt++;
		}
		
		if (cnt == 3) {
			for (var i = 0; i < nameHid.length; i++) {
				if (nameHid[i].value == nameObj.value && emailHid[i].value == emailObj.value) {
					var _width = 500;
					var _height = 300;
				    var _left = Math.ceil(( document.body.offsetWidth - _width )/2);
				    var _top = Math.ceil(( document.body.offsetHeight - _height )/2);
					
					var pwd_title = 'pwdFind';
				    
					window.open(''
							,pwd_title , 'width=' + _width + 'px, height= ' + _height + 'px, left=' + _left + ', top=' + _top +', resizable = no, scrollbars = no');
					
					pwdPost.target = pwd_title;
					pwdPost.action = 'pwdfind.do';
					
					pwdPost.submit();
					return false;
				}
			}
			alert('가입되어 있지 않은 회원이거나 입력하신 정보가 다릅니다.');
		}
	}
	
	function loginPageFnc() {
		location.href = '../auth/login.do';
	}
	
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='mainBorder'>
		<div>
			<span class='spanCss'>비밀번호 찾기</span>
		</div>
		<div id='backBord'>
		<form name='pwdPost' method="post">
			<table>
				<tr>
					<td>
						<span>이름</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='nameObj' type='text' name='name' placeholder='이름'>
					</td>
				</tr>
				<tr>
					<td id='nameCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span>이메일</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='emailObj' type='email' name='email'
							placeholder='ex)1234@gmail.com'>
					</td>
				</tr>
				<tr>
					<td id='emailCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td colspan='2' style='text-align:center;'>
						<input class='btnCss' type='button' onclick='pwdFindFnc();' value='비밀번호 찾기'>
						<input class='btnCss' type='button' onclick='loginPageFnc();' value='<-'>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<c:forEach items="${userList}" var='memberVo'>
		<input name='nameHid' type='hidden' value='${memberVo.name}'>
		<input name='emailHid' type='hidden' value='${memberVo.email}'>
	</c:forEach>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>

</html>