<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SmartLogisticsSystem | Premium Shopping & Logistics</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">

<style>
:root {
    --bg-body: #ffffff;
    --bg-light: #fcfcfc;
    --text-main: #1a1a1a;
    --text-muted: #777777;
    --accent-gold: #c5a059;
    --border-color: #f0f0f0;
    --transition: all 0.4s ease;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: 'Lato', sans-serif;
    background: var(--bg-body);
    color: var(--text-main);
    overflow-x: hidden;
    line-height: 1.7;
}

h1, h2, h3, h4, h5, h6, .serif-font {
    font-family: 'Playfair Display', serif;
    font-weight: 600;
    color: var(--text-main);
}

a {
    text-decoration: none;
    color: inherit;
    transition: var(--transition);
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.btn-custom {
    display: inline-block;
    padding: 14px 36px;
    background-color: var(--text-main);
    color: #fff;
    text-transform: uppercase;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1.5px;
    border: 1px solid var(--text-main);
    border-radius: 2px;
    cursor: pointer;
    transition: var(--transition);
}

.btn-custom:hover {
    background-color: transparent;
    color: var(--text-main);
}

.btn-custom-outline {
    background-color: transparent;
    color: var(--text-main);
    border: 1px solid var(--border-color);
}

.btn-custom-outline:hover {
    background-color: var(--text-main);
    color: #fff;
    border-color: var(--text-main);
}

/* NAVBAR */
.navbar-bella {
    background: rgba(255, 255, 255, 0.98);
    border-bottom: 1px solid transparent;
    padding: 25px 0;
    position: sticky;
    top: 0;
    z-index: 1000;
    transition: 0.4s;
}

.navbar-bella.scrolled {
    padding: 15px 0;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
    border-bottom: 1px solid var(--border-color);
}

.nav-inner {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo-bella {
    font-family: 'Playfair Display', serif;
    font-size: 26px;
    font-weight: 700;
    letter-spacing: -0.5px;
    color: var(--text-main);
}

.logo-bella span {
    color: var(--accent-gold);
}

.nav-menu-bella {
    display: flex;
    align-items: center;
    gap: 35px;
}

.nav-link-bella {
    font-size: 13px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 700;
    color: var(--text-main);
    position: relative;
}

.nav-link-bella::after {
    content: '';
    position: absolute;
    width: 0;
    height: 2px;
    bottom: -5px;
    left: 0;
    background-color: var(--accent-gold);
    transition: width 0.3s;
}

.nav-link-bella:hover::after,
.nav-link-bella.active::after {
    width: 100%;
}

.nav-icons-bella {
    display: flex;
    align-items: center;
    gap: 25px;
}

.nav-icon-item {
    font-size: 18px;
    color: var(--text-main);
    position: relative;
    cursor: pointer;
    transition: 0.3s;
}

.nav-icon-item:hover {
    color: var(--accent-gold);
}

.cart-badge-bella {
    position: absolute;
    top: -6px;
    right: -8px;
    background-color: var(--accent-gold);
    color: #fff;
    font-size: 10px;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.hero-bella {
    padding: 100px 0;
    min-height: 85vh;
    display: flex;
    align-items: center;
    background-color: #ffffff;
}

.hero-container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 60px;
    align-items: center;
}

.hero-content {
    animation: fadeInUp 1s ease-out;
}

.hero-subtitle {
    font-size: 13px;
    text-transform: uppercase;
    letter-spacing: 4px;
    color: var(--accent-gold);
    margin-bottom: 20px;
    font-weight: 700;
    display: block;
}

.hero-title-bella {
    font-size: clamp(40px, 4.5vw, 60px);
    line-height: 1.1;
    margin-bottom: 30px;
    color: var(--text-main);
    font-weight: 600;
}

.hero-desc-bella {
    font-size: 17px;
    color: var(--text-muted);
    margin-bottom: 40px;
    max-width: 480px;
    font-weight: 300;
}

.hero-image-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    animation: fadeInUp 1.2s ease-out;
    filter: drop-shadow(0 20px 40px rgba(0, 0, 0, 0.08));
}

.hero-main-img {
    max-width: 100%;
    height: auto;
    display: block;
    border-radius: 8px;
}

/* FEATURES */
.features-strip {
    padding: 40px 0;
    border-bottom: 1px solid var(--border-color);
}

.feature-item {
    display: flex;
    align-items: center;
    gap: 15px;
    justify-content: center;
}

.feature-icon {
    width: 40px;
    height: 40px;
    border: 1px solid var(--border-color);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--accent-gold);
    transition: 0.3s;
}

.feature-item:hover .feature-icon {
    background: var(--accent-gold);
    color: #fff;
    border-color: var(--accent-gold);
}

.feature-text h6 {
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin: 0;
    font-weight: 700;
}

.feature-text p {
    font-size: 12px;
    color: var(--text-muted);
    margin: 0;
}

/* SECTIONS */
.section-bella {
    padding: 90px 0;
}

.section-header-bella {
    text-align: center;
    margin-bottom: 60px;
}

.section-tag {
    font-size: 11px;
    color: var(--accent-gold);
    text-transform: uppercase;
    letter-spacing: 3px;
    font-weight: 700;
    margin-bottom: 10px;
    display: block;
}

.section-title-bella {
    font-size: 32px;
    margin-bottom: 15px;
}

.cat-card-bella {
    position: relative;
    border-radius: 4px;
    overflow: hidden;
    aspect-ratio: 1/1.25;
    cursor: pointer;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.03);
    transition: transform 0.5s ease;
}

.cat-card-bella:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.08);
}

.cat-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.8s ease;
}

.cat-card-bella:hover .cat-img {
    transform: scale(1.05);
}

.cat-overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.5), transparent);
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    padding: 25px;
}

.cat-btn {
    background: #fff;
    color: #000;
    padding: 10px 25px;
    text-transform: uppercase;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1px;
    align-self: flex-start;
    opacity: 0;
    transform: translateY(20px);
    transition: 0.4s;
}

.cat-card-bella:hover .cat-btn {
    opacity: 1;
    transform: translateY(0);
}

.cat-title {
    color: #fff;
    font-size: 20px;
    margin-bottom: 10px;
    font-family: 'Playfair Display', serif;
}

/* PRODUCTS */
.prod-card-bella {
    margin-bottom: 40px;
    position: relative;
}

.prod-img-box {
    position: relative;
    overflow: hidden;
    border-radius: 4px;
    margin-bottom: 20px;
    aspect-ratio: 3/4;
    background-color: #fcfcfc;
    border: 1px solid var(--border-color);
}

.prod-img-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.6s ease;
}

.prod-card-bella:hover .prod-img-box img {
    transform: scale(1.03);
}

.prod-actions-overlay {
    position: absolute;
    bottom: 15px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 10px;
    opacity: 0;
    transition: all 0.4s ease;
}

.prod-card-bella:hover .prod-actions-overlay {
    opacity: 1;
    bottom: 25px;
}

.action-btn {
    width: 40px;
    height: 40px;
    background: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #000;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    cursor: pointer;
    transition: 0.2s;
    border: none;
}

.action-btn:hover {
    background: var(--accent-gold);
    color: #fff;
}

.prod-info {
    text-align: center;
}

.prod-cat {
    font-size: 11px;
    text-transform: uppercase;
    color: var(--text-muted);
    letter-spacing: 1px;
    margin-bottom: 5px;
}

.prod-title {
    font-size: 15px;
    margin-bottom: 8px;
    font-weight: 400;
}

.prod-price {
    font-weight: 700;
    color: var(--text-main);
    font-size: 16px;
}

/* CONTACT */
.contact-card {
    background: #fff;
    border: 1px solid var(--border-color);
    padding: 35px 20px;
    border-radius: 8px;
    text-align: center;
    height: 100%;
    transition: 0.3s;
}

.contact-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
}

.contact-card i {
    font-size: 26px;
    color: var(--accent-gold);
    margin-bottom: 15px;
}

/* FOOTER */
.footer-bella {
    background-color: #111;
    color: #fff;
    padding: 80px 0 30px;
}

.footer-logo {
    font-family: 'Playfair Display', serif;
    font-size: 24px;
    margin-bottom: 20px;
    display: block;
    color: #fff;
}

.footer-heading {
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin-bottom: 25px;
    color: #fff;
}

.footer-links li {
    list-style: none;
    margin-bottom: 12px;
}

.footer-links a {
    color: #888;
    font-size: 14px;
    transition: 0.3s;
}

.footer-links a:hover {
    color: #fff;
    padding-left: 5px;
}

.newsletter-input {
    background: transparent;
    border: none;
    border-bottom: 1px solid #333;
    padding: 12px 0;
    width: 100%;
    color: #fff;
    outline: none;
    margin-bottom: 20px;
}

.newsletter-input:focus {
    border-color: #fff;
}

.copyright {
    border-top: 1px solid #222;
    margin-top: 60px;
    padding-top: 30px;
    font-size: 12px;
    color: #666;
    text-align: center;
}

.reveal-up {
    opacity: 0;
    transform: translateY(40px);
    transition: all 0.8s ease-out;
}

.reveal-up.active {
    opacity: 1;
    transform: translateY(0);
}

@media(max-width: 991px) {
    .hero-container {
        grid-template-columns: 1fr;
        text-align: center;
    }

    .hero-image-wrapper {
        order: -1;
        margin-bottom: 30px;
    }

    .hero-desc-bella {
        margin: 0 auto 30px;
    }

    .hero-title-bella {
        font-size: 36px;
    }

    .nav-menu-bella {
        display: none;
    }
}
</style>
</head>

<body>

<nav class="navbar-bella" id="mainNav">
    <div class="container">
        <div class="nav-inner">
            <div class="d-lg-none me-3">
                <i class="fa-solid fa-bars"></i>
            </div>

            <a href="index" class="logo-bella">Smart<span>Logistics</span></a>

            <div class="nav-menu-bella">
                <a href="index" class="nav-link-bella active">Home</a>
                <a href="productList" class="nav-link-bella">Shop</a>
                <a href="#collections" class="nav-link-bella">Collections</a>
                <a href="#about" class="nav-link-bella">About Us</a>
                <a href="#contact" class="nav-link-bella">Contact</a>
            </div>

            <div class="nav-icons-bella">
                <a href="productList" class="nav-icon-item">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </a>

                <a href="login" class="nav-icon-item">
                    <i class="fa-regular fa-user"></i>
                </a>

                <a href="cart" class="nav-icon-item">
                    <i class="fa-solid fa-bag-shopping"></i>
                    <span class="cart-badge-bella">2</span>
                </a>
            </div>
        </div>
    </div>
</nav>

<section class="hero-bella">
    <div class="container">
        <div class="hero-container">

            <div class="hero-content">
                <span class="hero-subtitle">Premium Logistics</span>
                <h1 class="hero-title-bella">Technology <br> Delivered with Style.</h1>

                <p class="hero-desc-bella">
                    Experience the seamless integration of premium e-commerce and intelligent logistics.
                    We bring the store to your door with professional efficiency.
                </p>

                <div style="display:flex; gap:15px; flex-wrap:wrap; justify-content:flex-start;">
                    <a href="productList" class="btn-custom">Explore Products</a>
                    <a href="login" class="btn-custom btn-custom-outline">Log In</a>
                </div>
            </div>

            <div class="hero-image-wrapper">
                <img src="https://images.unsplash.com/photo-1541807084-5c52b6b3adef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"
                     class="hero-main-img" alt="Premium Laptop">
            </div>

        </div>
    </div>
</section>

<div class="features-strip">
    <div class="container">
        <div class="row g-4">

            <div class="col-6 col-md-3 reveal-up">
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fa-solid fa-truck"></i>
                    </div>
                    <div class="feature-text">
                        <h6>Fast Shipping</h6>
                        <p>Quick delivery</p>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-3 reveal-up">
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fa-solid fa-shield-halved"></i>
                    </div>
                    <div class="feature-text">
                        <h6>Secure Payment</h6>
                        <p>100% Protected</p>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-3 reveal-up">
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fa-solid fa-rotate-left"></i>
                    </div>
                    <div class="feature-text">
                        <h6>Easy Cancel</h6>
                        <p>Before shipment</p>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-3 reveal-up">
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fa-solid fa-headset"></i>
                    </div>
                    <div class="feature-text">
                        <h6>Support</h6>
                        <p>Customer help</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<section class="section-bella" id="collections">
    <div class="container">
        <div class="section-header-bella reveal-up">
            <span class="section-tag">Collections</span>
            <h2 class="section-title-bella">Curated Categories</h2>
        </div>

        <div class="row g-4">

            <div class="col-md-6 col-lg-3 reveal-up">
                <div class="cat-card-bella">
                    <img src="https://images.unsplash.com/photo-1592750475338-74b7b21085ab?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
                         class="cat-img" alt="Mobiles">
                    <div class="cat-overlay">
                        <h4 class="cat-title">Mobiles</h4>
                        <a href="productList" class="cat-btn">Explore</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 reveal-up">
                <div class="cat-card-bella">
                    <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
                         class="cat-img" alt="Furniture">
                    <div class="cat-overlay">
                        <h4 class="cat-title">Furniture</h4>
                        <a href="productList" class="cat-btn">Explore</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 reveal-up">
                <div class="cat-card-bella">
                    <img src="https://images.unsplash.com/photo-1548036328-c9fa89d128fa?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
                         class="cat-img" alt="Fashion">
                    <div class="cat-overlay">
                        <h4 class="cat-title">Fashion</h4>
                        <a href="productList" class="cat-btn">Explore</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 reveal-up">
                <div class="cat-card-bella">
                    <img src="https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
                         class="cat-img" alt="Gadgets">
                    <div class="cat-overlay">
                        <h4 class="cat-title">Gadgets</h4>
                        <a href="productList" class="cat-btn">Explore</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<section class="section-bella" style="background-color:#fafafa;">
    <div class="container">
        <div class="section-header-bella reveal-up">
            <span class="section-tag">Trending</span>
            <h2 class="section-title-bella">This Week's Bestsellers</h2>
        </div>

        <div class="row">

            <div class="col-6 col-md-3 reveal-up">
                <div class="prod-card-bella">
                    <div class="prod-img-box">
                        <img src="https://images.unsplash.com/photo-1591337676887-a217a6970a8a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
                             alt="iPhone">
                        <div class="prod-actions-overlay">
                            <a href="productList" class="action-btn">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a href="wishlist" class="action-btn">
                                <i class="fa-regular fa-heart"></i>
                            </a>
                        </div>
                    </div>
                    <div class="prod-info">
                        <div class="prod-cat">Electronics</div>
                        <h4 class="prod-title">iPhone 14 Pro</h4>
                        <div class="prod-price">₹ 99,999</div>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-3 reveal-up">
                <div class="prod-card-bella">
                    <div class="prod-img-box">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
                             alt="Headphones">
                        <div class="prod-actions-overlay">
                            <a href="productList" class="action-btn">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a href="wishlist" class="action-btn">
                                <i class="fa-regular fa-heart"></i>
                            </a>
                        </div>
                    </div>
                    <div class="prod-info">
                        <div class="prod-cat">Audio</div>
                        <h4 class="prod-title">Studio Wireless</h4>
                        <div class="prod-price">₹ 3,499</div>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-3 reveal-up">
                <div class="prod-card-bella">
                    <div class="prod-img-box">
                        <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
                             alt="Watch">
                        <div class="prod-actions-overlay">
                            <a href="productList" class="action-btn">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a href="wishlist" class="action-btn">
                                <i class="fa-regular fa-heart"></i>
                            </a>
                        </div>
                    </div>
                    <div class="prod-info">
                        <div class="prod-cat">Accessories</div>
                        <h4 class="prod-title">Smart Watch</h4>
                        <div class="prod-price">₹ 1,999</div>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-3 reveal-up">
                <div class="prod-card-bella">
                    <div class="prod-img-box">
                        <img src="https://images.unsplash.com/photo-1541643600914-78b084683601?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
                             alt="Perfume">
                        <div class="prod-actions-overlay">
                            <a href="productList" class="action-btn">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a href="wishlist" class="action-btn">
                                <i class="fa-regular fa-heart"></i>
                            </a>
                        </div>
                    </div>
                    <div class="prod-info">
                        <div class="prod-cat">Beauty</div>
                        <h4 class="prod-title">Luxe Essence</h4>
                        <div class="prod-price">₹ 899</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<section class="section-bella" id="about">
    <div class="container">
        <div class="section-header-bella reveal-up">
            <span class="section-tag">About Us</span>
            <h2 class="section-title-bella">Smart Shopping with Smart Delivery</h2>
            <p style="color:#777; max-width:800px; margin:auto;">
                SmartLogisticsSystem is a premium shopping and logistics platform where customers can browse products,
                place orders, cancel orders before shipment, track delivery status, and choose secure payment options
                like UPI, card, and Cash on Delivery.
            </p>
        </div>
    </div>
</section>

<section class="section-bella" id="contact" style="background:#fafafa;">
    <div class="container">
        <div class="section-header-bella reveal-up">
            <span class="section-tag">Contact</span>
            <h2 class="section-title-bella">Get in Touch</h2>
        </div>

        <div class="row g-4">

            <div class="col-md-4 reveal-up">
                <div class="contact-card">
                    <i class="fa-solid fa-phone"></i>
                    <h5>Phone</h5>
                    <p style="color:#777;">+91 98765 43210</p>
                </div>
            </div>

            <div class="col-md-4 reveal-up">
                <div class="contact-card">
                    <i class="fa-solid fa-envelope"></i>
                    <h5>Email</h5>
                    <p style="color:#777;">support@smartlogistics.com</p>
                </div>
            </div>

            <div class="col-md-4 reveal-up">
                <div class="contact-card">
                    <i class="fa-solid fa-location-dot"></i>
                    <h5>Address</h5>
                    <p style="color:#777;">Nagpur, Maharashtra, India</p>
                </div>
            </div>

        </div>
    </div>
</section>

<footer class="footer-bella">
    <div class="container">
        <div class="row g-5">

            <div class="col-lg-4 col-md-6">
                <a href="index" class="footer-logo">SmartLogistics</a>
                <p style="color:#888; line-height:1.8; max-width:300px;">
                    Bridging the gap between premium shopping experiences and robust logistics solutions.
                    We deliver quality, efficiently.
                </p>
            </div>

            <div class="col-lg-2 col-md-6">
                <h5 class="footer-heading">Shop</h5>
                <ul class="footer-links p-0">
                    <li><a href="productList">New Arrivals</a></li>
                    <li><a href="productList">Best Sellers</a></li>
                    <li><a href="productList">Electronics</a></li>
                    <li><a href="productList">Home Decor</a></li>
                </ul>
            </div>

            <div class="col-lg-2 col-md-6">
                <h5 class="footer-heading">Company</h5>
                <ul class="footer-links p-0">
                    <li><a href="index">Home</a></li>
                    <li><a href="#about">About Us</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li><a href="myOrders">Track Order</a></li>
                </ul>
            </div>

            <div class="col-lg-4 col-md-6">
                <h5 class="footer-heading">Newsletter</h5>
                <p style="color:#888; font-size:14px; margin-bottom:20px;">
                    Subscribe for exclusive offers.
                </p>

                <form onsubmit="return subscribeNewsletter();">
                    <input type="email" id="newsletterEmail" placeholder="Your Email Address" class="newsletter-input" required>
                    <button type="submit" class="btn-custom" style="background:#fff; color:#000; border:none;">
                        Subscribe
                    </button>
                </form>
            </div>

        </div>

        <div class="copyright">
            <p>&copy; 2026 SmartLogisticsSystem. All Rights Reserved.</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
const revealElements = document.querySelectorAll('.reveal-up');

const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('active');
            revealObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.1 });

revealElements.forEach(el => revealObserver.observe(el));

const nav = document.getElementById('mainNav');

window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
        nav.classList.add('scrolled');
    } else {
        nav.classList.remove('scrolled');
    }
});

function subscribeNewsletter() {
    const email = document.getElementById("newsletterEmail").value;
    alert("Thank you for subscribing: " + email);
    document.getElementById("newsletterEmail").value = "";
    return false;
}
</script>

</body>
</html>