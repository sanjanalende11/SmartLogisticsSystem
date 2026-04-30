<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Details | SmartLogisticsSystem</title>
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
    }

    .logo span {
        color: var(--accent-gold);
    }

    .back-link {
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        color: rgba(255, 255, 255, 0.7);
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .back-link:hover {
        color: #fff;
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

    /* ========== DETAILS GRID ========== */
    .details-grid {
        display: grid;
        grid-template-columns: 350px 1fr;
        gap: 40px;
    }

    /* LEFT CARD: ORDER INFO */
    .info-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 30px;
        box-shadow: var(--shadow-sm);
        height: fit-content;
    }

    .section-header {
        font-family: 'Playfair Display', serif;
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 20px;
        color: var(--text-main);
        padding-bottom: 10px;
        border-bottom: 2px solid var(--accent-gold);
    }

    .detail-list {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .detail-item label {
        display: block;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        color: var(--text-muted);
        margin-bottom: 5px;
        font-weight: 700;
    }

    .detail-item span {
        font-size: 15px;
        color: var(--text-main);
        font-weight: 500;
    }

    .price-highlight {
        font-family: 'Playfair Display', serif;
        font-size: 24px;
        font-weight: 700;
        color: var(--accent-gold);
    }

    /* RIGHT CARD: CUSTOMER & DELIVERY */
    .customer-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 30px;
        box-shadow: var(--shadow-sm);
        height: fit-content;
    }

    .info-group {
        margin-bottom: 30px;
    }

    .info-group:last-child {
        margin-bottom: 0;
    }

    .group-title {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        color: var(--text-main);
        margin-bottom: 15px;
    }

    .group-title i {
        color: var(--accent-gold);
        font-size: 16px;
    }

    .address-box {
        background: var(--bg-light);
        border: 1px solid var(--border-light);
        padding: 15px;
        border-radius: 6px;
        font-size: 14px;
        line-height: 1.6;
        color: var(--text-main);
    }

    .status-badge {
        display: inline-block;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
    }

    /* FOOTER */
    .footer {
        background: #fff;
        border-top: 1px solid var(--border-color);
        padding: 20px 0;
        text-align: center;
        font-size: 13px;
        color: var(--text-muted);
        margin-top: auto;
    }

    /* RESPONSIVE */
    @media (max-width: 900px) {
        .details-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>
<body>

    <!-- HEADER -->
    <nav class="top-nav">
        <div class="nav-inner">
            <a href="adminDashboard" class="logo">Smart<span>Logistics</span></a>
            
            <a href="${pageContext.request.contextPath}/admin/viewShipment" class="back-link">
                <i class="fa-solid fa-arrow-left"></i>
                Back to Shipments
            </a>
        </div>
    </nav>

    <!-- MAIN CONTAINER -->
    <div class="page-container">
        
        <div class="page-header">
            <h1 class="page-title">Order Details #${order.id}</h1>
        </div>

        <div class="details-grid">
            
            <!-- LEFT COLUMN -->
            <div class="info-card">
                <h3 class="section-header">Order Information</h3>
                
                <div class="detail-list">
                    <div class="detail-item">
                        <label>Order Number</label>
                        <span>${order.orderNumber}</span>
                    </div>
                    <div class="detail-item">
                        <label>Order Date</label>
                        <span>${order.orderDate}</span>
                    </div>
                    <div class="detail-item">
                        <label>Product Name</label>
                        <span>${order.productName}</span>
                    </div>
                    <div class="detail-item">
                        <label>Quantity</label>
                        <span>${order.quantity}</span>
                    </div>
                    <div class="detail-item">
                        <label>Unit Price</label>
                        <span>₹${order.price}</span>
                    </div>
                    <div class="detail-item">
                        <label>Total Amount</label>
                        <span class="price-highlight">₹${order.totalAmount}</span>
                    </div>
                </div>
            </div>

            <!-- RIGHT COLUMN -->
            <div class="customer-card">
                
                <div class="info-group">
                    <div class="group-title">
                        <i class="fa-solid fa-user"></i> Customer Details
                    </div>
                    <div class="detail-list" style="gap: 15px;">
                        <div class="detail-item">
                            <label>Name</label>
                            <span>${order.customerName}</span>
                        </div>
                        <div class="detail-item">
                            <label>Phone</label>
                            <span>${order.phone}</span>
                        </div>
                    </div>
                </div>

                <div class="info-group">
                    <div class="group-title">
                        <i class="fa-solid fa-location-dot"></i> Delivery Address
                    </div>
                    <div class="address-box">
                        ${order.address}
                    </div>
                </div>

                <div class="info-group">
                    <div class="group-title">
                        <i class="fa-solid fa-credit-card"></i> Payment Info
                    </div>
                    <div class="detail-list" style="gap: 15px;">
                        <div class="detail-item">
                            <label>Method</label>
                            <span>${order.paymentMethod}</span>
                        </div>
                        <div class="detail-item">
                            <label>Status</label>
                            <span>${order.paymentStatus}</span>
                        </div>
                    </div>
                </div>

                <div class="info-group">
                    <div class="group-title">
                        <i class="fa-solid fa-truck-fast"></i> Shipment Status
                    </div>
                    <span class="status-badge" style="background: #f0f9f0; color: #166534;">
                        ${order.shipmentStatus}
                    </span>
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