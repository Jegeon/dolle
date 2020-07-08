<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 		User -->
	<c:if test="${_memberVo_.grade == 'user' || (_memberVo_.grade != 'admin' && _memberVo_.grade != 'mayor')}">
		<jsp:include page="/WEB-INF/views/UserHeader.jsp" />
	</c:if>
	
<!-- 		admin -->
	<c:if test="${_memberVo_.grade == 'admin' || _memberVo_.grade == 'mayor'}">
		<jsp:include page="/WEB-INF/views/AdminHeader.jsp" />
	</c:if>
