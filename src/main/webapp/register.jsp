<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Register</title>
<%@include file="include/head.jsp"%>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

.lginf {
	border: 3px solid #f1f1f1;
}

.inp {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.btn-lg {
	background-color: #04AA6D;
	color: white;
	padding: 14px 20px;
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
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>

</head>
<body>


	<%@include file="include/header.jsp"%>

	<div class="container ">
		<c:if test="${thongbaoEmail!=null }">
			<c:set var="thongbao" value="${thongbaoEmail }"></c:set>
			<script> alert(${thongbao});</script>
		</c:if>


		<div class="row justify-content-md-center">
			<div class="col-8">
				<form id="registerForm" method="post"
					action="/PK02207_ASM_Java4/register_validate" class="lginf">

					<!-- <form action="/PK02207_ASM_Java4/UsersServlet?action=create"
							method="post"> -->
					<div class="container">
						<div class="row">
							<div class="col-6">
								<label for="uname">Username</label> <input class="inp"
									type="text" placeholder="Username" name="uname"> <label
									for="psw">Password</label> <input class="inp" type="text"
									placeholder="Password" name="psw"> <label for="psw">User
									role</label> <select class="form-select inp"
									aria-label="Default select example" name="role">
									<option value="Admin">Admin</option>
									<option value="User" selected>User</option>
								</select>
							</div>
							<div class="col-6">
								<label for="uname">Fullname</label> <input class="inp"
									type="text" placeholder="Your name" name="name"> <label
									for="uname">Email</label> <input class="inp" type="text"
									placeholder="Email" name="email"> <label for="uname">Ghi
									chú</label><input class="inp" type="text" placeholder="Ghi chú"
									name="ghichu"> <span class="text-danger">${thongbaoErU}</span>
							</div>
						</div>
					</div>
					<span class="text-danger"></span></br>
					<script type="text/javascript">
	function validate() {
		let errMes = "";
		let name = document.forms["registerForm"]["name"].value;
		let email = document.forms["registerForm"]["email"].value;
		let username = document.forms["registerForm"]["uname"].value;
		let password = document.forms["registerForm"]["psw"].value;
		let gender = document.forms["registerForm"]["defaultGroupExample"].value;
		let EPassword = document.forms["registerForm"]["EnPsw"].value;

		if (name === "") {
			errMes += "Name chưa nhập dữ liệu!\n"
		 }
		if (email === "") {
			errMes += "Email chưa nhập dữ liệu!\n"
		}
		if (username === "") {
			errMes += "Username chưa nhập dữ liệu!\n"
		}
		if (password === "") {
			errMes += "Password chưa nhập dữ liệu!\n"
		}
		if (EPassword === "") {
			errMes += "Enter password chưa nhập dữ liệu!\n"
		}
			/* if (EPassword !== password) {
				errMes += "Password không khớp!\n"
			} */
		alert(errMes);
		return false;
	}
</script>
					<button type="submit" class="btn-lg"
						onclick="javascript:return validate()">Register</button>

					<div class="container" style="background-color: #f1f1f1">
						<span class="text-center"><a href="login.jsp">Have an
								account? Log in</a></span></span>
					</div>
				</form>
			</div>
		</div>

	</div>
	<%@include file="include/footer.jsp"%>

</body>
</html>