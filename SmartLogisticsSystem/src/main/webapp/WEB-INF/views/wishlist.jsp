<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Wishlist | SmartLogisticsSystem</title>
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
        --shadow-md: 0 10px 40px rgba(0, 0, 0, 0.08);
        --transition: all 0.3s ease;
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
        padding: 16px 0;
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

    .nav-link {
        color: rgba(255, 255, 255, 0.7);
        font-size: 14px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        transition: var(--transition);
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .nav-link:hover {
        color: var(--accent-gold);
    }

    /* ========== MAIN CONTAINER ========== */
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

    .page-count {
        font-size: 14px;
        color: var(--text-muted);
        background: var(--bg-light);
        padding: 6px 12px;
        border-radius: 20px;
        border: 1px solid var(--border-color);
    }

    /* ========== PRODUCT GRID ========== */
    .wishlist-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
        gap: 30px;
    }

    .product-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        overflow: hidden;
        transition: var(--transition);
        position: relative;
        display: flex;
        flex-direction: column;
    }

    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow-md);
        border-color: rgba(197, 160, 89, 0.3);
    }

    /* IMAGE */
    .image-wrapper {
        width: 100%;
        aspect-ratio: 1 / 1;
        background: var(--bg-light);
        position: relative;
        overflow: hidden;
        border-bottom: 1px solid var(--border-light);
    }

    .image-wrapper img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }

    .product-card:hover .image-wrapper img {
        transform: scale(1.05);
    }

    /* BADGES */
    .wishlist-badge {
        position: absolute;
        top: 12px;
        right: 12px;
        width: 35px;
        height: 35px;
        background: #fff;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #e74c3c;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        z-index: 2;
    }

    .wishlist-badge i {
        font-size: 16px;
    }

    /* CONTENT */
    .card-content {
        padding: 20px;
        text-align: center;
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .product-name {
        font-family: 'Playfair Display', serif;
        font-size: 18px;
        font-weight: 600;
        color: var(--text-main);
        margin-bottom: 10px;
        line-height: 1.3;
        /* Clamp to 2 lines */
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .product-price {
        font-size: 20px;
        font-weight: 700;
        color: var(--accent-gold);
        margin-bottom: 15px;
        font-family: 'Lato', sans-serif;
    }

    .btn-view {
        display: block;
        width: 100%;
        padding: 10px;
        background: transparent;
        border: 1px solid var(--text-main);
        color: var(--text-main);
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
        border-radius: 4px;
        transition: var(--transition);
    }

    .btn-view:hover {
        background: var(--text-main);
        color: #fff;
    }

    /* ========== EMPTY STATE ========== */
    .empty-state {
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
        margin-bottom: 20px;
    }

    .empty-state h3 {
        font-family: 'Playfair Display', serif;
        font-size: 24px;
        color: var(--text-main);
        margin-bottom: 10px;
    }

    .empty-state p {
        color: var(--text-muted);
        margin-bottom: 25px;
        font-size: 15px;
    }

    .btn-shop {
        display: inline-block;
        padding: 12px 28px;
        background: var(--accent-gold);
        color: #fff;
        font-weight: 700;
        border-radius: 4px;
        border: none;
        transition: var(--transition);
    }

    .btn-shop:hover {
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
</style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="top-nav">
        <div class="nav-inner">
            <a href="index" class="logo">
                <i class="fa-solid fa-bag-shopping"></i> Smart<span>Logistics</span>
            </a>
            
            <a href="productList" class="nav-link">
                <i class="fa-solid fa-arrow-left"></i> Back to Shop
            </a>
        </div>
    </nav>

    <!-- MAIN CONTAINER -->
    <div class="page-container">
        
        <div class="page-header">
            <h1 class="page-title">My Wishlist</h1>
            <!-- Logic: Display count if items exist -->
            <c:if test="${not empty wishlist}">
                <span class="page-count">${wishlist.size()} items</span>
            </c:if>
        </div>

        <c:choose>
            <c:when test="${not empty wishlist}">
                
                <div class="wishlist-grid">
                    <c:forEach var="p" items="${wishlist}">
                        <div class="product-card">
                            
                            <div class="image-wrapper">
                                <div class="wishlist-badge">
                                    <i class="fa-solid fa-heart"></i>
                                </div>
                                <!-- Logic: img1 from object 'p' -->
                                <img src="${pageContext.request.contextPath}/Images/${p.img1}" alt="${p.name}">
                            </div>

                            <div class="card-content">
                                <h3 class="product-name">${p.name}</h3>
                                <div class="product-price">₹${p.price}</div>
                                <!-- Logic: Link to product details preserving productId -->
                                <a href="productDetails?productId=${p.id}" class="btn-view">
                                    View Product
                                </a>
                            </div>

                        </div>
                    </c:forEach>
                </div>

            </c:when>

            <c:otherwise>
                
                <!-- EMPTY STATE -->
                <div class="empty-state">
                    <div class="empty-icon">
                        <i class="fa-regular fa-heart"></i>
                    </div>
                    <h3>Your Wishlist is Empty</h3>
                    <p>Save items you love to review them later.</p>
                    <a href="productList" class="btn-shop">Start Shopping</a>
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