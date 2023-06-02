<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@include file="include/head.jsp"%>
</head>
<body>
	<%@include file="include/header.jsp"%>

	<div class="body">
		<div class="shadow-sm p-3 mb-5 bg-white rounded">
			<div class="container border-left">
				<div class="row">
					<div class="col-9 ">
						<table class="table">
							<thead>
								<tr>
									<!-- <th scope="col">Stt</th> -->
									<th scope="col">Tên sp</th>
									<th scope="col">Hình ảnh</th>
									<th scope="col">Giá bán</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Tổng tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cart" items="${listSP }">
									<td>${cart.getSanpham().getTensp() }</td>
									<td><img width="200px"
										src="${cart.getSanpham().getHinhanh() }" /></td>
									<td>${cart.getSanpham().getGiaban()}</td>
									<td>${cart.getSoluong ()}</td>
									<td>${cart.getTongtien() }</td>

								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="col-3">
						</br> <b>Tổng hóa đơn: </b>${thanhtien }<b> $</b></br> <a class="btn btn-primary"
							href="checkout.jsp"> Thanh toán</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- <%@include file="include/footer.jsp"%> --%>
</body>
</html>