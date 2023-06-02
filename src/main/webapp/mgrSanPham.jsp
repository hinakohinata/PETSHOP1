<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
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

.form {
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
					<div class="col-7 ">
						<form action="mgrSanPham.jsp" method="get">
							<input name="searchsp" type="text" placeholder="Search...">
							<button type="submit" class="btn btn-light">Search</button>
						</form>
						<c:choose>
							<c:when test="${param.searchsp==null }">
								<c:set var="list" value="${listSP }"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="tuKhoa" value="${(param.searchsp)}"></c:set>
								<c:set var="list" value="${f:timKiemSanPham(tuKhoa)}"></c:set>
							</c:otherwise>
						</c:choose>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Mã sp</th>
									<th scope="col">Tên sp</th>
									<th scope="col">Giá bán</th>
									<th scope="col">Hình ảnh</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Trạng thái</th>
									<th scope="col  col-lg-2">Thao tác</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="dm" items="${list }">
									<tr>
										<th scope="row">${dm.getId() }</th>
										<td>${dm.getMasp() }</td>
										<td>${dm.getTensp() }</td>
										<td>${dm.getGiaban() }</td>
										<td><img width="100px" src="${dm.getHinhanh() }" /></td>
										<%-- ${dm.getHinhanh() } --%>
										<td>${dm.getSoluong() }</td>
										<td>${dm.getTrangthai() }</td>
										<td><a class="text-primary"
											href="mgrSanPham.jsp?idsp=${dm.getId() }">Update</a> <script
												type="text/javascript">
												function checkDLT() {
													return confirm("Bạn muốn xóa?");
												}
											</script> <a class="text-danger"
											href="SanPhamServlet?action=delete&idsp=${dm.getId() }"
											onclick="javascript:return checkDLT()">Delete</a></td>
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
					<div class="col-5">

						<c:choose>
							<c:when test="${param.idsp == null}">

								<form action="/PK02207_ASM_Java4/SanPhamServlet?action=create"
									method="post">
									<div class="container">
										<label for="uname" class="font-weight-bold"><b>ID</b></label><span
											type="text" name="id" class="font-weight-light">&ensp;&ensp;ID</span>
										</br> <label for="uname">Mã sản phẩm</label> <input class="inp"
											type="text" placeholder="Mã sản phẩm" name="masp"> <label
											for="epsw">Tên sản phẩm</label> <input class="inp"
											type="text" placeholder="Tên sản phẩm" name="tensp">
										<label for="uname">Giá bán</label> <input class="inp"
											type="number" min=1 placeholder="Giá bán" name="giaban">

										<label for="psw">Danh mục</label>
										<c:set var="danhmuc" value="${listDM }"></c:set>
										<select class="form-select"
											aria-label="Default select example" name="danhmuc">
											<c:forEach var="danhmuc" items="${listDM }">
													test="${danhmuc.getIddm() ==dmedit.getDanhmuc().getIddm()}">
													<option value="${danhmuc.getIddm() }">${danhmuc.getIddm() }
													- ${danhmuc.getTendm() }</option>
											</c:forEach>
										</select> <label for="uname">Hình ảnh</label> <input class="inp"
											type="text" placeholder="Hình ảnh" name="hinhanh"> <label
											for="epsw">Số lượng</label> <input class="inp" type="number"
											placeholder="Số lượng" name="soluong" min=1>Đã bán</label> <input
											class="inp" type="number" placeholder="Số lượng" name="daban"
											min=0 value=0><label for="uname">Mô tả ngắn</label> </br>
										<textarea class="inp" rows="" cols="" placeholder="Mô tả ngắn"
											name="mota" id="mota"></textarea>
										<label for="uname">Ghi chú</label> <input class="inp"
											type="text" placeholder="Ghi chú" name="ghichu">
										<button type="submit" class="btn bg-primary">Create</button>
										<span class="text-danger">${thongbaoErU}</span>
									</div>
								</form>
							</c:when>
							<c:when test="${param.idsp > 0}">
								<c:set var="dmedit" value="${f:findByIdsp(param.idsp) }"></c:set>
								<form
									action="/PK02207_ASM_Java4/SanPhamServlet?action=upform&eid=${dmedit.getId() }&euname=${dmedit.getMasp() }"
									method="post">
									<div class="container">
										<label for="uname" class="font-weight-bold"><b>ID</b></label><span
											type="text" name="eid" class="font-weight-light">&ensp;&ensp;${dmedit.getId() }</span>
										</br> <label for="uname">Mã sản phẩm</label> <input class="inp"
											type="text" placeholder="Username" name="euname"
											value="${dmedit.getMasp() }" disabled readonly> <label
											for="epsw">Tên sản phẩm</label> <input class="inp"
											type="text" placeholder="Password" name="etensp"
											value="${dmedit.getTensp() }"> <label for="uname">Giá
											bán</label> <input class="inp" type="text" placeholder="Fullname"
											name="egiaban" value="${dmedit.getGiaban() }"> <label
											for="psw">Danh mục</label>
										<c:set var="danhmuc" value="${listDM }"></c:set>
										<select class="form-select"
											aria-label="Default select example" name="edanhmuc">
											<c:forEach var="danhmuc" items="${listDM }">
												<c:if
													test="${danhmuc.getIddm() ==dmedit.getDanhmuc().getIddm()}">
													<option value="${danhmuc.getIddm() }" seleted>${danhmuc.getIddm() }
														- ${danhmuc.getTendm() }</option>
												</c:if>
											</c:forEach>
											<c:forEach var="danhmuc" items="${listDM }">
												<c:if
													test="${danhmuc.getIddm() !=dmedit.getDanhmuc().getIddm()}">
													<option value="${danhmuc.getIddm() }" seleted>${danhmuc.getIddm() }
														- ${danhmuc.getTendm() }</option>
												</c:if>
											</c:forEach>
										</select> <label for="uname">Hình ảnh</label> <input class="inp"
											type="text" placeholder="Hình ảnh" name="ehinhanh"
											value="${dmedit.getHinhanh() }"> <label for="epsw">Số
											lượng</label> <input class="inp" type="number" placeholder="Số lượng"
											name="esoluong" min=1 value="${dmedit.getSoluong() }">Đã
										bán</label> <input class="inp" type="number" placeholder="Số lượng"
											name="edaban" value="${dmedit.getDaban() }" min=0 value=0><label
											for="uname">Mô tả ngắn</label>
										<textarea id="mota" class="inp" rows="" cols=""
											placeholder="Mô tả ngắn" name="emota">${dmedit.getMotangan() }</textarea>
										<label for="uname">Ghi chú</label> <input class="inp"
											type="text" placeholder="Ghi chú" name="eghichu"
											value="${dmedit.getGhichu() }">
										<button type="submit" class="btn bg-primary">Update</button>

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
<script type="text/javascript">
	var editor = '';
	$(document).ready(function() {
		editor = CKEDITOR.replace('mota');
	})
</script>
</html>