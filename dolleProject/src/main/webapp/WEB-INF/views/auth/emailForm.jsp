<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	var emailPost = ''
	
	var yearObj = '';
	var dayObj = '';
	var monthCheck = '';
	
	var date = new Date();
	var year = date.getFullYear();
	var monthArray = new Array();
	
	var reg_Phone = /^((01[1|6|7|8|9])[2-9]+[0-9]{6,7})|(010[2-9][0-9]{7})$/; //핸드폰
	
	function emailFindFnc() {
		var cnt = 0;
		
		emailPost = document.emailPost;
		var nameObj = document.getElementById('nameObj');
		var phoneObj = document.getElementById('phoneObj');
		
		var nameCheck = document.getElementById('nameCheck');
		var phoneCheck = document.getElementById('phoneCheck');
		var birthCheck = document.getElementById('birthCheck');
		
		var nameHid = document.getElementsByName('nameHid');
		var phoneHid = document.getElementsByName('phoneHid');
		var birthHid = document.getElementsByName('birthHid');
		
		yearObj = document.getElementById('yearObj');
		dayObj = document.getElementById('dayObj');
		monthCheck = document.getElementById('monthCheck');
		
		var birthd = new Date(yearObj.value, monthCheck.value, dayObj.value);
		var birObj = document.getElementsByName('birthdate')[0];
		birObj.value = getFormatDateFnc(birthd);
		
		// 이름 빈칸 검사
		if (nameObj.value == '') {
			nameCheck.innerHTML = "이름을 입력해주세요.";
			nameObj.focus();
			return false;
		} else {
			nameCheck.innerHTML = "";
			cnt++;
		}
		
		// 핸드폰 빈칸 검사
		if (phoneObj.value == '') {
			phoneCheck.innerHTML = '핸드폰 번호를 입력하세요.';
			phoneObj.focus();
			return false;
		} else {
			phoneCheck.innerHTML = '';
			cnt++;
		}
		
		// 핸드폰 유효성
		if (!reg_Phone.test(phoneObj.value.split('-').join(''))) {
			phoneCheck.innerHTML = '핸드폰 형식이 옳바르지 않습니다.'
			phoneObj.style.outlineColor = '#FF0000';
			phoneObj.focus();
			return false;
		} else {
			phoneObj.style.outlineColor = '#0D4371';
			phoneCheck.innerHTML = '';
			cnt++;
		}
		
		// 년도 자리수 유효성
		if (yearObj.value.length != 4) {
			birthCheck.innerHTML = '년도 4자리를 입력해주세요.';
			yearObj.style.outlineColor = '#FF0000';
			yearObj.focus();
			return false;
		} else {
			yearObj.style.outlineColor = '#0D4371';
			birthCheck.innerHTML = '';
			cnt++;
		}
		
		// 년도 체크
		if (yearObj.value > year) {
			birthCheck.innerHTML = '미래에서 오셨나요?';
			yearObj.style.outlineColor = '#FF0000';
			yearObj.focus();
			return false;
		} else if (yearObj.value < (year - 100)) {
			birthCheck.innerHTML = '정말이세요?';
			yearObj.style.outlineColor = '#FF0000';
			yearObj.focus();
			return false;
		} else {
			yearObj.style.outlineColor = '#0D4371';
			birthCheck.innerHTML = '';
			cnt++;
		}
		
		// 일 자리수 유효성
		if (dayObj.value.length != 1 && dayObj.value.length != 2) {
			birthCheck.innerHTML = '일 1~2자리를 입력해주세요.';
			dayObj.style.outlineColor = '#FF0000';
			dayObj.focus();
			return false;
		} else {
			dayObj.style.outlineColor = '#0D4371';
			birthCheck.innerHTML = '';
			cnt++;
		}
		
		// 월에 따른 일 체크
		monthArray = ['30','28','31','30','31','30','31','31','30','31','30','31'];
		
		if (!(dayObj.value >= 1 && dayObj.value <= monthArray[(monthCheck.value) - 1])) {
			birthCheck.innerHTML =
				monthCheck.value + '월은 1~' + monthArray[(monthCheck.value) - 1] + '일 까지입니다.' ;
			dayObj.style.outlineColor = '#FF0000';
			dayObj.focus();
			return false;
		} else {
			dayObj.style.outlineColor = '#0D4371';
			birthCheck.innerHTML = '';
			cnt++;
		}
		
		if (cnt == 7) {
			for (var i = 0; i < nameHid.length; i++) {
				if (nameHid[i].value == nameObj.value && phoneHid[i].value == phoneObj.value
						&& birthHid[i].value == birObj.value) {
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
					return false;
				}
			}
			alert('가입되어 있지 않은 회원이거나 입력하신 정보가 다릅니다.');
		}
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

	// 핸드폰 자동 하이픈
	function inputPhoneNumber(obj) {

	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";

	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
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
						<input id='nameObj' type='text' name='name' placeholder='이름'>
					</td>
				</tr>
				<tr>
					<td  id='nameCheck' class='tdCss' >
					</td>
				</tr>
				<tr>
					<td>
						<span>핸드폰 번호</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='phoneObj' type='text' name='phone' placeholder='000-0000-0000'
							maxlength='13' onKeyup='inputPhoneNumber(this);'>
					</td>
				</tr>
				<tr>
					<td id='phoneCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span>생년 월일</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='yearObj' type='text' name='year' placeholder='년(4자)' size='4'
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
					<td id='birthCheck' class='tdCss'>
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
	<c:forEach items="${userList}" var='memberVo'>
		<input name='nameHid' type='hidden' value='${memberVo.name}'>
		<input name='phoneHid' type='hidden' value='${memberVo.phone}'>
		<input name='birthHid' type='hidden' value='<fmt:formatDate value="${memberVo.birthdate}" pattern="yyyy-MM-dd"/>'>
	</c:forEach>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>

</html>