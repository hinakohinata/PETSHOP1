
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<body>


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
				<a href="product.jsp" class="nav-item nav-link">Product</a> <a
					href="logout.jsp" class="nav-item nav-link">Logout</a>




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