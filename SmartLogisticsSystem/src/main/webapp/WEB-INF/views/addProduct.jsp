<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Product | SmartLogisticsSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<!-- Premium Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">

<style>
    :root {
        /* Bella Theme Palette */
        --bg-body: #fffbf7; /* Warm Bone White */
        --bg-card: #ffffff;
        --text-main: #1a1a1a;
        --text-muted: #777777;
        --accent-gold: #c5a059;
        --accent-gold-light: #e6c8a3;
        --border-color: #e5e5e5;
        --shadow-soft: 0 10px 30px rgba(0,0,0,0.04);
        --transition: all 0.3s ease;
    }

    *{margin:0;padding:0;box-sizing:border-box;}

    body{
        font-family:'Lato', sans-serif;
        background:var(--bg-body);
        color:var(--text-main);
        overflow-x:hidden;
        min-height: 100vh;
    }

    h1, h2, h3, h4, h5, h6, .serif-font {
        font-family:'Playfair Display', serif;
        font-weight: 600;
        color: var(--text-main);
        letter-spacing: -0.5px;
    }

    a{text-decoration:none;color:inherit; transition:var(--transition);}

    /* ========== NAVBAR (White & Gold) ========== */
    .navbar-bella {
        background: rgba(255,255,255,0.98);
        border-bottom: 1px solid var(--border-color);
        padding: 20px 0;
        position: sticky;
        top: 0;
        z-index: 1000;
    }
    .nav-inner { display: flex; align-items: center; justify-content: space-between; }
    .logo-bella {
        font-family:'Playfair Display', serif;
        font-size: 26px;
        font-weight: 700;
        letter-spacing: -0.5px;
        color: var(--text-main);
    }
    .logo-bella span { color: var(--accent-gold); }
    .nav-actions { display: flex; gap: 15px; align-items: center; }
    .nav-btn-ghost {
        background: transparent;
        color: var(--text-main);
        padding: 10px 20px;
        border-radius: 4px;
        font-weight: 600;
        font-size: 13px;
        border: 1px solid var(--border-color);
    }
    .nav-btn-ghost:hover {
        border-color: var(--accent-gold);
        color: var(--accent-gold);
    }
    .nav-btn-active {
        background: var(--accent-gold);
        color: #fff;
        border-color: var(--accent-gold);
    }

    /* ========== PAGE LAYOUT ========== */
    .page-container { padding: 60px 0 100px; }

    /* Breadcrumb */
    .breadcrumb-wrap {
        margin-bottom: 30px;
        font-size: 14px;
        color: var(--text-muted);
    }
    .breadcrumb-wrap a {
        color: var(--accent-gold);
        font-weight: 600;
    }

    /* HERO SECTION */
    .page-hero {
        background: #fff;
        border: 1px solid var(--border-color);
        border-radius: 12px;
        padding: 40px;
        margin-bottom: 40px;
        text-align: center;
    }
    .page-title {
        font-size: 36px;
        margin-bottom: 10px;
    }
    .page-desc {
        color: var(--text-muted);
        max-width: 600px;
        margin: 0 auto;
        font-size: 15px;
    }

    /* ========== MAIN FORM CARD ========== */
    .form-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 16px;
        padding: 40px;
        box-shadow: var(--shadow-soft);
    }
    .form-header {
        margin-bottom: 30px;
        border-bottom: 1px solid var(--border-color);
        padding-bottom: 20px;
    }
    .form-header h2 { font-size: 24px; margin-bottom: 5px; }
    .form-header p { color: var(--text-muted); font-size: 14px; }

    .form-group { margin-bottom: 25px; }
    .form-label {
        display: block;
        font-size: 13px;
        font-weight: 700;
        color: var(--text-main);
        margin-bottom: 8px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    .form-label .required { color: var(--accent-gold); margin-left: 4px; }

    .form-control {
        width: 100%;
        background: #fff;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 12px 15px;
        font-size: 15px;
        font-family:'Lato', sans-serif;
        color: var(--text-main);
        transition: var(--transition);
    }
    .form-control:focus {
        border-color: var(--accent-gold);
        box-shadow: 0 0 0 4px rgba(197,160,89,0.1);
        outline: none;
    }
    textarea.form-control {
        resize: vertical;
        min-height: 120px;
    }

    /* Upload Area */
    .upload-section { margin-bottom: 35px; }
    .upload-zone {
        border: 2px dashed var(--border-color);
        background: #fcfcfc;
        border-radius: 12px;
        padding: 30px;
        text-align: center;
        cursor: pointer;
        transition: var(--transition);
        position: relative;
    }
    .upload-zone:hover, .upload-zone.drag-over {
        border-color: var(--accent-gold);
        background: rgba(197,160,89,0.03);
    }
    .upload-icon {
        font-size: 32px;
        color: var(--accent-gold);
        margin-bottom: 15px;
    }
    .upload-text h6 { font-size: 18px; margin-bottom: 5px; font-weight: 700; }
    .upload-text p { font-size: 13px; color: var(--text-muted); }
    .file-input { display: none; } /* Hidden actual input */
    
    /* Preview */
    .preview-box {
        margin-top: 20px;
        background: #fcfcfc;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 10px;
        min-height: 150px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .preview-box img {
        max-width: 100%;
        max-height: 200px;
        object-fit: contain;
        border-radius: 4px;
        display: none;
    }

    /* Buttons */
    .action-row {
        display: flex;
        gap: 15px;
        margin-top: 20px;
    }
    .btn-submit {
        flex: 1;
        padding: 14px;
        background: var(--text-main);
        color: #fff;
        border: none;
        border-radius: 6px;
        font-weight: 700;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: var(--transition);
        cursor: pointer;
    }
    .btn-submit:hover {
        background: var(--accent-gold);
        transform: translateY(-2px);
    }
    .btn-reset {
        flex: 1;
        padding: 14px;
        background: transparent;
        color: var(--text-main);
        border: 1px solid var(--border-color);
        border-radius: 6px;
        font-weight: 600;
        font-size: 14px;
        text-transform: uppercase;
        transition: var(--transition);
        cursor: pointer;
    }
    .btn-reset:hover {
        background: #f5f5f5;
        border-color: #ccc;
    }

    /* ========== SIDE PANEL ========== */
    .side-panel {
        background: #fff;
        border: 1px solid var(--border-color);
        border-radius: 16px;
        padding: 30px;
        height: 100%;
    }
    .panel-title {
        font-size: 18px;
        margin-bottom: 20px;
        border-bottom: 2px solid var(--accent-gold);
        display: inline-block;
        padding-bottom: 5px;
    }
    .tip-item {
        display: flex;
        gap: 15px;
        margin-bottom: 20px;
        align-items: flex-start;
    }
    .tip-icon {
        color: var(--accent-gold);
        font-size: 18px;
        margin-top: 3px;
    }
    .tip-content strong { display: block; font-size: 14px; margin-bottom: 4px; font-family:'Lato', sans-serif; font-weight: 700; }
    .tip-content p { font-size: 13px; color: var(--text-muted); margin: 0; line-height: 1.5; }

    @media(max-width: 768px){
        .action-row { flex-direction: column; }
        .btn-submit, .btn-reset { width: 100%; }
        .page-container { padding: 40px 0 60px; }
    }
</style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar-bella">
    <div class="container">
        <div class="nav-inner">
            <a href="admindashboard" class="logo-bella">Smart<span>Logistics</span></a>
            <div class="nav-actions">
                <a href="admindashboard" class="nav-btn-ghost"><i class="fa-solid fa-arrow-left me-2"></i> Dashboard</a>
                <a href="productList" class="nav-btn-ghost nav-btn-active">View Products</a>
            </div>
        </div>
    </div>
</nav>

<div class="container page-container">

    <!-- Breadcrumb -->
    <div class="breadcrumb-wrap">
        <a href="admindashboard">Dashboard</a> / <span>Add New Product</span>
    </div>

    <!-- HERO / INTRO -->
    <div class="page-hero">
        <h1 class="page-title">Create New Listing</h1>
        <p class="page-desc">
            Add a new product to the catalog. Ensure high-quality images, accurate pricing, 
            and detailed descriptions for the best customer experience.
        </p>
    </div>

    <div class="row g-5">
        <!-- LEFT COLUMN: FORM -->
        <div class="col-lg-8">
            <div class="form-card">
                <form action="saveProduct" method="post" enctype="multipart/form-data">
                    
                    <div class="form-header">
                        <h2>Product Details</h2>
                        <p>Fill in the required information below</p>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Product Name <span class="required">*</span></label>
                                <input type="text" name="name" class="form-control" placeholder="e.g. Wireless Headphones" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Brand</label>
                                <input type="text" name="brand" class="form-control" placeholder="e.g. Sony, Apple">
                            </div>
                        </div>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Price (₹) <span class="required">*</span></label>
                                <input type="number" name="price" step="0.01" class="form-control" placeholder="0.00" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Quantity <span class="required">*</span></label>
                                <input type="number" name="quantity" class="form-control" placeholder="Available Stock" required>
                            </div>
                        </div>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Category <span class="required">*</span></label>
                                <select name="category" class="form-control" required>
                                    <option value="">Select Category</option>
                                    <option>Electronics</option>
                                    <option>Fashion</option>
                                    <option>Furniture</option>
                                    <option>Mobiles</option>
                                    <option>Home Appliances</option>
                                    <option>Accessories</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Status</label>
                                <select name="status" class="form-control">
                                    <option value="Available">In Stock</option>
                                    <option value="Out of Stock">Out of Stock</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Short Tags</label>
                        <input type="text" name="tags" class="form-control" placeholder="e.g. premium, new, sale">
                    </div>

                    <div class="form-group">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" placeholder="Write a detailed product description..."></textarea>
                    </div>

                   <div class="upload-section">
    <label class="form-label">Product Images <span class="required">*</span></label>

    <div class="row g-3">

        <div class="col-md-4">
            <input type="file" name="file1" class="form-control" accept="image/*" onchange="previewMultiImage(event,'preview1')" required>
            <div class="preview-box mt-2">
                <img id="preview1" style="display:none; max-width:100%;">
            </div>
        </div>

        <div class="col-md-4">
            <input type="file" name="file2" class="form-control" accept="image/*" onchange="previewMultiImage(event,'preview2')">
            <div class="preview-box mt-2">
                <img id="preview2" style="display:none; max-width:100%;">
            </div>
        </div>

        <div class="col-md-4">
            <input type="file" name="file3" class="form-control" accept="image/*" onchange="previewMultiImage(event,'preview3')">
            <div class="preview-box mt-2">
                <img id="preview3" style="display:none; max-width:100%;">
            </div>
        </div>

    </div>
</div>
                   
                    <div class="action-row">
                        <button type="submit" class="btn-submit">Add Product</button>
                        <button type="reset" class="btn-reset" onclick="resetForm()">Reset</button>
                    </div>

                </form>
            </div>
        </div>

        
        <div class="col-lg-4">
            <div class="side-panel">
                <h3 class="panel-title">Guidelines</h3>
                
                <div class="tip-item">
                    <div class="tip-icon"><i class="fa-solid fa-circle-check"></i></div>
                    <div class="tip-content">
                        <strong>High Quality Images</strong>
                        <p>Use clear, well-lit photos (min 500x500px) to attract buyers.</p>
                    </div>
                </div>

                <div class="tip-item">
                    <div class="tip-icon"><i class="fa-solid fa-tag"></i></div>
                    <div class="tip-content">
                        <strong>Accurate Pricing</strong>
                        <p>Enter the exact selling price. You can add discounts in the description.</p>
                    </div>
                </div>

                <div class="tip-item">
                    <div class="tip-icon"><i class="fa-solid fa-boxes-stacked"></i></div>
                    <div class="tip-content">
                        <strong>Stock Management</strong>
                        <p>Set quantity to 0 if the item is out of stock to hide it from listings.</p>
                    </div>
                </div>

                <div class="tip-item">
                    <div class="tip-icon"><i class="fa-solid fa-layer-group"></i></div>
                    <div class="tip-content">
                        <strong>Category Selection</strong>
                        <p>Choose the most relevant category to ensure customers find you easily.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    // Drag and drop visuals
    const uploadZone = document.getElementById('uploadZone');
    
    // Click trigger for file input
    uploadZone.addEventListener('click', () => {
        document.getElementById('imageInput').click();
    });

    // Drag events
    ['dragenter', 'dragover'].forEach(eventName => {
        uploadZone.addEventListener(eventName, (e) => {
            e.preventDefault();
            uploadZone.classList.add('drag-over');
        });
    });

    ['dragleave', 'drop'].forEach(eventName => {
        uploadZone.addEventListener(eventName, (e) => {
            e.preventDefault();
            uploadZone.classList.remove('drag-over');
        });
    });

    // Handle file drop
    uploadZone.addEventListener('drop', (e) => {
        const input = document.getElementById('imageInput');
        input.files = e.dataTransfer.files;
        previewImage({ target: input });
    });

   
    function previewMultiImage(event, id) {
        const input = event.target;
        const preview = document.getElementById(id);

        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = "block";
            }
            reader.readAsDataURL(input.files[0]);
        }
    }


    function resetForm() {
        const preview = document.getElementById("previewImg");
        const previewText = document.getElementById("previewText");
        preview.src = "#";
        preview.style.display = "none";
        previewText.style.display = "block";
        document.querySelector("form").reset();
    }
</script>

</body>
</html>