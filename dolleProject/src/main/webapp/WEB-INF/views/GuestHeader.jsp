<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<style>
#headerWrap {
	font-family: "대한민국정부상징체", sans-serif;
}

.navbar {
	box-sizing: border-box;
	padding-top: 14px;
	float: left;
	height: 40px;
	width: 252px;
}

.navbar:hover {
	background-color: #EFEAE2;
}

#introduceMenu, #townIntroduceMenu, #reservationMenu, #boardMenu,
	#supportMenu {
	display: none;
/* 	position: absolute; */
/*  z-index: 1; */

}

.blackLink {
	text-decoration: none;
	color:black;
}

.whiteLink {
	text-decoration: none;
	color:#FFFFFF;
}
</style>
<script type="text/javascript" src="/dolleProject/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
   		
	   //소개
       $("#introduceNavbar").mouseover(function() {
          $("#introduceMenu").css("display", "block")
   
       });
       $("#introduceMenu").mouseover(function() {
          $("#introduceMenu").css("display", "block")
          $("#introduceNavbar").css("backgroundColor", "#EFEAE2")
   
       });
       
       $("#introduceNavbar").mouseleave(function() {
          $("#introduceMenu").css("display", "none")
   
       });
       $("#introduceMenu").mouseleave(function() {
          $("#introduceMenu").css("display", "none")
          $("#introduceNavbar").css("backgroundColor", "")
   
       });
       
       //마을소개
       $("#townIntroduceNavbar").mouseover(function() {
          $("#townIntroduceMenu").css("display", "block")
   
       });
       $("#townIntroduceMenu").mouseover(function() {
          $("#townIntroduceMenu").css("display", "block")
          $("#townIntroduceNavbar").css("backgroundColor", "#EFEAE2")
   
       });
       
       $("#townIntroduceNavbar").mouseleave(function() {
          $("#townIntroduceMenu").css("display", "none")
   
       });
       $("#townIntroduceMenu").mouseleave(function() {
          $("#townIntroduceMenu").css("display", "none")
          $("#townIntroduceNavbar").css("backgroundColor", "")
   
       });
       
       
   
    });
   
   

</script>



	<div id='headerWrap' style="width: 100%; margin: auto; position: absolute;">


		<div
			style="background-color: #707070; color: #ffffff; height: 40px; padding: 15px 5px 5px 5px; box-sizing: border-box;">


			<span style="float: right;">
			</span> 
			<span style="float: right;">
			</span>
		</div>

		<div style="border-bottom: 1px solid #A5A5A5;">
			<div
				style="text-align: center; padding: 30px 0px 10px 0px; box-sizing: border-box;">
				<div style="font-size: 50px;">둘레길</div>
				<div style="padding-bottom: 15px;">
					<div style="float: right;">
						<a class='blackLink' href='../auth/login.do'>로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class='blackLink' href='../member/add.do'>회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</div>
			</div>
		</div>

		<div
			style="border-bottom: 1px solid #A5A5A5; height: 40px; text-align: center;">
			<div style="width: 1260px; margin: 0px auto;">
				<div class='navbar' id='introduceNavbar'>소개</div>
				<div class='navbar' id='townIntroduceNavbar'>마을소개</div>
			</div>
		</div>


		   <div id='introduceMenu' style="border-bottom: 1px solid #A5A5A5; height: 40px;" >
		      <div style="width:1260px; margin: 0px auto;">
		         <div style="height: 40px; width: 380px; background-color: #EFEAE2; text-align: center; padding-top: 14px;
		              box-sizing: border-box;"> 
		            <span style="padding: 0px 7px 0px 7px;">
		               <a class='blackLink' href='#'>팀 공존</a>
		            </span>
		            <span style="padding: 0px 7px 0px 7px;">
		               <a class='blackLink' href='#'>기획 의도</a>
		            </span>
		            <span style="padding: 0px 7px 0px 7px;">
		               <a class='blackLink' href='#'>팀원 소개</a>
		            </span>
		         </div>
		      </div>
		   </div>
		<div id='townIntroduceMenu'
			style="border-bottom: 1px solid #A5A5A5; height: 40px;">
			<div style="width: 1260px; margin: 0px auto;">
				<div
					style="height: 40px; width: 450px; background-color: #EFEAE2; text-align: center; padding-top: 14px; box-sizing: border-box; margin-left: 252px;">
					<span style="padding: 0px 7px 0px 7px;"> <a class='blackLink' href='#'>성곽마을이란?</a>
					</span> <span style="padding: 0px 7px 0px 7px;"> <a class='blackLink' href='#'>아홉 마을 소개</a>
					</span> <span style="padding: 0px 7px 0px 7px;"> <a class='blackLink' href='#'>혜화명륜</a>
					</span>
				</div>
			</div>
		</div>
		

	</div>

	<div style="padding-top: 227px;">
	
	</div>

	<!--    배경은 전체에 다 나오는 데? -->
	<!--    내용만 1260 -->
	<%--    <c:if test="${member.email ne null}"> --%>
	<!--       <span style="float:right;"> -->
	<%--          ${member.name} --%>
	<!--          <a style="color:white;"  -->
	<%--             href="<%=request.getContextPath()%>/logout.do"> --%>
	<!--             로그아웃</a> -->
	<!--       </span> -->
	<%--    </c:if> --%>