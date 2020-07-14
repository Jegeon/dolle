<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드 투어 예약자 관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">
table, tr, th, td {
		border-collapse: collapse;
		vertical-align: middle;
		text-align: center;
	}
	tr {
		border-top: 1px solid #ddd;
		border-bottom: 1px solid #ddd;
	}
	table {
		width: 1260px;
	}
	th {
		font-weight: bold;
		background-color: #F8F4ED;
		border-top: 2px solid #ddd;
		border-bottom: 2px solid #ddd;
		height: 40px;
		box-sizing: border-box;
	}
	td {
		height: 40px;
		box-sizing: border-box;
	}
	.daehanFont {
		font-size: 30px; 
		font-family: 대한민국정부상징체 ; 
	}
	.ahreum {
		width:220px; 
		height:50px;
		font:normal bold 18px Segoe UI; 
		color:white; 
		background-color: #0D4371;
		border:0px;
		text-align: center;
		vertical-align: middle;
	}
	#searchWrap {
		float: right;
		height: 50px;
		width: 400px;
		padding-top: 60px;
	}
	#searchOptionWrap {
		width: 140px;
		padding: 6px 22px;
		vertical-align: middle;
		border: 1px solid #B9B9B9;
		font-size: 14px;
		font-family: Segoe UI;
		-webkit-appearance: none; /* 원본 select 버튼 감추기 */
		background: url('/dolleProject/resources/images/selectBtn.PNG')
			no-repeat 95% 50%;
	}
	#searchDiv {
		width: 250px;
		height: 31px;
		display: inline-block;
		border: 1px solid #B9B9B9;
		vertical-align: middle;
	}
	#searchInput {
		width: 190px;
		height: 22px;
		vertical-align: middle;
		font: normal normal 14px Segoe UI;
		margin-left: 10px;
		padding: 2px 0px 1px 10px;
		border: 0px;
	}
	#searchBtn {
		margin-top: 2px;
		vertical-align: middle;
	}
	#listBtnDiv {
		margin: auto;
		width: 230px;
		float: right;
	}
	#listBtnInput {
		width: 230px;
		height: 40px;
		background-color: #0D4371;
		text-align: center;
		vertical-align: middle;
		color: white;
		font-weight: bold;
		font-size: 20px;
		border: none;
		box-sizing: border-box;
	}
</style>
<script type="text/javascript">
	function goPageFnc(pageNum){
		var curPage = $('#curPage');
		curPage.val(pageNum);
		
		var pagingForm = $('#pagingForm');
		pagingForm.submit();
	}
	function submitFnc(){
		var pagingForm = $('#searchForm');
		pagingForm.submit();
	}
	function confirmFnc(){
		var checkVal = confirm("승인하시겠습니까?");
		if(checkVal == true){
			$("#adminForm").attr("action", "./multiConfirm.do");
			$("#adminForm").submit();	
			$("#adminForm").attr("action", "./reservationListCanceled.do");
		}
	}
	function cancelFnc(){
		var checkVal = confirm("취소하시겠습니까?");
		if(checkVal == true){
			$("#adminForm").attr("action", "./multiCancel.do");
			$("#adminForm").submit();	
			$("#adminForm").attr("action", "./reservationListCanceled.do");
		}
	}
	function deleteFnc(){
		var checkVal = confirm("삭제하시겠습니까?");
		if(checkVal == true){
			$("#adminForm").attr("action", "./multiDelete.do");
			$("#adminForm").submit();	
			$("#adminForm").attr("action", "./reservationListCanceled.do");
		}
	}
</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<h1 class="daehanFont" style="margin: 10px 0px 10px 82px;">가이드 투어 예약자 관리 - 예약 현황(취소자)</h1>
	
	<%-- 가져오는 데이터 확인 ${tourReservationListAll} --%>
 	<!-- 검색 시작 -->
	<div style="float:right; height:50px; width:530px; padding-top:10px;">
		<form id='searchForm' action="./reservationListCanceled.do" method="post">
			<select id="searchOption" name="searchOption"  
				style="width:140px; padding: 6px 22px; vertical-align: middle;
					border: 1px solid #B9B9B9; 
					font-size:14px; font-family: Segoe UI;
					-webkit-appearance: none; /* 원본 select 버튼 감추기 */
					background: url('/dolleProject/resources/images/selectBtn.PNG') no-repeat 95% 50%;">
				<c:choose>
					<c:when test="${searchOption eq 'both'}">
						<option value="both" selected="selected">전체</option>
						<option value="memberName">회원 이름</option>
						<option value="tourName">투어 이름</option>
					</c:when>
					<c:when test="${searchOption eq 'memberName'}">
						<option value="both">전체</option>
						<option value="memberName" selected="selected">회원 이름</option>
						<option value="tourName">투어 이름</option>
					</c:when>
					<c:when test="${searchOption eq 'tourName'}">
						<option value="both">전체</option>
						<option value="memberName">회원 이름</option>
						<option value="tourName" selected="selected">투어 이름</option>
					</c:when>
				</c:choose>		
			</select>
		
			<div style="width:250px; height:31px; display:inline-block;
				 border:1px solid #B9B9B9; vertical-align:middle;">
				<input id="keyword" name="keyword" type="text" value="${keyword}"
					 style="width:190px; height:22px; vertical-align: middle;
						font: normal normal 14px Segoe UI; margin-left:10px;
						padding: 2px 0px 1px 10px; border: 0px;">
				<img id="searchBtn" alt="검색버튼" onclick="submitFnc();"
				 src="/dolleProject/resources/images/searchBtn.PNG"
				 style="margin-top:2px; vertical-align: middle;"> 
			</div>
		</form>
	</div>
	<!-- 검색 끝 -->
	
	<form id="adminForm" action="./reservationListCanceled.do" method="post">
		<div style="width: 1260px; height: 450px; margin: auto; clear: both;">
			<table>
				<tr>
					<th>
						선택
					</th>
					<th style="width: 90px;">
						예약 번호
					</th>
					<th style="width: 90px;">
						이름
					</th>
					<th class='resCss'>
						이메일
					</th>
					<th>
						투어 번호
					</th>
					<th style="width: 160px;">
						예약한 투어 이름
					</th>
					<th style="width: 90px;">
						예약 날짜
					</th>
					<th style="width: 90px;">
						예약 인원
					</th>
					<th style="width: 90px;">
						입금 여부
					</th>
					<th style="width: 90px;">
						입금 시간
					</th>
				</tr>
				<!-- 검색결과가 없는 경우 -->
				<c:if test="${empty tourReservationListCanceled}">
					<tr>
						<td colspan="9">검색된 결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var='reservationVo' items='${tourReservationListCanceled}'>
					<tr>
						<td>
							<input type="checkbox" name="checkIdx" value="${reservationVo.reserveNo}">
						</td>
						<td>
							${reservationVo.reserveNo}
						</td>
						<td>
							${reservationVo.memberName}
						</td>
						<td>
							${reservationVo.memberEmail}
						</td>
						<td>
							${reservationVo.tourNo}
						</td>
						<td>
							${reservationVo.tourName}
						</td>
						<td>
							<fmt:formatDate value="${reservationVo.reserveTourDate}" pattern="yyyy-MM-dd" />
						</td>
						<td>
							${reservationVo.reserveApplyNum}
						</td>
						<td>
							<c:if test="${reservationVo.reserveDepositState == 'standby'}">
								미입금
							</c:if>
							<c:if test="${reservationVo.reserveDepositState == 'paid'}">
								승인 대기
							</c:if>
							<c:if test="${reservationVo.reserveDepositState == 'active'}">
								예약 완료
							</c:if>
							<c:if test="${reservationVo.reserveDepositState == 'canceled'}">
								예약 취소
							</c:if>
						</td>
						<td>
							<fmt:formatDate value="${reservationVo.reserveDepositDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
	
	<div style="width:1260px; height:205px; margin:0 auto; text-align: center; 
	padding-top: 30px; box-sizing: border-box;">
		<ul id="pagingGroup" style="width: 600px; display: inline-block; margin-left: 165px;">
			<li class="pagingImg" onclick="goPageFnc(1);"
				 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
				 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleLeft.PNG" 
					style="width: 55%;">
			</li>
			<li class="pagingImg" onclick="goPageFnc(${pagingMap.reservationPaging.prevPage});"
				 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
				 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/left.PNG" 
					style="width: 40%;">
			</li>
			<c:forEach var="num" 
				begin="${pagingMap.reservationPaging.blockBegin}" 
				end="${pagingMap.reservationPaging.blockEnd}">
				
				<c:if test="${pagingMap.reservationPaging.curPage eq num}">
					<li class="pagingNum" onclick="goPageFnc(${num});"
						style="cursor: pointer; width:40px; height:40px; display:inline-block; 
						background: #0D4371; color:#fff; border:1px solid #707070; vertical-align: middle; 
						font-size: 20px; padding-top:8px; box-sizing: border-box;">
						<c:out value="${num}"/>
					</li>
				</c:if>
				<c:if test="${pagingMap.reservationPaging.curPage ne num}">
					<li class="pagingNum" onclick="goPageFnc(${num});"
						 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
						 background: #FFFFFF; border:1px solid #707070; vertical-align: middle;
						font-size: 20px; padding-top:8px; box-sizing: border-box;">
						<c:out value="${num}"/>
					</li>
				</c:if>
			</c:forEach>

			<li class="pagingImg" onclick="goPageFnc(${pagingMap.reservationPaging.nextPage});"
			 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
			 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/right.PNG" 
					style="width: 42%;">
			</li>
			<li class="pagingImg" onclick="goPageFnc(${pagingMap.reservationPaging.totPage});"
				 style="cursor: pointer; width:40px; height:40px; display: inline-block; 
				 background: #FFFFFF; border:1px solid #fff; vertical-align: middle;
				 padding-top:7px; box-sizing: border-box;">
				<img id="doubledLeftBtn" alt="doubledLeftBtn" src="/dolleProject/resources/images/doubleRight.PNG" 
					style="width: 55%;">
			</li>
		</ul>
		<!-- 다중 시작 -->
		<div style="margin: auto; padding-top: 30px; clear:both; width: 800px; text-align: center;">
			<c:if test="${_memberVo_.grade == 'admin'}">
				<input id='listBtnInput' class='ahreum' value='예약 취소' onclick='cancelFnc();'>
				<input id='listBtnInput' class='ahreum' value='예약 승인' onclick='confirmFnc();'>
				<input id='listBtnInput' class='ahreum' value='예약 삭제' onclick='deleteFnc();'>
			</c:if>
		</div>
		<!-- 다중 끝 -->
		
		<!-- 페이징정보 전달 -->
		<form action="./reservationListCanceled.do" id='pagingForm' method="get">
			<input type="hidden" id='curPage' name='curPage' value="${pagingMap.reviewPaging.curPage}">
			<input type="hidden" id='pagingSearchOption' name='searchOption' value="${searchOption}">
			<input type="hidden" id='pagingKeyword' name='keyword' value="${keyword}">
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	
</body>
</html>