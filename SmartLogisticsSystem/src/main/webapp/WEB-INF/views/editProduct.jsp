<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product | SmartLogistics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Theme Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    :root {
        --bg-body: #f7f6f3;
        --bg-card: #ffffff;
        --bg-input: #fcfcfc;
        --text-main: #1a1a1a;
        --text-muted: #777777;
        --accent-gold: #c5a059;
        --border-color: #e8e6e1;
        --focus-gold: rgba(197, 160, 89, 0.15);
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
        padding: 40px 20px;
    }

    /* TOP BAR */
    .top-bar {
        background: var(--bg-card);
        border-bottom: 1px solid var(--border-color);
        padding: 15px 0;
        margin-bottom: 40px;
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
        text-decoration: none;
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
        text-decoration: none;
        transition: var(--transition);
    }

    .back-link:hover {
        color: var(--accent-gold);
    }

    /* MAIN CONTAINER */
    .product-main {
        flex: 1;
        display: flex;
        justify-content: center;
    }

    .product-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 50px;
        width: 100%;
        max-width: 700px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.04);
        animation: cardIn 0.7s ease-out;
    }

    @keyframes cardIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .page-title {
        font-family: 'Playfair Display', serif;
        font-size: 28px;
        text-align: center;
        margin-bottom: 10px;
        font-weight: 600;
    }

    .page-subtitle {
        text-align: center;
        color: var(--text-muted);
        font-size: 15px;
        font-weight: 300;
        margin-bottom: 40px;
    }

    /* FORM GROUPS */
    .form-group {
        margin-bottom: 25px;
        position: relative;
    }

    .form-group label {
        display: block;
        margin-bottom: 10px;
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        color: var(--text-main);
    }

    .form-control {
        width: 100%;
        padding: 14px 18px;
        border: 1px solid var(--border-color);
        border-radius: 4px;
        font-size: 15px;
        font-family: 'Lato', sans-serif;
        background: var(--bg-input);
        color: var(--text-main);
        outline: none;
        transition: var(--transition);
    }

    .form-control:focus {
        border-color: var(--accent-gold);
        background: #fff;
        box-shadow: 0 0 0 3px var(--focus-gold);
    }

    textarea.form-control {
        resize: vertical;
        min-height: 120px;
    }

    /* IMAGE PREVIEW SECTION */
    .image-preview-section {
        margin-bottom: 30px;
        text-align: center;
        padding: 20px;
        background: #fafafa;
        border: 1px dashed var(--border-color);
        border-radius: 8px;
    }

    .preview-img {
        width: 100%;
        max-width: 300px;
        height: 200px;
        object-fit: cover;
        border-radius: 4px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        margin-bottom: 15px;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

    .change-img-btn {
        display: inline-block;
        padding: 8px 16px;
        background: transparent;
        border: 1px solid var(--border-color);
        color: var(--text-muted);
        font-size: 12px;
        border-radius: 4px;
        cursor: pointer;
        transition: var(--transition);
    }

    .change-img-btn:hover {
        border-color: var(--accent-gold);
        color: var(--accent-gold);
    }

    .image-input-hidden {
        display: none;
    }

    /* BUTTONS */
    .btn-update {
        display: block;
        width: 100%;
        padding: 16px;
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
        font-family: 'Lato', sans-serif;
        margin-top: 10px;
    }

    .btn-update:hover {
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

    /* ALERTS */
    .alert-bella {
        padding: 14px 18px;
        border-radius: 4px;
        font-size: 14px;
        margin-bottom: 24px;
        display: none; /* Hidden by default */
        align-items: flex-start;
        gap: 10px;
    }
    
    .alert-error {
        background: #fdf2f2;
        border: 1px solid #f0d0d0;
        color: #b91c1c;
    }

    /* RESPONSIVE */
    @media (max-width: 480px) {
        .product-card {
            padding: 30px 20px;
        }
        .top-bar-inner {
            padding: 0 15px;
        }
    }
</style>
</head>

<body>

<!-- TOP BAR -->
<div class="top-bar">
    <div class="top-bar-inner">
        <a href="dashboard" class="logo-link">Smart<span>Logistics</span></a>
        <a href="products" class="back-link">
            <i class="fa-solid fa-arrow-left"></i>
            Back to Products
        </a>
    </div>
</div>

<!-- MAIN AREA -->
<div class="product-main">
    <div class="product-card">
        
        <h2 class="page-title">Edit Product</h2>
        <p class="page-subtitle">Update product details below.</p>

        <!-- SUCCESS/ERROR ALERTS -->
        <c:if test="${not empty success}">
            <div class="alert-bella alert-success" style="display: flex; background: #f0f9f0; border: 1px solid #bbf7d0; color: #2f855a;">
                <i class="fa-solid fa-check-circle"></i>
                <span>${success}</span>
            </div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert-bella alert-error" style="display: flex;">
                <i class="fa-solid fa-circle-exclamation"></i>
                <span>${error}</span>
            </div>
        </c:if>

        <form action="updateProduct" method="post" enctype="multipart/form-data">

            <!-- Hidden ID -->
            <input type="hidden" name="id" value="${product.id}">

            <!-- 🔴 IMPORTANT: KEEP OLD IMAGES -->
            <input type="hidden" name="existingImg1" value="${product.img1}">
            <input type="hidden" name="existingImg2" value="${product.img2}">
            <input type="hidden" name="existingImg3" value="${product.img3}">

            <!-- Image Preview Section -->
            <div class="image-preview-section">
                <c:if test="${not empty product.img1}">
                    <img class="preview-img" src="${pageContext.request.contextPath}/Images/${product.img1}" alt="Product Image">
                </c:if>
                <c:if test="${empty product.img1}">
                    <div style="width: 100%; max-width: 300px; height: 200px; background: #eee; margin: 0 auto 15px; display: flex; align-items: center; justify-content: center; border-radius: 4px; color: #999;">
                        No Image
                    </div>
                </c:if>
                
                <label for="imgInput" class="change-img-btn">
                    <i class="fa-solid fa-camera"></i> Change Image
                </label>
                <input type="file" id="imgInput" name="img1" class="image-input-hidden" accept="image/*">
            </div>

            <!-- Product Name -->
            <div class="form-group">
                <label for="name">Product Name</label>
                <input type="text" id="name" name="name" class="form-control" value="${product.name}" required>
            </div>

            <!-- Brand -->
            <div class="form-group">
                <label for="brand">Brand</label>
                <input type="text" id="brand" name="brand" class="form-control" value="${product.brand}">
            </div>

            <!-- Price -->
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" id="price" name="price" class="form-control" value="${product.price}" step="0.01" required>
            </div>

            <!-- Quantity -->
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" id="quantity" name="quantity" class="form-control" value="${product.quantity}" required>
            </div>

            <!-- Category -->
            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" id="category" name="category" class="form-control" value="${product.category}">
            </div>

            <!-- Description -->
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" rows="4">${product.description}</textarea>
            </div>

            <!-- Submit -->
            <button type="submit" class="btn-update">Update Product</button>

        </form>

    </div>
</div>

<!-- FOOTER TEXT -->
<div class="page-footer-text">
    &copy; 2026 SmartLogisticsSystem. All Rights Reserved.
</div>

</body>
</html>