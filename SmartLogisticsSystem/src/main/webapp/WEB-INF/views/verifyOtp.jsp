<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Verify OTP | SmartLogistics</title>
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
.otp-main {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 60px 20px;
}

.otp-card {
    background: #fff;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    padding: 50px 45px;
    width: 100%;
    max-width: 460px;
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
.otp-icon-circle {
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
.otp-title {
    font-size: 28px;
    text-align: center;
    margin-bottom: 10px;
}

.otp-desc {
    text-align: center;
    color: var(--text-muted);
    font-size: 15px;
    font-weight: 300;
    margin-bottom: 35px;
    max-width: 340px;
    margin-left: auto;
    margin-right: auto;
    line-height: 1.7;
}

.otp-email-highlight {
    color: var(--text-main);
    font-weight: 700;
}

/* OTP BOXES */
.otp-boxes-wrapper {
    display: flex;
    justify-content: center;
    gap: 12px;
    margin-bottom: 30px;
}

.otp-digit-box {
    width: 52px;
    height: 60px;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    text-align: center;
    font-size: 24px;
    font-family: 'Lato', sans-serif;
    font-weight: 700;
    color: var(--text-main);
    background: var(--bg-light);
    outline: none;
    transition: 0.3s;
    caret-color: var(--accent-gold);
}

.otp-digit-box::placeholder {
    color: #ccc;
    font-weight: 300;
}

.otp-digit-box:focus {
    border-color: var(--accent-gold);
    background: #fff;
    box-shadow: 0 0 0 3px rgba(197, 160, 89, 0.1);
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
    margin-top: 5px;
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

/* DIVIDER */
.otp-divider {
    display: flex;
    align-items: center;
    gap: 15px;
    margin: 30px 0;
}

.otp-divider span {
    font-size: 12px;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: 1px;
    white-space: nowrap;
}

.otp-divider::before,
.otp-divider::after {
    content: '';
    flex: 1;
    height: 1px;
    background: var(--border-color);
}

/* BOTTOM LINK */
.otp-bottom-link {
    text-align: center;
    font-size: 14px;
    color: var(--text-muted);
}

.otp-bottom-link a {
    color: var(--text-main);
    font-weight: 700;
    text-decoration: underline;
    text-underline-offset: 3px;
}

.otp-bottom-link a:hover {
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

/* SHAKE ANIMATION FOR WRONG OTP */
@keyframes shakeOtp {
    0%, 100% { transform: translateX(0); }
    20% { transform: translateX(-8px); }
    40% { transform: translateX(8px); }
    60% { transform: translateX(-6px); }
    80% { transform: translateX(6px); }
}

.shake-it {
    animation: shakeOtp 0.5s ease;
}

@media (max-width: 480px) {
    .otp-card {
        padding: 35px 25px;
    }

    .otp-title {
        font-size: 24px;
    }

    .otp-digit-box {
        width: 44px;
        height: 52px;
        font-size: 20px;
    }

    .otp-boxes-wrapper {
        gap: 8px;
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
        <a href="forgotpassword" class="back-link">
            <i class="fa-solid fa-arrow-left"></i>
            Resend OTP
        </a>
    </div>
</div>

<!-- VERIFY OTP FORM -->
<div class="otp-main">
    <div class="otp-card" id="otpCard">

        <div class="otp-icon-circle">
            <i class="fa-solid fa-shield-halved"></i>
        </div>

        <h2 class="otp-title">Verify OTP</h2>
        <p class="otp-desc">
            Enter the 6-digit code sent to
            <span class="otp-email-highlight">${email}</span>
        </p>

        <!-- ERROR ALERT -->
        <c:if test="${not empty error}">
            <div class="alert-bella alert-error">
                <i class="fa-solid fa-circle-exclamation"></i>
                <span>${error}</span>
            </div>
        </c:if>

        <form action="verifyOtp" method="post" id="otpForm">

            <!-- HIDDEN EMAIL - LOGIC UNTOUCHED -->
            <input type="hidden" name="email" value="${email}" />

            <!-- HIDDEN OTP FIELD - FILLED BY JS BEFORE SUBMIT -->
            <input type="hidden" name="otp" id="hiddenOtp" value="" />

            <!-- VISUAL OTP DIGIT BOXES -->
            <div class="otp-boxes-wrapper" id="otpBoxes">
                <input type="text" class="otp-digit-box" maxlength="1" inputmode="numeric" autocomplete="one-time-code" />
                <input type="text" class="otp-digit-box" maxlength="1" inputmode="numeric" />
                <input type="text" class="otp-digit-box" maxlength="1" inputmode="numeric" />
                <input type="text" class="otp-digit-box" maxlength="1" inputmode="numeric" />
                <input type="text" class="otp-digit-box" maxlength="1" inputmode="numeric" />
                <input type="text" class="otp-digit-box" maxlength="1" inputmode="numeric" />
            </div>

            <button type="submit" class="btn-submit">Verify</button>

        </form>

        <div class="otp-divider">
            <span>need help?</span>
        </div>

        <div class="otp-bottom-link">
            Didn't receive the code? <a href="forgotpassword">Try Again</a>
        </div>

    </div>
</div>

<!-- FOOTER TEXT -->
<div class="page-footer-text">
    &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
</div>

<script>
(function() {
    var boxes = document.querySelectorAll('.otp-digit-box');
    var hiddenOtp = document.getElementById('hiddenOtp');
    var otpCard = document.getElementById('otpCard');
    var otpForm = document.getElementById('otpForm');

    boxes.forEach(function(box, index) {

        // Only allow digits
        box.addEventListener('input', function(e) {
            this.value = this.value.replace(/[^0-9]/g, '');

            if (this.value.length === 1 && index < boxes.length - 1) {
                boxes[index + 1].focus();
            }
        });

        // Handle backspace
        box.addEventListener('keydown', function(e) {
            if (e.key === 'Backspace' && this.value === '' && index > 0) {
                boxes[index - 1].focus();
                boxes[index - 1].value = '';
            }
        });

        // Handle paste
        box.addEventListener('paste', function(e) {
            e.preventDefault();
            var pasted = (e.clipboardData || window.clipboardData).getData('text').replace(/[^0-9]/g, '');
            for (var i = 0; i < pasted.length && i < boxes.length; i++) {
                boxes[i].value = pasted[i];
            }
            var nextEmpty = pasted.length < boxes.length ? pasted.length : boxes.length - 1;
            boxes[nextEmpty].focus();
        });

        // Select all on focus for easy overwrite
        box.addEventListener('focus', function() {
            this.select();
        });
    });

    // Before submit, combine digits into hidden field
    otpForm.addEventListener('submit', function(e) {
        var code = '';
        boxes.forEach(function(b) { code += b.value; });

        if (code.length < 6) {
            e.preventDefault();
            otpCard.classList.remove('shake-it');
            void otpCard.offsetWidth; // trigger reflow
            otpCard.classList.add('shake-it');
            return;
        }

        hiddenOtp.value = code;
    });

    // Auto-focus first box on page load
    if (boxes.length > 0) {
        boxes[0].focus();
    }
})();
</script>

</body>
</html>