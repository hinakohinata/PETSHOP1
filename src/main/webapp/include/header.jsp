
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<body>
	<!-- Topbar Start -->
	<div class="container-fluid border-bottom d-none d-lg-block">
		<div class="row gx-0">
			<div class="col-lg-4 text-center py-2">
				<div class="d-inline-flex align-items-center">
					<i class="bi bi-geo-alt fs-1 text-primary me-3"></i>
					<div class="text-start">
						<h6 class="text-uppercase mb-1">Our Office</h6>
						<span>123 Street, New York, USA</span>
					</div>
				</div>
			</div>
			<div class="col-lg-4 text-center border-start border-end py-2">
				<div class="d-inline-flex align-items-center">
					<i class="bi bi-envelope-open fs-1 text-primary me-3"></i>
					<div class="text-start">
						<h6 class="text-uppercase mb-1">Email Us</h6>
						<span>info@example.com</span>
					</div>
				</div>
			</div>
			<div class="col-lg-4 text-center py-2">
				<div class="d-inline-flex align-items-center">
					<i class="bi bi-phone-vibrate fs-1 text-primary me-3"></i>
					<div class="text-start">
						<h6 class="text-uppercase mb-1">Call Us</h6>
						<span>+012 345 6789</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
		<a href="index.jsp" class="navbar-brand ms-lg-5">
			<h1 class="m-0 text-uppercase text-dark">
				<i class="bi bi-shop fs-1 text-primary me-3"></i>Pet Shop
			</h1>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<form action="product.jsp" method="get">
				<input name="search" type="text" placeholder="Search...">
				<button type="submit" class="btn btn-light">Search</button>
			</form>
			<div class="navbar-nav ms-auto py-0">
				<a href="index.jsp" class="nav-item nav-link">Home</a>
				<!--  <a href="about.jsp" class="nav-item nav-link">About</a>-->
				<!--  <a href="service.jsp" class="nav-item nav-link">Service</a>-->
				<a href="product.jsp" class="nav-item nav-link">Product</a>


				<c:choose>
					<c:when test="${userLogin != 'true'}">
						<a href="login.jsp" class="nav-item nav-link">Login</a>
					</c:when>
					<c:when test="${userLogin == 'true'}">
						<c:choose>
							<c:when test="${userrole == 'Admin'}">
								<a href="admin.jsp" class="nav-item nav-link">${username}</a>
							</c:when>
							<c:otherwise>
								<a href="/PK02207_ASM_Java4/CartServlet?user=${userid }" class="nav-item nav-link">${username}</a>
							</c:otherwise>
						</c:choose>
						<a href="logout.jsp" class="nav-item nav-link">Logout</a>
					</c:when>
				</c:choose>




				<!-- <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                    <div class="dropdown-menu m-0">
                        <a href="price.jsp" class="dropdown-item">Pricing Plan</a>
                        <a href="team.jsp" class="dropdown-item">The Team</a>
                        <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                        <a href="blog.jsp" class="dropdown-item">Blog Grid</a>
                        <a href="detail.jsp" class="dropdown-item">Blog Detail</a>
                    </div>
                </div> -->
				<a href="contact.jsp"
					class="nav-item nav-link nav-contact bg-primary text-white px-5 ms-lg-5">Contact
					<i class="bi bi-arrow-right"></i>
				</a>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->
</body>