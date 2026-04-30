
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Orders | SmartLogisticsSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Theme Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    :root {
        --bg-body: #f7f6f3;
        --bg-card: #ffffff;
        --bg-light: #fcfcfc;
        --bg-input: #fcfcfc;
        --text-main: #1a1a1a;
        --text-muted: #777777;
        --accent-gold: #c5a059;
        --border-color: #e8e6e1;
        --border-light: #f3f4f6;
        --shadow-sm: 0 4px 12px rgba(0, 0, 0, 0.05);
        --shadow-md: 0 8px 24px rgba(0, 0, 0, 0.08);
        --transition: all 0.3s ease;

        /* Status Colors */
        --status-pending-bg: #fff7ed;
        --status-pending-text: #b45309;
        --status-delivered-bg: #dcfce7;
        --status-delivered-text: #15803d;
        --status-cancelled-bg: #fee2e2;
        --status-cancelled-text: #b91c1c;
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
    .top-header {
        background: #fff;
        border-bottom: 1px solid var(--border-color);
        padding: 16px 0;
    }

    .header-inner {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .logo {
        font-family: 'Playfair Display', serif;
        font-size: 24px;
        font-weight: 700;
        color: var(--text-main);
        text-decoration: none;
        letter-spacing: -0.5px;
    }

    .logo span {
        color: var(--accent-gold);
    }

    .header-link {
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        color: var(--text-muted);
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .header-link:hover {
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
    }

    .page-title {
        font-family: 'Playfair Display', serif;
        font-size: 32px;
        font-weight: 600;
        color: var(--text-main);
    }

    /* ========== ORDER CARD ========== */
    .order-list {
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    .order-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 30px;
        box-shadow: var(--shadow-sm);
        display: grid;
        grid-template-columns: 160px 1fr;
        gap: 30px;
        transition: var(--transition);
    }

    .order-card:hover {
        box-shadow: var(--shadow-md);
        border-color: rgba(197, 160, 89, 0.3);
    }

    /* PRODUCT IMAGE AREA */
    .order-image {
        width: 100%;
        height: 160px;
        border-radius: 6px;
        overflow: hidden;
        background: var(--bg-light);
        border: 1px solid var(--border-color);
    }

    .order-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    /* ORDER DETAILS */
    .order-details {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .order-head {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 20px;
    }

    .product-title {
        font-family: 'Playfair Display', serif;
        font-size: 22px;
        font-weight: 600;
        color: var(--text-main);
        margin-bottom: 6px;
    }

    .order-meta {
        font-size: 14px;
        color: var(--text-muted);
        display: block;
        margin-bottom: 4px;
    }

    /* INFO GRID */
    .info-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 15px 30px;
        margin-bottom: 20px;
    }

    .info-item label {
        display: block;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        font-weight: 700;
        color: var(--text-muted);
        margin-bottom: 4px;
    }

    .info-item span {
        font-size: 15px;
        color: var(--text-main);
        font-weight: 500;
    }

    /* STATUS BADGES */
    .status-badge {
        display: inline-block;
        padding: 6px 14px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .status-pending {
        background-color: var(--status-pending-bg);
        color: var(--status-pending-text);
    }

    .status-delivered {
        background-color: var(--status-delivered-bg);
        color: var(--status-delivered-text);
    }

    .status-cancelled {
        background-color: var(--status-cancelled-bg);
        color: var(--status-cancelled-text);
    }

    /* ACTION AREA */
    .action-area {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 15px;
        padding-top: 15px;
        border-top: 1px solid var(--border-light);
    }

    .btn-cancel {
        padding: 10px 20px;
        background: transparent;
        border: 1px solid var(--status-cancelled-text);
        color: var(--status-cancelled-text);
        border-radius: 4px;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: var(--transition);
    }

    .btn-cancel:hover {
        background: var(--status-cancelled-text);
        color: #fff;
    }

    .price-highlight {
        font-family: 'Playfair Display', serif;
        font-size: 24px;
        font-weight: 700;
        color: var(--accent-gold);
    }

    /* ========== EMPTY STATE ========== */
    .empty-state {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 60px 20px;
        text-align: center;
        box-shadow: var(--shadow-sm);
        max-width: 500px;
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
    }

    .btn-primary-cta {
        display: inline-block;
        padding: 14px 28px;
        background: var(--accent-gold);
        color: #fff;
        font-weight: 700;
        border-radius: 4px;
        border: none;
        transition: var(--transition);
    }

    .btn-primary-cta:hover {
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
    @media (max-width: 768px) {
        .order-card {
            grid-template-columns: 1fr;
            gap: 20px;
        }
        
        .order-image {
            height: 200px;
        }
        
        .info-grid {
            grid-template-columns: 1fr;
            gap: 10px;
        }
        
        .page-title {
            font-size: 24px;
        }
    }
</style>
</head>
<body>

    <!-- HEADER -->
    <div class="top-header">
        <div class="header-inner">
            <a href="index" class="logo">Smart<span>Logistics</span></a>
            <a href="customerdashboard" class="header-link">
                <i class="fa-solid fa-gauge-high"></i>
                My Dashboard
            </a>
        </div>
    </div>

    <!-- MAIN CONTAINER -->
    <div class="page-container">
        
        <div class="page-header">
            <h1 class="page-title">My Orders</h1>
        </div>

        <c:choose>
            <c:when test="${not empty list}">
                
                <div class="order-list">
                    <c:forEach var="o" items="${list}">
                        
                        <div class="order-card">
                            
                            <!-- Product Image -->
                            <div class="order-image">
                                <img src="${pageContext.request.contextPath}/Images/${o.productImage}" alt="${o.productName}">
                            </div>

                            <!-- Order Details -->
                            <div class="order-details">
                                <div>
                                    <div class="order-head">
                                        <div>
                                            <div class="product-title">${o.productName}</div>
                                            <span class="order-meta">Order #${o.orderNumber} &bull; Placed on ${o.orderDate}</span>
                                        </div>
                                        <div class="price-highlight">₹${o.finalAmount}</div>
                                    </div>

                                    <div class="info-grid">
                                        <div class="info-item">
                                            <label>Quantity</label>
                                            <span>${o.quantity}</span>
                                        </div>
                                        <div class="info-item">
                                            <label>Payment</label>
                                            <span>${o.paymentMethod}</span>
                                        </div>
                                        <div class="info-item">
                                            <label>Delivery Address</label>
                                            <span style="font-size: 14px;">${o.address}</span>
                                        </div>
                                        <div class="info-item">
                                            <label>Order Status</label>
                                            <c:choose>
                                                <c:when test="${o.status eq 'Delivered'}">
                                                    <span class="status-badge status-delivered">Delivered</span>
                                                </c:when>
                                                <c:when test="${o.status eq 'Cancelled'}">
                                                    <span class="status-badge status-cancelled">Cancelled</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge status-pending">${o.status}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>

                                <!-- Actions / Status Footer -->
                                <div class="action-area">
                                    <!-- Cancel Logic -->
                                    <c:if test="${o.status ne 'Cancelled' && o.status ne 'Delivered' && (o.shipmentStatus eq 'Not Created' || o.shipmentStatus eq 'Pending')}">
                                        <form action="${pageContext.request.contextPath}/cancelOrder" method="post" onsubmit="return confirm('Are you sure you want to cancel this order?');">
                                            <input type="hidden" name="orderId" value="${o.id}">
                                            <button type="submit" class="btn-cancel">Cancel Order</button>
                                        </form>
                                    </c:if>
                                    
                                    <div style="font-size: 13px; color: var(--text-muted);">
                                        <i class="fa-solid fa-truck-fast"></i> ${o.shipmentStatus}
                                    </div>
                                </div>

                            </div>
                        </div>

                    </c:forEach>
                </div>

            </c:when>

            <c:otherwise>
                
                <!-- EMPTY STATE -->
                <div class="empty-state">
                    <div class="empty-icon">
                        <i class="fa-solid fa-box-open"></i>
                    </div>
                    <h3>No Orders Yet</h3>
                    <p>You haven't placed any orders yet. Start shopping to see them here.</p>
                    <a href="productList" class="btn-primary-cta">Browse Products</a>
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
