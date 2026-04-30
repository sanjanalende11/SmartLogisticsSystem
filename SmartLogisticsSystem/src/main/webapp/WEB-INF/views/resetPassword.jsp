<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password | SmartLogistics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 使用与OTP验证页面相同的字体和图标库 -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    /* 使用与OTP验证页面完全相同的CSS变量定义，确保视觉一致性 */
    :root {
        --bg-body: #ffffff;
        --bg-light: #fcfcfc;
        --bg-page: #f7f6f3;
        --text-main: #1a1a1a;
        --text-muted: #777777;
        --accent-gold: #c5a059;
        --border-color: #e8e6e1;
        --transition: all 0.4s ease;
        --error-color: #b91c1c;
        --error-bg: #fdf2f2;
        --success-color: #2ecc71;
        --success-bg: #f0f9f0;
    }

    /* 基础重置和布局（与OTP页面一致） */
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

    /* 顶部栏（与OTP页面一致） */
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

    /* 主内容区（与OTP页面布局一致） */
    .reset-main {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 60px 20px;
    }

    .reset-card {
        background: #fff;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 50px 45px;
        width: 100%;
        max-width: 480px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.04);
        animation: cardIn 0.7s ease-out;
        position: relative;
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

    /* 图标圆圈（与OTP页面风格一致） */
    .reset-icon-circle {
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
        background: var(--bg-light);
        transition: var(--transition);
    }

    .reset-icon-circle:hover {
        border-color: var(--accent-gold);
        background: #fff;
        transform: scale(1.05);
    }

    /* 标题和描述（与OTP页面一致） */
    .reset-title {
        font-size: 28px;
        text-align: center;
        margin-bottom: 10px;
    }

    .reset-desc {
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

    /* 表单组（新增，用于密码输入） */
    .form-group {
        margin-bottom: 20px;
        position: relative;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        font-size: 14px;
        font-weight: 500;
        color: var(--text-main);
        font-family: 'Lato', sans-serif;
    }

    /* 密码输入框（增强样式） */
    .password-wrapper {
        position: relative;
    }

    .password-input {
        width: 100%;
        padding: 12px 45px 12px 15px;
        border: 1px solid var(--border-color);
        border-radius: 4px;
        font-size: 15px;
        font-family: 'Lato', sans-serif;
        color: var(--text-main);
        background: var(--bg-light);
        outline: none;
        transition: var(--transition);
    }

    .password-input:focus {
        border-color: var(--accent-gold);
        background: #fff;
        box-shadow: 0 0 0 3px rgba(197, 160, 89, 0.1);
    }

    .password-input.error {
        border-color: var(--error-color);
        background: var(--error-bg);
    }

    .password-input.success {
        border-color: var(--success-color);
        background: var(--success-bg);
    }

    /* 密码可见性切换按钮 */
    .toggle-password {
        position: absolute;
        right: 12px;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        cursor: pointer;
        color: var(--text-muted);
        font-size: 18px;
        padding: 0;
        width: 24px;
        height: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: var(--transition);
    }

    .toggle-password:hover {
        color: var(--accent-gold);
    }

    /* 密码强度指示器 */
    .strength-meter {
        height: 4px;
        background: #e0e0e0;
        margin-top: 8px;
        border-radius: 2px;
        overflow: hidden;
        display: none;
    }

    .strength-fill {
        height: 100%;
        width: 0%;
        transition: width 0.3s ease, background-color 0.3s ease;
        border-radius: 2px;
    }

    .strength-text {
        font-size: 12px;
        color: var(--text-muted);
        margin-top: 5px;
        height: 18px;
        text-align: right;
    }

    /* 错误提示信息（与OTP页面样式一致） */
    .error-message {
        color: var(--error-color);
        font-size: 12px;
        margin-top: 5px;
        display: none;
    }

    /* 成功提示信息（新增） */
    .success-message {
        color: var(--success-color);
        font-size: 12px;
        margin-top: 5px;
        display: none;
    }

    /* 提交按钮（与OTP页面风格一致） */
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
        margin-top: 25px;
        font-family: 'Lato', sans-serif;
    }

    .btn-submit:hover {
        background-color: transparent;
        color: var(--text-main);
    }

    .btn-submit:disabled {
        background-color: #ccc;
        border-color: #ccc;
        cursor: not-allowed;
        opacity: 0.7;
    }

    /* 成功提示框（与OTP页面风格一致） */
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
        display: none;
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

    .alert-success {
        background: var(--success-bg);
        border: 1px solid rgba(46, 204, 113, 0.3);
        color: var(--success-color);
    }

    .alert-success i {
        color: var(--success-color);
    }

    .alert-error {
        background: var(--error-bg);
        border: 1px solid rgba(185, 28, 28, 0.3);
        color: var(--error-color);
    }

    .alert-error i {
        color: var(--error-color);
    }

    /* 底部链接（与OTP页面一致） */
    .reset-bottom-link {
        text-align: center;
        font-size: 14px;
        color: var(--text-muted);
        margin-top: 25px;
    }

    .reset-bottom-link a {
        color: var(--text-main);
        font-weight: 700;
        text-decoration: underline;
        text-underline-offset: 3px;
    }

    .reset-bottom-link a:hover {
        color: var(--accent-gold);
    }

    /* 页脚文本（与OTP页面一致） */
    .page-footer-text {
        text-align: center;
        padding: 25px 20px;
        font-size: 12px;
        color: #bbb;
        letter-spacing: 0.5px;
    }

    /* 响应式调整（与OTP页面一致） */
    @media (max-width: 480px) {
        .reset-card {
            padding: 35px 25px;
        }

        .reset-title {
            font-size: 24px;
        }

        .password-input {
            padding: 10px 40px 10px 12px;
            font-size: 14px;
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
            Back to Login
        </a>
    </div>
</div>

<!-- RESET PASSWORD FORM -->
<div class="reset-main">
    <div class="reset-card" id="resetCard">

        <div class="reset-icon-circle">
            <i class="fa-solid fa-key"></i>
        </div>

        <h2 class="reset-title">Reset Password</h2>
        <p class="reset-desc">
            Enter your new password below for
            <span class="otp-email-highlight">${email}</span>
        </p>

        <!-- 成功提示框 -->
        <c:if test="${not empty success}">
            <div class="alert-bella alert-success" style="display: flex;">
                <i class="fa-solid fa-circle-check"></i>
                <span>${success}</span>
            </div>
        </c:if>

        <!-- 错误提示框 -->
        <c:if test="${not empty error}">
            <div class="alert-bella alert-error" style="display: flex;">
                <i class="fa-solid fa-circle-exclamation"></i>
                <span>${error}</span>
            </div>
        </c:if>

        <form action="updatePassword" method="post" id="passwordForm">

            <!-- HIDDEN EMAIL - LOGIC UNTOUCHED -->
            <input type="hidden" name="email" value="${email}" />

            <!-- NEW PASSWORD -->
            <div class="form-group">
                <label for="password">New Password</label>
                <div class="password-wrapper">
                    <input type="password" id="password" name="password" class="password-input" placeholder="Enter your new password" autocomplete="new-password" required />
                    <button type="button" class="toggle-password" id="togglePassword" aria-label="Show password">
                        <i class="fa-solid fa-eye"></i>
                    </button>
                </div>
                <div class="strength-meter" id="strengthMeter">
                    <div class="strength-fill" id="strengthFill"></div>
                </div>
                <div class="strength-text" id="strengthText"></div>
                <div class="error-message" id="passwordError">Password must be at least 8 characters long and contain a mix of letters, numbers and symbols.</div>
                <div class="success-message" id="passwordSuccess">Password looks good!</div>
            </div>

            <!-- CONFIRM PASSWORD -->
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <div class="password-wrapper">
                    <input type="password" id="confirmPassword" name="confirmPassword" class="password-input" placeholder="Confirm your new password" autocomplete="new-password" required />
                    <button type="button" class="toggle-password" id="toggleConfirmPassword" aria-label="Show confirm password">
                        <i class="fa-solid fa-eye"></i>
                    </button>
                </div>
                <div class="error-message" id="confirmError">Passwords do not match.</div>
                <div class="success-message" id="confirmSuccess">Passwords match!</div>
            </div>

            <button type="submit" class="btn-submit" id="submitBtn" disabled>Update Password</button>
        </form>

        <div class="reset-bottom-link">
            Remember your password? <a href="login">Back to Login</a>
        </div>
    </div>
</div>

<!-- FOOTER TEXT -->
<div class="page-footer-text">
    &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
</div>

<script>
(function() {
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const togglePasswordBtn = document.getElementById('togglePassword');
    const toggleConfirmPasswordBtn = document.getElementById('toggleConfirmPassword');
    const strengthMeter = document.getElementById('strengthMeter');
    const strengthFill = document.getElementById('strengthFill');
    const strengthText = document.getElementById('strengthText');
    const passwordError = document.getElementById('passwordError');
    const passwordSuccess = document.getElementById('passwordSuccess');
    const confirmError = document.getElementById('confirmError');
    const confirmSuccess = document.getElementById('confirmSuccess');
    const submitBtn = document.getElementById('submitBtn');
    const passwordForm = document.getElementById('passwordForm');

    // 密码强度检测逻辑
    passwordInput.addEventListener('input', function() {
        const val = this.value;
        strengthMeter.style.display = val.length > 0 ? 'block' : 'none';
        passwordSuccess.style.display = 'none';
        passwordError.style.display = 'none';
        this.classList.remove('success', 'error');
        
        let strength = 0;
        let feedback = '';
        
        // 基础长度要求
        if (val.length >= 8) strength += 1;
        
        // 字符类型多样性
        if (val.match(/[a-z]+/)) strength += 1;
        if (val.match(/[A-Z]+/)) strength += 1;
        if (val.match(/[0-9]+/)) strength += 1;
        if (val.match(/[$@#&!]+/)) strength += 1;
        
        // 设置强度指示器和文本
        let color = '#e74c3c'; // 红色
        let width = '25%';
        
        switch(strength) {
            case 1:
                width = '25%';
                color = '#e74c3c'; // 弱
                feedback = 'Weak';
                break;
            case 2:
                width = '50%';
                color = '#f1c40f'; // 一般
                feedback = 'Fair';
                break;
            case 3:
                width = '75%';
                color = '#3498db'; // 良好
                feedback = 'Good';
                break;
            case 4:
                width = '100%';
                color = '#2ecc71'; // 强
                feedback = 'Strong';
                break;
            case 5:
                width = '100%';
                color = '#27ae60'; // 非常强
                feedback = 'Very Strong';
                break;
            default:
                feedback = '';
        }
        
        strengthFill.style.width = width;
        strengthFill.style.backgroundColor = color;
        strengthText.textContent = feedback;
        strengthText.style.color = color;
        
        // 检查确认密码是否匹配
        if (confirmPasswordInput.value.length > 0) {
            checkPasswordMatch();
        }
        
        validateForm();
    });

    // 密码匹配检查
    confirmPasswordInput.addEventListener('input', function() {
        checkPasswordMatch();
        validateForm();
    });

    function checkPasswordMatch() {
        const password = passwordInput.value;
        const confirmPassword = confirmPasswordInput.value;
        
        if (confirmPassword.length === 0) {
            confirmError.style.display = 'none';
            confirmSuccess.style.display = 'none';
            confirmPasswordInput.classList.remove('success', 'error');
            return;
        }
        
        if (password === confirmPassword) {
            confirmError.style.display = 'none';
            confirmSuccess.style.display = 'block';
            confirmPasswordInput.classList.remove('error');
            confirmPasswordInput.classList.add('success');
        } else {
            confirmError.style.display = 'block';
            confirmSuccess.style.display = 'none';
            confirmPasswordInput.classList.remove('success');
            confirmPasswordInput.classList.add('error');
        }
    }

    // 密码可见性切换
    togglePasswordBtn.addEventListener('click', function() {
        togglePasswordVisibility(passwordInput, this);
    });

    toggleConfirmPasswordBtn.addEventListener('click', function() {
        togglePasswordVisibility(confirmPasswordInput, this);
    });

    function togglePasswordVisibility(input, button) {
        const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
        input.setAttribute('type', type);
        
        const icon = button.querySelector('i');
        if (type === 'text') {
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
            button.setAttribute('aria-label', 'Hide password');
        } else {
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
            button.setAttribute('aria-label', 'Show password');
        }
    }

    // 表单验证
    function validateForm() {
        const password = passwordInput.value;
        const confirmPassword = confirmPasswordInput.value;
        
        // 基本密码强度要求（至少需要3个字符类型且长度>=8）
        const strength = calculatePasswordStrength(password);
        const isPasswordStrong = strength >= 3 && password.length >= 8;
        
        // 密码匹配
        const passwordsMatch = password === confirmPassword && password.length > 0;
        
        // 启用或禁用提交按钮
        submitBtn.disabled = !(isPasswordStrong && passwordsMatch);
    }

    function calculatePasswordStrength(password) {
        let strength = 0;
        if (password.length >= 8) strength += 1;
        if (password.match(/[a-z]+/)) strength += 1;
        if (password.match(/[A-Z]+/)) strength += 1;
        if (password.match(/[0-9]+/)) strength += 1;
        if (password.match(/[$@#&!]+/)) strength += 1;
        return strength;
    }

    // 表单提交处理
    passwordForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // 这里可以添加AJAX提交逻辑
        // 例如：
        /*
        fetch('updatePassword', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams(new FormData(passwordForm))
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // 显示成功消息
                const successAlert = document.createElement('div');
                successAlert.className = 'alert-bella alert-success';
                successAlert.innerHTML = '<i class="fa-solid fa-circle-check"></i><span>Password updated successfully!</span>';
                successAlert.style.display = 'flex';
                passwordForm.insertBefore(successAlert, passwordForm.firstChild);
                
                // 禁用表单
                passwordInput.disabled = true;
                confirmPasswordInput.disabled = true;
                submitBtn.disabled = true;
            } else {
                // 显示错误消息
                const errorAlert = document.createElement('div');
                errorAlert.className = 'alert-bella alert-error';
                errorAlert.innerHTML = `<i class="fa-solid fa-circle-exclamation"></i><span>${data.message || 'Failed to update password. Please try again.'}</span>`;
                errorAlert.style.display = 'flex';
                
                // 移除现有的错误消息
                const existingError = passwordForm.querySelector('.alert-error');
                if (existingError) existingError.remove();
                
                passwordForm.insertBefore(errorAlert, passwordForm.firstChild);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            const errorAlert = document.createElement('div');
            errorAlert.className = 'alert-bella alert-error';
            errorAlert.innerHTML = '<i class="fa-solid fa-circle-exclamation"></i><span>An error occurred. Please try again later.</span>';
            errorAlert.style.display = 'flex';
            
            const existingError = passwordForm.querySelector('.alert-error');
            if (existingError) existingError.remove();
            
            passwordForm.insertBefore(errorAlert, passwordForm.firstChild);
        });
        */
        
        // 模拟成功响应（用于演示）
        const successAlert = document.createElement('div');
        successAlert.className = 'alert-bella alert-success';
        successAlert.innerHTML = '<i class="fa-solid fa-circle-check"></i><span>Password updated successfully!</span>';
        successAlert.style.display = 'flex';
        passwordForm.insertBefore(successAlert, passwordForm.firstChild);
        
        // 禁用表单
        passwordInput.disabled = true;
        confirmPasswordInput.disabled = true;
        submitBtn.disabled = true;
        submitBtn.textContent = 'Password Updated';
    });

    // 初始验证
    validateForm();
})();
</script>

</body>
</html>