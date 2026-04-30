<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register | SmartLogisticsSystem</title>
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
	--bg-light: #f9fafc;
	--text-main: #1a1a1a;
	--text-muted: #777777;
	--accent-gold: #c5a059;
	--border-color: #f0f0f0;
	--shadow-soft: 0 20px 50px rgba(0, 0, 0, 0.04);
	--transition: all 0.3s ease;
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
	overflow-x: hidden;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Playfair Display', serif;
	font-weight: 600;
	color: var(--text-main);
	margin-bottom: 8px;
}

a {
	text-decoration: none;
	color: inherit;
	transition: var(--transition);
}

.navbar-bella {
	background: rgba(255, 255, 255, 0.98);
	border-bottom: 1px solid var(--border-color);
	padding: 18px 0;
	position: sticky;
	top: 0;
	z-index: 1000;
	transition: 0.4s;
}

.navbar-bella.scrolled {
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);
}

.nav-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 20px;
}

.logo-bella {
	font-family: 'Playfair Display', serif;
	font-size: 28px;
	font-weight: 700;
	letter-spacing: -0.5px;
	color: var(--text-main);
}

.logo-bella span {
	color: var(--accent-gold);
}

.nav-actions {
	display: flex;
	gap: 14px;
	align-items: center;
	flex-wrap: wrap;
}

.nav-btn-ghost {
	background: transparent;
	color: var(--text-main);
	padding: 10px 18px;
	border-radius: 6px;
	font-weight: 600;
	font-size: 13px;
	border: 1px solid var(--border-color);
}

.nav-btn-ghost:hover {
	border-color: var(--accent-gold);
	color: var(--accent-gold);
}

.page-container {
	padding: 70px 0 100px;
}

.main-grid {
	align-items: stretch;
}

.info-panel, .register-card {
	height: 100%;
}

.info-panel {
	background: radial-gradient(circle at bottom right, rgba(197, 160, 89, 0.1),
		transparent 30%), linear-gradient(135deg, #ffffff, #f8fafc);
	border: 1px solid var(--border-color);
	border-radius: 30px;
	padding: 40px;
	box-shadow: var(--shadow-soft);
}

.info-badge {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	background: rgba(197, 160, 89, 0.1);
	padding: 10px 20px;
	border-radius: 50px;
	font-size: 22px;
	font-family: 'Playfair Display', serif;
	font-weight: 700;
	margin-bottom: 18px;
}

.info-content p {
	color: var(--text-muted);
	font-size: 15px;
	line-height: 1.8;
	margin-bottom: 30px;
}

.benefits-list {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 18px;
}

.benefit-item {
	display: flex;
	align-items: flex-start;
	gap: 14px;
	text-align: left;
	background: #fff;
	border: 1px solid var(--border-color);
	border-radius: 16px;
	padding: 18px;
}

.benefit-icon {
	width: 50px;
	height: 50px;
	min-width: 50px;
	border: 1px solid var(--border-color);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	color: var(--accent-gold);
	background: #fff;
}

.benefit-item h5 {
	margin-bottom: 6px;
	font-size: 17px;
}

.benefit-item p {
	margin: 0;
	font-size: 14px;
	color: var(--text-muted);
	line-height: 1.6;
}

.register-card {
	background: #fff;
	border: 1px solid var(--border-color);
	border-radius: 24px;
	padding: 42px;
	box-shadow: var(--shadow-soft);
}

.register-header {
	text-align: center;
	margin-bottom: 32px;
}

.register-title {
	font-family: 'Playfair Display', serif;
	font-size: 32px;
	font-weight: 700;
	color: var(--text-main);
	margin-bottom: 10px;
}

.register-subtitle {
	font-size: 15px;
	color: var(--text-muted);
}

.form-group {
	margin-bottom: 22px;
}

.form-label {
	font-size: 13px;
	font-weight: 700;
	color: var(--text-main);
	margin-bottom: 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
	display: block;
}

.input-group.custom-input {
	position: relative;
}

.input-icon {
	position: absolute;
	left: 16px;
	top: 50%;
	transform: translateY(-50%);
	color: var(--text-muted);
	font-size: 16px;
	z-index: 3;
	transition: 0.3s;
	pointer-events: none;
}

.form-control {
	width: 100%;
	min-height: 50px;
	background: #fff;
	border: 1px solid var(--border-color);
	border-radius: 10px;
	padding: 12px 16px 12px 46px;
	font-size: 15px;
	color: var(--text-main);
	outline: none;
	transition: 0.3s;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.form-control:focus {
	border-color: var(--accent-gold);
	box-shadow: 0 4px 20px rgba(197, 160, 89, 0.18);
}

.form-control::placeholder {
	color: #bbb;
}

.password-wrap .form-control {
	padding-right: 52px;
}

.show-pass {
	position: absolute;
	right: 14px;
	top: 50%;
	transform: translateY(-50%);
	background: transparent;
	border: none;
	color: var(--text-muted);
	z-index: 4;
	cursor: pointer;
	font-size: 16px;
}

.show-pass:hover {
	color: var(--accent-gold);
}

.btn-register {
	width: 100%;
	padding: 14px;
	background: var(--text-main);
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 14px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 1px;
	cursor: pointer;
	transition: 0.3s;
}

.btn-register:hover {
	background: var(--accent-gold);
	color: #fff;
}

.mini-stats {
	display: flex;
	justify-content: center;
	gap: 40px;
	margin-top: 28px;
	flex-wrap: wrap;
}

.mini-stat-item {
	text-align: center;
}

.mini-stat-num {
	font-size: 30px;
	font-weight: 700;
	font-family: 'Playfair Display', serif;
	color: var(--text-main);
	margin-bottom: 5px;
}

.mini-stat-label {
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 1px;
	color: var(--text-muted);
}

.login-prompt {
	text-align: center;
	margin-top: 26px;
	font-size: 15px;
	color: var(--text-main);
}

.login-link {
	color: var(--accent-gold);
	font-weight: 700;
	margin-left: 6px;
}

.login-link:hover {
	text-decoration: underline;
}

.footer-bella {
	background: #fafafa;
	border-top: 1px solid var(--border-color);
	padding: 70px 0 30px;
	margin-top: 20px;
}

.footer-title {
	font-size: 18px;
	margin-bottom: 18px;
}

.footer-list {
	list-style: none;
	padding-left: 0;
	margin-bottom: 0;
}

.footer-link {
	color: var(--text-muted);
	font-size: 14px;
}

.footer-link:hover {
	color: var(--accent-gold);
}

.social-mini {
	display: flex;
	gap: 12px;
	flex-wrap: wrap;
}

.social-link {
	width: 40px;
	height: 40px;
	border: 1px solid var(--border-color);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(--text-main);
	background: #fff;
}

.social-link:hover {
	color: var(--accent-gold);
	border-color: var(--accent-gold);
}

.newsletter-form {
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
}

.newsletter-form input {
	flex: 1;
	min-width: 220px;
	border: 1px solid #ddd;
	padding: 12px 14px;
	border-radius: 8px;
	outline: none;
}

.btn-mini {
	width: auto;
	padding: 12px 18px;
	white-space: nowrap;
}

.footer-bottom {
	margin-top: 40px;
	padding-top: 20px;
	border-top: 1px solid var(--border-color);
	text-align: center;
	font-size: 14px;
	color: var(--text-muted);
}

@media ( max-width : 991px) {
	.page-container {
		padding: 50px 0 80px;
	}
	.info-panel, .register-card {
		padding: 28px;
	}
	.benefits-list {
		grid-template-columns: 1fr;
	}
}

@media ( max-width : 767px) {
	.nav-inner {
		flex-direction: column;
		align-items: flex-start;
	}
	.nav-actions {
		width: 100%;
	}
	.nav-btn-ghost {
		width: 100%;
		text-align: center;
	}
	.register-title {
		font-size: 28px;
	}
	.info-badge {
		font-size: 18px;
	}
	.mini-stats {
		gap: 20px;
	}
	
	
}

.custom-alert{
    width:100%;
    padding:14px 18px;
    border-radius:12px;
    margin-bottom:18px;
    font-size:14px;
    font-weight:600;
    display:flex;
    align-items:center;
    gap:10px;
    animation: fadeDown 0.5s ease;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
}

.error-alert{
    background: linear-gradient(135deg,#ffe5e5,#fff5f5);
    color:#d90429;
    border-left:5px solid #d90429;
}

.success-alert{
    background: linear-gradient(135deg,#e6ffed,#f3fff6);
    color:#198754;
    border-left:5px solid #198754;
}

@keyframes fadeDown{
    from{
        opacity:0;
        transform:translateY(-10px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}


</style>
</head>
<body>

	<nav class="navbar-bella">
		<div class="container">
			<div class="nav-inner">
				<a href="${pageContext.request.contextPath}/" class="logo-bella">Smart<span>Logistics</span></a>
				<div class="nav-actions">
					<a href="${pageContext.request.contextPath}/login"
						class="nav-btn-ghost">Sign In</a> <a href="#"
						class="nav-btn-ghost">Dashboard</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="page-container">
		<div class="container">
			<div class="row g-4 main-grid">

				<div class="col-lg-5">
					<div class="info-panel">
						<div class="info-badge">
							<i class="fa-solid fa-user-tie"></i> Create Account
						</div>

						<div class="info-content">
							<h2>Join SmartLogisticsSystem</h2>
							<p>Create an account to explore products, track shipments,
								and experience premium shopping.</p>
						</div>

						<div class="benefits-list">
							<div class="benefit-item">
								<div class="benefit-icon">
									<i class="fa-solid fa-bolt"></i>
								</div>
								<div>
									<h5>Access</h5>
									<p>Access your personal dashboard.</p>
								</div>
							</div>

							<div class="benefit-item">
								<div class="benefit-icon">
									<i class="fa-solid fa-box-open"></i>
								</div>
								<div>
									<h5>Shop</h5>
									<p>Browse our catalog of curated items.</p>
								</div>
							</div>

							<div class="benefit-item">
								<div class="benefit-icon">
									<i class="fa-solid fa-truck-fast"></i>
								</div>
								<div>
									<h5>Delivery</h5>
									<p>Fast and reliable shipping.</p>
								</div>
							</div>

							<div class="benefit-item">
								<div class="benefit-icon">
									<i class="fa-solid fa-shield-heart"></i>
								</div>
								<div>
									<h5>Secure</h5>
									<p>Your data is safe with us.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-7">
					<div class="register-card">
						<div class="register-header">

							<c:if test="${not empty error}">
								<div class="custom-alert error-alert">
									<i class="fa-solid fa-circle-exclamation"></i> ${error}
								</div>
							</c:if>

							<c:if test="${not empty success}">
								<div class="custom-alert success-alert">
									<i class="fa-solid fa-circle-check"></i> ${success}
								</div>
							</c:if>
							<div class="register-title">Create Account</div>
							<div class="register-subtitle">Fill in details below to
								create your account.</div>
						</div>

						<form action="${pageContext.request.contextPath}/doRegister"
							method="post">

							<div class="form-group">
								<label class="form-label">Full Name <span
									style="color: red;">*</span></label>
								<div class="input-group custom-input">
									<input type="text" name="fullname" class="form-control"
										placeholder="John Doe" required> <span
										class="input-icon"><i class="fa-solid fa-user"></i></span>
								</div>
							</div>

							<div class="row g-3">
								<div class="col-md-6">
									<div class="form-group">
										<label class="form-label">Username <span
											style="color: red;">*</span></label>
										<div class="input-group custom-input">
											<input type="text" name="username" class="form-control"
												placeholder="johndoe" required> <span
												class="input-icon"><i class="fa-solid fa-at"></i></span>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label class="form-label">Email Address <span
											style="color: red;">*</span></label>
										<div class="input-group custom-input">
											<input type="email" name="email" class="form-control"
												placeholder="name@example.com" required> <span
												class="input-icon"><i class="fa-solid fa-envelope"></i></span>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label class="form-label">Password <span
											style="color: red;">*</span></label>
										<div class="input-group custom-input password-wrap">
											<input type="password" name="password" id="password"
												class="form-control" placeholder="••••••••" required>
											<span class="input-icon"><i class="fa-solid fa-lock"></i></span>
											<button type="button" class="show-pass" id="togglePassword">
												<i class="fa-solid fa-eye" id="eyeIcon"></i>
											</button>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label class="form-label">Phone Number</label>
										<div class="input-group custom-input">
											<input type="tel" name="phone" class="form-control"
												placeholder="+91 98765 43 10"> <span
												class="input-icon"><i class="fa-solid fa-phone"></i></span>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="form-label">Address</label>
								<div class="input-group custom-input">
									<input type="text" name="address" class="form-control"
										placeholder="123, Street Name" required> <span
										class="input-icon"><i class="fa-solid fa-location-dot"></i></span>
								</div>
							</div>

							<div class="row g-3">
								<div class="col-md-6">
									<div class="form-group">
										<label class="form-label">City</label>
										<div class="input-group custom-input">
											<input type="text" name="city" class="form-control"
												placeholder="New York"> <span class="input-icon"><i
												class="fa-solid fa-city"></i></span>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label class="form-label">Zip Code</label>
										<div class="input-group custom-input">
											<input type="text" name="zip" class="form-control"
												placeholder="10001"> <span class="input-icon"><i
												class="fa-solid fa-map-pin"></i></span>
										</div>
									</div>
								</div>
							</div>

							<button type="submit" class="btn-register">Create
								Account</button>

							<div class="mini-stats">
								<div class="mini-stat-item">
									<div class="mini-stat-num">5K+</div>
									<div class="mini-stat-label">Products</div>
								</div>
								<div class="mini-stat-item">
									<div class="mini-stat-num">15K+</div>
									<div class="mini-stat-label">Users</div>
								</div>
							</div>

							<div class="login-prompt">
								Already have an account? <a
									href="${pageContext.request.contextPath}/login"
									class="login-link">Login Here</a>
							</div>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<footer class="footer-bella">
		<div class="container">
			<div class="row g-4">

				<div class="col-lg-2 col-md-6">
					<h5 class="footer-title">Shop</h5>
					<ul class="footer-list">
						<li class="mb-2"><a href="#" class="footer-link">All
								Products</a></li>
						<li class="mb-2"><a href="#" class="footer-link">New
								Arrivals</a></li>
						<li class="mb-2"><a href="#" class="footer-link">Best
								Sellers</a></li>
						<li class="mb-2"><a href="#" class="footer-link">Orders</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-6">
					<h5 class="footer-title">Support</h5>
					<ul class="footer-list">
						<li class="mb-2"><a href="#" class="footer-link">Help
								Center</a></li>
						<li class="mb-2"><a href="#" class="footer-link">Terms &
								Conditions</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-6">
					<h5 class="footer-title">Company</h5>
					<ul class="footer-list">
						<li class="mb-2"><a href="#" class="footer-link">About Us</a></li>
						<li class="mb-2"><a href="#" class="footer-link">Contact</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-6">
					<h5 class="footer-title">Social</h5>
					<div class="social-mini">
						<a href="#" class="social-link"><i
							class="fa-brands fa-facebook-f"></i></a> <a href="#"
							class="social-link"><i class="fa-brands fa-instagram"></i></a> <a
							href="#" class="social-link"><i class="fa-brands fa-twitter"></i></a>
					</div>
				</div>

				<div class="col-lg-4 col-md-12">
					<h5 class="footer-title">Newsletter</h5>
					<p
						style="font-size: 14px; color: var(--text-muted); margin-bottom: 20px;">
						Subscribe to receive updates on new arrivals and special offers.</p>
					<form class="newsletter-form">
						<input type="email" placeholder="Email Address">
						<button type="button" class="btn-register btn-mini">Subscribe</button>
					</form>
				</div>

			</div>

			<div class="footer-bottom">© 2026 SmartLogisticsSystem. All
				rights reserved.</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    const nav = document.querySelector('.navbar-bella');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            nav.classList.add('scrolled');
        } else {
            nav.classList.remove('scrolled');
        }
    });

    const togglePassword = document.getElementById('togglePassword');
    const passwordField = document.getElementById('password');
    const eyeIcon = document.getElementById('eyeIcon');

    if (togglePassword && passwordField && eyeIcon) {
        togglePassword.addEventListener('click', function () {
            const isPassword = passwordField.type === 'password';
            passwordField.type = isPassword ? 'text' : 'password';
            eyeIcon.classList.toggle('fa-eye');
            eyeIcon.classList.toggle('fa-eye-slash');
        });
    }
</script>
</body>
</html>