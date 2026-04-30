<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap"
	rel="stylesheet">

<style>
:root {
	--bg-body: #ffffff;
	--bg-light: #fcfcfc;
	--bg-alt: #fafafa;
	--text-main: #1a1a1a;
	--text-muted: #777777;
	--accent-gold: #c5a059;
	--border-color: #f0f0f0;
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
	overflow-x: hidden;
	line-height: 1.7;
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

/* ========== ANIMATIONS ========== */
@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* ========== BUTTONS ========== */
.btn-custom {
	display: inline-block;
	padding: 14px 36px;
	background-color: var(--text-main);
	color: #fff;
	text-transform: uppercase;
	font-size: 12px;
	font-weight: 700;
	letter-spacing: 1.5px;
	border: 1px solid var(--text-main);
	border-radius: 2px;
	cursor: pointer;
	transition: var(--transition);
}

.btn-custom:hover {
	background-color: transparent;
	color: var(--text-main);
}

.btn-custom-outline {
	background-color: transparent;
	color: var(--text-main);
	border: 1px solid var(--border-color);
}

.btn-custom-outline:hover {
	background-color: var(--text-main);
	color: #fff;
	border-color: var(--text-main);
}

.btn-sm-custom {
	padding: 8px 20px;
	font-size: 11px;
	letter-spacing: 1px;
}

/* ========== NAVBAR ========== */
.navbar-bella {
	background: rgba(255, 255, 255, 0.98);
	border-bottom: 1px solid transparent;
	padding: 25px 0;
	position: sticky;
	top: 0;
	z-index: 1000;
	transition: 0.4s;
}

.navbar-bella.scrolled {
	padding: 15px 0;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
	border-bottom: 1px solid var(--border-color);
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

.nav-menu-bella {
	display: flex;
	align-items: center;
	gap: 35px;
}

.nav-link-bella {
	font-size: 13px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	color: var(--text-main);
	position: relative;
}

.nav-link-bella::after {
	content: '';
	position: absolute;
	width: 0;
	height: 2px;
	bottom: -5px;
	left: 0;
	background-color: var(--accent-gold);
	transition: width 0.3s;
}

.nav-link-bella:hover::after {
	width: 100%;
}

.nav-link-bella.active::after {
	width: 100%;
}

.nav-icons-bella {
	display: flex;
	align-items: center;
	gap: 25px;
}

.nav-icon-item {
	font-size: 18px;
	color: var(--text-main);
	position: relative;
	cursor: pointer;
	transition: 0.3s;
}

.nav-icon-item:hover {
	color: var(--accent-gold);
}

.cart-badge-bella {
	position: absolute;
	top: -6px;
	right: -8px;
	background-color: var(--accent-gold);
	color: #fff;
	font-size: 10px;
	width: 16px;
	height: 16px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* ========== PAGE HEADER ========== */
.page-header-bella {
	padding: 60px 0 40px;
	background: var(--bg-body);
	border-bottom: 1px solid var(--border-color);
	text-align: center;
}

.page-header-bella .section-tag {
	font-size: 11px;
	color: var(--accent-gold);
	text-transform: uppercase;
	letter-spacing: 3px;
	font-weight: 700;
	margin-bottom: 10px;
	display: block;
}

.page-header-bella h1 {
	font-size: 38px;
	margin-bottom: 12px;
}

.page-header-bella p {
	font-size: 16px;
	color: var(--text-muted);
	font-weight: 300;
	max-width: 500px;
	margin: 0 auto;
}

/* ========== DASHBOARD SECTION ========== */
.dashboard-section {
	padding: 60px 0 90px;
}

/* ========== STAT CARDS ========== */
.stat-card-bella {
	background: var(--bg-body);
	border: 1px solid var(--border-color);
	border-radius: 4px;
	padding: 30px;
	text-align: center;
	transition: var(--transition);
	position: relative;
	overflow: hidden;
}

.stat-card-bella::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 3px;
	background: var(--accent-gold);
	transform: scaleX(0);
	transform-origin: left;
	transition: transform 0.5s ease;
}

.stat-card-bella:hover::before {
	transform: scaleX(1);
}

.stat-card-bella:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.06);
}

.stat-icon {
	width: 50px;
	height: 50px;
	border: 1px solid var(--border-color);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 18px;
	color: var(--accent-gold);
	font-size: 18px;
	transition: 0.3s;
}

.stat-card-bella:hover .stat-icon {
	background: var(--accent-gold);
	color: #fff;
	border-color: var(--accent-gold);
}

.stat-number {
	font-family: 'Playfair Display', serif;
	font-size: 32px;
	font-weight: 700;
	color: var(--text-main);
	margin-bottom: 4px;
}

.stat-label {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2px;
	color: var(--text-muted);
	font-weight: 700;
}

/* ========== TABLE ========== */
.table-wrapper-bella {
	background: var(--bg-body);
	border: 1px solid var(--border-color);
	border-radius: 4px;
	overflow: hidden;
	box-shadow: 0 5px 25px rgba(0, 0, 0, 0.02);
}

.table-header-bella {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 25px 30px;
	border-bottom: 1px solid var(--border-color);
	flex-wrap: wrap;
	gap: 15px;
}

.table-header-bella h3 {
	font-size: 20px;
	margin: 0;
}

.table-header-bella .table-count {
	font-size: 12px;
	color: var(--text-muted);
	font-weight: 400;
	margin-left: 12px;
	font-family: 'Lato', sans-serif;
}

.table-search {
	display: flex;
	align-items: center;
	gap: 10px;
	background: var(--bg-light);
	border: 1px solid var(--border-color);
	border-radius: 2px;
	padding: 8px 16px;
	transition: 0.3s;
}

.table-search:focus-within {
	border-color: var(--accent-gold);
}

.table-search i {
	color: var(--text-muted);
	font-size: 13px;
}

.table-search input {
	border: none;
	background: transparent;
	outline: none;
	font-size: 13px;
	color: var(--text-main);
	font-family: 'Lato', sans-serif;
	width: 200px;
}

.table-search input::placeholder {
	color: #bbb;
}

.table-bella {
	width: 100%;
	border-collapse: collapse;
}

.table-bella thead th {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 1.5px;
	font-weight: 700;
	color: var(--text-muted);
	padding: 18px 30px;
	border-bottom: 1px solid var(--border-color);
	background: var(--bg-light);
	text-align: left;
	font-family: 'Lato', sans-serif;
}

.table-bella tbody tr {
	transition: 0.3s;
	border-bottom: 1px solid var(--border-color);
}

.table-bella tbody tr:last-child {
	border-bottom: none;
}

.table-bella tbody tr:hover {
	background: #fdfdfc;
}

.table-bella tbody td {
	padding: 20px 30px;
	font-size: 14px;
	color: var(--text-main);
	vertical-align: middle;
}

.shipment-id-cell {
	font-weight: 700;
	font-family: 'Lato', sans-serif;
	color: var(--text-main);
	font-size: 14px;
}

.shipment-id-cell i {
	color: var(--accent-gold);
	margin-right: 8px;
	font-size: 13px;
}

.order-id-cell {
	color: var(--text-muted);
	font-size: 13px;
	font-weight: 400;
}

.driver-cell {
	display: flex;
	align-items: center;
	gap: 12px;
}

.driver-avatar {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	background: var(--bg-alt);
	border: 1px solid var(--border-color);
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(--accent-gold);
	font-size: 13px;
	font-weight: 700;
	flex-shrink: 0;
}

.driver-name {
	font-weight: 400;
	font-size: 14px;
}

/* Status Badges */
.status-badge {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	padding: 6px 16px;
	border-radius: 2px;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	font-family: 'Lato', sans-serif;
}

.status-badge .status-dot {
	width: 6px;
	height: 6px;
	border-radius: 50%;
	display: inline-block;
}

.status-delivered {
	background: #f0faf4;
	color: #1a7a42;
}

.status-delivered .status-dot {
	background: #1a7a42;
}

.status-in-transit {
	background: #fff8eb;
	color: #b8860b;
}

.status-in-transit .status-dot {
	background: #b8860b;
	animation: pulse-dot 1.5s ease-in-out infinite;
}

.status-pending {
	background: #f5f5f5;
	color: #888;
}

.status-pending .status-dot {
	background: #888;
}

.status-cancelled {
	background: #fdf2f2;
	color: #c0392b;
}

.status-cancelled .status-dot {
	background: #c0392b;
}

@
keyframes pulse-dot { 0%, 100% {
	opacity: 1;
	transform: scale(1);
}

50
%
{
opacity
:
0.4;
transform
:
scale(
0.7
);
}
}

/* Row Action */
.row-action-btn {
	width: 34px;
	height: 34px;
	border: 1px solid var(--border-color);
	border-radius: 2px;
	background: transparent;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	color: var(--text-muted);
	cursor: pointer;
	transition: 0.3s;
	font-size: 13px;
}

.row-action-btn:hover {
	border-color: var(--accent-gold);
	color: var(--accent-gold);
	background: #fdf8ef;
}

/* Empty State */
.empty-state {
	text-align: center;
	padding: 80px 30px;
}

.empty-state i {
	font-size: 48px;
	color: var(--border-color);
	margin-bottom: 20px;
}

.empty-state h4 {
	font-size: 20px;
	margin-bottom: 8px;
}

.empty-state p {
	color: var(--text-muted);
	font-size: 14px;
	font-weight: 300;
}

/* ========== FOOTER ========== */
.footer-bella {
	background-color: #111;
	color: #fff;
	padding: 80px 0 30px;
}

.footer-logo {
	font-family: 'Playfair Display', serif;
	font-size: 24px;
	margin-bottom: 20px;
	display: block;
	color: #fff;
}

.footer-heading {
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 2px;
	margin-bottom: 25px;
	color: #fff;
}

.footer-links li {
	list-style: none;
	margin-bottom: 12px;
}

.footer-links a {
	color: #888;
	font-size: 14px;
	transition: 0.3s;
}

.footer-links a:hover {
	color: #fff;
	padding-left: 5px;
}

.newsletter-input {
	background: transparent;
	border: none;
	border-bottom: 1px solid #333;
	padding: 12px 0;
	width: 100%;
	color: #fff;
	outline: none;
	margin-bottom: 20px;
}

.newsletter-input:focus {
	border-color: #fff;
}

.copyright {
	border-top: 1px solid #222;
	margin-top: 60px;
	padding-top: 30px;
	font-size: 12px;
	color: #666;
	text-align: center;
}

/* Reveal Utility */
.reveal-up {
	opacity: 0;
	transform: translateY(40px);
	transition: all 0.8s ease-out;
}

.reveal-up.active {
	opacity: 1;
	transform: translateY(0);
}

/* Filter Tabs */
.filter-tabs {
	display: flex;
	gap: 0;
	border: 1px solid var(--border-color);
	border-radius: 2px;
	overflow: hidden;
}

.filter-tab {
	padding: 8px 20px;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	color: var(--text-muted);
	cursor: pointer;
	transition: 0.3s;
	border: none;
	background: var(--bg-body);
	font-family: 'Lato', sans-serif;
	border-right: 1px solid var(--border-color);
}

.filter-tab:last-child {
	border-right: none;
}

.filter-tab:hover {
	color: var(--text-main);
	background: var(--bg-light);
}

.filter-tab.active {
	background: var(--text-main);
	color: #fff;
}

/* Responsive */
@media ( max-width : 991px) {
	.nav-menu-bella {
		display: none;
	}
	.page-header-bella h1 {
		font-size: 30px;
	}
	.table-bella thead th, .table-bella tbody td {
		padding: 14px 18px;
	}
	.table-search input {
		width: 150px;
	}
	.table-header-bella {
		padding: 20px;
	}
}

@media ( max-width : 767px) {
	.table-wrapper-bella {
		overflow-x: auto;
	}
	.table-bella {
		min-width: 700px;
	}
	.table-header-bella {
		flex-direction: column;
		align-items: flex-start;
	}
	.stat-number {
		font-size: 26px;
	}
	.filter-tabs {
		overflow-x: auto;
		flex-wrap: nowrap;
	}
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar-bella" id="mainNav">
		<div class="container">
			<div class="nav-inner">
				<div class="d-lg-none me-3">
					<i class="fa-solid fa-bars"></i>
				</div>
				<a href="index.jsp" class="logo-bella">Smart<span>Logistics</span></a>
				<div class="nav-menu-bella">
					<a href="index.jsp" class="nav-link-bella">Home</a> <a
						href="productList" class="nav-link-bella">Shop</a> <a href="#"
						class="nav-link-bella">Collections</a> <a href="#"
						class="nav-link-bella">About Us</a> <a href="#"
						class="nav-link-bella">Contact</a>
				</div>
				<div class="nav-icons-bella">
					<div class="nav-icon-item">
						<i class="fa-solid fa-magnifying-glass"></i>
					</div>
					<a href="login" class="nav-icon-item"><i
						class="fa-regular fa-user"></i></a> <a href="#" class="nav-icon-item">
						<i class="fa-solid fa-bag-shopping"></i> <span
						class="cart-badge-bella">2</span>
					</a>
				</div>
			</div>
		</div>
	</nav>

	<!-- Page Header -->
	<section class="page-header-bella">
		<div class="container">
			<span class="section-tag">Dashboard</span>
			<h1>Driver Shipments</h1>
			<p>Track and manage all active and completed deliveries in one
				place.</p>
		</div>
	</section>

	<!-- Dashboard Content -->
	<section class="dashboard-section">
		<div class="container">

			<!-- Stat Cards -->
			<div class="row g-4 mb-5">
				<div class="col-6 col-lg-3 reveal-up">
					<div class="stat-card-bella">
						<div class="stat-icon">
							<i class="fa-solid fa-box"></i>
						</div>
						<div class="stat-number">${list.size()}</div>
						<div class="stat-label">Total Shipments</div>
					</div>
				</div>
				<div class="col-6 col-lg-3 reveal-up">
					<div class="stat-card-bella">
						<div class="stat-icon">
							<i class="fa-solid fa-truck-fast"></i>
						</div>
						<div class="stat-number" id="transitCount">0</div>
						<div class="stat-label">In Transit</div>
					</div>
				</div>
				<div class="col-6 col-lg-3 reveal-up">
					<div class="stat-card-bella">
						<div class="stat-icon">
							<i class="fa-solid fa-circle-check"></i>
						</div>
						<div class="stat-number" id="deliveredCount">0</div>
						<div class="stat-label">Delivered</div>
					</div>
				</div>
				<div class="col-6 col-lg-3 reveal-up">
					<div class="stat-card-bella">
						<div class="stat-icon">
							<i class="fa-solid fa-clock"></i>
						</div>
						<div class="stat-number" id="pendingCount">0</div>
						<div class="stat-label">Pending</div>
					</div>
				</div>
			</div>

			<!-- Shipment Table -->
			<div class="reveal-up">
				<div class="table-wrapper-bella">
					<div class="table-header-bella">
						<div
							style="display: flex; align-items: center; flex-wrap: wrap; gap: 15px;">
							<h3>
								All Shipments<span class="table-count">(${list.size()}
									records)</span>
							</h3>
							<div class="filter-tabs">
								<button class="filter-tab active" data-filter="all">All</button>
								<button class="filter-tab" data-filter="In Transit">Transit</button>
								<button class="filter-tab" data-filter="Delivered">Delivered</button>
								<button class="filter-tab" data-filter="Pending">Pending</button>
							</div>
						</div>
						<div class="table-search">
							<i class="fa-solid fa-magnifying-glass"></i> <input type="text"
								id="tableSearchInput" placeholder="Search shipments...">
						</div>
					</div>

					<c:choose>
						<c:when test="${not empty list}">
							<table class="table-bella" id="shipmentTable">
								<thead>
									<tr>
										<th>Shipment ID</th>
										<th>Order ID</th>
										<th>Driver</th>
										<th>Status</th>
										<th style="text-align: right;">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="s" items="${list}">
										<tr data-status="${s.status}">
											<td><span class="shipment-id-cell"> <i
													class="fa-solid fa-cube"></i> #${s.id}
											</span></td>
											<td><span class="order-id-cell">${s.orderId}</span></td>
											<td>
												<div class="driver-cell">
													<div class="driver-avatar">
														${fn:substring(s.driverName, 0, 1)}</div>
													<span class="driver-name">${s.driverName}</span>
												</div>
											</td>
											<td><c:choose>
													<c:when test="${s.status == 'Delivered'}">
														<span class="status-badge status-delivered"> <span
															class="status-dot"></span>Delivered
														</span>
													</c:when>
													<c:when test="${s.status == 'In Transit'}">
														<span class="status-badge status-in-transit"> <span
															class="status-dot"></span>In Transit
														</span>
													</c:when>
													<c:when test="${s.status == 'Cancelled'}">
														<span class="status-badge status-cancelled"> <span
															class="status-dot"></span>Cancelled
														</span>
													</c:when>
													<c:otherwise>
														<span class="status-badge status-pending"> <span
															class="status-dot"></span>${s.status}
														</span>
													</c:otherwise>
												</c:choose></td>
											<td style="text-align: right;"><c:if
													test="${s.status ne 'Delivered' && s.status ne 'Cancelled'}">

													<form
														action="${pageContext.request.contextPath}/driver/updateShipmentStatus"
														method="post" class="d-flex gap-2 justify-content-end">

														<input type="hidden" name="shipmentId" value="${s.id}">
														<input type="hidden" name="orderId" value="${s.orderId}">

														<select name="status" class="form-select form-select-sm"
															style="width: 150px;">
															<option value="Pending"
																${s.status == 'Pending' ? 'selected' : ''}>Pending</option>
															<option value="In Transit"
																${s.status == 'In Transit' ? 'selected' : ''}>In
																Transit</option>
															<option value="Delivered">Delivered</option>
														</select>

														<button type="submit" class="btn btn-success btn-sm">
															Update</button>
													</form>

												</c:if> <c:if test="${s.status eq 'Delivered'}">
													<span class="badge bg-success">Completed</span>
												</c:if> <c:if test="${s.status eq 'Cancelled'}">
													<span class="badge bg-danger">Cancelled</span>
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<div class="empty-state">
								<i class="fa-solid fa-box-open"></i>
								<h4>No Shipments Found</h4>
								<p>There are currently no shipments assigned to this driver.</p>
								<a href="index" class="btn-custom btn-sm-custom"
									style="margin-top: 25px;">Back to Home</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</div>
	</section>

	<!-- FOOTER -->
	<footer class="footer-bella">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-4 col-md-6">
					<a href="index" class="footer-logo">SmartLogistics</a>
					<p style="color: #888; line-height: 1.8; max-width: 300px;">
						Bridging the gap between premium shopping experiences and robust
						logistics solutions. We deliver quality, efficiently.</p>
				</div>
				<div class="col-lg-2 col-md-6">
					<h5 class="footer-heading">Shop</h5>
					<ul class="footer-links p-0">
						<li><a href="#">New Arrivals</a></li>
						<li><a href="#">Best Sellers</a></li>
						<li><a href="#">Electronics</a></li>
						<li><a href="#">Home Decor</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6">
					<h5 class="footer-heading">Company</h5>
					<ul class="footer-links p-0">
						<li><a href="index">Home</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Track Order</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6">
					<h5 class="footer-heading">Newsletter</h5>
					<p style="color: #888; font-size: 14px; margin-bottom: 20px;">Subscribe
						for exclusive offers.</p>
					<form>
						<input type="email" placeholder="Your Email Address"
							class="newsletter-input">
						<button type="submit" class="btn-custom"
							style="background: #fff; color: #000; border: none;">Subscribe</button>
					</form>
				</div>
			</div>
			<div class="copyright">
				<p>&copy; 2026 SmartLogisticsSystem. All Rights Reserved.</p>
			</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    // Scroll Reveal Animation
    const revealElements = document.querySelectorAll('.reveal-up');
    const revealObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('active');
                revealObserver.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });
    revealElements.forEach(el => revealObserver.observe(el));

    // Navbar Scroll Effect
    const nav = document.getElementById('mainNav');
    window.addEventListener('scroll', () => {
        nav.classList.toggle('scrolled', window.scrollY > 50);
    });

    // Stat Counter Animation
    function animateCount(el, target) {
        let current = 0;
        const step = Math.max(1, Math.ceil(target / 30));
        const interval = setInterval(() => {
            current += step;
            if (current >= target) {
                current = target;
                clearInterval(interval);
            }
            el.textContent = current;
        }, 40);
    }

    // Compute counts from table rows
    const rows = document.querySelectorAll('#shipmentTable tbody tr');
    let transit = 0, delivered = 0, pending = 0;
    rows.forEach(r => {
        const status = r.getAttribute('data-status');
        if (status === 'In Transit') transit++;
        else if (status === 'Delivered') delivered++;
        else pending++;
    });

    // Trigger counter when stat cards become visible
    const statSection = document.querySelector('.stat-card-bella');
    if (statSection) {
        const statObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    animateCount(document.getElementById('transitCount'), transit);
                    animateCount(document.getElementById('deliveredCount'), delivered);
                    animateCount(document.getElementById('pendingCount'), pending);
                    statObserver.unobserve(entry.target);
                }
            });
        }, { threshold: 0.3 });
        statObserver.observe(statSection);
    }

    // Filter Tabs
    const filterTabs = document.querySelectorAll('.filter-tab');
    filterTabs.forEach(tab => {
        tab.addEventListener('click', function() {
            filterTabs.forEach(t => t.classList.remove('active'));
            this.classList.add('active');

            const filter = this.getAttribute('data-filter');
            rows.forEach(row => {
                if (filter === 'all' || row.getAttribute('data-status') === filter) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    });

   
    const searchInput = document.getElementById('tableSearchInput');
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const query = this.value.toLowerCase();
           
            
            filterTabs.forEach(t => t.classList.remove('active'));
            filterTabs[0].classList.add('active');

            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(query) ? '' : 'none';
            });
        });
    }
</script>

</body>
</html>