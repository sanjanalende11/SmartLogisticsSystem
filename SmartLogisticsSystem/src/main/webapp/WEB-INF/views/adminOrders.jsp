<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Manage Orders | SmartLogistics</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Theme Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    :root {
        --bg-body: #f7f6f3;
        --bg-card: #ffffff;
        --bg-light: #fcfcfc;
        --bg-header: #111827;
        --text-main: #1a1a1a;
        --text-muted: #777777;
        --text-light: #ffffff;
        --accent-gold: #c5a059;
        --accent-hover: #b08d4b;
        --border-color: #e8e6e1;
        --border-light: #f3f4f6;
        --transition: all 0.3s ease;
        
        /* Status Colors */
        --status-order-bg: #e0e7ff;
        --status-order-text: #3730a3;
        --status-ship-bg: #fef9c3;
        --status-ship-text: #854d0e;
        --status-pay-bg: #dcfce7;
        --status-pay-text: #166534;
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

    /* HEADER */
    .top-header {
        background: var(--bg-header);
        padding: 16px 0;
        border-bottom: 4px solid var(--accent-gold);
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
        font-size: 26px;
        font-weight: 700;
        color: var(--text-light);
        text-decoration: none;
        letter-spacing: -0.5px;
    }

    .logo span {
        color: var(--accent-gold);
    }

    .header-link {
        color: rgba(255,255,255,0.7);
        text-decoration: none;
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        transition: var(--transition);
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .header-link:hover {
        color: var(--accent-gold);
    }

    /* MAIN CONTAINER */
    .page-container {
        max-width: 1280px;
        margin: 0 auto;
        padding: 40px 20px;
        width: 100%;
        flex: 1;
    }

    .page-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        padding-bottom: 15px;
        border-bottom: 1px solid var(--border-color);
    }

    .page-title {
        font-family: 'Playfair Display', serif;
        font-size: 32px;
        color: var(--text-main);
        font-weight: 600;
    }

    /* TABLE CARD */
    .table-card {
        background: var(--bg-card);
        border-radius: 8px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        border: 1px solid var(--border-color);
        overflow: hidden;
    }

    .table-responsive {
        overflow-x: auto;
        width: 100%;
    }

    /* TABLE STYLING */
    .custom-table {
        width: 100%;
        border-collapse: collapse;
        min-width: 1000px; /* Force scroll on small screens */
    }

    .custom-table thead {
        background-color: var(--bg-light);
    }

    .custom-table th {
        text-align: left;
        padding: 16px 20px;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: var(--text-muted);
        font-weight: 700;
        border-bottom: 2px solid var(--border-color);
    }

    .custom-table td {
        padding: 20px;
        vertical-align: middle;
        border-bottom: 1px solid var(--border-light);
        font-size: 14px;
        color: var(--text-main);
    }

    .custom-table tr:last-child td {
        border-bottom: none;
    }

    .custom-table tr:hover td {
        background-color: #fafafa;
    }

    /* TABLE CONTENT ELEMENTS */
    .order-id {
        font-family: 'Playfair Display', serif;
        font-weight: 700;
        color: var(--text-main);
        font-size: 16px;
    }

    .order-meta {
        font-size: 12px;
        color: var(--text-muted);
        margin-top: 4px;
        display: block;
    }

    .product-name {
        font-weight: 700;
        display: block;
        margin-bottom: 4px;
    }

    .customer-name {
        font-weight: 700;
        color: var(--text-main);
    }

    .amount-text {
        font-family: 'Playfair Display', serif;
        font-weight: 700;
        font-size: 18px;
        color: var(--text-main);
    }

    /* BADGES */
    .badge {
        display: inline-block;
        padding: 5px 12px;
        border-radius: 20px;
        font-size: 11px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .badge-order {
        background-color: var(--status-order-bg);
        color: var(--status-order-text);
    }

    .badge-ship {
        background-color: var(--status-ship-bg);
        color: var(--status-ship-text);
    }

    .badge-pay {
        background-color: var(--status-pay-bg);
        color: var(--status-pay-text);
    }

    /* BUTTONS */
    .btn-ship {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        background-color: transparent;
        border: 1px solid var(--accent-gold);
        color: var(--accent-gold);
        padding: 8px 16px;
        border-radius: 4px;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        text-decoration: none;
        cursor: pointer;
        transition: var(--transition);
    }

    .btn-ship:hover:not(:disabled) {
        background-color: var(--accent-gold);
        color: #fff;
    }

    .btn-ship:disabled, .btn-ship.disabled-style {
        border-color: #ccc;
        color: #999;
        cursor: not-allowed;
        background-color: #f9f9f9;
    }

    /* EMPTY STATE */
    .empty-box {
        background: var(--bg-card);
        padding: 60px 20px;
        text-align: center;
        border-radius: 8px;
        border: 1px solid var(--border-color);
        box-shadow: 0 4px 20px rgba(0,0,0,0.05);
    }

    .empty-box h3 {
        font-family: 'Playfair Display', serif;
        font-size: 24px;
        margin-bottom: 10px;
        color: var(--text-muted);
    }

    .empty-box p {
        color: var(--text-muted);
        font-size: 14px;
    }

    /* FOOTER */
    .footer {
        text-align: center;
        padding: 20px;
        color: var(--text-muted);
        font-size: 12px;
        border-top: 1px solid var(--border-color);
        margin-top: auto;
        background: #fff;
    }
</style>
</head>
<body>

    <!-- HEADER -->
    <div class="top-header">
        <div class="header-inner">
            <a href="index" class="logo">Smart<span>Logistics</span></a>
            <a href="admindashboard" class="header-link">
                <i class="fa-solid fa-gauge-high"></i>
                Admin Dashboard
            </a>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="page-container">
        
        <div class="page-header">
            <h2 class="page-title">Manage Orders</h2>
        </div>

        <c:choose>
            <c:when test="${not empty list}">
                <div class="table-card">
                    <div class="table-responsive">
                        <table class="custom-table">
                            <thead>
                                <tr>
                                    <th>Order Info</th>
                                    <th>Product</th>
                                    <th>Customer</th>
                                    <th>Address</th>
                                    <th>Amount</th>
                                    <th>Payment</th>
                                    <th>Order Status</th>
                                    <th>Shipment</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="o" items="${list}">
                                    <tr>
                                        <!-- Order Info -->
                                        <td>
                                            <div class="order-id">#${o.id}</div>
                                            <span class="order-meta">${o.orderNumber}</span>
                                            <span class="order-meta">${o.orderDate}</span>
                                            <span class="order-meta">User: ${o.customerUsername}</span>
                                        </td>

                                        <!-- Product -->
                                        <td>
                                            <span class="product-name">${o.productName}</span>
                                            <span class="order-meta">Qty: ${o.quantity} &bull; Price: ₹ ${o.price}</span>
                                        </td>

                                        <!-- Customer -->
                                        <td>
                                            <div class="customer-name">${o.customerName}</div>
                                            <span class="order-meta">${o.phone}</span>
                                        </td>

                                        <!-- Address -->
                                        <td>
                                            <div style="max-width: 200px; line-height: 1.4;">${o.address}</div>
                                        </td>

                                        <!-- Amount -->
                                        <td>
                                            <div class="amount-text">₹ ${o.totalAmount}</div>
                                        </td>

                                        <!-- Payment -->
                                        <td>
                                            <div style="font-size:13px; font-weight:700; margin-bottom:4px;">${o.paymentMethod}</div>
                                            <span class="badge badge-pay">${o.paymentStatus}</span>
                                        </td>

                                        <!-- Order Status -->
                                        <td>
                                            <span class="badge badge-order">${o.status}</span>
                                        </td>

                                        <!-- Shipment Status -->
                                        <td>
                                            <span class="badge badge-ship">${o.shipmentStatus}</span>
                                        </td>

                                        <!-- Action -->
                                        <td>
                                            <c:choose>
                                                <c:when test="${o.shipmentStatus eq 'Created'}">
                                                    <button type="button" class="btn-ship disabled-style"
                                                        onclick="alert('Shipment already created!')">
                                                        <i class="fa-solid fa-truck-fast"></i> Created
                                                    </button>
                                                </c:when>

                                                <c:otherwise>
                                                    <a href="${pageContext.request.contextPath}/admin/createShipment?orderId=${o.id}" class="btn-ship">
                                                        <i class="fa-solid fa-truck-fast"></i> Ship
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:when>

            <c:otherwise>
                <div class="empty-box">
                    <h3>No Orders Found</h3>
                    <p>There are no customer orders available yet.</p>
                </div>
            </c:otherwise>
        </c:choose>

    </div>

    <!-- FOOTER -->
    <div class="footer">
        &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
    </div>

</body>
</html>