<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="cs" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${userrole != 'Admin' }">
	<c:redirect url="index.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="include/head.jsp"%>
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

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img
.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span
.psw {
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

.btn-lg {
	background-color: #04AA6D;
	color: white;
	padding: 7px 10px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

.btn-lg:hover {
	opacity: 0.8;
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
	span
.psw {
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
									<th scope="col">User name</th>
									<th scope="col">Password</th>
									<th scope="col">Full name</th>
									<th scope="col">Email</th>
									<th scope="col">User role</th>
									<th scope="col">Ghi chú</th>
									<th scope="col">Thao tác</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="dm" items="${listUser }">
									<tr>
										<th scope="row"><small>${dm.getId() }</small></th>
										<td>${dm.getUsername() }</td>
										<td>${dm.getPassword() }</td>
										<td>${dm.getFullname() }</td>
										<td><small>${dm.getEmail() }</small></td>
										<td>${dm.getUserrole() }</td>
										<td>${dm.getGhichu() }</td>
										<td><a class="text-primary"
											href="mgrUsers.jsp?id=${dm.getId() }">Update</a> 
											<script type="text/javascript">
											function checkDLT(){
												return confirm("Bạn muốn xóa?");
												}
											</script>
											<a class="text-danger"
											href="UsersServlet?action=delete&iduser=${dm.getId() }" onclick="javascript:return checkDLT()">Delete</a></td>
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
							<c:when test="${param.id == null}">

								<form action="/PK02207_ASM_Java4/UsersServlet?action=create"
									method="post">
									<div class="container">
										<label for="uname">ID</label> <input class="inp" type="text"
											placeholder="ID" name="id" disabled readonly> <label
											for="uname">Username</label> <input class="inp" type="text"
											placeholder="Username" name="uname"> <label for="psw">Password</label>
										<input class="inp" type="text" placeholder="Password"
											name="psw"> <label for="uname">Fullname</label> <input
											class="inp" type="text" placeholder="Your name" name="name">
										<label for="uname">Email</label> <input class="inp"
											type="text" placeholder="Email" name="email"> <label
											for="psw">User role</label> <select class="inp"
											class="form-select" aria-label="Default select example"
											name="role">
											<option value="Admin">Admin</option>
											<option value="User" selected>User</option>
										</select> <label for="uname">Ghi chú</label> <input class="inp"
											type="text" placeholder="Ghi chú" name="ghichu">
										<button type="submit" class="btn bg-primary">Create</button>
										<span class="text-danger">${thongbaoErU}</span>
									</div>
								</form>
							</c:when>
							<c:when test="${param.id > 0}">
								<c:set var="dmedit" value="${f:findByIdUser(param.id) }"></c:set>
								<form
									action="/PK02207_ASM_Java4/UsersServlet?action=upform&eid=${dmedit.getId() }&euname=${dmedit.getUsername() }"
									method="post">
									<div class="container">
										<label for="uname">ID</label> <input type="text"
											placeholder="ID" name="eid" value="${dmedit.getId() }"
											disabled readonly> <label for="uname">Username</label>
										<input type="text" placeholder="Username" name="euname"
											value="${dmedit.getUsername() }" disabled readonly> <label
											for="epsw">Password</label> <input type="text"
											placeholder="Password" name="epsw"
											value="${dmedit.getPassword() }" required> <label
											for="uname">Fullname</label> <input type="text"
											placeholder="Fullname" name="ename"
											value="${dmedit.getFullname() }"> <label for="uname">Email</label>
										<input type="text" placeholder="Email" name="eemail"
											value="${dmedit.getEmail() }" required> <label
											for="psw">User role</label>
										<c:choose>
											<c:when test="${dmedit.getUserrole()=='Admin'}">
												<select class="form-select"
													aria-label="Default select example" name="erole">
													<option value="Admin" seleted>Admin</option>
													<option value="User">User</option>
												</select>
											</c:when>
											<c:otherwise>
												<select class="form-select"
													aria-label="Default select example" name="erole">
													<option value="User" seleted>User</option>
													<option value="Admin">Admin</option>
												</select>
											</c:otherwise>
										</c:choose>
										<label for="uname">Ghi chú</label> <input type="text"
											placeholder="Ghi chú" name="eghichu"
											value="${dmedit.getGhichu() }">
										<button type="submit">Update</button>

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