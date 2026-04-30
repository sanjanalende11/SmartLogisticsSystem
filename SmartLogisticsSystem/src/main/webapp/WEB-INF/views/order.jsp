
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Place Order | SmartLogisticsSystem</title>
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
        --border-light: #f3f4f6;
        --shadow-sm: 0 4px 12px rgba(0, 0, 0, 0.05);
        --shadow-md: 0 10px 40px rgba(0, 0, 0, 0.08);
        --transition: all 0.3s ease;
        
        --glass-bg: rgba(197, 160, 89, 0.05);
        --glass-border: rgba(197, 160, 89, 0.15);
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

    /* ========== HEADER ========== */
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

    /* ========== MAIN LAYOUT ========== */
    .page-container {
        max-width: 1280px;
        margin: 0 auto;
        padding: 40px 20px;
        width: 100%;
        flex: 1;
    }

    .page-grid {
        display: grid;
        grid-template-columns: 1fr 420px;
        gap: 40px;
        align-items: start;
    }

    /* ========== PRODUCT CARD ========== */
    .product-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        overflow: hidden;
        box-shadow: var(--shadow-sm);
    }

    .product-image-wrapper {
        width: 100%;
        height: 400px;
        background: var(--bg-light);
        border-bottom: 1px solid var(--border-color);
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    .product-image-wrapper img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .product-details {
        padding: 30px;
    }

    .product-category {
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        color: var(--text-muted);
        font-weight: 700;
        margin-bottom: 10px;
        display: block;
    }

    .product-title {
        font-family: 'Playfair Display', serif;
        font-size: 32px;
        font-weight: 600;
        color: var(--text-main);
        margin-bottom: 12px;
        line-height: 1.2;
    }

    .product-rating {
        color: #FFD700;
        font-size: 14px;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        gap: 5px;
    }
    
    .product-rating span {
        color: var(--text-muted);
        font-size: 13px;
        margin-left: 5px;
    }

    .product-price-large {
        font-family: 'Playfair Display', serif;
        font-size: 36px;
        font-weight: 700;
        color: var(--accent-gold);
        margin-bottom: 15px;
    }

    .product-desc {
        color: var(--text-muted);
        font-size: 15px;
        line-height: 1.7;
        margin-bottom: 25px;
    }

    .feature-list {
        list-style: none;
        border-top: 1px solid var(--border-light);
        padding-top: 20px;
    }

    .feature-list li {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 10px;
        color: var(--text-main);
        font-size: 14px;
    }

    .feature-list li i {
        color: var(--accent-gold);
        font-size: 12px;
    }

    /* ========== ORDER FORM CARD ========== */
    .order-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 35px;
        box-shadow: var(--shadow-md);
        position: sticky;
        top: 100px;
    }

    .card-header {
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 1px solid var(--border-light);
    }

    .card-header h3 {
        font-family: 'Playfair Display', serif;
        font-size: 22px;
        font-weight: 600;
        color: var(--text-main);
    }

    /* FORMS */
    .form-group {
        margin-bottom: 20px;
    }

    .form-label {
        display: block;
        margin-bottom: 8px;
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        font-weight: 700;
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

    /* SUMMARY SECTION INSIDE FORM */
    .order-summary {
        background: var(--glass-bg);
        border: 1px solid var(--glass-border);
        border-radius: 6px;
        padding: 15px 20px;
        margin: 25px 0;
    }

    .summary-row {
        display: flex;
        justify-content: space-between;
        font-size: 14px;
        color: var(--text-muted);
        margin-bottom: 8px;
    }

    .summary-row.total {
        border-top: 1px solid var(--border-color);
        padding-top: 10px;
        margin-top: 10px;
        margin-bottom: 0;
        font-family: 'Playfair Display', serif;
        font-size: 20px;
        font-weight: 700;
        color: var(--text-main);
    }

    .summary-row.total span:last-child {
        color: var(--accent-gold);
    }

    /* BUTTON */
    .btn-submit {
        display: flex;
        align-items: center;
        justify-content: center;
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
        font-family: 'Lato', sans-serif;
    }

    .btn-submit:hover {
        background: var(--accent-hover);
        box-shadow: 0 5px 15px rgba(197, 160, 89, 0.3);
        transform: translateY(-2px);
    }

    .secure-note {
        text-align: center;
        margin-top: 15px;
        font-size: 13px;
        color: var(--text-muted);
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }
    
    .secure-note i {
        color: var(--success-text);
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
        .page-grid {
            grid-template-columns: 1fr;
        }
        
        .order-card {
            position: static;
            order: -1; /* Form on top for mobile */
        }

        .product-image-wrapper {
            height: 300px;
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
        
        <div class="page-grid">
            
            <!-- LEFT: PRODUCT DETAILS -->
            <div class="product-card">
                <div class="product-image-wrapper">
                    <!-- Placeholder Image -->
                    <i class="fa-solid fa-box-open" style="font-size: 80px; color: #ddd;"></i>
                </div>
                
                <div class="product-details">
                    <span class="product-category">Featured Collection</span>
                    <h1 class="product-title">Premium Shopping Product</h1>
                    
                    <div class="product-rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                        <span>(4.5 Customer Reviews)</span>
                    </div>

                    <div class="product-price-large">₹999</div>
                    <p class="product-desc">
                        Experience luxury shopping with our premium collection. 
                        Designed for comfort and style, this item represents the highest quality standards 
                        you expect from SmartLogistics.
                    </p>

                    <ul class="feature-list">
                        <li><i class="fa-solid fa-check"></i> High-quality material craftsmanship</li>
                        <li><i class="fa-solid fa-check"></i> 7-day easy return policy</li>
                        <li><i class="fa-solid fa-truck-fast"></i> Free & Fast delivery</li>
                        <li><i class="fa-solid fa-shield-halved"></i> Secure payment processing</li>
                    </ul>
                </div>
            </div>

            <!-- RIGHT: ORDER FORM -->
            <div class="order-card">
                <div class="card-header">
                    <h3>Place Your Order</h3>
                </div>

                <form action="placeOrder" method="post">
                    
                    <div class="form-group">
                        <label class="form-label">Product Name</label>
                        <input type="text" name="productName" class="form-control" value="Premium Shopping Product" readonly>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Quantity</label>
                        <input type="number" name="quantity" class="form-control" value="1" min="1" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Customer Name</label>
                        <input type="text" name="customerName" class="form-control" placeholder="Enter your full name" required>
                    </div>

                    <!-- Inline Summary -->
                    <div class="order-summary">
                        <div class="summary-row">
                            <span>Price per unit</span>
                            <span>₹999</span>
                        </div>
                        <div class="summary-row">
                            <span>Delivery</span>
                            <span style="color: var(--success-text);">Free</span>
                        </div>
                        <div class="summary-row total">
                            <span>Total</span>
                            <span>₹999</span>
                        </div>
                    </div>

                    <button type="submit" class="btn-submit">
                        <i class="fa-solid fa-bag-shopping" style="margin-right: 8px;"></i> 
                        Place Order
                    </button>

                    <div class="secure-note">
                        <i class="fa-solid fa-lock"></i>
                        256-bit SSL Encrypted Transaction
                    </div>

                </form>
            </div>

        </div>

    </div>

    <!-- FOOTER -->
    <footer class="footer">
        &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
    </footer>

</body>
</html>
