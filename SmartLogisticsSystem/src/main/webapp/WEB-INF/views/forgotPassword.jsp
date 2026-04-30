<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Forgot Password | SmartLogistics</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root {
    --bg-body: #ffffff;
    --bg-light: #fcfcfc;
    --bg-page: #f7f6f3;
    --text-main: #1a1a1a;
    --text-muted: #777777;
    --accent-gold: #c5a059;
    --border-color: #e8e6e1;
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
    background: var(--bg-page);
    color: var(--text-main);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    line-height: 1.7;
}

h1, h2, h3, h4, h5, h6 {
    font-family: 'Playfair Display', serif;
    font-weight: 600;
    color: var(--text-main);
}

a {
    text-decoration: none;
    color: inherit;
    transition: var(--transition);
}

/* TOP BAR */
.top-bar {
    background: #fff;
    border-bottom: 1px solid var(--border-color);
    padding: 18px 0;
}

.top-bar-inner {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo-link {
    font-family: 'Playfair Display', serif;
    font-size: 24px;
    font-weight: 700;
    color: var(--text-main);
    letter-spacing: -0.5px;
}

.logo-link span {
    color: var(--accent-gold);
}

.back-link {
    font-size: 13px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 700;
    color: var(--text-muted);
    display: flex;
    align-items: center;
    gap: 8px;
    transition: 0.3s;
}

.back-link:hover {
    color: var(--accent-gold);
}

.back-link i {
    font-size: 12px;
    transition: transform 0.3s;
}

.back-link:hover i {
    transform: translateX(-3px);
}

/* MAIN AREA */
.forgot-main {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 60px 20px;
}

.forgot-card {
    background: #fff;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    padding: 50px 45px;
    width: 100%;
    max-width: 440px;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.04);
    animation: cardIn 0.7s ease-out;
}

@keyframes cardIn {
    from {
        opacity: 0;
        transform: translateY(25px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ICON CIRCLE */
.forgot-icon-circle {
    width: 64px;
    height: 64px;
    border: 1px solid var(--border-color);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 28px;
    color: var(--accent-gold);
    font-size: 22px;
}

/* HEADINGS */
.forgot-title {
    font-size: 28px;
    text-align: center;
    margin-bottom: 10px;
}

.forgot-desc {
    text-align: center;
    color: var(--text-muted);
    font-size: 15px;
    font-weight: 300;
    margin-bottom: 35px;
    max-width: 320px;
    margin-left: auto;
    margin-right: auto;
    line-height: 1.7;
}

/* FORM */
.form-group-bella {
    margin-bottom: 24px;
}

.form-label-bella {
    display: block;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    font-weight: 700;
    color: var(--text-main);
    margin-bottom: 10px;
}

.form-input-bella {
    width: 100%;
    padding: 14px 18px;
    border: 1px solid var(--border-color);
    border-radius: 3px;
    font-size: 15px;
    font-family: 'Lato', sans-serif;
    color: var(--text-main);
    background: var(--bg-light);
    outline: none;
    transition: 0.3s;
}

.form-input-bella::placeholder {
    color: #bbb;
    font-weight: 300;
}

.form-input-bella:focus {
    border-color: var(--accent-gold);
    background: #fff;
    box-shadow: 0 0 0 3px rgba(197, 160, 89, 0.08);
}

/* BUTTON */
.btn-submit {
    display: block;
    width: 100%;
    padding: 15px;
    background-color: var(--text-main);
    color: #fff;
    text-transform: uppercase;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1.5px;
    border: 1px solid var(--text-main);
    border-radius: 3px;
    cursor: pointer;
    transition: var(--transition);
    margin-top: 8px;
    font-family: 'Lato', sans-serif;
}

.btn-submit:hover {
    background-color: transparent;
    color: var(--text-main);
}

/* ALERTS */
.alert-bella {
    padding: 14px 18px;
    border-radius: 4px;
    font-size: 14px;
    margin-bottom: 24px;
    display: flex;
    align-items: flex-start;
    gap: 10px;
    line-height: 1.5;
    animation: alertSlide 0.4s ease-out;
}

@keyframes alertSlide {
    from {
        opacity: 0;
        transform: translateY(-8px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.alert-bella i {
    margin-top: 2px;
    flex-shrink: 0;
}

.alert-error {
    background: #fdf2f2;
    border: 1px solid #f0d0d0;
    color: #b91c1c;
}

.alert-error i {
    color: #dc2626;
}

.alert-success {
    background: #f0fdf4;
    border: 1px solid #bbf7d0;
    color: #166534;
}

.alert-success i {
    color: #16a34a;
}

/* DIVIDER */
.forgot-divider {
    display: flex;
    align-items: center;
    gap: 15px;
    margin: 30px 0;
}

.forgot-divider span {
    font-size: 12px;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: 1px;
    white-space: nowrap;
}

.forgot-divider::before,
.forgot-divider::after {
    content: '';
    flex: 1;
    height: 1px;
    background: var(--border-color);
}

/* BOTTOM LINK */
.forgot-bottom-link {
    text-align: center;
    font-size: 14px;
    color: var(--text-muted);
}

.forgot-bottom-link a {
    color: var(--text-main);
    font-weight: 700;
    text-decoration: underline;
    text-underline-offset: 3px;
}

.forgot-bottom-link a:hover {
    color: var(--accent-gold);
}

/* FOOTER TEXT */
.page-footer-text {
    text-align: center;
    padding: 25px 20px;
    font-size: 12px;
    color: #bbb;
    letter-spacing: 0.5px;
}

@media (max-width: 480px) {
    .forgot-card {
        padding: 35px 25px;
    }

    .forgot-title {
        font-size: 24px;
    }

    .top-bar-inner {
        padding: 0 15px;
    }
}
</style>
</head>

<body>

<!-- TOP BAR -->
<div class="top-bar">
    <div class="top-bar-inner">
        <a href="index" class="logo-link">Smart<span>Logistics</span></a>
        <a href="login" class="back-link">
            <i class="fa-solid fa-arrow-left"></i>
            Back to Login
        </a>
    </div>
</div>

<!-- FORGOT PASSWORD FORM -->
<div class="forgot-main">
    <div class="forgot-card">

        <div class="forgot-icon-circle">
            <i class="fa-solid fa-lock"></i>
        </div>

        <h2 class="forgot-title">Forgot Password?</h2>
        <p class="forgot-desc">
            Enter your registered email address and we'll send you an OTP to reset your password.
        </p>

        <!-- ERROR ALERT -->
        <c:if test="${not empty error}">
            <div class="alert-bella alert-error">
                <i class="fa-solid fa-circle-exclamation"></i>
                <span>${error}</span>
            </div>
        </c:if>

        <!-- SUCCESS ALERT -->
        <c:if test="${not empty msg}">
            <div class="alert-bella alert-success">
                <i class="fa-solid fa-circle-check"></i>
                <span>${msg}</span>
            </div>
        </c:if>

        <form action="sendResetEmail" method="post">

            <div class="form-group-bella">
                <label class="form-label-bella" for="email">Email Address</label>
                <input
                    type="email"
                    id="email"
                    name="email"
                    class="form-input-bella"
                    placeholder="you@example.com"
                    required
                />
            </div>

            <button type="submit" class="btn-submit">Send OTP</button>

        </form>

        <div class="forgot-divider">
            <span>or</span>
        </div>

        <div class="forgot-bottom-link">
            Remember your password? <a href="login">Sign In</a>
        </div>

    </div>
</div>

<!-- FOOTER TEXT -->
<div class="page-footer-text">
    &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
</div>

</body>
</html>