<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login | SmartLogisticsSystem</title>
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
	--bg-form: #ffffff;
	--text-main: #1a1a1a;
	--text-muted: #777777;
	--accent-gold: #c5a059;
	--accent-gold-light: #e6c8a3;
	--border-subtle: #e5e5e5;
	--shadow-card: 0 15px 35px rgba(0, 0, 0, 0.04);
	--border-color: #d4d4d4;
	--black-contrast: #0f172a;
	--shadow-hover: 0 25px 60px rgba(0, 0, 0, 0.1);
	--transition: all 0.4s ease;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body {
	font-family: 'Lato', sans-serif;
	background: var(--bg-body);
	color: var(--text-main);
	overflow-x: hidden;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	position: relative;
	animation: colorBreath 15s infinite;
}

/* Premium gold-white ambient glow */
body::before {
	content: "";
	position: fixed;
	width: 620px;
	height: 620px;
	background: radial-gradient(circle, rgba(197, 160, 89, 0.14),
		transparent 70%);
	top: -140px;
	right: -140px;
	z-index: 0;
	pointer-events: none;
	animation: floatGlow 8s ease-in-out infinite;
}

body::after {
	content: "";
	position: fixed;
	width: 520px;
	height: 520px;
	background: radial-gradient(circle, rgba(230, 200, 163, 0.12),
		transparent 70%);
	bottom: -140px;
	left: -140px;
	z-index: 0;
	pointer-events: none;
	animation: floatGlowReverse 10s ease-in-out infinite;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Playfair Display', serif;
	font-weight: 600;
	color: var(--text-main);
	margin: 0;
}

p {
	margin: 0;
}

a {
	text-decoration: none;
	color: inherit;
	transition: var(--transition);
}

/* ================= NAVBAR ================= */
.navbar-bella {
	background: rgba(255, 255, 255, 0.95);
	border-bottom: 1px solid rgba(197, 160, 89, 0.18);
	padding: 18px 0;
	position: sticky;
	top: 0;
	z-index: 1000;
	backdrop-filter: blur(10px);
	box-shadow: 0 6px 24px rgba(0, 0, 0, 0.03);
}

.nav-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 20px;
	flex-wrap: wrap;
	position: relative;
	z-index: 2;
}

.logo {
	font-family: 'Playfair Display', serif;
	font-size: 28px;
	font-weight: 700;
	letter-spacing: -0.5px;
	color: var(--text-main);
	display: flex;
	align-items: center;
	gap: 12px;
	position: relative;
}

.logo i {
	color: var(--accent-gold);
	filter: drop-shadow(0 0 8px rgba(197, 160, 89, 0.22));
}

.logo span {
	color: var(--accent-gold);
}

.nav-actions {
	display: flex;
	align-items: center;
	gap: 12px;
	flex-wrap: wrap;
}

.btn-ghost {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 10px 20px;
	border: 1px solid rgba(197, 160, 89, 0.22);
	border-radius: 12px;
	background: rgba(255, 255, 255, 0.82);
	color: var(--text-main);
	font-size: 14px;
	font-weight: 600;
	transition: 0.3s ease;
	position: relative;
	overflow: hidden;
}

.btn-ghost::before {
	content: "";
	position: absolute;
	top: 0;
	left: -120%;
	width: 80%;
	height: 100%;
	background: linear-gradient(120deg, transparent, rgba(255, 255, 255, 0.6),
		transparent);
	transition: 0.6s ease;
}

.btn-ghost:hover::before {
	left: 130%;
}

.btn-ghost:hover {
	border-color: var(--accent-gold);
	color: var(--accent-gold);
	box-shadow: 0 10px 24px rgba(197, 160, 89, 0.10);
	transform: translateY(-1px);
}

/* ================= MAIN ================= */
.main-section {
	flex: 1;
	display: flex;
	align-items: center;
	padding: 50px 0;
	position: relative;
	z-index: 1;
}

.login-wrapper {
	display: flex;
	align-items: stretch;
	justify-content: center;
	gap: 32px;
	width: 100%;
}

/* ================= LEFT SIDE ================= */
.visual-side {
	flex: 1;
	max-width: 560px;
	min-height: 640px;
	padding: 50px 40px;
	border-radius: 24px;
	border: 1px solid rgba(197, 160, 89, 0.14);
	background: linear-gradient(180deg, rgba(255, 255, 255, 0.98),
		rgba(255, 255, 255, 0.94));
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	position: relative;
	overflow: hidden;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.04), 0 0 0 1px
		rgba(255, 255, 255, 0.7) inset;
}

.visual-side::before {
	content: "";
	position: absolute;
	inset: 0;
	background: linear-gradient(135deg, rgba(197, 160, 89, 0.06),
		transparent 35%, rgba(255, 255, 255, 0.4));
	z-index: 0;
	pointer-events: none;
}

.bg-pattern {
	position: absolute;
	inset: 0;
	opacity: 0.04;
	background-image: radial-gradient(circle, rgba(0, 0, 0, 0.18) 1px,
		transparent 1px);
	background-size: 20px 20px;
	pointer-events: none;
	z-index: 0;
}

.decorative-circle {
	position: absolute;
	width: 120px;
	height: 120px;
	border-radius: 50%;
	top: 25px;
	left: 25px;
	background: #fff;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08), 0 0 0 1px
		rgba(197, 160, 89, 0.18), 0 0 35px rgba(197, 160, 89, 0.12);
	display: flex;
	align-items: center;
	justify-content: center;
	animation: spin 10s linear infinite;
	z-index: 1;
}

.decorative-circle::before {
	content: "\f0d1";
	font-family: "Font Awesome 6 Free";
	font-weight: 900;
	color: var(--accent-gold);
	font-size: 30px;
}

.particles {
	position: absolute;
	inset: 0;
	z-index: 1;
	pointer-events: none;
}

.particles span {
	position: absolute;
	width: 7px;
	height: 7px;
	background: radial-gradient(circle, #fff 10%, var(--accent-gold) 70%);
	border-radius: 50%;
	opacity: 0.7;
	box-shadow: 0 0 14px rgba(197, 160, 89, 0.25);
	animation: floatParticle 6s infinite ease-in-out;
}

.particles span:nth-child(1) {
	top: 22%;
	left: 28%;
	animation-delay: 0s;
}

.particles span:nth-child(2) {
	top: 62%;
	left: 72%;
	animation-delay: 2s;
}

.particles span:nth-child(3) {
	top: 80%;
	left: 40%;
	animation-delay: 4s;
}

.particles span:nth-child(4) {
	top: 35%;
	left: 78%;
	animation-delay: 1.5s;
}

.visual-content {
	position: relative;
	z-index: 2;
	max-width: 420px;
}

.hero-title {
	font-size: clamp(38px, 5vw, 62px);
	line-height: 1.08;
	color: var(--black-contrast);
	margin-bottom: 18px;
	font-weight: 600;
	text-shadow: 0 8px 30px rgba(197, 160, 89, 0.08);
}

.hero-title .gold-text {
	color: var(--accent-gold);
	position: relative;
}

.hero-subtitle {
	color: #888;
	font-size: 16px;
	line-height: 1.8;
}

/* ================= RIGHT SIDE ================= */
.form-side {
	flex: 1;
	max-width: 520px;
	min-height: 640px;
	background: rgba(255, 255, 255, 0.94);
	border: 1px solid rgba(197, 160, 89, 0.14);
	border-radius: 24px;
	padding: 50px 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: var(--shadow-card);
	position: relative;
	z-index: 10;
	overflow: hidden;
	backdrop-filter: blur(10px);
}

.form-side::before {
	content: "";
	position: absolute;
	inset: 0;
	border-radius: 24px;
	padding: 1px;
	background: linear-gradient(120deg, rgba(197, 160, 89, 0.00),
		rgba(197, 160, 89, 0.75), rgba(255, 255, 255, 0.9),
		rgba(197, 160, 89, 0.55), rgba(197, 160, 89, 0.00));
	background-size: 300% 300%;
	-webkit-mask: linear-gradient(#fff 0 0) content-box,
		linear-gradient(#fff 0 0);
	-webkit-mask-composite: xor;
	mask-composite: exclude;
	animation: borderGlow 4s linear infinite;
	pointer-events: none;
	z-index: 0;
}

.form-side::after {
	content: "";
	position: absolute;
	inset: 0;
	background: linear-gradient(180deg, rgba(255, 255, 255, 0.45),
		transparent 32%);
	pointer-events: none;
	z-index: 0;
}

.form-box {
	width: 100%;
	max-width: 400px;
	position: relative;
	z-index: 2;
}

.card-header {
	margin-bottom: 32px;
	text-align: center;
}

.brand-logo {
	width: 82px;
	height: 82px;
	background: linear-gradient(145deg, #ffffff, #fbf7ef);
	border: 2px solid var(--accent-gold);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 20px;
	color: var(--black-contrast);
	font-size: 28px;
	animation: logoPulse 3s ease-in-out infinite;
	box-shadow: 0 10px 25px rgba(197, 160, 89, 0.14), inset 0 0 18px
		rgba(255, 255, 255, 0.7);
}

.brand-logo i {
	color: var(--accent-gold);
}

.card-title {
	font-size: 34px;
	margin-bottom: 10px;
}

.card-desc {
	color: var(--text-muted);
	font-size: 15px;
	line-height: 1.7;
}

.form-group {
	margin-bottom: 22px;
}

.form-label {
	font-size: 14px;
	font-weight: 700;
	color: var(--text-main);
	margin-bottom: 10px;
	display: block;
}

.label-note {
	color: var(--text-muted);
	font-weight: 400;
	margin-left: 6px;
	font-size: 13px;
}

.input-wrapper {
	position: relative;
}

.input-icon {
	position: absolute;
	left: 18px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
	font-size: 15px;
	z-index: 2;
	transition: 0.3s ease;
}

.password-toggle {
	cursor: pointer;
}

.form-control {
	width: 100%;
	height: 56px;
	background: rgba(249, 249, 249, 0.92);
	border: 1px solid var(--border-subtle);
	padding: 0 18px 0 48px;
	border-radius: 12px;
	font-size: 15px;
	color: var(--black-contrast);
	font-family: 'Lato', sans-serif;
	outline: none;
	transition: 0.3s ease;
	font-weight: 400;
	box-shadow: none !important;
}

.input-wrapper:focus-within .input-icon {
	color: var(--accent-gold);
	transform: translateY(-50%) scale(1.08);
}

.form-control:focus {
	border-color: var(--accent-gold);
	background: #fff;
	color: var(--black-contrast);
	box-shadow: 0 0 0 3px rgba(197, 160, 89, 0.14), 0 0 20px
		rgba(197, 160, 89, 0.08) !important;
}

.form-submit {
	width: 100%;
	padding: 16px;
	background: linear-gradient(135deg, #0f172a, #000000);
	border: 1px solid var(--accent-gold);
	border-radius: 12px;
	color: #fff;
	font-size: 15px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 1px;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	overflow: hidden;
	margin-top: 8px;
	box-shadow: 0 12px 24px rgba(0, 0, 0, 0.10);
}

.form-submit::before {
	content: "";
	position: absolute;
	top: 0;
	left: -100%;
	width: 70%;
	height: 100%;
	background: linear-gradient(120deg, transparent, rgba(255, 255, 255, 0.45),
		transparent);
	transition: 0.7s ease;
}

.form-submit:hover::before {
	left: 130%;
}

.form-submit:hover {
	background: linear-gradient(135deg, var(--accent-gold-light), #b8860b);
	transform: translateY(-2px);
	box-shadow: 0 18px 36px rgba(197, 160, 89, 0.16);
	border-color: var(--accent-gold-light);
}

/* ================= SOCIAL ================= */
.social-container {
	margin: 28px 0 24px;
	text-align: center;
}

.social-label {
	color: var(--text-muted);
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 1.5px;
	font-weight: 700;
	margin-bottom: 16px;
}

.social-btns {
	display: flex;
	justify-content: center;
	gap: 14px;
	flex-wrap: wrap;
}

.social-btn {
	min-width: 140px;
	height: 48px;
	background: rgba(255, 255, 255, 0.92);
	border: 1px solid rgba(197, 160, 89, 0.14);
	border-radius: 12px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	transition: all 0.3s;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	padding: 0 16px;
	position: relative;
	overflow: hidden;
}

.social-btn::before {
	content: "";
	position: absolute;
	top: 0;
	left: -120%;
	width: 70%;
	height: 100%;
	background: linear-gradient(120deg, transparent, rgba(255, 255, 255, 0.7),
		transparent);
	transition: 0.7s ease;
}

.social-btn:hover::before {
	left: 140%;
}

.social-btn:hover {
	background: #fdfbf7;
	border-color: var(--accent-gold);
	transform: translateY(-2px);
	box-shadow: 0 10px 20px rgba(197, 160, 89, 0.10);
}

.social-btn i {
	color: var(--accent-gold);
}

/* ================= FOOTER ================= */
.auth-footer {
	margin-top: 24px;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 18px;
	flex-wrap: wrap;
	font-size: 14px;
	color: var(--text-muted);
}

.auth-footer a {
	color: var(--text-muted);
	font-weight: 600;
	position: relative;
}

.auth-footer a::after {
	content: "";
	position: absolute;
	left: 0;
	bottom: -3px;
	width: 0;
	height: 1px;
	background: var(--accent-gold);
	transition: 0.3s ease;
}

.auth-footer a:hover {
	color: var(--accent-gold);
}

.auth-footer a:hover::after {
	width: 100%;
}

/* ================= ANIMATIONS ================= */
@
keyframes colorBreath { 0%, 100% {
	background-color: var(--bg-body);
}

50
%
{
background-color
:
#f8f7f4;
}
}
@
keyframes spin {to { transform:rotate(360deg);
	
}

}
@
keyframes logoPulse { 0%,100% {
	box-shadow: 0 10px 25px rgba(197, 160, 89, 0.14), inset 0 0 18px
		rgba(255, 255, 255, 0.7), 0 0 0 0 rgba(197, 160, 89, 0.18);
}

50
%
{
box-shadow
:
0
14px
28px
rgba(
197
,
160
,
89
,
0.18
)
,
inset
0
0
18px
rgba(
255
,
255
,
255
,
0.7
)
,
0
0
24px
6px
rgba(
197
,
160
,
89
,
0.14
);
}
}
@
keyframes floatGlow { 0%,100% {
	transform: translate(0, 0);
}

50
%
{
transform
:
translate(
-30px
,
20px
);
}
}
@
keyframes floatGlowReverse { 0%,100% {
	transform: translate(0, 0);
}

50
%
{
transform
:
translate(
30px
,
-20px
);
}
}
@
keyframes borderGlow { 0% {
	background-position: 0% 50%;
}

100
%
{
background-position
:
300%
50%;
}
}
@
keyframes floatParticle { 0%,100% {
	transform: translateY(0);
	opacity: 0.55;
}

50
%
{
transform
:
translateY(
-20px
);
opacity
:
1;
}
}
.reveal {
	opacity: 0;
	transform: translateY(20px);
	transition: all 0.8s ease-out;
}

.reveal.visible {
	opacity: 1;
	transform: translateY(0);
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 991px) {
	.main-section {
		padding: 30px 0;
	}
	.login-wrapper {
		flex-direction: column;
		gap: 24px;
	}
	.visual-side, .form-side {
		max-width: 100%;
		min-height: auto;
	}
	.visual-side {
		padding: 70px 25px 35px;
	}
	.form-side {
		padding: 40px 25px;
	}
	.hero-title {
		font-size: 40px;
	}
}

@media ( max-width : 575px) {
	.navbar-bella {
		padding: 14px 0;
	}
	.logo {
		font-size: 22px;
	}
	.nav-inner {
		flex-direction: column;
		align-items: flex-start;
	}
	.nav-actions {
		width: 100%;
	}
	.btn-ghost {
		padding: 9px 14px;
		font-size: 13px;
	}
	.card-title {
		font-size: 28px;
	}
	.hero-title {
		font-size: 34px;
	}
	.social-btns {
		flex-direction: column;
	}
	.social-btn {
		width: 100%;
	}
	.auth-footer {
		flex-direction: column;
		gap: 10px;
	}
	
	
}

.popup-alert{
    width:100%;
    padding:16px 20px;
    border-radius:16px;
    margin-bottom:20px;
    display:flex;
    align-items:center;
    justify-content:center;
    gap:10px;
    font-size:15px;
    font-weight:600;
    text-align:center;
    animation: popupFade 0.5s ease;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

.popup-alert i{
    font-size:20px;
}

.error-popup{
    background: linear-gradient(135deg,#fff1f1,#ffe3e3);
    color:#d62828;
    border:1px solid #f5b5b5;
}

.success-popup{
    background: linear-gradient(135deg,#f0fff4,#dcfce7);
    color:#198754;
    border:1px solid #b7ebc6;
}

@keyframes popupFade{
    from{
        opacity:0;
        transform:translateY(-15px) scale(0.95);
    }
    to{
        opacity:1;
        transform:translateY(0) scale(1);
    }
}
</style>
</head>
<body>

	<nav class="navbar-bella">
		<div class="container">
			<div class="nav-inner">
				<div class="logo">
					<i class="fa-solid fa-bag-shopping"></i> Smart<span>Logistics</span>
				</div>

				<div class="nav-actions">
					<a href="register" class="btn-ghost">Register</a> <a
						href="index.jsp" class="btn-ghost">Dashboard</a>
				</div>
			</div>
		</div>
	</nav>

	<section class="main-section">
		<div class="container">
			<div class="login-wrapper">

				<div class="visual-side">
					<div class="decorative-circle"></div>
					<div class="bg-pattern"></div>

					<div class="particles">
						<span></span> <span></span> <span></span> <span></span>
					</div>

					<div class="visual-content reveal visible">
						<h1 class="hero-title">
							<span class="gold-text">Elegance</span> Meets Logistics.
						</h1>
						<p class="hero-subtitle">Experience a smarter way to shop and
							track. Integrated service for your lifestyle.</p>
					</div>
				</div>

				<div class="form-side">
					<div class="form-box reveal visible">
						<div class="card-header">

							<c:if test="${not empty error}">
								<div class="popup-alert error-popup">
									<i class="fa-solid fa-circle-xmark"></i> <span>${error}</span>
								</div>
							</c:if>

							<c:if test="${not empty success}">
								<div class="popup-alert success-popup">
									<i class="fa-solid fa-circle-check"></i> <span>${success}</span>
								</div>
							</c:if>

							<c:if test="${not empty msg}">
								<div class="popup-alert success-popup">
									<i class="fa-solid fa-circle-check"></i> <span>${msg}</span>
								</div>
							</c:if>
							<div class="brand-logo">
								<i class="fa-solid fa-cube"></i>
							</div>
							<h2 class="card-title">Sign In</h2>
							<p class="card-desc">Sign in to access your dashboard.</p>
						</div>

						<form action="doLogin" method="post">
							<div class="form-group">
								<label class="form-label"> Username <!-- <span class="label-note">Username</span> -->
								</label>
								<div class="input-wrapper">
									<i class="fa-solid fa-envelope input-icon"></i> <input
										type="text" name="username" class="form-control"
										placeholder="Username" required>
								</div>
							</div>

							<div class="form-group">
								<label class="form-label"> Password </label>
								<div class="input-wrapper">
									<i class="fa-solid fa-lock input-icon password-toggle"
										id="eyeIcon" onclick="togglePassword()"></i> <input
										type="password" name="password" id="passInput"
										class="form-control" placeholder="••••••••••" required>
								</div>
							</div>

							<div class="social-container">
								<div class="social-label">or continue with</div>
								<div class="social-btns">
									<button type="button" class="social-btn">
										<i class="fa-brands fa-google"></i> Google
									</button>
									<button type="button" class="social-btn">
										<i class="fa-brands fa-apple"></i> Apple
									</button>
								</div>
							</div>

							<button type="submit" class="form-submit">Sign In</button>

							<div class="auth-footer">
								<a href="forgotPassword">Forgot Password?</a> <a href="register">Create
									Account</a>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>

	<script>
    function togglePassword() {
        const input = document.getElementById('passInput');
        const icon = document.getElementById('eyeIcon');

        if (input.type === "password") {
            input.type = "text";
            icon.classList.remove("fa-lock");
            icon.classList.add("fa-lock-open");
        } else {
            input.type = "password";
            icon.classList.remove("fa-lock-open");
            icon.classList.add("fa-lock");
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        const fadeElements = document.querySelectorAll('.reveal');

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.1 });

        fadeElements.forEach(el => observer.observe(el));
    });
</script>

	

</body>
</html>