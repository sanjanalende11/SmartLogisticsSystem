
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Shipment | SmartLogisticsSystem</title>
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

    /* ========== TOP BAR ========== */
    .top-bar {
        background: var(--bg-card);
        border-bottom: 1px solid var(--border-color);
        padding: 16px 0;
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

    /* ========== MAIN AREA ========== */
    .main-content {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 60px 20px;
    }

    .form-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 50px 45px;
        width: 100%;
        max-width: 480px;
        box-shadow: var(--shadow-md);
        animation: cardIn 0.7s ease-out;
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

    /* ICON CIRCLE */
    .icon-circle {
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

    .icon-circle:hover {
        border-color: var(--accent-gold);
        background: #fff;
        transform: scale(1.05);
    }

    /* HEADINGS */
    .page-title {
        font-size: 28px;
        text-align: center;
        margin-bottom: 10px;
        font-weight: 600;
    }

    .page-desc {
        text-align: center;
        color: var(--text-muted);
        font-size: 14px;
        font-weight: 300;
        margin-bottom: 35px;
        line-height: 1.6;
    }

    /* FORM */
    .form-group {
        margin-bottom: 25px;
        text-align: left;
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
        padding: 14px 16px;
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

    .form-control[readonly] {
        background-color: #eee;
        color: #666;
        cursor: not-allowed;
        border-color: #ddd;
    }

    /* BUTTONS */
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
        margin-top: 10px;
        font-family: 'Lato', sans-serif;
    }

    .btn-submit:hover {
        background-color: transparent;
        color: var(--text-main);
    }

    /* FOOTER */
    .page-footer-text {
        text-align: center;
        padding: 25px 20px;
        font-size: 12px;
        color: #bbb;
        letter-spacing: 0.5px;
    }

    /* RESPONSIVE */
    @media (max-width: 480px) {
        .form-card {
            padding: 35px 25px;
        }
        .page-title {
            font-size: 24px;
        }
    }
</style>
</head>

<body>

    <!-- TOP BAR -->
    <div class="top-bar">
        <div class="top-bar-inner">
            <a href="adminDashboard" class="logo-link">Smart<span>Logistics</span></a>
            <a href="adminDashboard" class="back-link">
                <i class="fa-solid fa-arrow-left"></i>
                Back to Dashboard
            </a>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="form-card">
            
            <div class="icon-circle">
                <i class="fa-solid fa-truck-fast"></i>
            </div>

            <h2 class="page-title">Create Shipment</h2>
            <p class="page-desc">Assign a driver to process this order for delivery.</p>

            <!-- SUCCESS/ERROR ALERTS (Optional Integration) -->
            <c:if test="${not empty success}">
                <div style="background: #f0f9f0; color: #166534; padding: 12px; border-radius: 4px; margin-bottom: 20px; text-align: center; font-size: 14px;">
                    ${success}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/admin/saveShipment" method="post">

                <!-- ORDER ID (Readonly recommended for safety) -->
                <div class="form-group">
                    <label for="orderId" class="form-label">Order ID</label>
                    <input type="number" id="orderId" name="orderId" class="form-control"
                           value="${shipment.orderId}" readonly>
                </div>

                <!-- DRIVER NAME -->
                <div class="form-group">
                    <label for="driverName" class="form-label">Driver Name</label>
                    <input type="text" id="driverName" name="driverName" class="form-control"
                           placeholder="Enter driver's full name" required>
                </div>

                <!-- SUBMIT -->
                <button type="submit" class="btn-submit">
                    Create Shipment
                </button>
            </form>

        </div>
    </div>

    <!-- FOOTER TEXT -->
    <div class="page-footer-text">
        &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
    </div>

</body>
</html>
