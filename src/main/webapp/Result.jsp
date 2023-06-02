<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Result</title>
<%@include file="include/head.jsp"%>
</head>
<body>
	<%@include file="include/header2.jsp"%>

	<div class="container ">


		<div
			class="row justify-content-md-center shadow-sm p-3 mb-5 bg-white rounded"">
			<div class="col-8">
				<form id="registerForm" method="post"
					action="/PK02207_ASM_Java4/login?action=check" class="lginf">

					<!-- <form action="/PK02207_ASM_Java4/UsersServlet?action=create"
							method="post"> -->
					<div class="container">
						<div class="row">
							<h4>Check user...</h4>

							<div clas="col-8">
								<label for="uname">Nhập mã xác thực</label> <input class="inp"
									type="text" placeholder="" name="maCheck">
								<p>Mã xác thực đã được gửi đến "${useremail }"</p>
								<button class="btn btn-primary">Check</button>
							</div>
						</div>
					</div>
					<span class="text-danger"></span></br>
				</form>
			</div>
		</div>
	</div>
</body>
</html>