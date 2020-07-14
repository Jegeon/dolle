<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 		User -->
	<c:if test="${_memberVo_.grade == 'user'}">
		<jsp:include page="/WEB-INF/views/UserHeader.jsp" />
	</c:if>
	
<!-- 		admin -->
	<c:if test="${_memberVo_.grade == 'admin'}">
		<jsp:include page="/WEB-INF/views/AdminHeader.jsp" />
	</c:if>
	
<!-- 	    guest -->
	<c:if test="${_memberVo_.grade != 'admin' && _memberVo_.grade != 'user'}">
		<jsp:include page="/WEB-INF/views/GuestHeader.jsp" />
	</c:if>
