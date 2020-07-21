<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<!-- Bootstrap -->
<%-- <link href='<c:url value="/css/bootstrap.min.css" />' rel="stylesheet"> --%>
<%-- <link href='<c:url value="/css/kfonts2.css" />' rel="stylesheet"> --%>
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
		font-size: 15px;
		color: #0D4371;
	}
	
	p {
		font-weight: bold;
	}
	
	#monthCheck {
		height: 35px;
	}

	#mainText {
		color: #0D4371;
		font-size: 30px;
		font-weight: bold;
	}
	
	#infoText {
		color: #000000;
		font-size: xx-small;
		width: 200px;
		height: 160px;
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/javascript" src="\dolleProject\resources\js\jquery-3.5.1.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<%-- <script src='<c:url value="/js/bootstrap.min.js"  />'></script> --%>
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
	var cerNum = '';
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
	var reg_Phone = /^((01[1|6|7|8|9])[2-9]+[0-9]{6,7})|(010[2-9][0-9]{7})$/; //핸드폰

	function completedFnc() {
		addMemberBtn = document.addMemberBtn;
		checking = document.getElementById('checking');
		cerNum = document.getElementById('cerNum');
		
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
		agreeObj = document.getElementsByName('agree');
		
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
		
		if (!(dayObj.value >= 1 || dayObj.value <= monthArray[(monthCheck.value) - 1])) {
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
		
		var emailList = document.getElementsByName('emailList');
		// 이메일 중복 확인
		for (var i = 0; i < emailList.length; i++) {
			if (emailObj.value == emailList[i].value) {
				emailCheck.innerHTML = '이미 존재하는 이메일입니다.';
				emailObj.style.outlineColor = '#FF0000';
				emailObj.focus();
				return false;
			} else {
				emailObj.style.outlineColor = '#0D4371';
				emailCheck.innerHTML = '';
			}
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
		
		// 인증번호 체크
		if (cerNum.value != cerObj.value) {
			cerCheck.innerHTML = '인증번호가 다릅니다. 다시 확인해주세요.';
			cerObj.focus();
			return false;
		} else {
			cerCheck.innerHTML = '';
		}
		
		// 가입성공
		alert('가입이 완료되었습니다.');
		addMemberBtn.submit();
	}
	
	// 생년월일 가공
	function getFormatDateFnc(date){
	    var year = date.getFullYear();          //yyyy
	    var month = date.getMonth();          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '/' + month + '/' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	
	// 중복확인
	function sameNickFnc() {
		overlap = document.overlap;
		
		var _width = 500;
		var _height = 300;
	    var _left = Math.ceil(( document.body.offsetWidth - _width )/2);
	    var _top = Math.ceil(( document.body.offsetHeight - _height )/2);
	    

		window.name = 'overlapCheck';
		winObject = window.open('nick.do'
				, nickNameObj.value, 'width=' + _width + 'px, height= ' + _height + 'px, left=' + _left + ', top=' + _top +', resizable = no, scrollbars = no');
		
		winObject.document.all.nickname.value = document.all.nickname.value;
		winObject.document.all.overlap.value = document.all.overlap.value;

	}
	
	// 이메일 전송
	function cerNumFnc() {
		emailObj = document.getElementById('emailObj');
		cerNum = document.getElementById('cerNum');
		alert('해당 이메일로 인증번호가 발송 되었습니다.');
		
		$.ajax({
			url : "../mail/mailSending.do",
			type: "POST",
			data: "tomail=" + emailObj.value,
			success:function(data){
				$('#cerNum').val(data);
			},
			error: function(){
				alert("error");
			}
		});			
		
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
	
	function listPageMoveFnc() {
		location.href = "../member/list.do";
	}
	
	function pageMoveListFnc(){
		location.href = "../auth/login.do";
	}
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<div id='mainBorder'>
		<div style='padding: 15px;'>
			<span id='mainText'>회원가입</span>
		</div>
		
		<div style='margin-left: 80px;'>
		<form name='addMemberBtn' action="./addCtr.do" method="post">
			<table>
				<tr>
					<td>
						<div>
							<table style='margin-right: 30px;'>
								<tr>
									<td>
										<span>이름</span>
									</td>
								</tr>
								<tr>
									<td>
										<input id='nameObj' type="text" name='name' placeholder='이름' value=''>
									</td>
								</tr>
								<tr>
									<td id='nameCheck' class='tdCss'>
									</td>
								</tr>
								<tr>
									<td>
										<span>닉네임</span>
									</td>
								</tr>
								<tr>
									<td>
										<input id='nickNameObj' type="text" name='nickname' placeholder='닉네임' size='10'
											maxlength='6' value=''>
										<input class='btnCss' type="button" onclick='sameNickFnc();' value='중복 확인'>
										<input id='checking' type='hidden' name='overlap' value=''>
									</td>
									
								</tr>
								<tr>
									<td id='nickNameCheck' class='tdCss'>
									</td>
								</tr>
								<tr>
									<td>
										<span>이메일</span>
									</td>
								</tr>
								<tr>
									<td>
										<input id='emailObj' type='email' name='email' placeholder='예)XXXX@gmail.com' value=''>
									</td>
								</tr>
								<tr>
									<td id='emailCheck' class='tdCss'>
									</td>
								</tr>
								<tr>
									<td>
										<input id='cerObj' type='text' size='7' placeholder='인증번호를 입력해주세요.'>
										<input id='cerNumBtn' class='btnCss' type="button" onclick='cerNumFnc();' value='인증번호 발송'>
										<input id='cerNum' type='hidden' value=''>
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
								</tr>
								<tr>
									<td id='passCheckCheck' class='tdCss'>
									</td>
								</tr>
							</table>
						</div>
					</td>
					<td>
						<div>
							<table>
								<tr>
									<td>
										<span>핸드폰 번호</span>
									</td>
								</tr>
								<tr>
									<td>
										<input id='phonObj' type='text' name='phone' onKeyup='inputPhoneNumber(this);'
											placeholder='ex) 010-1234-5678' maxlength='13' value=''>
									</td>
								</tr>
								<tr>
									<td id='phonCheck' class='tdCss'>
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
									<td>
										<span>내외국인</span>
									</td>
								</tr>
								<tr>
									<td>
										내국인
										<input type='radio' name='national' value='domestic'>
										외국인
										<input type='radio' name='national' value='foreign'>
									</td>
								</tr>
								<tr>
									<td id='localCheck' class='tdCss'>
									</td>
								</tr>
								<tr>
									<td>
										<div style='border: 1px solid black;'>
											<p>개인정보<p>
											<span id='infoText'>
											돌레길은 아래의 목적으로<br>
											개인정보를 수집 및 이용하며,<br>
											회원의 개인정보를 안전하게<br>
											취급하는데 최선을 다합니다.<br>
											1. 목적 : 회원 정보 수집<br>
											2. 항목 : 아이디(이메일주소), 비밀번호,<br>
											이름, 생년월일, 휴대폰번호<br>
											위 개인정보 수집에 대한 동의를<br>
											거부할 권리가 있으며,<br>
											동의 거부 시에는 등록이 제한될 수 있습니다.<br>
											</span>
										</div>
									</td>
								</tr>
								<tr>
									<td style='font-size: 12px;'>
										(필수)위의 내용을 읽었으며 동의합니다.
										<input id='agreeObj' type='checkBox' name='agree'>동의
									</td>
								</tr>
								<tr>
									<td id='agreeCheck' class='tdCss'>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</form>
		</div>
			<div style='padding: 15px;'>
				<input class='btnCss' onclick='completedFnc();' type='button' value='가입완료'>
				<c:if test="${_memberVo_.grade == 'admin'}">
					<input class='btnCss' onclick='listPageMoveFnc();' type='button' value='<-'>
				</c:if>
				<c:if test="${_memberVo_.grade != 'admin'}">
					<input class='btnCss' onclick='pageMoveListFnc();' type='button' value='<-'>
				</c:if>
			</div>
	</div>
	
	<c:forEach var='memberVo' items='${userList}'>
		<input name='emailList' type='hidden' value='${memberVo.email}'>
	</c:forEach>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>