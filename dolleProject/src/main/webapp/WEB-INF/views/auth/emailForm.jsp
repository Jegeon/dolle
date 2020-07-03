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
		width: 1260px;
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
	var name = '';
	var phone = '';
	var birthdate = '';
	var emailBtn = '';

	function emilFindFnc() {
		name = document.name;
		phone = document.phone;
		birthdate = document.birthdate;
		emailBtn = document.emailBtn;
		
		window.name='emailFind';
		window.open('../member/emailCheckForm.jsp'
				, 'emailForm', 'width=500px, height=300px, resizable = no, scrollbars = no');
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
						<input type='text' name='year' placeholder='년(자)' size='4' maxlength='4'>
						<select name='month'>
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
						<input type='text' name='day' placeholder='일' size='2' maxlength='2'>
						<input type='hidden' name='birthdate' value=''>
					</td>
				</tr>
				<tr>
					<td colspan='2' style='text-align:center;'>
						<input class='btnCss' type='button' onclick='emilFindFnc();' value='이메일 찾기'>
						<input class='btnCss' type='button' value='<-'>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>

</html>