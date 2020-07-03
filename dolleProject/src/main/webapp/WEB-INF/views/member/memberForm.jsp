<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
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
	
	td{
		text-align: left;
		padding: 3px;
	}
	
	input {
		text-align: left;
		padding: 8px;
	}
	
	input::placeholder {
		font-size: 5px;
	}
	
	input:focus {
		outline: 2px solid #0D4371;
	}
	
	span {
		font-size: 5px;
		color: #0D4371;
	}
	
	p {
		font-weight: bold;
	}

	#mainText {
		color: #0D4371;
		font-size: 30px;
		font-weight: bold;
	}
	
	#infoText {
		color: #000000;
		font-size: xx-small;
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
	
	a {
		font-size: 5px;
		text-decoration: none;
	}
	
</style>
<script type="text/javascript">
	var addMemberBtn = '';
	var windwoObject = null;

	var ObjArray = new Array();
	var nameObj = '';
	var phonObj = '';
	var nickNameObj = '';
	var yearObj = '';
	var dayObj = '';
	var emailObj = '';
	var localObj = '';
	var cerObj = '';
	var passObj = '';
	var passCheckObj = '';
	var agreeObj = '';
	var checking = '';
	
	var checkArray = new Array();
	var nameCheck = '';
	var phonCheck = '';
	var nickNameCheck = '';
	var birthCheck = '';
	var emailCheck = '';
	var localCheck = '';
	var cerCheck = '';
	var passCheck = '';
	var passCheckCheck = '';
	var agreeCheck = '';
	var monthCheck = '';
	
	var textArray = new Array();
	var cnt = 0;
	var agreeCnt = 0;
	
	var date = new Date();
	var year = date.getFullYear();
	var monthArray = new Array();
	
	var pattern_num = /[0-9]/;	// 숫자 
	var pattern_eng = /[a-zA-Z]/;	// 문자 
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; //이메일
	var reg_Phone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/; //핸드폰

	function completedFnc() {
		addMemberBtn = document.addMemberBtn;
		checking = document.getElementById('checking');
		
		nameObj = document.getElementById('nameObj');
		phonObj = document.getElementById('phonObj');
		nickNameObj = document.getElementById('nickNameObj');
		yearObj = document.getElementById('yearObj');
		dayObj = document.getElementById('dayObj');
		emailObj = document.getElementById('emailObj');
		localObj = document.getElementsByName('national');
		cerObj = document.getElementById('cerObj');
		passObj = document.getElementById('passObj');
		passCheckObj = document.getElementById('passCheckObj');
		agreeObj = document.getElementsByName('grade');
		
		nameCheck = document.getElementById('nameCheck');
		phonCheck = document.getElementById('phonCheck');
		nickNameCheck = document.getElementById('nickNameCheck');
		birthCheck = document.getElementById('birthCheck');
		emailCheck = document.getElementById('emailCheck');
		localCheck = document.getElementById('localCheck');
		cerCheck = document.getElementById('cerCheck');
		passCheck = document.getElementById('passCheck');
		passCheckCheck = document.getElementById('passCheckCheck');
		agreeCheck = document.getElementById('agreeCheck');
		monthCheck = document.getElementById('monthCheck');
		
		ObjArray = [nameObj, phonObj, nickNameObj, yearObj, dayObj, emailObj,
			cerObj, passObj, passCheckObj];
		
		checkArray = [nameCheck, phonCheck, nickNameCheck, birthCheck, birthCheck, emailCheck,
			cerCheck, passCheck, passCheckCheck]
		
		textArray = ['이름을 입력해주세요', '핸드폰번호를 입력해주세요.', '닉네임을 입력해주세요.'
			, '년도 4자리를 입력해주세요.', '일 (1~2자리)를 입력해주세요.', '이메일을 입력해주세요.'
			, '인증번호를 입력해주세요.', '비밀번호를 입력해주세요.', '비밀번호 확인을 입력해주세요.'];
		
		// 빈칸 유효성
		for (var i = 0; i < ObjArray.length; i++) {
			if (ObjArray[i].value == "") {
				checkArray[i].innerHTML = textArray[i];
				ObjArray[i].style.outlineColor = '#FF0000';
				ObjArray[i].focus();
				return false;
			} else {
				ObjArray[i].style.outlineColor = '#0D4371';
				checkArray[i].innerHTML = '';
			}
		}
		
		// 내외국인 체크 여부
		for (var i = 0; i < localObj.length; i++) {
			if (localObj[i].checked == true) {
				cnt++;
			}
		}
		
		if (cnt < 1) {
			localObj[0].focus();
			localCheck.innerHTML = '내외국인 항목을 체크해주세요.';
			return;
		} else {
			localCheck.innerHTML = '';
		}
		// 핸드폰 유효성
		if (!reg_Phone.test(phonObj.value.split('-').join(''))) {
			phonCheck.innerHTML = '핸드폰 형식이 옳바르지 않습니다.'
			phonObj.style.outlineColor = '#FF0000';
			phonObj.focus();
			return false;
		} else {
			phonObj.style.outlineColor = '#0D4371';
			phonCheck.innerHTML = '';
		}
		
		// 닉네임 중복확인 여부
		if (checking.value != 'ok') {
			nickNameCheck.innerHTML = '중복 확인 버튼을 눌러주세요.';
			overlap.focus();
			return false;
		} else {
			nickNameObj.setAttribute('readonly', 'readonly');
			nickNameCheck.innerHTML='';
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
		}
		
		// 일 자리수 유효성
		if (ObjArray[4].value.length != 1 && ObjArray[4].value.length != 2) {
			birthCheck.innerHTML = '일 1~2자리를 입력해주세요.';
			ObjArray[4].style.outlineColor = '#FF0000';
			ObjArray[4].focus();
			return false;
		} else {
			ObjArray[4].style.outlineColor = '#0D4371';
			birthCheck.innerHTML = '';
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
		
		// 인증번호 검증
		
		// 비밀번호 자리수 유효성
		if (!(passObj.value.length >= 8 && passObj.value.length <= 15)) {
			passCheck.innerHTML = '비밀번호는 8~15자리로 입력해주세요.';
			passObj.style.outlineColor = '#FF0000';
			passObj.focus();
			return false;
		} else {
			passObj.style.outlineColor = '#0D4371';
			passCheck.innerHTML = '';
		}
		
		// 비밀번호 형식 체크
		if (!(pattern_eng.test(passObj.value) && pattern_num.test(passObj.value))) {
			passCheck.innerHTML = '비밀번호는 문자, 숫자가 포함되야 합니다.';
			passObj.style.outlineColor = '#FF0000';
			passObj.focus();
			return false;
		} else {
			passObj.style.outlineColor = '#0D4371';
			passCheck.innerHTML = '';
		}
		
		// 비밀번호 확인 유효성
		if (passObj.value != passCheckObj.value) {
			passCheckCheck.innerHTML = '비밀번호와 비밀번호 확인이 일치하지 않습니다.';
			passCheckObj.style.outlineColor = '#FF0000';
			passCheckObj.focus();
			return false;
		} else {
			passCheckObj.style.outlineColor = '#0D4371';
			passCheckCheck.innerHTML = '';
		}
		
		// 동의 체크 여부
		if (agreeObj[0].checked == true) {
			agreeCnt++;
		}
		
		if (agreeCnt < 1) {
			agreeObj[0].focus();
			agreeCheck.innerHTML = '동의 여부를 체크해주세요.';
			return;
		} else {
			agreeCheck.innerHTML = '';
		}
		
		// 생년 월일 패턴 변환
		var birthd = new Date(yearObj.value, monthCheck.value, dayObj.value);
		var bir = document.getElementsByName('birthdate');
		bir[0].value = getFormatDateFnc(birthd);
		
		// 가입성공
		alert('축하합니다. 드디어 가입했습니다. (와.....)');
		addMemberBtn.submit();
	}
	
	function getFormatDateFnc(date){
	    var year = date.getFullYear();          //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '/' + month + '/' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	
	function sameNickFnc() {
		overlap = document.overlap;
		
		var _width = 500;
		var _height = 300;
	    var _left = Math.ceil(( document.body.offsetWidth - _width )/2);
	    var _top = Math.ceil(( document.body.offsetHeight - _height )/2);
	    

		window.name = 'overlapCheck';
		window.open('nick.do'
				, nickNameObj.value, 'width=' + _width + 'px, height= ' + _height + 'px, left=' + _left + ', top=' + _top +', resizable = no, scrollbars = no');
		
		winObject.document.all.nickname.value = document.all.nickname.value;
		winObject.document.all.overlap.value = document.all.overlap.value;

	}
	
	function cerNumFnc() {
		
	}
	
	function submitToWindowFnc() {
	}
	
	function pageMoveListFnc(){
		location.href = "list.do";
	}
	
	window.onload = function() {
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='mainBorder'>
		<div>
			<span id='mainText'>회원가입</span>
		</div>
		
		<div>
		<form name='addMemberBtn' action="./addCtr.do" method="post">
			<table>
				<tr>
					<td>
						<span>이름</span>
					</td>
					<td>
						<span>핸드폰 번호</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='nameObj' type="text" name='name' placeholder='이름' value=''>
					</td>
					<td>
						<input id='phonObj' type='text' name='phone'
							placeholder='ex) 010-1234-5678, 01012345678' value=''>
					</td>
				</tr>
				<tr>
					<td id='nameCheck' class='tdCss'>
					</td>
					<td id='phonCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span>닉네임</span>
					</td>
					<td>
						<span>생년 월일</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='nickNameObj' type="text" name='nickname' placeholder='닉네임' size='7'
							maxlength='6' value=''>
						<input class='btnCss' type="button" onclick='sameNickFnc();' value='중복 확인'>
						<input id='checking' type='hidden' name='overlap' value=''>
					</td>
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
					<td id='nickNameCheck' class='tdCss'>
					</td>
					<td id='birthCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span>이메일</span>
					</td>
					<td>
						<span>내외국인</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='emailObj' type='email' name='email' placeholder='예)XXXX@gmail.com' value=''>
					</td>
					<td>
						내국인
						<input type='radio' name='national' value='n'>
						외국인
						<input type='radio' name='national' value='f'>
					</td>
				</tr>
				<tr>
					<td id='emailCheck' class='tdCss'>
					</td>
					<td id='localCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<input id='cerObj' type='text' size='7' placeholder='인증번호를 입력해주세요.'>
						<input class='btnCss' type="button" onclick='cerNumFnc();' value='인증번호 발송'>
					</td>
					<td rowspan='6'>
						<div style='border: 1px solid black;'>
							<p>개인정보<p>
							<span id='infoText'>
							돌레길은 아래의 목적으로 개인정보를 수집 및 이용하며,<br>
							회원의 개인정보를 안전하게 취급하는데 최선을 다합니다.<br>
							<br>
							개인정보 수집 및 이용에 대한 안내<br>
							1. 목적 : 지원자 개인 식별, 지원의사 확인, 입사전형의 진행,<br>
							&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
							고지사항 전달, 입사 지원자와의 원활한 의사소통,<br>
							&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
							지원이력 확인 및 면접 불합격자 재지원 제한<br>
							2. 항목 : 아이디(이메일주소), 비밀번호, 이름, 생년월일, 휴대폰번호<br>
							3. 보유기간 : 회원 탈퇴 시까지 보유 (단, 지원이력 정보는 일방향<br>
							&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
							암호화하여 탈퇴일로부터 1년간 보관 후 파기합니다.)<br>
							<br>
							위 개인정보 수집에 대한 동의를 거부할 권리가 있으며,<br>
							동의 거부 시에는 지원자 등록이 제한될 수 있습니다.<br>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td id='cerCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span>비밀번호</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='passObj' type='password' name='password' placeholder='비밀번호' value=''
							maxlength='15'>
					</td>
				</tr>
				<tr>
					<td id='passCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span>비밀번호 확인</span>
					</td>
				</tr>
				<tr>
					<td>
						<input id='passCheckObj' type='password' name='tempPassword' placeholder='비밀번호 확인'
							value='' maxlength='15'>
					</td>
					<td>
						(필수)위의 내용을 읽었으며 동의합니다.
						<input id='agreeObj' type='checkBox' name='grade'>동의
					</td>
				</tr>
				<tr>
					<td id='passCheckCheck' class='tdCss'>
					</td>
					<td id='agreeCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td colspan='2' style='text-align:center;'>
						<input class='btnCss' onclick='completedFnc();' type='button' value='가입완료'>
						<input class='btnCss' onclick='pageMoveListFnc();' type='button' value='<-'>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>