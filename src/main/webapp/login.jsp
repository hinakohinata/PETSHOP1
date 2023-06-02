<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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

	<div class="container-fluid bg-testimonial py-5"
		style="margin: 45px 0;"">

		<!-- <img class="img-fluid mx-auto" src="img/testimonial.jpg" alt="">
 -->
		<div class="container py-5">
			<div class="row justify-content-end">
				<div class="col-lg-7 bg-light">
					<form action="/PK02207_ASM_Java4/login?action=login" method="post"
						class="lginf" id="frmLogin">
						<h2 class="text-center">Login</h2>

						<div class="container ">
							<label for="uname"><b>Username</b></label> <input class="inp"
								type="text" id="uname" placeholder="Enter Username" name="uname"
								> <label for="psw"><b>Password</b></label> <input
								type="password" placeholder="Enter Password" id="pasw"
								name="psw" class="inp"> <span
								class="text-danger">${thongbao}</span></br>

							<button type="submit" class="btn btn-primary" id="btn-login">Login</button>
							<!-- <label> <input type="checkbox" checked="checked" name="remember"> Remember me
				</label> -->
						</div>

						<div class="container" style="background-color: #f1f1f1">
							<a href="index.jsp"><button type="button" class="cancelbtn">Cancel</button></a>
							<span class="psw"><a href="register.jsp">Create an
									account</a></span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="include/footer.jsp"%>
	<!-- <script type="text/javascript">
		$('#btn-login').click(function(e) {
			/* var value = $('age').getValue(); */
			var value = $('uname').getValue();
			var value1 = $('passw').getValue();
			alert(value != null);
			if (value != null || value1 != null){
				frmLogin.action="/PK02207_ASM_Java4/login?action=login"
				return false;
				}
			/* action="/PK02207_ASM_Java4/login?action=login" */
			return true;
			e.preventDefault();

		});
	</script> -->
</body>
</html>