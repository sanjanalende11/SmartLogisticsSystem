<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Confirmed | SmartLogisticsSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Theme Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    :root {
        --bg-body: #f7f6f3;
        --bg-card: #ffffff;
        --text-main: #1a1a1a;
        --text-muted: #777777;
        --accent-gold: #c5a059;
        --accent-hover: #b08d4b;
        --border-color: #e8e6e1;
        --shadow-sm: 0 4px 12px rgba(0, 0, 0, 0.05);
        --shadow-md: 0 10px 40px rgba(0, 0, 0, 0.08);
        --transition: all 0.3s ease;
        
        /* Status Colors */
        --success-bg: #f0f9f0;
        --success-text: #166534;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Lato', sans-serif;
        background-color: var(--bg-body);
        color: var(--text-main);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    a {
        text-decoration: none;
        color: inherit;
        transition: var(--transition);
    }

    /* ========== NAVBAR ========== */
    .top-nav {
        background: var(--bg-card);
        border-bottom: 1px solid var(--border-color);
        padding: 16px 0;
    }

    .nav-inner {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .logo {
        font-family: 'Playfair Display', serif;
        font-size: 26px;
        font-weight: 700;
        color: var(--text-main);
        text-decoration: none;
        letter-spacing: -0.5px;
    }

    .logo span {
        color: var(--accent-gold);
    }

    /* ========== MAIN CONTAINER ========== */
    .page-container {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 60px 20px;
    }

    .success-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 60px 40px;
        width: 100%;
        max-width: 500px;
        text-align: center;
        box-shadow: var(--shadow-md);
        animation: cardIn 0.8s ease-out;
    }

    @keyframes cardIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* ICON CIRCLE */
    .icon-circle {
        width: 90px;
        height: 90px;
        background: var(--success-bg);
        border: 1px solid #bbf7d0;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 30px;
        color: var(--success-text);
        font-size: 36px;
        animation: popIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }

    @keyframes popIn {
        0% { transform: scale(0); }
        80% { transform: scale(1.1); }
        100% { transform: scale(1); }
    }

    /* TEXT */
    .page-title {
        font-family: 'Playfair Display', serif;
        font-size: 32px;
        font-weight: 600;
        color: var(--text-main);
        margin-bottom: 12px;
    }

    .page-desc {
        font-size: 16px;
        color: var(--text-muted);
        margin-bottom: 25px;
        line-height: 1.6;
    }

    /* ORDER ID BOX */
    .order-id-box {
        background: var(--bg-body);
        border: 1px solid var(--border-color);
        padding: 15px;
        border-radius: 6px;
        margin-bottom: 30px;
    }

    .order-id-label {
        display: block;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: var(--text-muted);
        margin-bottom: 5px;
        font-weight: 700;
    }

    .order-id-value {
        font-family: 'Playfair Display', serif;
        font-size: 24px;
        font-weight: 700;
        color: var(--accent-gold);
    }

    /* BUTTONS */
    .action-group {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .btn {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 16px;
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
        border-radius: 4px;
        transition: var(--transition);
        font-family: 'Lato', sans-serif;
        cursor: pointer;
    }

    .btn-primary {
        background-color: var(--accent-gold);
        color: #fff;
        border: 1px solid var(--accent-gold);
    }

    .btn-primary:hover {
        background-color: var(--accent-hover);
        border-color: var(--accent-hover);
        transform: translateY(-2px);
    }

    .btn-secondary {
        background-color: transparent;
        color: var(--text-main);
        border: 1px solid var(--border-color);
    }

    .btn-secondary:hover {
        background-color: var(--bg-body);
        border-color: var(--text-main);
    }

    /* FOOTER */
    .footer {
        background: #fff;
        border-top: 1px solid var(--border-color);
        padding: 20px 0;
        text-align: center;
        font-size: 13px;
        color: var(--text-muted);
    }

    /* RESPONSIVE */
    @media (min-width: 576px) {
        .action-group {
            flex-direction: row;
        }
        
        .btn {
            flex: 1;
        }
    }
</style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="top-nav">
        <div class="nav-inner">
            <a href="index" class="logo">Smart<span>Logistics</span></a>
        </div>
    </nav>

    <!-- MAIN CONTAINER -->
    <div class="page-container">
        
        <div class="success-card">
            <div class="icon-circle">
                <i class="fa-solid fa-check"></i>
            </div>

            <h1 class="page-title">Order Confirmed!</h1>
            <p class="page-desc">
                Thank you for shopping with us. Your order has been placed successfully and is being processed.
            </p>

            <div class="order-id-box">
                <span class="order-id-label">Order Number</span>
                <div class="order-id-value">#${sessionScope.lastOrderNumber}</div>
            </div>

            <div class="action-group">
                <a href="myOrders" class="btn btn-primary">
                    <i class="fa-solid fa-box-open" style="margin-right: 8px;"></i>
                    View My Orders
                </a>
                <a href="productList" class="btn btn-secondary">
                    <i class="fa-solid fa-bag-shopping" style="margin-right: 8px;"></i>
                    Continue Shopping
                </a>
            </div>
        </div>

    </div>

    <!-- FOOTER -->
    <footer class="footer">
        &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
    </footer>

</body>
</html>