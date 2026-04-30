<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | SmartLogisticsSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<!-- Matching Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap"
	rel="stylesheet">

<style>
:root {
	/* Bella Theme Palette */
	--bg-body: #fffbf7; /* Warm Bone White */
	--bg-card: #ffffff;
	--text-main: #1a1a1a;
	--text-muted: #777777;
	--accent-gold: #c5a059;
	--accent-gold-light: #e6c8a3;
	--border-color: #f0f0f0;
	--shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
	--transition: all 0.4s ease;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Lato', sans-serif;
	background: var(--bg-body);
	color: var(--text-main);
	min-height: 100vh;
}

h1, h2, h3, h4, h5, h6, .serif-font {
	font-family: 'Playfair Display', serif;
	font-weight: 600;
	color: var(--text-main);
	letter-spacing: -0.5px;
}

a {
	text-decoration: none;
	color: inherit;
	transition: var(--transition);
}

/* ========== NAVBAR (Matches Customer Dashboard) ========== */
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

/* ========== PAGE WRAPPER ========== */
.dashboard-container {
	padding: 60px 0 100px;
}

/* ========== HERO BOX ========== */
.hero-box {
	background: var(--bg-card);
	border: 1px solid var(--border-color);
	border-radius: 12px;
	padding: 50px;
	text-align: center;
	box-shadow: var(--shadow);
	margin-bottom: 50px;
	position: relative;
}
/* Gold top accent */
.hero-box::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 4px;
	background: var(--accent-gold);
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
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
	background: var(--bg-card);
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

/* ========== SECTION LAYOUT ========== */
.section-header {
	margin-bottom: 30px;
	font-size: 24px;
	border-left: 4px solid var(--accent-gold);
	padding-left: 15px;
}

/* ========== ACTION CARDS (Elegant) ========== */
.action-card {
	background: var(--bg-card);
	border: 1px solid var(--border-color);
	border-radius: 12px;
	padding: 40px 20px;
	text-align: center;
	transition: var(--transition);
	height: 100%;
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
	margin-bottom: 25px;
	transition: 0.3s;
	border: 1px solid transparent;
}

.action-card:hover .action-icon-circle {
	background: var(--accent-gold);
	color: #fff;
	border-color: var(--accent-gold);
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
	min-height: 44px;
}

.btn-action {
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

.btn-action:hover {
	background-color: var(--accent-gold);
	transform: translateY(-2px);
}

/* ========== INFO PANEL ========== */
.info-panel {
	background: var(--bg-card);
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
	.action-card {
		padding: 30px 15px;
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
					<a href="productList" class="nav-btn-ghost">Products</a> <a
						href="admin/viewShipment" class="nav-btn-ghost">Shipments</a> <a
						href="login" class="nav-btn-ghost"><i
						class="fa-solid fa-right-from-bracket"></i> Logout</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container dashboard-container">

		<!-- HERO -->
		<div class="hero-box">
			<div class="page-title">Welcome Admin</div>
			<div class="page-subtitle">Manage products, oversee shipments,
				handle driver operations, and track system health from your clean,
				centralized control panel.</div>
		</div>

		<div
			class="alert alert-warning d-flex justify-content-between align-items-center mt-4">

			<div>
				<i class="fa-solid fa-bell"></i> <b>${newOrders}</b> New Orders
				Received
			</div>

			<a href="${pageContext.request.contextPath}/admin/orders"
				class="btn btn-dark btn-sm"> View Orders </a>

		</div>

		<!-- STATS -->
		<div class="row g-4 stats-row">
			<div class="col-lg-3 col-md-6">
				<div class="stat-card">
					<div class="stat-icon">
						<i class="fa-solid fa-box-open"></i>
					</div>
					<div class="stat-value">524</div>
					<div class="stat-label">Total Products</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="stat-card">
					<div class="stat-icon">
						<i class="fa-solid fa-cart-shopping"></i>
					</div>
					<div class="stat-value">1,280</div>
					<div class="stat-label">Total Orders</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="stat-card">
					<div class="stat-icon">
						<i class="fa-solid fa-truck-fast"></i>
					</div>
					<div class="stat-value">48</div>
					<div class="stat-label">Active Shipments</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="stat-card">
					<div class="stat-icon">
						<i class="fa-solid fa-users"></i>
					</div>
					<div class="stat-value">10.2K</div>
					<div class="stat-label">Users</div>
				</div>
			</div>
		</div>

		<!-- STORE MANAGEMENT -->
		<div class="section-header">Store Management</div>

		<div class="row g-4">
			<!-- ADD PRODUCT -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-plus"></i>
					</div>
					<h4>Add Product</h4>
					<p>List new products with name, category, price, quantity, and
						image upload.</p>
					<a href="addProduct" class="btn-action">Create Item</a>
				</div>
			</div>

			<!-- VIEW PRODUCTS -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-layer-group"></i>
					</div>
					<h4>Manage Products</h4>
					<p>Browse, edit, delete and manage stock of all listed
						products.</p>
					<a href="productList" class="btn-action">Manage</a>
				</div>
			</div>


			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-tags"></i>
					</div>
					<h4>Categories</h4>
					<p>Organize product categories, add new ones, and keep your
						catalog structured.</p>
					<button disabled class="btn-action"
						style="background: #eee; color: #888; cursor: not-allowed;">Coming
						Soon</button>
				</div>
			</div>

			<!-- SYSTEM HEALTH (Quick View) -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-server"></i>
					</div>
					<h4>System Status</h4>
					<p>Check server uptime, database connections, and payment
						gateway health.</p>
					<button class="btn-action" onclick="alert('System Healthy')">Check
						Status</button>
				</div>
			</div>
		</div>

		<!-- LOGISTICS MANAGEMENT -->
		<div class="section-header" style="margin-top: 50px;">Logistics
			& Operations</div>

		<div class="row g-4">
			<!-- MANAGE ORDERS -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-cart-shopping"></i>
					</div>
					<h4>Manage Orders</h4>
					<p>View all customer orders, verify order details, and start
						shipment processing.</p>
					<a href="admin/orders" class="btn-action">View Orders</a>
				</div>
			</div>

			<!-- CREATE SHIPMENT -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-truck-ramp-box"></i>
					</div>
					<h4>Create Shipment</h4>
					<p>Create shipment records for customer orders and organize
						logistics efficiently.</p>
					<a href="admin/orders" class="btn-action">Select Order</a>
				</div>
			</div>

			<!-- VIEW SHIPMENTS -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-route"></i>
					</div>
					<h4>View Shipments</h4>
					<p>Monitor shipment status, dispatch details, and track
						delivery from one place.</p>
					<a href="admin/viewShipment" class="btn-action">Track Fleet</a>
				</div>
			</div>

			<!-- DRIVER DASHBOARD -->
			<div class="col-lg-3 col-md-6">
				<div class="action-card">
					<div class="action-icon-circle">
						<i class="fa-solid fa-motorcycle"></i>
					</div>
					<h4>Driver Ops</h4>
					<p>Manage delivery assignments, update progress, and monitor
						driver tasks.</p>
					<a href="driverdashboard" class="btn-action">Manage Team</a>
				</div>
			</div>
		</div>

		<!-- INFO PANEL -->
		<div class="info-panel">
			<h4>Admin Control Center Guide</h4>
			<p style="color: #666; margin-bottom: 20px;">Use the cards above
				to navigate the main administrative functions. All features are
				integrated into this unified dashboard.</p>

			<div class="info-item">
				<i class="fa-solid fa-circle-check"></i>
				<div>
					Use <strong>Add Product</strong> to populate the customer
					marketplace.
				</div>
			</div>
			<div class="info-item">
				<i class="fa-solid fa-circle-check"></i>
				<div>
					Use <strong>Create Shipment</strong> to start the delivery process.
				</div>
			</div>
			<div class="info-item">
				<i class="fa-solid fa-circle-check"></i>
				<div>
					Monitor <strong>Driver Dashboard</strong> to ensure timely
					deliveries.
				</div>
			</div>
		</div>

	</div>

</body>
</html>