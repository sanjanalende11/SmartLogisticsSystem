
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Checkout | SmartLogisticsSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Theme Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    :root {
        --bg-body: #f7f6f3;
        --bg-card: #ffffff;
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
        --success-bg: #f0f9f0;
        --success-text: #2f855a;
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

    .nav-back-link {
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        color: var(--text-muted);
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .nav-back-link:hover {
        color: var(--accent-gold);
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

    .checkout-grid {
        display: grid;
        grid-template-columns: 1fr 420px;
        gap: 30px;
    }

    /* ========== CARDS ========== */
    .card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 30px;
        box-shadow: var(--shadow-sm);
    }

    .section-title {
        font-family: 'Playfair Display', serif;
        font-size: 22px;
        font-weight: 600;
        margin-bottom: 24px;
        padding-bottom: 12px;
        border-bottom: 2px solid var(--accent-gold);
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .section-title i {
        color: var(--accent-gold);
        font-size: 18px;
    }

    /* ========== FORMS ========== */
    .form-group {
        margin-bottom: 20px;
    }

    .form-label {
        display: block;
        margin-bottom: 8px;
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        color: var(--text-main);
    }

    .form-control {
        width: 100%;
        padding: 12px 16px;
        border: 1px solid var(--border-color);
        border-radius: 4px;
        font-size: 15px;
        font-family: 'Lato', sans-serif;
        background: var(--bg-light);
        color: var(--text-main);
        outline: none;
        transition: var(--transition);
    }

    .form-control:focus {
        border-color: var(--accent-gold);
        background: #fff;
        box-shadow: 0 0 0 3px rgba(197, 160, 89, 0.1);
    }

    .payment-input-group {
        background: var(--bg-light);
        padding: 15px;
        border-radius: 4px;
        border: 1px solid var(--border-color);
        margin-top: 10px;
        animation: slideDown 0.3s ease;
    }

    @keyframes slideDown {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* ========== SUMMARY ITEMS ========== */
    .order-items-list {
        display: flex;
        flex-direction: column;
        gap: 20px;
        max-height: 400px;
        overflow-y: auto;
        padding-right: 5px;
    }

    /* Custom Scrollbar for summary */
    .order-items-list::-webkit-scrollbar {
        width: 6px;
    }
    .order-items-list::-webkit-scrollbar-thumb {
        background: #ccc;
        border-radius: 3px;
    }

    .summary-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 15px;
        border-bottom: 1px solid var(--border-color);
    }

    .summary-item:last-child {
        border-bottom: none;
    }

    .item-info h4 {
        font-family: 'Playfair Display', serif;
        font-size: 16px;
        font-weight: 600;
        color: var(--text-main);
        margin-bottom: 4px;
    }

    .item-meta {
        font-size: 13px;
        color: var(--text-muted);
    }

    .item-total {
        font-weight: 700;
        color: var(--text-main);
        font-size: 16px;
    }

    /* ========== PRICING ========== */
    .price-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 12px;
        font-size: 15px;
        color: var(--text-muted);
    }

    .price-row.final {
        margin-top: 20px;
        padding-top: 20px;
        border-top: 2px solid var(--border-color);
        font-family: 'Playfair Display', serif;
        font-size: 24px;
        font-weight: 700;
        color: var(--text-main);
    }

    .price-row.final span:last-child {
        color: var(--accent-gold);
    }

    .discount-badge {
        display: inline-block;
        margin-top: 10px;
        padding: 8px 12px;
        background: var(--glass-bg);
        border: 1px solid var(--glass-border);
        color: var(--success-text);
        font-size: 13px;
        font-weight: 700;
        border-radius: 4px;
    }

    /* ========== BUTTONS ========== */
    .btn-submit {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        padding: 16px;
        background: var(--accent-gold);
        color: #fff;
        text-align: center;
        font-size: 15px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: var(--transition);
        margin-top: 25px;
        font-family: 'Lato', sans-serif;
    }

    .btn-submit:hover {
        background: var(--accent-hover);
        box-shadow: 0 5px 15px rgba(197, 160, 89, 0.3);
        transform: translateY(-2px);
    }

    .btn-submit i {
        margin-right: 8px;
    }

    /* ========== EMPTY STATE ========== */
    .empty-state {
        text-align: center;
        padding: 60px 20px;
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        box-shadow: var(--shadow-sm);
        max-width: 500px;
        margin: 0 auto;
    }

    .empty-icon {
        font-size: 40px;
        color: var(--border-color);
        margin-bottom: 20px;
    }

    .empty-state h3 {
        font-family: 'Playfair Display', serif;
        font-size: 24px;
        color: var(--text-main);
        margin-bottom: 10px;
    }

    .btn-empty {
        display: inline-block;
        padding: 12px 24px;
        background: var(--accent-gold);
        color: #fff;
        font-weight: 700;
        border-radius: 4px;
        margin-top: 15px;
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
        .checkout-grid {
            grid-template-columns: 1fr;
        }
        
        .checkout-grid > :nth-child(2) {
            order: -1; /* Move summary to top on mobile */
        }
    }
</style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="top-nav">
        <div class="nav-inner">
            <a href="index" class="logo">Smart<span>Logistics</span></a>
            <a href="myCart" class="nav-back-link">
                <i class="fa-solid fa-arrow-left"></i>
                Back to Cart
            </a>
        </div>
    </nav>

    <!-- MAIN CONTAINER -->
    <div class="page-container">
        
        <!-- PAGE HEADER -->
        <div class="page-header">
            <h1 class="page-title">Checkout</h1>
            <p class="page-subtitle">Please review your order and enter delivery details.</p>
        </div>

        <c:choose>
            <c:when test="${not empty cartItems}">
                
                <div class="checkout-grid">
                    
                    <!-- LEFT COLUMN: FORM -->
                    <div class="left-col">
                        <div class="card">
                            <h3 class="section-title">
                                <i class="fa-solid fa-truck-fast"></i>
                                Delivery Details
                            </h3>

                            <form action="placeOrderFromCart" method="post">
                                
                                <div class="form-group">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" name="customerName" class="form-control" value="${customer.username}" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Phone Number</label>
                                    <input type="tel" name="phone" class="form-control" placeholder="+91 XXXXX XXXXX" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Delivery Address</label>
                                    <textarea name="address" class="form-control" rows="4" placeholder="House No, Street, City, Zip Code" required></textarea>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Payment Method</label>
                                    <select name="paymentMethod" class="form-control" onchange="togglePayment(this.value)" required>
                                        <option value="" disabled selected>Select Payment Method</option>
                                        <option value="Cash on Delivery">Cash on Delivery</option>
                                        <option value="UPI">UPI / GPay / PhonePe</option>
                                        <option value="Debit Card">Debit Card</option>
                                        <option value="Credit Card">Credit Card</option>
                                    </select>
                                </div>

                                <!-- Dynamic Payment Fields -->
                                <div id="upiSection" class="payment-input-group" style="display: none;">
                                    <div class="form-group" style="margin-bottom: 0;">
                                        <label class="form-label" style="margin-bottom: 5px;">Enter UPI ID</label>
                                        <input type="text" name="upiId" class="form-control" placeholder="mobile@upi">
                                    </div>
                                </div>

                                <div id="cardSection" class="payment-input-group" style="display: none;">
                                    <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 15px;">
                                        <div class="form-group" style="margin-bottom: 0;">
                                            <label class="form-label" style="margin-bottom: 5px;">Card Number</label>
                                            <input type="text" name="cardNumber" class="form-control" placeholder="XXXX XXXX XXXX XXXX">
                                        </div>
                                        <div class="form-group" style="margin-bottom: 0;">
                                            <label class="form-label" style="margin-bottom: 5px;">Expiry</label>
                                            <input type="text" name="expiry" class="form-control" placeholder="MM/YY">
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 0; margin-top: 15px;">
                                        <label class="form-label" style="margin-bottom: 5px;">CVV</label>
                                        <input type="password" name="cvv" class="form-control" placeholder="123" style="width: 100px;">
                                    </div>
                                </div>

                                <button type="submit" class="btn-submit">
                                    <i class="fa-solid fa-check"></i> Place Order
                                </button>
                            </form>
                        </div>
                    </div>

                    <!-- RIGHT COLUMN: SUMMARY -->
                    <div class="right-col">
                        <div class="card" style="position: sticky; top: 100px;">
                            <h3 class="section-title">
                                <i class="fa-solid fa-receipt"></i>
                                Order Summary
                            </h3>

                            <div class="order-items-list">
                                <c:forEach var="item" items="${cartItems}">
                                    <div class="summary-item">
                                        <div class="item-info">
                                            <h4>${item.product.name}</h4>
                                            <div class="item-meta">${item.product.category} &bull; Qty: ${item.quantity}</div>
                                        </div>
                                        <div class="item-total">₹${item.product.price * item.quantity}</div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div style="margin-top: 25px; border-top: 1px solid var(--border-color); padding-top: 20px;">
                                <div class="price-row">
                                    <span>Subtotal</span>
                                    <span>₹${cartTotal}</span>
                                </div>
                                <div class="price-row">
                                    <span>Delivery</span>
                                    <span>Free</span>
                                </div>
                                <div class="price-row">
                                    <span>Tax</span>
                                    <span>Included</span>
                                </div>

                                <div class="price-row final">
                                    <span>Total</span>
                                    <span>₹${finalAmount}</span>
                                </div>

                                <c:if test="${discountAmount > 0}">
                                    <div class="discount-badge">
                                        <i class="fa-solid fa-tag"></i> You saved ₹${discountAmount}
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>

                </div>

            </c:when>

            <c:otherwise>
                <!-- EMPTY STATE -->
                <div class="empty-state">
                    <div class="empty-icon">
                        <i class="fa-solid fa-basket-shopping"></i>
                    </div>
                    <h3>Your Cart is Empty</h3>
                    <p>You cannot proceed to checkout with no items.</p>
                    <a href="productList" class="btn-empty">Browse Products</a>
                </div>
            </c:otherwise>
        </c:choose>

    </div>

    <!-- FOOTER -->
    <footer class="footer">
        &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
    </footer>

    <script>
        function togglePayment(value) {
            const upiSection = document.getElementById("upiSection");
            const cardSection = document.getElementById("cardSection");

            // Reset
            upiSection.style.display = "none";
            cardSection.style.display = "none";

            if (value === "UPI") {
                upiSection.style.display = "block";
            } else if (value === "Debit Card" || value === "Credit Card") {
                cardSection.style.display = "block";
            }
        }
    </script>

</body>
</html>
