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
<script type="text/javascript">
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
	var reg_Phone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/; //핸드폰

	function updateBtnFnc() {
		updateForm = document.updateForm;
		
		nameObj = document.getElementById('memberName');
		nicknameObj = document.getElementById('memberNickName');
		phoneObj = document.getElementById('memberPhone');
		nationalObj = document.getElementsByName('national')[0];
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
			tempPasstempPasswordObjword.style.outlineColor = '#0D4371';
			tempPasswordCheck.innerHTML = '';
		}
		
	}
	
	function pageMoveBeforeFnc(no){
		var url = 'listOne.do?no=' + no;
		location.href = url;
	}
			
			
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id='mainBorder'>
		<div>
			<span class='firstSpanCss'>내 정보</span>
		</div>
		<table>
			<tr>
				<td>
					<input class='inputBtn' type='button' value='가입 정보'>
				</td>
				<td>
					<input class='inputBtn' type='button' value='예약 현황'>
				</td>
				<td>
					<input class='inputBtn' type='button' value='내가 쓴 글'>
				</td>
			</tr>
		</table>
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
							<input type='hidden' name='overlap'>
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
						<input type='text' name='phone' value='${memberVo.phone}'
							id='memberPhone'>
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
						<input type='radio' name='national' value='n'>
						외국인
						<input type='radio' name='national' value='f'>
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

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>