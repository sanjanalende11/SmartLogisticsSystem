<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer Dashboard | SmartLogisticsSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<!-- Matching Fonts from Landing Page -->
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap"
	rel="stylesheet">

<style>
:root {
	--bg-body: #ffffff;
	--bg-light: #fafafa;
	--text-main: #1a1a1a;
	--text-muted: #777777;
	--accent-gold: #c5a059;
	--border-color: #e5e5e5;
	--shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
	--transition: all 0.3s ease;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Lato', sans-serif;
	background: var(--bg-light);
	color: var(--text-main);
	min-height: 100vh;
}

h1, h2, h3, h4, h5, h6, .serif-font {
	font-family: 'Playfair Display', serif;
	font-weight: 600;
	color: var(--text-main);
}

a {
	text-decoration: none;
	color: inherit;
	transition: var(--transition);
}

/* ========== NAVBAR (Same as Landing Page) ========== */
.navbar-bella {
	background: rgba(255, 255, 255, 0.98);
	border-bottom: 1px solid var(--border-color);
	padding: 20px 0;
	position: sticky;
	top: 0;
	z-index: 1000;
}

.nav-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.logo-bella {
	font-family: 'Playfair Display', serif;
	font-size: 26px;
	font-weight: 700;
	letter-spacing: -0.5px;
	color: var(--text-main);
}

.logo-bella span {
	color: var(--accent-gold);
}

.nav-actions {
	display: flex;
	gap: 15px;
	align-items: center;
}

.nav-btn-ghost {
	background: transparent;
	color: var(--text-main);
	padding: 10px 20px;
	border-radius: 4px;
	font-weight: 600;
	font-size: 13px;
	border: 1px solid var(--border-color);
}

.nav-btn-ghost:hover {
	border-color: var(--accent-gold);
	color: var(--accent-gold);
}

/* ========== DASHBOARD CONTAINER ========== */
.dashboard-container {
	padding: 60px 0 100px;
}

/* ========== HERO BOX (Clean Style) ========== */
.hero-box {
	background: #fff;
	border: 1px solid var(--border-color);
	border-radius: 12px;
	padding: 50px;
	text-align: center;
	box-shadow: var(--shadow);
	margin-bottom: 50px;
	position: relative;
	overflow: hidden;
}

.hero-box::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 5px;
	background: var(--accent-gold);
}

.page-title {
	font-size: 42px;
	margin-bottom: 15px;
	color: var(--text-main);
}

.page-subtitle {
	color: var(--text-muted);
	max-width: 700px;
	margin: 0 auto 30px;
	font-size: 16px;
	font-weight: 300;
}

/* ========== STATS CARDS (Minimalist) ========== */
.stats-row {
	margin-bottom: 50px;
}

.stat-card {
	background: #fff;
	border: 1px solid var(--border-color);
	border-radius: 12px;
	padding: 30px;
	text-align: center;
	transition: var(--transition);
	height: 100%;
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: var(--shadow);
	border-color: var(--accent-gold);
}

.stat-icon {
	font-size: 32px;
	color: var(--accent-gold);
	margin-bottom: 15px;
}

.stat-value {
	font-family: 'Playfair Display', serif;
	font-size: 28px;
	font-weight: 700;
	margin-bottom: 5px;
}

.stat-label {
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 1px;
	color: var(--text-muted);
}

/* ========== ACTION CARDS ========== */
.section-header {
	margin-bottom: 30px;
	font-size: 24px;
	border-left: 4px solid var(--accent-gold);
	padding-left: 15px;
}

.action-card {
	background: #fff;
	border: 1px solid var(--border-color);
	border-radius: 12px;
	padding: 40px 20px;
	text-align: center;
	transition: var(--transition);
	height: 100%;
	position: relative;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.action-card:hover {
	box-shadow: var(--shadow);
	border-color: var(--accent-gold);
}

.action-icon-circle {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	background: #fdfcf8;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 28px;
	color: var(--accent-gold);
	margin-bottom: 20px;
	transition: 0.3s;
}

.action-card:hover .action-icon-circle {
	background: var(--accent-gold);
	color: #fff;
}

.action-card h4 {
	font-size: 18px;
	margin-bottom: 10px;
	color: var(--text-main);
}

.action-card p {
	font-size: 14px;
	color: var(--text-muted);
	margin-bottom: 25px;
	min-height: 40px;
}

.action-btn-link {
	display: inline-block;
	padding: 12px 28px;
	background-color: var(--text-main);
	color: #fff;
	border-radius: 4px;
	font-size: 12px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 1px;
	transition: 0.3s;
}

.action-btn-link:hover {
	background-color: var(--accent-gold);
	transform: translateY(-2px);
}

/* ========== INFO PANEL (Clean) ========== */
.info-panel {
	background: #fff;
	border: 1px solid var(--border-color);
	border-radius: 12px;
	padding: 40px;
	margin-top: 50px;
}

.info-panel h4 {
	margin-bottom: 20px;
}

.info-item {
	display: flex;
	gap: 15px;
	align-items: center;
	margin-bottom: 15px;
	padding-bottom: 15px;
	border-bottom: 1px solid #f5f5f5;
}

.info-item:last-child {
	border-bottom: none;
	margin-bottom: 0;
	padding-bottom: 0;
}

.info-item i {
	color: var(--accent-gold);
	font-size: 16px;
}

@media ( max-width :768px) {
	.hero-box {
		padding: 30px 20px;
	}
	.page-title {
		font-size: 32px;
	}
}
</style>
</head>

<body>

	<!-- NAVBAR -->
	<nav class="navbar-bella">
		<div class="container">
			<div class="nav-inner">
				<a href="index.jsp" class="logo-bella">Smart<span>Logistics</span></a>
				<div class="nav-actions">
					<a href="cart" class="nav-btn-ghost"><i
						class="fa-solid fa-cart-shopping me-2"></i> My Cart</a> <a
						href="index.jsp" class="nav-btn-ghost"><i
						class="fa-solid fa-right-from-bracket me-2"></i> Logout</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container dashboard-container">

		<!-- HERO -->
		<div class="hero-box">
			<div class="page-title">Welcome ${username} </div>
			<div class="page-subtitle">Manage your shopping journey,
				explore products, view your cart, place orders, and track everything
				from your clean customer dashboard.</div>
			<div style="font-size: 14px; color: #888; margin-bottom: 20px;">
				<i class="fa-solid fa-location-dot me-2"
					style="color: var(--accent-gold)"></i> Delivering to: <strong>${address}</strong>
			</div>
		</div>

		<!-- QUICK STATS -->
		<div class="row g-4 stats-row">
			<div class="col-md-3 col-6">
				<a href="productList" style="text-decoration: none;">
					<div class="stat-card">
						<div class="stat-icon">
							<i class="fa-solid fa-store"></i>
						</div>
						<div class="stat-value">New</div>
						<div class="stat-label">Arrivals</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 col-6">
				<a href="myOrders" style="text-decoration: none;">
					<div class="stat-card">
						<div class="stat-icon">
							<i class="fa-solid fa-box"></i>
						</div>
						<div class="stat-value">Track</div>
						<div class="stat-label">Orders</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 col-6">
				<a href="orderPage" style="text-decoration: none;">
					<div class="stat-card">
						<div class="stat-icon">
							<i class="fa-solid fa-truck-fast"></i>
						</div>
						<div class="stat-value">Fast</div>
						<div class="stat-label">Delivery</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 col-6">
				<a href="wishlist" style="text-decoration: none;">
					<div class="stat-card">
						<div class="stat-icon">
							<i class="fa-solid fa-heart"></i>
						</div>
						<div class="stat-value">Saved</div>
						<div class="stat-label">Wishlist</div>
					</div>
				</a>
			</div>
		</div>

		<!-- ACTIONS -->
		<div class="section-header">Quick Actions</div>

		<div class="row g-4">

			<!-- VIEW PRODUCTS -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-layer-group"></i>
					</div>
					<h4>View Products</h4>
					<p>Browse all products added by admin and start shopping.</p>
					<a href="productList" class="action-btn-link">Browse Products</a>
				</div>
			</div>

			<!-- MY CART -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-cart-plus"></i>
					</div>
					<h4>My Cart</h4>
					<p>Review items you have selected for purchase.</p>
					<a href="cart" class="action-btn-link">Open Cart</a>
				</div>
			</div>

			<!-- PLACE ORDER -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-credit-card"></i>
					</div>
					<h4>Place Order</h4>
					<p>Proceed to checkout and finalize your purchase.</p>
					<a href="orderPage" class="action-btn-link">Checkout</a>
				</div>
			</div>

			<!-- VIEW ORDERS -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-box-open"></i>
					</div>
					<h4>My Orders</h4>
					<p>Track all your past and current shipments.</p>
					<a href="${pageContext.request.contextPath}/myOrders" class="action-btn-link">View Orders</a>
				</div>
			</div>

		</div>

		<!-- INFO PANEL -->
		<div class="info-panel">
			<h4>Customer Shopping Access Is Now Available</h4>
			<p style="color: #666; margin-bottom: 20px;">We have updated the
				system to ensure you have direct access to all shopping features
				from a clean, centralized dashboard.</p>

			<div class="info-item">
				<i class="fa-solid fa-circle-check"></i>
				<div>
					Customer can now open the full product list using the <strong>View
						Products</strong> button.
				</div>
			</div>
			<div class="info-item">
				<i class="fa-solid fa-circle-check"></i>
				<div>
					Direct access to <strong>My Cart</strong> for reviewing items
					before checkout.
				</div>
			</div>
			<div class="info-item">
				<i class="fa-solid fa-circle-check"></i>
				<div>
					Seamless <strong>Order Tracking</strong> integration available.
				</div>
			</div>
		</div>

	</div>

</body>
</html>