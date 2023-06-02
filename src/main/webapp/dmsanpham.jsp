<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
		
<c:if test="${param.iddm == null}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if>

<c:set var="danhmuc" value="${f:findById(param.iddm)}"></c:set>
	
	<h3>
		${danhmuc.getTendm()}
	</h3>
	
	<%-- <p>
		${danhmuc.getMota()}
	</p> --%>

</body>
</html>