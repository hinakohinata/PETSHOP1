<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<%@include file="include/head.jsp"%>
</head>
<body>
	<%@include file="include/header.jsp"%>
	<!-- Contact Start -->
	<div class="container-fluid pt-5">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-7">
					<form>
						<div class="row g-3">
							<div class="col-12">
								<input type="text" class="form-control bg-light border-0 px-4"
									placeholder="Tên" style="height: 55px;">
							</div>
							<div class="col-12">
								<input type="email" class="form-control bg-light border-0 px-4"
									placeholder="Địa chỉ" style="height: 55px;">
							</div>
							<div class="col-12">
								<input type="email" class="form-control bg-light border-0 px-4"
									placeholder="Số điện thoại" style="height: 55px;">
							</div>
							<div class="col-12">
								<textarea class="form-control bg-light border-0 px-4 py-3"
									rows="8" placeholder="Ghi chú"></textarea>
							</div>
							<div class="col-12">
								<button class="btn btn-primary w-100 py-3" type="submit">Thanh
									toán</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-5">
					<div class="service-item bg-light d-flex p-4">Mã đơn: <i>Auto</i></div>
					<div class="service-item bg-light d-flex p-4">Tổng tiền: $${thanhtien }</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->

	<%@include file="include/footer.jsp"%>
</body>
</html>