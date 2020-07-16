<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>
<style type="text/css">
	* {
		text-align: center;
		margin: auto;
	}
	
	table {
		text-align: center;
		margin: auto;
	}
	
	td {
		text-align: left;
		padding: 3px;
	}
	
	input {
		text-align: left;
		padding: 5px;
	}
	
	input:focus {
		outline: 2px solid #0D4371;
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
		padding: 8px;
	}
</style>
<script type="text/javascript" src="\dolleProject\resources\js\jquery-3.5.1.js"></script>
<script type="text/javascript">
	var nickCheck = '';

	var nicknameObj = '';
	var nicknameCheck = '';
	var sameNick = '';
	var saveNick = '';
	
	var checking = '';
	var sameCheck = '';
	
	var pattern_num = /[0-9]/;	// 숫자 
	var pattern_eng = /[a-zA-Z]/;	// 문자 
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; //이메일
	var reg_Phone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/; //핸드폰
	
	function nickCheckFnc() {
		nickCheck = document.nickCheck;
		
		nicknameObj = document.getElementById('nicknameObj');
		nicknameCheck = document.getElementById('nicknameCheck');
		sameCheck = document.getElementById('sameCheck');

		
		// 빈칸 체크
		if (nicknameObj.value == "") {
			nicknameCheck.innerHTML = '닉네임을 입력해주세요.';
			nicknameObj.style.outlineColor = '#FF0000';
			nicknameObj.focus();
			return false;
		} else {
			nicknameObj.style.outlineColor = '#0D4371';
			nicknameCheck.innerHTML = '';
		}
		
		// 닉네임 자리수 유효성
		if (nicknameObj.value.length >= 3 && nicknameObj.value.length <= 6) {
			nicknameObj.style.outlineColor = '#0D4371';
			nicknameCheck.innerHTML = '';
		} else {
			nicknameCheck.innerHTML = '닉네임은 3~6자리로 입력해주세요.';
			nicknameObj.style.outlineColor = '#FF0000';
			nicknameObj.focus();
			return false;
		}
		
		// 닉네임 특수문자 체크
		if (pattern_spc.test(nicknameObj.value)) {
			nicknameCheck.innerHTML = '닉네임에는 특수문자를 사용할 수 없습니다.';
			nicknameObj.style.outlineColor = '#FF0000';
			nicknameObj.focus();
			return false;
		} else {
			nicknameObj.style.outlineColor = '#0D4371';
			nicknameCheck.innerHTML = '';
		}
		
		nickCheck.submit();
	}
	
	function useNickFnc() {
		
		if ($('#sameCheck').val() == '1') {
			checking = document.getElementById('checking');
			opener.document.all.nickname.value = document.all.nickname.value;
			checking.value = 'ok';
			opener.document.all.overlap.value = document.all.overlap.value;
			self.close();
		} else if ($('#sameCheck').val() == '2'){
			alert('이미 사용중인 닉네임 입니다.');
		} else {
			alert('중복확인을 눌러주세요.');
		}
	}
	
	window.onload = function() {

		$('#nicknameObj').val($('#saveNick').val());
		
		if($('#saveNick').val() == "") {
			document.all.nickname.value = opener.document.all.nickname.value;
		}
		
		sameNick = document.getElementById('sameNick');
		saveNick = document.getElementById('saveNick');
		
		if(saveNick.value != ""){
			if (sameNick.value == 0) {
				alert('중복 없음');
				$('#sameCheck').val(1);
				alert($('#sameCheck').val());
			} else {
				alert('중복 있음');
				$('#sameCheck').val(2);
				alert($('#sameCheck').val());
			}
		}
	}
	
</script>
</head>

<body>

	<h2>중복 확인</h2>
	
	<form id='nickCheck' name='nickCheck' action="nickCtr.do" method="get">
		<table>
			<tr>
				<td>
					<input id='nicknameObj' name="nickname" type='text' size='10'
						maxlength='6' value=''>
					<input id='sameNick' type='hidden' value='${result}'>
					<input id='saveNick' type='hidden' value='${nickname}'>
				</td>
				<td>
					<input class='btnCss' type='button' value='중복확인'
						onclick='nickCheckFnc();'>
					<input type='hidden' value=''>
				</td>
			</tr>
			<tr>
				<td id='nicknameCheck' class='tdCss' colspan='2'>
				</td>
			</tr>
		</table>
	</form>
	<form name='useNick' action='add.do' method='post'>
		<input type='hidden' value='${nickname}'>
		<input id='sameCheck' type='hidden' value=''>
		<input id='checking' type='hidden' name='overlap' value=''>
		<input class='btnCss' type='button' value='사용하기' onclick='useNickFnc();'>
		<input class='btnCss' type='button' value='취소' onclick='window.close();'>
	</form>
		
	
</body>

</html>