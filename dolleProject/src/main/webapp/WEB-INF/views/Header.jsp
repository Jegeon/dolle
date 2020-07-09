<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
