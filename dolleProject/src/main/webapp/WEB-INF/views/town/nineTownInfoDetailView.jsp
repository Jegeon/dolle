<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마을 소개 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<style type="text/css">


#totalWrap {
	width: 1260px;
	height: 800px;
	margin: auto;
	padding-top: 30px;
}

#imgWrap {
	width: 710px;
	height: 680px;
	float: left;
	box-sizing: border-box;
	margin-right: 30px;
	padding-top: 50px;
}

#contentWrap {
	width: 520px;
	height: 680px;
	float: left;
}

#fontImgWrap {
	padding-top: 15px;
	padding-left: 176px;
}

#hhmrgFont {
	width: 183px;
	height: 37px;
}

.contentBtn {
	width: 150px;
	height: 35px;
	text-align: center;
	border: 1px solid #ADADAD;
	box-sizing: border-box;
	padding-top: 9px;
	background-color: #ffffff;
	font-family: Arial;
	font-weight: 600;
	border-radius: 4px;
	float:left;
	margin-right: 30px;
}

.contentSpan {
	float:left;
	font-family: Arial;
	font-weight: 600;
	line-height: 24px;
}

.contentLine {
	width: 500px;
}

#townIntroduceLine {
	height: 200px;
	margin-top: 20px;
	margin-bottom: 10px;
}

#townSeeLine {
	height: 100px;
}

#townEatLine {
	height: 100px;
}

#townPlayLine {
	height: 80px;
}

#leftImg {
	width: 710px;
}

</style>
<script type="text/javascript" src="/dolleProject/resources/js/jquery-3.5.1.js">
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#townIntroduceDiv').css("backgroundColor", "#0D4371");
		$('#townIntroduceDiv').css("color", "#ffffff");
		$('.contentBtn').css("cursor", "pointer");
		
		$('#townIntroduceDiv').attr("onClick","introClickFnc()");
		
		$('#townSeeDiv').attr("onClick", "seeClickFnc()");
		
		$('#townEatDiv').attr("onClick", "eatClickFnc()");
		
		$('#townPlayDiv').attr("onClick", "playClickFnc()");
		
		$('#recommendCourseDiv').attr("onClick", "courseClickFnc()");
		
		var menu = $("#menu").val();
		
		if(menu == "intro"){
			introClickFnc();
		}else if(menu == "eat"){
			eatClickFnc();
		}else if(menu == "see"){
			seeClickFnc();
		}
		
	});
	
	function introClickFnc() {
		$('#townIntroduceDiv').css("backgroundColor", "#0D4371");
		$('#townIntroduceDiv').css("color", "#ffffff");
		
		$('#townSeeDiv').css("backgroundColor", "#ffffff");
		$('#townSeeDiv').css("color", "#000000");
		$('#townEatDiv').css("backgroundColor", "#ffffff");
		$('#townEatDiv').css("color", "#000000");
		$('#townPlayDiv').css("backgroundColor", "#ffffff");
		$('#townPlayDiv').css("color", "#000000");
		$('#recommendCourseDiv').css("backgroundColor", "#ffffff");
		$('#recommendCourseDiv').css("color", "#000000");
		
		$('#leftImg').attr("src", "/dolleProject/resources/images/townIntroduce/townIntroduceImg.jpg");
		$('#imgWrap').css("paddingTop", "50px");
	}
	
	function seeClickFnc(){
		$('#townSeeDiv').css("backgroundColor", "#0D4371");
		$('#townSeeDiv').css("color", "#ffffff");
		
		$('#townIntroduceDiv').css("backgroundColor", "#ffffff");
		$('#townIntroduceDiv').css("color", "#000000");
		$('#townEatDiv').css("backgroundColor", "#ffffff");
		$('#townEatDiv').css("color", "#000000");
		$('#townPlayDiv').css("backgroundColor", "#ffffff");
		$('#townPlayDiv').css("color", "#000000");
		$('#recommendCourseDiv').css("backgroundColor", "#ffffff");
		$('#recommendCourseDiv').css("color", "#000000");
		
		$('#leftImg').attr("src", "/dolleProject/resources/images/townIntroduce/townSeeImg.jpg");
		$('#imgWrap').css("paddingTop", "130px");
	}
	
	function eatClickFnc() {
		$('#townEatDiv').css("backgroundColor", "#0D4371");
		$('#townEatDiv').css("color", "#ffffff");
		
		$('#townIntroduceDiv').css("backgroundColor", "#ffffff");
		$('#townIntroduceDiv').css("color", "#000000");
		$('#townSeeDiv').css("backgroundColor", "#ffffff");
		$('#townSeeDiv').css("color", "#000000");
		$('#townPlayDiv').css("backgroundColor", "#ffffff");
		$('#townPlayDiv').css("color", "#000000");
		$('#recommendCourseDiv').css("backgroundColor", "#ffffff");
		$('#recommendCourseDiv').css("color", "#000000");
		
		$('#leftImg').attr("src", "/dolleProject/resources/images/townIntroduce/townEatImg.jpg");
		$('#imgWrap').css("paddingTop", "0px");
	}
	
	function playClickFnc() {
		$('#townPlayDiv').css("backgroundColor", "#0D4371");
		$('#townPlayDiv').css("color", "#ffffff");
		
		$('#townIntroduceDiv').css("backgroundColor", "#ffffff");
		$('#townIntroduceDiv').css("color", "#000000");
		$('#townSeeDiv').css("backgroundColor", "#ffffff");
		$('#townSeeDiv').css("color", "#000000");
		$('#townEatDiv').css("backgroundColor", "#ffffff");
		$('#townEatDiv').css("color", "#000000");
		$('#recommendCourseDiv').css("backgroundColor", "#ffffff");
		$('#recommendCourseDiv').css("color", "#000000");
		
		$('#leftImg').attr("src", "/dolleProject/resources/images/townIntroduce/townPlayImg.jpg");
		$('#imgWrap').css("paddingTop", "70px");
	}
	
	function courseClickFnc() {
		$('#recommendCourseDiv').css("backgroundColor", "#0D4371");
		$('#recommendCourseDiv').css("color", "#ffffff");
		
		$('#townIntroduceDiv').css("backgroundColor", "#ffffff");
		$('#townIntroduceDiv').css("color", "#000000");
		$('#townSeeDiv').css("backgroundColor", "#ffffff");
		$('#townSeeDiv').css("color", "#000000");
		$('#townEatDiv').css("backgroundColor", "#ffffff");
		$('#townEatDiv').css("color", "#000000");
		$('#townPlayDiv').css("backgroundColor", "#ffffff");
		$('#townPlayDiv').css("color", "#000000");
		
		$('#leftImg').attr("src", "/dolleProject/resources/images/townIntroduce/recommendCourseImg.png");
		$('#imgWrap').css("paddingTop", "0px");
	}
		
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<input id="menu" type="hidden" value="${menu}">
	
	<div id='totalWrap'>
		<div id='imgWrap'>
			<img id='leftImg' src='/dolleProject/resources/images/townIntroduce/townIntroduceImg.jpg' alt='leftImg'>
		</div>
		
		<div id='contentWrap'>
			<div id='fontImgWrap'>
				<img id='hhmrgFont' src='/dolleProject/resources/images/hhmrgFont.PNG'
					alt='혜화명륜권'>
			</div>
			
			<div id='contentSmallWrap'>
				<div class='contentLine' id='townIntroduceLine'>
					<div class='contentBtn' id='townIntroduceDiv'>
						<span>마을 소개</span>
					</div>
					
					<div class='contentSpan'>
						<span class='spanHeight'>
							혜화명륜 성곽마을은 서울 역사도심의 
							<br>동북부에 위치하며, 한양도성 사소문 중 
							<br>하나인 혜화문 안쪽에 위치하고 있습니다.
							<br>조선시대 최고의 교육기관인 성균관을 
							<br>중심으로 이를 서비스하던 반촌이 
							<br>형성되어 있었고  1970년대 이후에는 
							<br>다양한 예술가와 정치인들의 
							<br>활동 무대이기도 하였습니다.
						</span>
					</div>
				</div>
				
				<div class='contentLine' id='townSeeLine'>
					<div class='contentBtn' id='townSeeDiv'>
						<span>마을 볼거리</span>
					</div>
					
					<div class='contentSpan'>
						<span class='spanHeight'>
							우암송시열집터,성균관대학교,혜화동로터리
							<br>,한무숙문학관,장면총리가옥
							<br>,와룡공원,와룡공원길 성곽길
							
						</span>
					</div>
				</div>
				
				<div class='contentLine' id='townEatLine'>
					<div class='contentBtn' id='townEatDiv'>
						<span>마을 먹거리</span>
					</div>
					
					<div class='contentSpan'>
						<span class='spanHeight'>
							방선생웃음밥상-더덕요리전문점
							<br>혜화골목냉면-사계절냉면전문점
							<br>혜화칼국수-40년전통칼국수
						</span>
					</div>
				</div>
				
				<div class='contentLine' id='townPlayLine'>
					<div class='contentBtn' id='townPlayDiv'>
						<span>마을 놀거리</span>
					</div>
					
					<div class='contentSpan'>
						<span class='spanHeight'>
							유소문화축제 성곽길투어, 
							<br>국립어린이과학원, 창경궁 탐방
						</span>
					</div>
				</div>
				
				<div class='contentLine' id='recommendCourseLine'>
					<div class='contentBtn' id='recommendCourseDiv'>
						<span>추천 코스</span>
					</div>
					
					<div class='contentSpan'>
						<span class='spanHeight'>
							성균관대학교-와룡공원-이루재
							<br>-성곽공원길-우암송시열집터
							<br>-한무숙문학관-장면총리가옥-혜화동로터리
						</span>
					</div>
				</div>
			
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>