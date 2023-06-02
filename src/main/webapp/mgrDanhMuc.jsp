<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:if test="${userrole != 'Admin' }">
	<c:redirect url="index.jsp"></c:redirect>
</c:if>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="include/head.jsp"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
</head>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

.body {
	display: inline-flex;
	float: left;
	left-border: 1px;
}

form {
	border: 3px solid #f1f1f1;
}

.lginf {
	border: 3px solid #f1f1f1;
}

.inp {
	width: 100%;
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.table, form {
	font-size: 90%;
}

.btn-lg {
	background-color: #04AA6D;
	color: white;
	padding: 7px 10px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

.btn-lg
:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
<body>
	<%-- <jsp:forward page="/DanhMucServlet" /> --%>
	<%@include file="include/header1.jsp"%>
	<div class="body">
		<div class="shadow-sm p-3 mb-5 bg-white rounded" width="5%">
			<ul>
				<li><a class="py-2 px-3 mb-2"
					href="UsersServlet?action=loadData"> Account </a></li>
				<li><a class="py-2 px-3 mb-2"
					href="SanPhamServlet?action=loadData"> Product </a></li>

				<li><a class="py-2 px-3 mb-2" href="#"> Contact </a></li>
				<li><a class=" py-2 px-3 mb-2"
					href="DanhMucServlet?action=loadData"> Categories </a></li>
			</ul>
		</div>


		<div class="shadow-sm p-3 mb-5 bg-white rounded" width="95%">
			<div class="container border-left">
				<div class="row">
					<div class="col-9 ">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Tên danh mục</th>
									<th scope="col">Mô tả</th>
									<th scope="col  col-lg-2">Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dm" items="${listDM }">
									<tr>
										<th scope="row">${dm.getIddm() }</th>
										<td>${dm.getTendm() }</td>
										<td>${dm.getMota() }</td>
										<td><a class="text-primary"
											href="mgrDanhMuc.jsp?iddm=${dm.getIddm() }">Update</a>
											<script type="text/javascript">
											function checkDLT(){
												return confirm("Bạn muốn xóa?");
												}
											</script> <a
											class="text-danger"
											href="DanhMucServlet?action=delete&iddm=${dm.getIddm() }" onclick="javascript:return checkDLT()">Delete</a></td>
									</tr>
								</c:forEach>
								<!-- <tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr> -->
							</tbody>
						</table>
					</div>
					<div class="col-3">
						<c:choose>
							<c:when test="${param.iddm == null}">
								<form action="/PK02207_ASM_Java4/DanhMucServlet?action=create"
									method="post">
									<div class="container">
										<label for="uname">ID danh mục</label> <input class="inp" type="text"
											placeholder="ID" name="iddm" disabled readonly><label
											for="uname">Tên danh mục</label> <input class="inp" type="text"
											placeholder="Tên danh mục" name="tendm" required> <label
											for="psw">Mô tả</label> <input class="inp" type="password"
											placeholder="Mô tả" name="mota">
										<button type="submit" class="btn btn-primary">Create</button>
										<!-- <label> <input type="checkbox" checked="checked" name="remember"> Remember me </label> -->
										<span class="text-danger">${thongbao}</span>
									</div>
								</form>
							</c:when>
							<c:when test="${param.iddm > 0}">
								<c:set var="dmedit" value="${f:findById(param.iddm) }"></c:set>
								<form
									action="/PK02207_ASM_Java4/DanhMucServlet?action=upform&eiddm=${dmedit.getIddm() }"
									method="post">
									<div class="container">
										<label for="uname">ID danh mục</label> <input class="inp" type="text"
											placeholder="ID" name="eiddm" value="${dmedit.getIddm() }"
											disabled readonly><label for="uname">Tên danh
											mục</label> <input class="inp" type="text" name="etendm"
											value="${dmedit.getTendm() }"> <label for="psw">Mô
											tả</label> <input class="inp" type="text" placeholder="Mô tả"
											value="${dmedit.getMota() }" name="emotadm">
										<button type="submit" class="btn btn-primary">Update</button>
										<span class="text-danger">${thongbao}</span>
									</div>
								</form>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>