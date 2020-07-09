<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<style type="text/css">
	#mainBorder {
		text-align: center;
		margin: auto;
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
	function pwdFindFnc() {
		var nameObj = document.getElementById('nameObj');
		var emailObj = document.getElementById('emailObj');
		
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
					<td colspan='2' style='text-align:center;'>
						<input class='btnCss' type='button' onclick='pwdFindFnc();' value='비밀번호 찾기'>
						<input class='btnCss' type='button' onclick='loginPageFnc();' value='<-'>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>

</html>