
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Cart | SmartLogisticsSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Theme Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    :root {
        --bg-body: #f7f6f3;
        --bg-card: #ffffff;
        --bg-header: #ffffff;
        --bg-light: #fcfcfc;
        --text-main: #1a1a1a;
        --text-muted: #777777;
        --accent-gold: #c5a059;
        --accent-hover: #b08d4b;
        --border-color: #e8e6e1;
        --shadow-sm: 0 4px 12px rgba(0, 0, 0, 0.05);
        --shadow-md: 0 8px 24px rgba(0, 0, 0, 0.08);
        --transition: all 0.3s ease;
        
        /* Glassmorphism Accents */
        --glass-bg: rgba(197, 160, 89, 0.05);
        --glass-border: rgba(197, 160, 89, 0.15);
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
        background: var(--bg-header);
        border-bottom: 1px solid var(--border-color);
        padding: 16px 0;
        position: sticky;
        top: 0;
        z-index: 100;
    }

    .nav-inner {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
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

    .nav-cart-icon {
        position: relative;
        font-size: 20px;
        color: var(--text-main);
        cursor: pointer;
        padding: 8px;
        border-radius: 50%;
        transition: var(--transition);
    }

    .nav-cart-icon:hover {
        color: var(--accent-gold);
        background: var(--glass-bg);
    }

    .cart-badge {
        position: absolute;
        top: 0;
        right: 0;
        background: var(--accent-gold);
        color: #fff;
        font-size: 11px;
        font-weight: 700;
        width: 18px;
        height: 18px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 2px solid #fff;
    }

    /* ========== MAIN LAYOUT ========== */
    .page-container {
        max-width: 1280px;
        margin: 0 auto;
        padding: 40px 20px;
        width: 100%;
        flex: 1;
    }

    .page-header {
        margin-bottom: 30px;
        border-bottom: 1px solid var(--border-color);
        padding-bottom: 15px;
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
    }

    .page-title {
        font-family: 'Playfair Display', serif;
        font-size: 36px;
        font-weight: 600;
        color: var(--text-main);
    }

    .page-subtitle {
        font-family: 'Lato', sans-serif;
        font-size: 16px;
        color: var(--text-muted);
        font-weight: 300;
        margin-top: 5px;
    }

    .cart-count-badge {
        font-family: 'Lato', sans-serif;
        font-size: 14px;
        font-weight: 700;
        color: var(--accent-gold);
        background: var(--glass-bg);
        padding: 6px 12px;
        border: 1px solid var(--glass-border);
        border-radius: 20px;
    }

    .content-grid {
        display: grid;
        grid-template-columns: 1fr 380px;
        gap: 30px;
    }

    /* ========== CART ITEMS LIST ========== */
    .cart-list {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .cart-item {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 24px;
        display: flex;
        gap: 24px;
        transition: var(--transition);
        position: relative;
    }

    .cart-item:hover {
        box-shadow: var(--shadow-sm);
        border-color: var(--accent-gold);
        transform: translateY(-2px);
    }

    .item-image {
        width: 120px;
        height: 120px;
        border-radius: 6px;
        overflow: hidden;
        background: #f0f0f0;
        flex-shrink: 0;
        border: 1px solid var(--border-color);
    }

    .item-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .item-details {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .item-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }

    .item-name {
        font-family: 'Playfair Display', serif;
        font-size: 20px;
        font-weight: 600;
        color: var(--text-main);
        margin-bottom: 6px;
    }

    .item-category {
        font-size: 13px;
        color: var(--text-muted);
        text-transform: uppercase;
        letter-spacing: 0.5px;
        font-weight: 700;
    }

    .item-price-block {
        text-align: right;
    }

    .item-price {
        font-family: 'Playfair Display', serif;
        font-size: 22px;
        font-weight: 700;
        color: var(--accent-gold);
    }

    .item-qty {
        font-size: 14px;
        color: var(--text-muted);
        margin-top: 4px;
    }

    .item-meta {
        display: flex;
        align-items: center;
        gap: 20px;
        margin-top: 10px;
        padding-top: 10px;
        border-top: 1px solid var(--border-color);
    }

    .subtotal-display {
        font-size: 14px;
        color: var(--text-main);
    }

    .subtotal-display strong {
        font-weight: 700;
    }

    .remove-link {
        font-size: 13px;
        font-weight: 700;
        color: var(--text-muted);
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 6px;
        transition: var(--transition);
    }

    .remove-link:hover {
        color: #d9534f;
    }

    /* ========== SUMMARY CARD ========== */
    .summary-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 30px;
        height: fit-content;
        position: sticky;
        top: 100px;
        box-shadow: var(--shadow-sm);
    }

    .summary-title {
        font-family: 'Playfair Display', serif;
        font-size: 22px;
        font-weight: 600;
        margin-bottom: 24px;
        padding-bottom: 15px;
        border-bottom: 2px solid var(--accent-gold);
    }

    .summary-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        font-size: 15px;
        color: var(--text-muted);
    }

    .summary-row.total {
        margin-top: 20px;
        margin-bottom: 25px;
        padding-top: 20px;
        border-top: 1px solid var(--border-color);
        font-family: 'Playfair Display', serif;
        font-size: 24px;
        font-weight: 700;
        color: var(--text-main);
    }

    .summary-row.total span:last-child {
        color: var(--accent-gold);
    }

    .btn-checkout {
        display: block;
        width: 100%;
        padding: 16px;
        background: var(--accent-gold);
        color: #fff;
        text-align: center;
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: var(--transition);
        margin-bottom: 12px;
        font-family: 'Lato', sans-serif;
    }

    .btn-checkout:hover {
        background: var(--accent-hover);
        box-shadow: 0 5px 15px rgba(197, 160, 89, 0.3);
    }

    .btn-continue {
        display: block;
        width: 100%;
        padding: 14px;
        background: transparent;
        color: var(--text-main);
        text-align: center;
        font-size: 13px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        border: 1px solid var(--border-color);
        border-radius: 4px;
        cursor: pointer;
        transition: var(--transition);
        font-family: 'Lato', sans-serif;
    }

    .btn-continue:hover {
        border-color: var(--text-main);
        background: var(--bg-light);
    }

    .delivery-note {
        margin-top: 24px;
        padding: 15px;
        background: var(--glass-bg);
        border: 1px solid var(--glass-border);
        border-radius: 6px;
        font-size: 13px;
        color: var(--text-muted);
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .delivery-note i {
        color: var(--accent-gold);
    }

    /* ========== EMPTY STATE ========== */
    .empty-cart-wrapper {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 60px 20px;
        text-align: center;
        box-shadow: var(--shadow-sm);
        max-width: 600px;
        margin: 0 auto;
    }

    .empty-icon {
        font-size: 48px;
        color: var(--border-color);
        margin-bottom: 24px;
    }

    .empty-cart-wrapper h2 {
        font-family: 'Playfair Display', serif;
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 12px;
        color: var(--text-main);
    }

    .empty-cart-wrapper p {
        font-size: 15px;
        color: var(--text-muted);
        margin-bottom: 30px;
    }

    .btn-empty {
        display: inline-block;
        padding: 14px 32px;
        background: var(--accent-gold);
        color: #fff;
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        border-radius: 4px;
        border: none;
        cursor: pointer;
        transition: var(--transition);
    }

    .btn-empty:hover {
        background: var(--accent-hover);
    }

    /* ========== FOOTER ========== */
    .footer {
        background: #fff;
        border-top: 1px solid var(--border-color);
        padding: 20px 0;
        text-align: center;
        font-size: 13px;
        color: var(--text-muted);
        margin-top: auto;
    }

    /* ========== RESPONSIVE ========== */
    @media (max-width: 992px) {
        .content-grid {
            grid-template-columns: 1fr;
        }
        
        .summary-card {
            position: static;
            order: -1; /* Summary on top for mobile */
            margin-bottom: 20px;
        }
    }

    @media (max-width: 576px) {
        .cart-item {
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        
        .item-header {
            flex-direction: column;
            gap: 10px;
        }
        
        .item-price-block {
            text-align: center;
        }
        
        .item-meta {
            flex-direction: column;
            gap: 10px;
        }
        
        .page-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 10px;
        }
    }
</style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="top-nav">
        <div class="nav-inner">
            <a href="index" class="logo">Smart<span>Logistics</span></a>
            
            <div class="nav-cart-icon" onclick="window.location.href='myCart'">
                <i class="fa-solid fa-bag-shopping"></i>
                <span class="cart-badge">
                    <c:choose>
                        <c:when test="${not empty cartItems}">${cartItems.size()}</c:when>
                        <c:otherwise>0</c:otherwise>
                    </c:choose>
                </span>
            </div>
        </div>
    </nav>

    <!-- MAIN CONTAINER -->
    <div class="page-container">
        
        <!-- PAGE HEADER -->
        <div class="page-header">
            <div>
                <h1 class="page-title">Shopping Cart</h1>
                <p class="page-subtitle">Review your selected items</p>
            </div>
            <c:if test="${not empty cartItems}">
                <span class="cart-count-badge">${cartItems.size()} Items</span>
            </c:if>
        </div>

        <c:choose>
            <c:when test="${not empty cartItems}">
                
                <div class="content-grid">
                    
                    <!-- CART ITEMS LIST -->
                    <div class="cart-list">
                        <c:forEach var="item" items="${cartItems}">
                            <div class="cart-item">
                                <div class="item-image">
                                    <img src="${pageContext.request.contextPath}/Images/${item.product.img1}" alt="${item.product.name}">
                                </div>
                                <div class="item-details">
                                    <div>
                                        <div class="item-header">
                                            <div>
                                                <div class="item-category">${item.product.category}</div>
                                                <div class="item-name">${item.product.name}</div>
                                            </div>
                                            <div class="item-price-block">
                                                <div class="item-price">₹${item.product.price}</div>
                                                <div class="item-qty">Qty: ${item.quantity}</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="item-meta">
                                        <div class="subtotal-display">
                                            Subtotal: <strong>₹${item.product.price * item.quantity}</strong>
                                        </div>
                                        <a href="removeFromCart?productId=${item.product.id}" class="remove-link">
                                            <i class="fa-solid fa-trash-can"></i> Remove
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- ORDER SUMMARY -->
                    <div class="summary-card">
                        <h3 class="summary-title">Order Summary</h3>
                        
                        <div class="summary-row">
                            <span>Items (${cartItems.size()})</span>
                            <span>₹${cartTotal}</span>
                        </div>
                        <div class="summary-row">
                            <span>Delivery</span>
                            <span>Free</span>
                        </div>
                        <div class="summary-row">
                            <span>Tax</span>
                            <span>Calculated at checkout</span>
                        </div>
                        
                        <div class="summary-row total">
                            <span>Total</span>
                            <span>₹${cartTotal}</span>
                        </div>

                        <a href="checkout" class="btn-checkout">
                            Proceed to Checkout
                        </a>
                        
                        <a href="productList" class="btn-continue">
                            Continue Shopping
                        </a>

                        <div class="delivery-note">
                            <i class="fa-solid fa-circle-info"></i>
                            <span>Free delivery on this order. Returns within 7 days.</span>
                        </div>
                    </div>

                </div>

            </c:when>

            <c:otherwise>
                
                <!-- EMPTY STATE -->
                <div class="empty-cart-wrapper">
                    <div class="empty-icon">
                        <i class="fa-solid fa-cart-arrow-down"></i>
                    </div>
                    <h2>Your Cart is Empty</h2>
                    <p>Looks like you haven't added anything to your cart yet.</p>
                    <a href="productList" class="btn-empty">Start Shopping</a>
                </div>

            </c:otherwise>
        </c:choose>

    </div>

    <!-- FOOTER -->
    <footer class="footer">
        &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
    </footer>

</body>
</html>
