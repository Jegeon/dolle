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
	width: 210px;
}

.navbar:hover {
	background-color: #EFEAE2;
}

#adminMenu, #introduceMenu, #townIntroduceMenu, #reservationMenu, #boardMenu,
	#supportMenu {
	display: none;
/* 	position: absolute; */
/*  z-index: 1; */

}

.blackLink {
	text-decoration: none;
	color:black;
}

.detailLink {
	font-family: Segoe UI;
	font-weight: bold;
	font-size: 14px;
	color: gray;
}

.whiteLink {
	text-decoration: none;
	color:#FFFFFF;
}


</style>
<script type="text/javascript" src="/dolleProject/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
   		
	 	//관리자
       $("#adminNavbar").mouseover(function() {
          $("#adminMenu").css("display", "block")
   
       });
       $("#adminMenu").mouseover(function() {
          $("#adminMenu").css("display", "block")
          $("#adminNavbar").css("backgroundColor", "#EFEAE2")
   
       });
       $("#adminNavbar").mouseleave(function() {
           $("#adminMenu").css("display", "none")
    
        });
        $("#adminMenu").mouseleave(function() {
           $("#adminMenu").css("display", "none")
           $("#adminNavbar").css("backgroundColor", "")
    
        });
       
        ///////////////////관리자 세부 메뉴///////////////////
	$("#popManageUser").hide();
	$("#popManageReserve").hide();
	$("#popManageBoard").hide();
	$("#popSupportUser").hide();
	
	$("#manageUser").click(function(){
		$("#popManageUser").toggle(400);
	});
	
	$("#manageReserve").click(function(){
		$("#popManageReserve").toggle(400);
		
	});
	
	$("#manageBoard").click(function(){
		$("#popManageBoard").toggle(400);
		
	});
	
	$("#supportUser").click(function(){
		$("#popSupportUser").toggle(400);
		
	});

        /////////////////////////////////////
       
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
       
       //예약
       $("#reservationNavbar").mouseover(function() {
          $("#reservationMenu").css("display", "block")
   
       });
       $("#reservationMenu").mouseover(function() {
          $("#reservationMenu").css("display", "block")
          $("#reservationNavbar").css("backgroundColor", "#EFEAE2")
   
       });
       
       $("#reservationNavbar").mouseleave(function() {
          $("#reservationMenu").css("display", "none")
   
       });
       $("#reservationMenu").mouseleave(function() {
          $("#reservationMenu").css("display", "none")
          $("#reservationNavbar").css("backgroundColor", "")
   
       });
       
       //게시판
       $("#boardNavbar").mouseover(function() {
          $("#boardMenu").css("display", "block")
   
       });
       $("#boardMenu").mouseover(function() {
          $("#boardMenu").css("display", "block")
          $("#boardNavbar").css("backgroundColor", "#EFEAE2")
   
       });
       
       $("#boardNavbar").mouseleave(function() {
          $("#boardMenu").css("display", "none")
   
       });
       $("#boardMenu").mouseleave(function() {
          $("#boardMenu").css("display", "none")
          $("#boardNavbar").css("backgroundColor", "")
   
       });
       
       //고객지원
       $("#supportNavbar").mouseover(function() {
          $("#supportMenu").css("display", "block")
   
       });
       $("#supportMenu").mouseover(function() {
          $("#supportMenu").css("display", "block")
          $("#supportNavbar").css("backgroundColor", "#EFEAE2")
   
       });
       
       $("#supportNavbar").mouseleave(function() {
          $("#supportMenu").css("display", "none")
   
       });
       $("#supportMenu").mouseleave(function() {
          $("#supportMenu").css("display", "none")
          $("#supportNavbar").css("backgroundColor", "")
   
       });
   
    });
   
   

</script>



	<div id='headerWrap' style="width: 100%; margin: auto; position: absolute;">


		<div
			style="background-color: #707070; color: #ffffff; height: 40px; padding: 15px 5px 5px 5px; box-sizing: border-box;">


			<span style="float: right;"> <a class='whiteLink' href='#'>한글</a> / <a class='whiteLink' href='#'>영어</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</span> <span style="float: right;"> <a class='whiteLink' href='#'>주간</a> / <a class='whiteLink' href='#'>야간모드</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
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
				<div class='navbar' id='adminNavbar'>관리자</div>
				<div class='navbar' id='introduceNavbar'>소개</div>
				<div class='navbar' id='townIntroduceNavbar'>마을소개</div>
				<div class='navbar' id='reservationNavbar'>예약</div>
				<div class='navbar' id='boardNavbar'>게시판</div>
				<div class='navbar' id='supportNavbar'>고객지원</div>
			</div>
		</div>

		
		<div id='adminMenu' style="border-bottom: 1px solid #A5A5A5; height: 40px;" >
		      <div style="width:1260px; margin: 0px auto;">
		         <div style="height: 40px; width: 1260px; background-color: #EFEAE2; text-align: center; padding-top: 14px;
		              box-sizing: border-box;"> 
		            <!-- 회원 관리 -->
		            <span id="manageUser" style="padding: 0px 7px 0px 7px;">
		               <a class='blackLink' href='#'>회원 관리</a>
		            </span>
		            
		            <span id="popManageUser">
		            	<span id="popUser" style="padding: 0px 7px 0px 7px;">
					       <a class='blackLink detailLink' href='#'>회원</a>
						</span>
						<span id="popAdmin" style="padding: 0px 7px 0px 7px;">
						       <a class='blackLink detailLink' href='#'>관리자</a>
						</span>
		            </span>
		            
		            <!-- 예약 관리 -->
		            <span id="manageReserve" style="padding: 0px 7px 0px 7px;">
		               <a class='blackLink' href='#'>예약 관리</a>
		            </span>
		            
		            <span id="popManageReserve">
			            <span id="popReserveDate" style="padding: 0px 7px 0px 7px;">
						       <a class='blackLink detailLink' href='#'>예약일정</a>
						</span>
						<span id="popReserveAll" style="padding: 0px 7px 0px 7px;">
						       <a class='blackLink detailLink' href='#'>예약현황(전체)</a>
						</span>
						<span id="popReserveNoPay" style="padding: 0px 7px 0px 7px;">
						       <a class='blackLink detailLink' href='#'>예약현황(미입금자)</a>
						</span>
						<span id="popReserveCancel" style="padding: 0px 7px 0px 7px;">
						       <a class='blackLink detailLink' href='#'>예약현황(취소자)</a>
						</span>
						<span id="popManageReserve" style="padding: 0px 7px 0px 7px;">
						       <a class='blackLink detailLink' href='#'>예약페이지 관리</a>
						</span>
					</span>
					
		            <!-- 게시판 관리 -->
		            <span id="manageBoard" style="padding: 0px 7px 0px 7px;">
		               <a class='blackLink' href='#'>게시판 관리</a>
		            </span>
		            
		            <span id="popManageBoard">
			            <span id="popReview" style="padding: 0px 7px 0px 7px;">
						       <a class='blackLink detailLink' href='#'>코스후기 게시판</a>
						</span>
					</span>
		            <!-- 고객지원 -->
		            <span id="supportUser" style="padding: 0px 7px 0px 7px;">
		               <a class='blackLink' href='#'>고객지원</a>
		            </span>
		            
		            <span id="popSupportUser">
			            <span id="popNotice" style="padding: 0px 7px 0px 7px;">
						       <a class='blackLink detailLink' href='#'>공지사항</a>
						</span>
					</span>
		         </div>
		      </div>
		 </div>
		 
		 
		 
		 
		 <div id='introduceMenu' style="border-bottom: 1px solid #A5A5A5; height: 40px;" >
		      <div style="width:1260px; margin: 0px auto;">
		         <div style="height: 40px; width: 380px; background-color: #EFEAE2; text-align: center; padding-top: 14px;
		              box-sizing: border-box; margin-left: 210px;"> 
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
					style="height: 40px; width: 450px; background-color: #EFEAE2; text-align: center; padding-top: 14px; box-sizing: border-box; margin-left: 420px;">
					<span style="padding: 0px 7px 0px 7px;"> <a class='blackLink' href='#'>성곽마을이란?</a>
					</span> <span style="padding: 0px 7px 0px 7px;"> <a class='blackLink' href='#'>아홉 마을 소개</a>
					</span> <span style="padding: 0px 7px 0px 7px;"> <a class='blackLink' href='#'>혜화명륜</a>
					</span>
				</div>
			</div>
		</div>
		<div id='reservationMenu'
			style="border-bottom: 1px solid #A5A5A5; height: 40px;">
			<div style="width: 1260px; margin: 0px auto;">
				<div
					style="height: 40px; width: 252px; background-color: #EFEAE2; text-align: center; padding-top: 14px; box-sizing: border-box; margin-left: 588px;">
					<span style="padding: 0px 7px 0px 7px;"> <a class='blackLink' href='../reservation/list.do'>투어 예약</a>
					</span>
				</div>
			</div>
		</div>
		<div id='boardMenu'
			style="border-bottom: 1px solid #A5A5A5; height: 40px;">
			<div style="width: 1260px; margin: 0px auto;">
				<div
					style="height: 40px; width: 252px; background-color: #EFEAE2; text-align: center; padding-top: 14px; box-sizing: border-box; margin-left: 798px;">
					<span style="padding: 0px 7px 0px 7px;"> <a class='blackLink' href='../courseReview/list.do'>코스 후기 게시판</a>
					</span>
				</div>
			</div>
		</div>
		<div id='supportMenu'
			style="border-bottom: 1px solid #A5A5A5; height: 40px;">
			<div style="width: 1260px; margin: 0px auto;">
				<div
					style="height: 40px; width: 252px; background-color: #EFEAE2; text-align: center; padding-top: 14px; box-sizing: border-box; margin-left: 1008px;">
					<span style="padding: 0px 7px 0px 7px;"> <a class='blackLink' href='../noticeBoard/list.do'>공지 사항</a>
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