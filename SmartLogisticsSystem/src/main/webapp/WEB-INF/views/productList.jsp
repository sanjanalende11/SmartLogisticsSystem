<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Products | SmartLogisticsSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<!-- Premium Elegant Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Montserrat:wght@300;400;500;600&display=swap"
	rel="stylesheet">

<style>
:root {
	/* Aesthetic Palette */
	--bg-body: #fffbf7; /* Warm Bone White */
	--bg-card: #ffffff;
	--text-main: #2c2c2e;
	--text-muted: #8a8a8f;
	--accent-gold: #c5a059;
	--accent-gold-light: #e6c8a3;
	--border-color: #ececec;
	--shadow-soft: 0 10px 40px rgba(0, 0, 0, 0.04);
	--shadow-hover: 0 20px 50px rgba(0, 0, 0, 0.08);
	--transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Montserrat', sans-serif;
	background: var(--bg-body);
	color: var(--text-main);
	overflow-x: hidden;
	line-height: 1.7;
}

/* Typography */
h1, h2, h3, h4, h5, h6, .serif-font {
	font-family: 'Cormorant Garamond', serif; /* Elegant Serif */
	font-weight: 600;
	color: var(--text-main);
	letter-spacing: -0.5px;
}

a {
	text-decoration: none;
	color: inherit;
	transition: var(--transition);
}

/* ========== GLASSMORPHISM NAVBAR ========== */
.navbar-premium {
	background: rgba(255, 251, 247, 0.85);
	backdrop-filter: blur(12px);
	-webkit-backdrop-filter: blur(12px);
	border-bottom: 1px solid rgba(0, 0, 0, 0.04);
	padding: 20px 0;
	position: sticky;
	top: 0;
	z-index: 1000;
	transition: 0.4s;
}

.nav-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.logo-brand {
	font-family: 'Cormorant Garamond', serif;
	font-size: 32px;
	font-weight: 700;
	color: var(--text-main);
}

.logo-brand span {
	font-style: italic;
	color: var(--accent-gold);
}

.search-wrapper {
	position: relative;
	width: 350px;
}

.search-input {
	width: 100%;
	background: #fff;
	border: 1px solid var(--border-color);
	padding: 12px 20px 12px 45px;
	border-radius: 50px;
	font-family: 'Montserrat', sans-serif;
	font-size: 14px;
	outline: none;
	transition: 0.3s;
}

.search-input:focus {
	border-color: var(--accent-gold);
	box-shadow: 0 4px 20px rgba(197, 160, 89, 0.1);
}

.search-icon {
	position: absolute;
	left: 18px;
	top: 50%;
	transform: translateY(-50%);
	color: var(--text-muted);
	font-size: 14px;
}

.nav-link-text {
	font-size: 13px;
	text-transform: uppercase;
	letter-spacing: 1.5px;
	font-weight: 500;
	margin-left: 25px;
	position: relative;
}

.nav-link-text::after {
	content: '';
	position: absolute;
	bottom: -4px;
	left: 0;
	width: 0;
	height: 1px;
	background: var(--accent-gold);
	transition: 0.3s;
}

.nav-link-text:hover::after {
	width: 100%;
}

/* ========== LAYOUT ========== */
.page-layout {
	padding: 80px 0;
}

/* ========== FILTERS SIDEBAR ========== */
.filter-section {
	background: var(--bg-card);
	border: 1px solid var(--border-color);
	border-radius: 20px;
	padding: 35px;
	position: sticky;
	top: 110px;
	box-shadow: var(--shadow-soft);
}

.sidebar-title {
	font-size: 22px;
	margin-bottom: 30px;
	padding-bottom: 15px;
	border-bottom: 1px solid var(--border-color);
}

.filter-group {
	margin-bottom: 30px;
}

.filter-label {
	font-family: 'Montserrat', sans-serif;
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 1px;
	color: var(--text-muted);
	margin-bottom: 15px;
	font-weight: 600;
}

/* Custom Checkbox */
.custom-check {
	display: flex;
	align-items: center;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 14px;
	color: var(--text-main);
}

.custom-check input {
	appearance: none;
	width: 16px;
	height: 16px;
	border: 1px solid var(--border-color);
	border-radius: 4px;
	margin-right: 12px;
	position: relative;
	transition: 0.2s;
}

.custom-check input:checked {
	background: var(--accent-gold);
	border-color: var(--accent-gold);
}

.custom-check input:checked::after {
	content: '✔';
	position: absolute;
	top: -3px;
	left: 1px;
	font-size: 10px;
	color: #fff;
}

/* ========== PRODUCT GRID ========== */
.header-area {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 40px;
}

.header-area h2 {
	font-size: 42px;
	font-weight: 400;
}

.header-area p {
	color: var(--text-muted);
	font-size: 14px;
	max-width: 400px;
}

/* ========== AESTHETIC PRODUCT CARD ========== */
.prod-card {
	background: var(--bg-card);
	border-radius: 20px;
	overflow: hidden;
	position: relative;
	transition: var(--transition);
	border: 1px solid transparent; /* Prep for hover border */
}

.prod-card:hover {
	transform: translateY(-10px);
	box-shadow: var(--shadow-hover);
	border-color: rgba(197, 160, 89, 0.2);
}

.prod-img-container {
	height: 340px; /* Portrait ratio */
	position: relative;
	overflow: hidden;
	background: #f4f4f4;
}

.prod-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.8s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.prod-card:hover .prod-img {
	transform: scale(1.08);
}

/* Badge */
.badge-new {
	position: absolute;
	top: 20px;
	left: 20px;
	background: rgba(255, 255, 255, 0.9);
	color: var(--text-main);
	padding: 6px 14px;
	font-size: 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 600;
	backdrop-filter: blur(5px);
	border-radius: 30px;
	z-index: 2;
}

/* Overlay Actions */
.card-actions {
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%) translateX(20px);
	display: flex;
	flex-direction: column;
	gap: 15px;
	opacity: 0;
	transition: all 0.5s ease;
	z-index: 3;
}

.prod-card:hover .card-actions {
	opacity: 1;
	transform: translateY(-50%) translateX(0);
}

.action-circle {
	width: 45px;
	height: 45px;
	background: #fff;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
	cursor: pointer;
	transition: 0.3s;
	color: var(--text-main);
}

.action-circle:hover {
	background: var(--accent-gold);
	color: #fff;
	transform: scale(1.1);
}

/* Card Content */
.card-body {
	padding: 25px;
	text-align: center;
}

.cat-tag {
	font-size: 11px;
	text-transform: uppercase;
	color: var(--accent-gold);
	letter-spacing: 1.5px;
	font-weight: 600;
	margin-bottom: 10px;
	display: block;
}

.prod-name {
	font-family: 'Cormorant Garamond', serif;
	font-size: 20px;
	margin-bottom: 15px;
	line-height: 1.3;
	transition: 0.3s;
}

.prod-name:hover {
	color: var(--accent-gold);
}

.price-wrapper {
	margin-bottom: 20px;
	font-family: 'Montserrat', sans-serif;
}

.price-curr {
	font-size: 14px;
	vertical-align: top;
	margin-right: 2px;
	color: var(--text-muted);
}

.price-val {
	font-size: 24px;
	font-weight: 600;
	color: var(--text-main);
}

.price-old {
	text-decoration: line-through;
	color: #ccc;
	margin-left: 10px;
	font-size: 14px;
}

/* Buttons */
.btn-cart {
	display: block;
	width: 100%;
	padding: 14px;
	border: 1px solid var(--border-color);
	background: transparent;
	border-radius: 50px;
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 600;
	cursor: pointer;
	transition: 0.3s;
	color: var(--text-main);
}

.btn-cart:hover {
	background: var(--accent-gold);
	border-color: var(--accent-gold);
	color: #fff;
}

.stock-pill {
	display: inline-block;
	padding: 4px 10px;
	border-radius: 4px;
	font-size: 10px;
	font-weight: 600;
	text-transform: uppercase;
}

.in-stock {
	background: #e6f4ea;
	color: #1e8e3e;
}

.out-stock {
	background: #fce8e6;
	color: #d93025;
}

/* Responsive */
@media ( max-width : 991px) {
	.filter-section {
		position: static;
		margin-bottom: 50px;
	}
	.search-wrapper {
		display: none;
	}
	.header-area {
		flex-direction: column;
		align-items: flex-start;
		gap: 15px;
	}
}
</style>
</head>
<body>

	<!-- NAVBAR (Glassmorphism) -->
	<nav class="navbar-premium">
		<div class="container">
			<div class="nav-inner">
				<a href="index" class="logo-brand">Smart<span>Logistics</span></a>

				<form action="searchProduct" method="get" class="search-wrapper">
					<i class="fa-solid fa-magnifying-glass search-icon"></i> <input
						type="text" name="keyword" class="search-input"
						placeholder="Search products..." required>
				</form>

				<div>
					<a href="customerdashboard" class="nav-link-text">Dashboard</a> <a
						href="cart" class="nav-link-text">Cart (0)</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container page-layout">
		<div class="row g-5">

			<div class="col-lg-3">
				<div class="filter-section">
					<h3 class="sidebar-title">Refine</h3>

					<form action="filterProducts" method="get">

						<div class="filter-group">
							<div class="filter-label">Category</div>

							<label class="custom-check"> <input type="checkbox"
								name="category" value="Electronics"> Electronics
							</label> <label class="custom-check"> <input type="checkbox"
								name="category" value="Fashion"> Fashion
							</label> <label class="custom-check"> <input type="checkbox"
								name="category" value="Furniture"> Furniture
							</label>
						</div>

						<div class="filter-group">
							<div class="filter-label">Price Range</div>
							<input type="text" name="minPrice" placeholder="Min"><br>
							<br> <input type="text" name="maxPrice" placeholder="Max">
						</div>

						<div class="filter-group">
							<label class="custom-check"> <input type="checkbox"
								name="inStock" value="true"> In Stock
							</label>
						</div>

						<button type="submit" class="btn-cart">Apply Filter</button>

					</form>
				</div>
			</div>

			<!-- PRODUCTS AREA -->
			<div class="col-lg-9">
				<div class="header-area">
					<div>
						<h2>The Collection</h2>
						<p>Curated pieces for a modern lifestyle.</p>
					</div>
					<div>
						<form action="sortProducts" method="get">
							<select name="sort" onchange="this.form.submit()">
								<option value="">Sort By</option>
								<option value="low">Price Low to High</option>
								<option value="high">Price High to Low</option>
							</select>
						</form>
					</div>
				</div>

				<!-- JSP LOGIC START -->
				<c:choose>
					<c:when test="${not empty products}">
						<div class="row g-4">
							<c:forEach var="p" items="${products}">
								<div class="col-lg-4 col-md-6">
									<div class="prod-card">

										<div class="badge-new">New Arrival</div>

										<div class="card-actions">

											<c:if test="${sessionScope.role == 'CUSTOMER'}">
												<a href="addToWishlist?productId=${p.id}"
													class="action-circle" title="Wishlist"> <i
													class="fa-regular fa-heart"></i>
												</a>
											</c:if>

											<a href="productDetails?productId=${p.id}"
												class="action-circle" title="View"> <i
												class="fa-regular fa-eye"></i>
											</a>

											<c:if test="${sessionScope.role == 'ADMIN'}">
												<a href="editProduct?id=${p.id}" class="action-circle"
													title="Edit"> <i class="fa-solid fa-pen"></i>
												</a>

												<a href="deleteProduct?id=${p.id}" class="action-circle"
													title="Delete"
													onclick="return confirm('Delete this product?')"> <i
													class="fa-solid fa-trash"></i>
												</a>
											</c:if>

										</div>

										<div class="prod-img-container">
											<div id="carousel${p.id}" class="carousel slide"
												data-bs-ride="carousel">
												<div class="carousel-inner">

													<div class="carousel-item active">
														<img
															src="${pageContext.request.contextPath}/Images/${p.img1}"
															class="d-block w-100 prod-img">
													</div>

													<c:if test="${not empty p.img2}">
														<div class="carousel-item">
															<img
																src="${pageContext.request.contextPath}/Images/${p.img2}"
																class="d-block w-100 prod-img">
														</div>
													</c:if>

													<c:if test="${not empty p.img3}">
														<div class="carousel-item">
															<img
																src="${pageContext.request.contextPath}/Images/${p.img3}"
																class="d-block w-100 prod-img">
														</div>
													</c:if>

												</div>

												<button class="carousel-control-prev" type="button"
													data-bs-target="#carousel${p.id}" data-bs-slide="prev">
													<span class="carousel-control-prev-icon"></span>
												</button>

												<button class="carousel-control-next" type="button"
													data-bs-target="#carousel${p.id}" data-bs-slide="next">
													<span class="carousel-control-next-icon"></span>
												</button>
											</div>
										</div>
										<div class="card-body">
											<span class="cat-tag">${p.category}</span> <a
												href="productDetails?productId=${p.id}" class="prod-name">${p.name}</a>

											<div class="price-wrapper">
												<span class="price-curr">₹</span> <span class="price-val">${p.price}</span>
												<c:if test="${p.quantity <= 0}">
													<span class="stock-pill out-stock">Sold Out</span>
												</c:if>
											</div>

											<c:if
												test="${sessionScope.role == 'CUSTOMER' && p.quantity > 0}">
												<form action="addToCart" method="post">
													<input type="hidden" name="productId" value="${p.id}">
													<button type="submit" class="btn-cart">Add to Bag</button>
												</form>
											</c:if>

											<c:if test="${p.quantity <= 0}">
												<button disabled class="btn-cart"
													style="opacity: 0.5; cursor: not-allowed;">Out of
													Stock</button>
											</c:if>
										</div>

									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>

					<c:otherwise>
						<div
							style="text-align: center; padding: 80px; background: #fff; border-radius: 20px; border: 1px solid var(--border-color);">
							<i class="fa-regular fa-folder-open"
								style="font-size: 50px; color: var(--border-color); margin-bottom: 20px;"></i>
							<h3
								style="font-family: 'Cormorant Garamond', serif; font-size: 28px;">Collection
								Empty</h3>
							<p style="color: var(--text-muted);">We are currently
								updating our inventory.</p>
						</div>
					</c:otherwise>
				</c:choose>


			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>