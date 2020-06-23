<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

nav > ul {
	list-style-type: none;
	padding: 0px;
	overflow: hidden;
	background-color: #333333;
	display: table;
	margin-left: auto;
	margin-right: auto;
}

nav > ul > li{
	float: left;
}

nav > ul > li > a{
	display: block;
 	color: white; 
	text-align: center;
	padding: 16px;
	text-decoration: none;
}

nav > ul > li > a:hover{
	color: #FFD9EC;
	background-color: #5D5D5D;
	font-weight: bold;
}

</style>
<title>Insert title here</title>
</head>
<body>

	<nav>
		<ul>
		<!--ㄷ 한자 적용  -->
			<li><a href="#"><span>≪</span></a></li>

			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>

			<li><a href="#"><span>≫</span></a></li>
		</ul>
	</nav>

</body>
</html>