<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="/LoadData" />
	<%-- Đổ dữ liệu thử
	<ol>
		<c:forEach var="danhmuc" items="${listDM}">

			<li>${danhmuc.getTendm() }
				<a href="dmsanpham.jsp?iddm=${danhmuc.getIddm() }">Xem chi tiết</a>
			</li>
			
		</c:forEach>
	</ol>
	Đổ dữ liệu thử --%>
	

</body>
</html>