<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
	#mainBorder {
		text-align: center;
		margin: auto;
	}

	.firstSpanCss {
		color: #0D4371;
		font-size: 30px;
		font-weight: bold;
	}
	
	.secondSpanCss {
		color: #0D4371;
		font-weight: bold;
		font-size: 12px;
	}
	
	table {
		text-align: center;
		margin: auto;
	}
	
	td {
		color: #000000;
		text-align: left;
		font-size: 5px;
		padding: 10px;
	}
	
	.tdCss {
		font-size: 5px;
		color: red;
	}
	
	input:focus {
		outline: 2px solid #0D4371;
		outline-color: #0D4371;
	}
	
	.inputCss {
		border: 0px;
		background-color: transparent;
		padding: 10px;
		color: #000000;
	}
	
	.inputBtn {
		border: 0px;
		outline: 0px;
		background-color: #FFFFFF;
	}
	
	.btnCss {
		background-color: #0D4371;
		color: #FFFFFF;
		border : 0px;
		outline: 0px;
		margin: 10px;
	}
	
</style>
<script type="text/javascript" src="\dolleProject\resources\js\jquery-3.5.1.js"></script>
<script type="text/javascript">
	var cnt = 0;
	var updateForm = '';
	
	var nameObj = '';
	var nicknameObj = '';
	var phoneObj = '';
	var nationalObj = '';
	var passwordObj = '';
	var tempPasswordObj = '';
	
	var nameCheck = '';
	var nicknameCheck = '';
	var phoneCheck = '';
	var nationalCheck = '';
	var passwordCheck = '';
	var tempPasswordCheck = '';
	
	var checkArray = new Array();
	var textCheckArray = new Array();
	var textValueArray = new Array();
	
	var pattern_num = /[0-9]/;	// 숫자 
	var pattern_eng = /[a-zA-Z]/;	// 문자 
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글
	var reg_Phone = /^((01[1|6|7|8|9])[2-9]+[0-9]{6,7})|(010[2-9][0-9]{7})$/; //핸드폰

	function updateBtnFnc() {
		cnt = 0;
		updateForm = document.updateForm;
		
		nameObj = document.getElementById('memberName');
		nicknameObj = document.getElementById('memberNickName');
		phoneObj = document.getElementById('memberPhone');
		nationalObj = document.getElementsByName('national');
		passwordObj = document.getElementById('memberPassword');
		tempPasswordObj = document.getElementById('memberTempPassword');
		
		nameCheck = document.getElementById('nameCheck');
		nicknameCheck = document.getElementById('nicknameCheck');
		phoneCheck = document.getElementById('phoneCheck');
		nationalCheck = document.getElementById('nationalCheck');
		passwordCheck = document.getElementById('passwordCheck');
		tempPasswordCheck = document.getElementById('tempPasswordCheck');
		
		checkArray = [nameObj, nicknameObj, phoneObj, passwordObj, tempPasswordObj];
		
		textCheckArray = [nameCheck, nicknameCheck, phoneCheck, passwordCheck
				, tempPasswordCheck];
		
		textValueArray = ['이름을 입력해주세요', '닉네임을 입력해주세요.'
			, '핸드폰 번호를 입력해주세요.', '비밀번호를 입력해주세요.', '비밀번호 확인을 입력해주세요.'];
		
		// 빈칸 검사
		for (var i = 0; i < checkArray.length; i++) {
			if (checkArray[i].value == '') {
				textCheckArray[i].innerHTML = textValueArray[i];
				checkArray[i].style.outlineColor = '#FF0000';
				checkArray[i].focus();
				return false;
			} else {
				checkArray[i].style.outlineColor = '#0D4371';
				textCheckArray[i].innerHTML = '';
				
			}
		}
		
		// 닉네임 중복확인 여부
		if ($('#checking').val() != 'ok') {
			nickNameCheck.innerHTML = '중복 확인 버튼을 눌러주세요.';
			overlap.focus();
			return false;
		} else if ($('#checking').val() == 'ok' || $('#sameCheck').val() == $('#memberNickName').val()){
			nickNameObj.setAttribute('readonly', 'readonly');
			nickNameCheck.innerHTML='';
		}
		
		// 핸드폰 형식 유효성
		if (!reg_Phone.test(phoneObj.value.split('-').join(''))) {
			phoneCheck.innerHTML = '핸드폰 형식이 옳바르지 않습니다.'
			phoneObj.style.outlineColor = '#FF0000';
			phoneObj.focus();
			return false;
		} else {
			phoneObj.style.outlineColor = '#0D4371';
			phoneCheck.innerHTML = '';
		}
		
		// 비밀번호 길이 유효성
		if (!(passwordObj.value.length >= 8 && passwordObj.value.length <= 15)) {
			passwordCheck.innerHTML = '비밀번호는 8~15자리로 입력해주세요.';
			passwordObj.style.outlineColor = '#FF0000';
			passwordObj.focus();
			return false;
		} else {
			passwordObj.style.outlineColor = '#0D4371';
			passwordCheck.innerHTML = '';
		}
		
		// 비밀번호 형식 체크
		if (!(pattern_eng.test(passwordObj.value) && pattern_num.test(passwordObj.value))) {
			passwordCheck.innerHTML = '비밀번호는 문자, 숫자가 포함되야 합니다.';
			passwordObj.style.outlineColor = '#FF0000';
			passwordObj.focus();
			return false;
		} else {
			passwordObj.style.outlineColor = '#0D4371';
			passwordCheck.innerHTML = '';
		}
		
		// 비밀번호 확인 유효성
		if (passwordObj.value != tempPasswordObj.value) {
			tempPasswordCheck.innerHTML = '비밀번호와 비밀번호 확인이 일치하지 않습니다.';
			tempPasswordObj.style.outlineColor = '#FF0000';
			tempPasswordObj.focus();
			return false;
		} else {
			tempPasswordObj.style.outlineColor = '#0D4371';
			tempPasswordCheck.innerHTML = '';
		}
		
		// 내외국인 체크 여부
		for (var i = 0; i < nationalObj.length; i++) {
			if (nationalObj[i].checked == true) {
				cnt++;
			}
		}
		
		if (cnt < 1) {
			nationalCheck.innerHTML = '내외국인 항목을 체크해주세요.';
			return;
		} else {
			nationalCheck.innerHTML = '';
		}
		
		updateForm.submit();
		
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
				,'', 'width=' + _width + 'px, height= ' + _height + 'px, left=' + _left + ', top=' + _top +', resizable = no, scrollbars = no');
		
		winObject.document.all.nickname.value = document.all.nickname.value;
		winObject.document.all.overlap.value = document.all.overlap.value;

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
	
	function pageMoveBeforeFnc(no){
		var url = 'listOne.do?no=' + no;
		location.href = url;
	}
	
	$(document).ready(function() {
		if ($('#natCheck').val() == 'domestic') {
			$("input:radio[name='national']:radio[value='domestic']").prop('checked', true);
		} else {
			$("input:radio[name='national']:radio[value='foreign']").prop('checked', true);
		}
		
	});
			
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id='mainBorder'>
		<div style='padding: 15px;'>
			<span class='firstSpanCss'>내 정보</span>
		</div>
		<div>
		<form name='updateForm' action="./updateCtr.do" method="post">
			<input type="hidden" name='no' value='${memberVo.no}'>
			<table>
				<tr>
					<td>
						<span class='secondSpanCss'>이름</span>
					</td>
					<td>
						<input type="text" name='name' id='memberName' value='${memberVo.name}'>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td id='nameCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>닉네임</span>
					</td>
					<td>
						<input type='text' name='nickname' value='${memberVo.nickname}'
							id='memberNickName' size='8'>
						<input class='btnCss' type="button" onclick='sameNickFnc();' value='중복 확인'>
							<input id='checking' type='hidden' name='overlap' value=''>
							<input id='sameCheck' type='hidden' value='${_memberVo_.nickname}'>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td id='nicknameCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>이메일</span>
					</td>
					<td>
						<input type="text" name="email" value='${memberVo.email}'
							id='memberEmail' readonly='readonly'>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>연락처</span>
					</td>
					<td>
						<input type='text' name='phone' value='${memberVo.phone}' maxlength='13'
							id='memberPhone' onKeyup='inputPhoneNumber(this);'>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td id='phoneCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>비밀번호</span>
					</td>
					<td>
						<input type='password' name='password' value='${memberVo.password}'
							id='memberPassword'>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td id='passwordCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>비밀번호 확인</span>
					</td>
					<td>
						<input type='password' name='tempPassword' value=''
							id='memberTempPassword'>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td id='tempPasswordCheck' class='tdCss'>
					</td>
				</tr>
				<tr>
					<td>
						<span class='secondSpanCss'>내외국인</span>
					</td>
					<td>
						내국인
						<input type='radio' name='national' value='domestic'>
						외국인
						<input type='radio' name='national' value='foreign'>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td id='nationalCheck' class='tdCss'>
					</td>
				</tr>
			</table>
			<input class='btnCss' type="button" value="수정하기"
				onclick='updateBtnFnc();'>
			<input class='btnCss' type="button" value="뒤로가기" 
				onclick="pageMoveBeforeFnc(${memberVo.no});">
		</form>
		</div>
	</div>
	<input id='natCheck' type='hidden' value='${memberVo.national}'>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>