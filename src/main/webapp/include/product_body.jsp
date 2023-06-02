<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
<!-- Products Start -->



<c:choose>
	<c:when test="${param.search==null }">
			<div class="border-start border-5 border-primary ps-5 mb-5 bg-light">
				<h1 class="text-primary text-uppercase">Products</h1>
				<h4>Products For Your Best Friends</h4>
			</div>
		<div class="container">
			<div class="row">
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
							<h3 class="text-left ">${danhmuc.getTendm() }</h3>
							</hr>
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
													<h5 class="text-primary mb-0">$${sanpham.getGiaban() }</h5>
													<div class="btn-action d-flex justify-content-center">
														<a class="btn btn-primary py-2 px-3" href=""><i
															class="bi bi-cart"></i></a> <a
															class="btn btn-primary py-2 px-3"
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
					<div class=" text-center">
						<c:forEach var="i" begin="1" end="${sotrang}" step="1">
							<a class="btn btn-primary  text-center"
								href="product.jsp?vitri=${i }">${i }</a>
						</c:forEach>
					</div>
				</ol>

				<form action="/PK02207_ASM_Java4/LoadData" method="post">
					<button class="btn btn-primary">Load</button>
				</form>
			</div>
		</div>
	</c:when>
	<c:otherwise>

		<c:set var="tuKhoa" value="${(param.search)}"></c:set>
		<div class="container text-center">
			<div class="row">
				<c:forEach var="sanpham" items="${f:timKiemSanPham(tuKhoa)}">
					<div class="col-3">
						<div class="pb-5">
							<div
								class="product-item position-relative bg-light d-flex flex-column text-center">
								<img class="img-fluid mb-4" src=${sanpham.getHinhanh() } alt="">
								<h6 class="text-uppercase">${sanpham.getTensp() }</h6>
								<h5 class="text-primary mb-0">$${sanpham.getGiaban() }</h5>
								<div class="btn-action d-flex justify-content-center">
									<a class="btn btn-primary py-2 px-3" href=""><i
										class="bi bi-cart"></i></a> <a class="btn btn-primary py-2 px-3"
										href="product_detal.jsp?idsp=${sanpham.getId() }"><i
										class="bi bi-eye"></i></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:otherwise>
</c:choose>
<!-- Products End -->


<!-- Offer Start -->
<div class="container-fluid bg-offer my-5 py-5">
	<div class="container py-5">
		<div class="row gx-5 justify-content-start">
			<div class="col-lg-7">
				<div class="border-start border-5 border-dark ps-5 mb-5">
					<h6 class="text-dark text-uppercase">Special Offer</h6>
					<h1 class="display-5 text-uppercase text-white mb-0">Save 50%
						on all items your first order</h1>
				</div>
				<p class="text-white mb-4">Eirmod sed tempor lorem ut dolores
					sit kasd ipsum. Dolor ea et dolore et at sea ea at dolor justo
					ipsum duo rebum sea. Eos vero eos vero ea et dolore eirmod et.
					Dolores diam duo lorem. Elitr ut dolores magna sit. Sea dolore sed
					et.</p>
				<a href="" class="btn btn-light py-md-3 px-md-5 me-3">Shop Now</a> <a
					href="" class="btn btn-outline-light py-md-3 px-md-5">Read More</a>
			</div>
		</div>
	</div>
</div>
<!-- Offer End -->



