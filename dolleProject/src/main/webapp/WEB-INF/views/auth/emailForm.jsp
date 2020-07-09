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
	var emailPost = ''
	
	var yearObj = '';
	var dayObj = '';
	var monthCheck = '';
	
	function emailFindFnc() {
		emailPost = document.emailPost;
		
		yearObj = document.getElementById('yearObj');
		dayObj = document.getElementById('dayObj');
		monthCheck = document.getElementById('monthCheck');
		
		var birthd = new Date(yearObj.value, monthCheck.value, dayObj.value);
		var birObj = document.getElementsByName('birthdate')[0];
		birObj.value = getFormatDateFnc(birthd);
		alert(birObj.value);
		
		var _width = 500;
		var _height = 300;
	    var _left = Math.ceil(( document.body.offsetWidth - _width )/2);
	    var _top = Math.ceil(( document.body.offsetHeight - _height )/2);
	    
	    var email_title = 'emailFind';
	    
		window.open(''
				,email_title , 'width=' + _width + 'px, height= ' + _height + 'px, left=' + _left + ', top=' + _top +', resizable = no, scrollbars = no');
		
		emailPost.target = email_title;
		emailPost.action = 'emailfind.do';
		
		emailPost.submit();
	}
	
	// 생년월일 가공
	function getFormatDateFnc(date){
	    var year = date.getFullYear();          //yyyy
	    var month = date.getMonth();          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + "-" + month + "-" + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
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
			<span class='spanCss'>이메일 찾기</span>
		</div>
		<div id='backBord'>
		<form name='emailPost' method="post">
			<table>
				<tr>
					<td>
						<span>이름</span>
					</td>
				</tr>
				<tr>
					<td>
						<input type='text' name='name' placeholder='이름'>
					</td>
				</tr>
				<tr>
					<td>
						<span>핸드폰 번호</span>
					</td>
				</tr>
				<tr>
					<td>
						<input type='text' name='phone' placeholder='000-0000-0000'>
					</td>
				</tr>
				<tr>
					<td>
						<span>생년 월일</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='yearObj' type='text' name='year' placeholder='년(자)' size='4'
						 maxlength='4' value=''>
						<select id='monthCheck' name='month'>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
						<input id='dayObj' type='text' name='day' placeholder='일' size='2' maxlength='2'
							value=''>
						<input type='hidden' name='birthdate' value=''>
					</td>
				</tr>
				<tr>
					<td colspan='2' style='text-align:center;'>
						<input class='btnCss' type='button' onclick='emailFindFnc();' value='이메일 찾기'>
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