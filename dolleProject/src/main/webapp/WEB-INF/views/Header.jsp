<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<style>
#headerWrap {
	font-family:"대한민국정부상징체", sans-serif;
}

</style>
<script type="text/javascript" 
	src="/springHome/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

</script>


<div>
<div id='headerWrap'>

	<div style="background-color:#707070; color:#ffffff; 
	height:40px; padding: 15px 5px 5px 5px; box-sizing:border-box;">
	
	
		<span style="float:right;">
			<a>한글</a>
			/
			<a>영어</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		
		
		<span style="float:right;">
			<a>주간</a>
			/
			<a>야간모드</a> &nbsp;&nbsp;&nbsp;&nbsp;
		</span>
	</div>
	
	<div style="border-bottom: 1px solid #A5A5A5;">
		<div style="text-align: center;
			 padding: 30px 0px 10px 0px; box-sizing: border-box;">
			<div style="font-size: 50px;">둘레길</div>
			<div style="padding-bottom:15px; ">
				<div style="float:right;">
					<a>로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a>회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
		</div>
	</div>
	
	<div style="border-bottom: 1px solid #A5A5A5; height: 40px; text-align: center;">
		<div onmouseenter="menuEvent1Fnc();" onmouseleave="menuoutEventFnc();" style="box-sizing: border-box; padding-top: 14px; display:inline-block; height: 40px; width: 230px;">
			소개
		</div>
		<div onmouseenter="menuEvent2Fnc();" onmouseleave="menuoutEventFnc();" style="box-sizing: border-box; padding-top: 14px; display:inline-block; height: 40px; width: 230px;">
			마을소개
		</div>
		<div onmouseenter="menuEvent3Fnc();" onmouseleave="menuoutEventFnc();" style="box-sizing: border-box; padding-top: 14px; display:inline-block; height: 40px; width: 230px;">
			예약
		</div>
		<div onmouseenter="menuEvent4Fnc();" onmouseleave="menuoutEventFnc();" style="box-sizing: border-box; padding-top: 14px; display:inline-block; height: 40px; width: 230px;">
			게시판
		</div>
		<div onmouseenter="menuEvent5Fnc();" onmouseleave="menuoutEventFnc();" style="box-sizing: border-box; padding-top: 14px; display:inline-block; height: 40px; width: 230px;">
			고객지원
		</div>
	</div>
	
<!-- 	<div style="border-bottom: 1px solid #A5A5A5; height: 40px;"> -->
<!-- 		<div style="height: 40px; width: 580px; background-color: #EFEAE2;"> -->
<!-- 			<span> -->
<!-- 				<a>팀 공존</a> -->
<!-- 			</span> -->
<!-- 			<span> -->
<!-- 				<a>기획 의도</a> -->
<!-- 			</span> -->
<!-- 			<span> -->
<!-- 				<a>팀원 소개</a> -->
<!-- 			</span> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	
	
	
</div>
	
	
<!-- 	배경은 전체에 다 나오는 데? -->
<!-- 	내용만 1260 -->
<%-- 	<c:if test="${member.email ne null}"> --%>
<!-- 		<span style="float:right;"> -->
<%-- 			${member.name} --%>
<!-- 			<a style="color:white;"  -->
<%-- 				href="<%=request.getContextPath()%>/logout.do"> --%>
<!-- 				로그아웃</a> -->
<!-- 		</span> -->
<%-- 	</c:if> --%>



