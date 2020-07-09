<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function loginPageFnc() {
		window.opener.location = '../auth/login.do';
		window.close();
	}

	function closeFnc() {
		window.close();
	}
</script>
</head>

<body>

	<div>
		${memberVo.name} 님의 <br>
		비밀번호는 ${memberVo.password} 입니다.
	</div>
	
	<div>
		<input type='button' onclick='loginPageFnc();' value='로그인 하기'>
		<input type='button' onclick='closeFnc();' value='취소'>
	</div>
	
</body>

</html>