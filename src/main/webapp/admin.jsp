<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:if test="${userrole != 'Admin' }">
	<c:redirect url="index.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@include file="include/head.jsp"%>
</head>
<body>
	<%@include file="include/header.jsp"%>
	<%@include file="include/admin_body.jsp"%>
	<%@include file="include/footer.jsp"%>
</body>
</html>