<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Product Details | SmartLogisticsSystem</title>
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
        
        /* Status Colors */
        --success-text: #2f855a;
        --success-bg: #f0f9f0;
        --danger-text: #b91c1c;
        --danger-bg: #fee2e2;
        --gold-light: #f0f9f0;
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
        background: #111827;
        border-bottom: 4px solid var(--accent-gold);
        padding: 14px 0;
        position: sticky;
        top: 0;
        z-index: 1000;
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
        color: #fff;
        text-decoration: none;
        letter-spacing: -0.5px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .logo i {
        font-size: 24px;
    }

    .logo span {
        color: var(--accent-gold);
    }

    .search-bar {
        flex: 1;
        max-width: 500px;
        margin: 0 20px;
        position: relative;
    }

    .search-input {
        width: 100%;
        padding: 12px 45px 12px 20px;
        border-radius: 30px;
        border: none;
        background: rgba(255, 255, 255, 0.1);
        color: #fff;
        outline: none;
    }

    .search-input::placeholder {
        color: rgba(255, 255, 255, 0.6);
    }

    .search-btn {
        position: absolute;
        right: 5px;
        top: 50%;
        transform: translateY(-50%);
        background: var(--accent-gold);
        border: none;
        width: 36px;
        height: 36px;
        border-radius: 50%;
        color: #111827;
        cursor: pointer;
        transition: var(--transition);
    }

    .search-btn:hover {
        background: #fff;
    }

    .nav-actions {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .nav-btn {
        background: transparent;
        border: 1px solid rgba(255, 255, 255, 0.3);
        color: #fff;
        padding: 8px 16px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: var(--transition);
    }

    .nav-btn:hover {
        background: rgba(255, 255, 255, 0.1);
        border-color: #fff;
    }

    .nav-btn-gold {
        background: var(--accent-gold);
        border-color: var(--accent-gold);
        color: #111827;
    }

    .nav-btn-gold:hover {
        background: #fff;
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

    .breadcrumb {
        font-size: 14px;
        color: var(--text-muted);
        margin-bottom: 30px;
    }

    .breadcrumb a {
        color: var(--accent-gold);
        font-weight: 700;
    }

    .product-details-wrapper {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 50px;
    }

    /* LEFT COLUMN: IMAGES */
    .product-gallery {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .main-image-container {
        background: #fff;
        border-radius: 12px;
        overflow: hidden;
        border: 1px solid var(--border-color);
        aspect-ratio: 1 / 1;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
    }

    .main-image-container img {
        width: 100%;
        height: 100%;
        object-fit: contain;
        padding: 20px;
    }

    .badge-bestseller {
        position: absolute;
        top: 20px;
        left: 20px;
        background: var(--accent-gold);
        color: #fff;
        padding: 8px 16px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    .wishlist-btn {
        position: absolute;
        top: 20px;
        right: 20px;
        width: 45px;
        height: 45px;
        background: #fff;
        border: 1px solid var(--border-color);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--text-muted);
        cursor: pointer;
        transition: var(--transition);
        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
    }

    .wishlist-btn:hover {
        color: #e74c3c;
        border-color: #e74c3c;
    }

    .thumbnail-strip {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 12px;
    }

    .thumb-box {
        background: #fff;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        aspect-ratio: 1 / 1;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: var(--transition);
    }

    .thumb-box:hover {
        border-color: var(--accent-gold);
        transform: scale(1.02);
    }

    .thumb-box img {
        max-width: 100%;
        max-height: 100%;
        object-fit: contain;
        padding: 10px;
    }

    /* RIGHT COLUMN: INFO */
    .product-info {
        display: flex;
        flex-direction: column;
    }

    .category-tag {
        display: inline-block;
        background: var(--bg-light);
        color: var(--accent-gold);
        padding: 6px 14px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 12px;
        width: fit-content;
    }

    .product-title {
        font-family: 'Playfair Display', serif;
        font-size: 36px;
        font-weight: 600;
        line-height: 1.2;
        margin-bottom: 15px;
        color: var(--text-main);
    }

    .rating-row {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 20px;
        flex-wrap: wrap;
    }

    .stars {
        color: #FFD700;
        font-size: 16px;
    }

    .review-count {
        font-size: 14px;
        color: var(--text-muted);
    }

    .price-area {
        display: flex;
        align-items: baseline;
        gap: 15px;
        margin-bottom: 15px;
    }

    .current-price {
        font-family: 'Playfair Display', serif;
        font-size: 32px;
        font-weight: 700;
        color: var(--accent-gold);
    }

    .original-price {
        font-size: 18px;
        text-decoration: line-through;
        color: #999;
    }

    .discount-tag {
        color: var(--success-text);
        font-size: 14px;
        font-weight: 700;
        background: var(--success-bg);
        padding: 4px 8px;
        border-radius: 4px;
    }

    .stock-status {
        margin-bottom: 25px;
        font-size: 15px;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .stock-status.instock {
        color: var(--success-text);
    }

    .stock-status.outstock {
        color: var(--danger-text);
    }

    .description-box {
        background: var(--bg-light);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 25px;
    }

    .description-title {
        font-family: 'Playfair Display', serif;
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 10px;
    }

    .description-text {
        font-size: 15px;
        line-height: 1.7;
        color: var(--text-muted);
    }

    /* HIGHLIGHT LIST */
    .feature-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 15px;
        margin-bottom: 30px;
    }

    .feature-card {
        background: #fff;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 15px;
        display: flex;
        align-items: center;
        gap: 12px;
        transition: var(--transition);
    }

    .feature-card:hover {
        border-color: var(--accent-gold);
        transform: translateY(-2px);
        box-shadow: var(--shadow-sm);
    }

    .feature-icon {
        width: 40px;
        height: 40px;
        border-radius: 8px;
        background: rgba(197, 160, 89, 0.1);
        color: var(--accent-gold);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
        flex-shrink: 0;
    }

    .feature-text h6 {
        font-size: 14px;
        font-weight: 700;
        margin-bottom: 2px;
        color: var(--text-main);
    }

    .feature-text p {
        font-size: 12px;
        color: var(--text-muted);
    }

    /* ACTION AREA */
    .action-panel {
        background: #fff;
        border: 1px solid var(--border-color);
        border-radius: 12px;
        padding: 25px;
        box-shadow: var(--shadow-sm);
    }

    .qty-row {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 20px;
    }

    .qty-label {
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        color: var(--text-main);
        width: 100px;
    }

    .qty-select {
        flex: 1;
        padding: 10px 15px;
        border: 1px solid var(--border-color);
        border-radius: 6px;
        background: var(--bg-light);
        font-family: 'Lato', sans-serif;
        font-size: 15px;
        font-weight: 600;
        color: var(--text-main);
        outline: none;
    }

    .button-group {
        display: flex;
        gap: 15px;
        margin-bottom: 20px;
    }

    .btn {
        flex: 1;
        padding: 15px;
        border-radius: 6px;
        font-weight: 700;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        text-decoration: none;
    }

    .btn-add {
        background: var(--accent-gold);
        color: #fff;
        border: 1px solid var(--accent-gold);
    }

    .btn-add:hover {
        background: var(--accent-hover);
        border-color: var(--accent-hover);
        box-shadow: 0 5px 15px rgba(197, 160, 89, 0.3);
    }

    .btn-buy {
        background: #111827;
        color: #fff;
        border: 1px solid #111827;
    }

    .btn-buy:hover {
        background: #000;
        border-color: #000;
    }

    .btn-disabled {
        background: #e5e7eb;
        color: #9ca3af;
        border-color: #e5e7eb;
        cursor: not-allowed;
    }

    /* DELIVERY INFO */
    .delivery-info {
        border-top: 1px solid var(--border-light);
        padding-top: 20px;
    }

    .info-item {
        display: flex;
        align-items: flex-start;
        gap: 10px;
        margin-bottom: 12px;
        font-size: 13px;
        color: var(--text-muted);
    }

    .info-item:last-child {
        margin-bottom: 0;
    }

    .info-item i {
        color: var(--accent-gold);
        margin-top: 2px;
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
    @media (max-width: 992px) {
        .product-details-wrapper {
            grid-template-columns: 1fr;
        }
        
        .product-gallery {
            order: -1; /* Images on top for mobile */
        }
    }

    @media (max-width: 576px) {
        .feature-grid {
            grid-template-columns: 1fr;
        }
        
        .button-group {
            flex-direction: column;
        }
        
        .product-title {
            font-size: 28px;
        }
        
        .nav-inner {
            flex-direction: column;
            gap: 15px;
        }
        
        .search-bar {
            width: 100%;
            margin: 10px 0;
        }
    }
</style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="top-nav">
        <div class="nav-inner">
            <a href="index" class="logo">
                <i class="fa-solid fa-bag-shopping"></i> Smart<span>Logistics</span>
            </a>

            <!-- Search Bar (Preserving Logic) -->
            <form action="search" method="get" class="search-bar">
                <input type="text" name="query" class="search-input" placeholder="Search products...">
                <button type="submit" class="search-btn">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </form>

            <!-- Actions -->
            <div class="nav-actions">
                <a href="login" class="nav-btn">
                    <i class="fa-solid fa-user"></i> Login
                </a>
                <a href="myCart" class="nav-btn nav-btn-gold">
                    <i class="fa-solid fa-cart-shopping"></i> Cart
                </a>
            </div>
        </div>
    </nav>

    <!-- MAIN CONTAINER -->
    <div class="page-container">
        
        <!-- Breadcrumb -->
        <div class="breadcrumb">
            <a href="index">Home</a> / <a href="productList">Products</a> / Product Details
        </div>

        <div class="product-details-wrapper">
            
            <!-- LEFT COLUMN: GALLERY -->
            <div class="product-gallery">
                <div class="main-image-container">
                    <!-- Best Seller Badge -->
                    <div class="badge-bestseller">Best Seller</div>
                    
                    <!-- Wishlist Button -->
                    <button class="wishlist-btn" title="Add to Wishlist">
                        <i class="fa-regular fa-heart"></i>
                    </button>

                    <!-- Main Image (Preserving Logic: ${product.img1}) -->
                    <img src="${pageContext.request.contextPath}/Images/${product.img1}" alt="${product.name}">
                </div>

                <!-- Thumbnails (Preserving Logic: img2, img3) -->
                <div class="thumbnail-strip">
                    <c:if test="${not empty product.img1}">
                        <div class="thumb-box" onclick="document.querySelector('.main-image-container img').src='${pageContext.request.contextPath}/Images/${product.img1}'">
                            <img src="${pageContext.request.contextPath}/Images/${product.img1}" alt="Thumb 1">
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty product.img2}">
                        <div class="thumb-box" onclick="document.querySelector('.main-image-container img').src='${pageContext.request.contextPath}/Images/${product.img2}'">
                            <img src="${pageContext.request.contextPath}/Images/${product.img2}" alt="Thumb 2">
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty product.img3}">
                        <div class="thumb-box" onclick="document.querySelector('.main-image-container img').src='${pageContext.request.contextPath}/Images/${product.img3}'">
                            <img src="${pageContext.request.contextPath}/Images/${product.img3}" alt="Thumb 3">
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- RIGHT COLUMN: INFO & ACTIONS -->
            <div class="product-info">
                
                <span class="category-tag">${product.category}</span>
                <h1 class="product-title">${product.name}</h1>

                <div class="rating-row">
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                    <span class="review-count">4.5 (1,245 reviews)</span>
                </div>

                <div class="price-area">
                    <span class="current-price">₹${product.price}</span>
                    <!-- Calculated Old Price for visuals -->
                    <span class="original-price">₹${product.price + 1000}</span>
                    <span class="discount-tag">Special Offer</span>
                </div>

                <!-- Stock Logic -->
                <div class="stock-status ${product.quantity > 0 ? 'instock' : 'outstock'}">
                    <c:choose>
                        <c:when test="${product.quantity > 0}">
                            <i class="fa-solid fa-circle-check"></i> In Stock (${product.quantity} available)
                        </c:when>
                        <c:otherwise>
                            <i class="fa-solid fa-circle-xmark"></i> Out of Stock
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Description -->
                <div class="description-box">
                    <h3 class="description-title">Description</h3>
                    <p class="description-text">
                        <c:choose>
                            <c:when test="${not empty product.description}">
                                ${product.description}
                            </c:when>
                            <c:otherwise>
                                This is a premium product available in SmartLogisticsSystem. It is designed to give customers a better shopping experience with quality, reliability, and strong delivery support.
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>

                <!-- Highlights Grid -->
                <div class="feature-grid">
                    <div class="feature-card">
                        <div class="feature-icon"><i class="fa-solid fa-truck-fast"></i></div>
                        <div class="feature-text">
                            <h6>Fast Delivery</h6>
                            <p>3-5 Business Days</p>
                        </div>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon"><i class="fa-solid fa-shield-halved"></i></div>
                        <div class="feature-text">
                            <h6>Secure Payment</h6>
                            <p>100% Protected</p>
                        </div>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon"><i class="fa-solid fa-box-open"></i></div>
                        <div class="feature-text">
                            <h6>Quality Packing</h6>
                            <p>Damage Free</p>
                        </div>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon"><i class="fa-solid fa-rotate-left"></i></div>
                        <div class="feature-text">
                            <h6>Easy Returns</h6>
                            <p>7 Days Return</p>
                        </div>
                    </div>
                </div>

                <!-- Action Panel -->
                <div class="action-panel">
                    <div class="qty-row">
                        <span class="qty-label">Quantity:</span>
                        <!-- Original Preserved Select Logic -->
                        <select name="quantity" class="qty-select">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>

                    <div class="button-group">
                        <c:choose>
                            <c:when test="${product.quantity > 0}">
                                <!-- Preserved Forms -->
                                <form action="addToCart" method="post" class="btn btn-add" style="display:flex;">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <button type="submit" style="background:none; border:none; color:inherit; font:inherit; width:100%; display:flex; align-items:center; justify-content:center; gap:8px; cursor:pointer;">
                                        <i class="fa-solid fa-cart-plus"></i> Add to Cart
                                    </button>
                                </form>

                                <form action="placeOrder" method="get" class="btn btn-buy" style="display:flex;">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <button type="submit" style="background:none; border:none; color:inherit; font:inherit; width:100%; display:flex; align-items:center; justify-content:center; gap:8px; cursor:pointer;">
                                        <i class="fa-solid fa-bag-shopping"></i> Buy Now
                                    </button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-disabled" disabled>
                                    Currently Unavailable
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="delivery-info">
                        <div class="info-item">
                            <i class="fa-solid fa-location-dot"></i>
                            <span>Delivery available to most serviceable locations.</span>
                        </div>
                        <div class="info-item">
                            <i class="fa-solid fa-truck"></i>
                            <span>Free delivery on selected products and offers.</span>
                        </div>
                        <div class="info-item">
                            <i class="fa-solid fa-credit-card"></i>
                            <span>Cash on Delivery and online payment options available.</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <footer class="footer">
        &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
    </footer>

</body>
</html>