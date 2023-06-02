<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@include file="include/head.jsp"%>
</head>
<body>
	<%-- <c:if test="${param.iddm == null}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if> --%>
	<%@include file="include/header.jsp"%>

	<c:set var="soluong" value="2"></c:set>
	<c:choose>
		<c:when test="${param.vitri == null}">
			<c:set var="vitri" value="0"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="vitri" value="${(param.vitri - 1)*soluong}"></c:set>
		</c:otherwise>
	</c:choose>
	<ol>
		<c:forEach var="danhmuc"
			items="${f:getAllDanhMucPhanTrang(vitri, soluong)}">
			<div class="border-start border-5 border-primary ps-5 mb-5">
				<h5>${danhmuc.getTendm() } </h5>
			</div>
			<div class="container text-center">
				<div class="row">
					<c:forEach var="sanpham" items="${listSP}">
						<c:if
							test="${sanpham.getDanhmuc().getIddm() == danhmuc.getIddm()}">
							<div class="col-3">
								<div class="pb-5">
									<div
										class="product-item position-relative bg-light d-flex flex-column text-center">
										<img class="img-fluid mb-4" src=${sanpham.getHinhanh() }
											alt="">
										<h6 class="text-uppercase">${sanpham.getTensp() }</h6>
										<h5 class="text-primary mb-0">${sanpham.getGiaban() }</h5>
										<div class="btn-action d-flex justify-content-center">
											<a class="btn btn-primary py-2 px-3" href=""><i
												class="bi bi-cart"></i></a> <a class="btn btn-primary py-2 px-3"
												href="product_detal.jsp?idsp=${sanpham.getId() }"><i
												class="bi bi-eye"></i></a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
		<c:set var="tong" value="${f:demDanhMuc()}"></c:set>
		<c:choose>
			<c:when test="${tong%soluong!=0 }">
				<c:set var="sotrang" value="${tong/soluong + 1}"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="sotrang" value="${tong/soluong}"></c:set>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="1" end="${sotrang}" step="1">
			<a class="btn btn-primary" href="danhmuc.jsp?vitri=${i }">${i }</a>
		</c:forEach>
			
	</ol>
</body>
</html>