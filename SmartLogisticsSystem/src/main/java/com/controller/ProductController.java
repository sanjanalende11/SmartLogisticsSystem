package com.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.model.CartItem;
import com.model.Product;
import com.service.ProductService;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @GetMapping("/addProduct")
    public String showForm() {
        return "addProduct";
    }

    @PostMapping("/saveProduct")
    public String saveProduct(
            @ModelAttribute Product p,
            @RequestParam(value="file1", required=false) MultipartFile img1,
            @RequestParam(value="file2", required=false) MultipartFile img2,
            @RequestParam(value="file3", required=false) MultipartFile img3,
            HttpServletRequest request) {

        String uploadPath = request.getServletContext().getRealPath("/Images/");

        try {
            if(img1 != null && !img1.isEmpty()){
                String fileName = img1.getOriginalFilename();
                img1.transferTo(new File(uploadPath + fileName));
                p.setImg1(fileName);
            }

            if(img2 != null && !img2.isEmpty()){
                String fileName = img2.getOriginalFilename();
                img2.transferTo(new File(uploadPath + fileName));
                p.setImg2(fileName);
            }

            if(img3 != null && !img3.isEmpty()){
                String fileName = img3.getOriginalFilename();
                img3.transferTo(new File(uploadPath + fileName));
                p.setImg3(fileName);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        productService.saveProduct(p);

        return "redirect:/productList";
    }
    @GetMapping("/productList")
    public String getProducts(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "productList";
    }

    @PostMapping("/addToCart")
    public String addToCart(@RequestParam("productId") int productId, HttpSession session) {

        Product product = productService.getProductById(productId);

        if (product == null) {
            return "redirect:/productList";
        }

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new LinkedHashMap<>();
        }

        if (cart.containsKey(productId)) {
            CartItem existingItem = cart.get(productId);
            existingItem.setQuantity(existingItem.getQuantity() + 1);
        } else {
            CartItem item = new CartItem();
            item.setProduct(product);
            item.setQuantity(1);
            cart.put(productId, item);
        }

        session.setAttribute("cart", cart);

        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String openCart(HttpSession session, Model model) {

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        List<CartItem> cartItems = new ArrayList<>();
        double cartTotal = 0;

        if (cart != null) {
            cartItems = new ArrayList<>(cart.values());

            for (CartItem item : cartItems) {
                cartTotal += item.getProduct().getPrice() * item.getQuantity();
            }
        }

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("cartTotal", cartTotal);

        return "cart";
    }

    @GetMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("productId") int productId, HttpSession session) {

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart != null && cart.containsKey(productId)) {
            cart.remove(productId);
        }

        session.setAttribute("cart", cart);

        return "redirect:/cart";
    }
    
    @GetMapping("/searchProduct")
    public String searchProduct(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("products", productService.searchProduct(keyword));
        return "productList";
    }
    
    @GetMapping("/filterPrice")
    public String filterPrice(@RequestParam double minPrice,
                              @RequestParam double maxPrice,
                              Model model) {

        model.addAttribute("products", productService.filterByPrice(minPrice, maxPrice));
        return "productList";
    }
    
    @GetMapping("/filterCategory")
    public String filterCategory(@RequestParam String category, Model model) {
        model.addAttribute("products", productService.filterByCategory(category));
        return "productList";
    }
    
    @GetMapping("/sortProducts")
    public String sortProducts(@RequestParam("sort") String sort, Model model) {
        List<Product> products = productService.sortProducts(sort);
        model.addAttribute("products", products);
        return "productList";
    }
    
    @GetMapping("/filterProducts")
    public String filterProducts(
            @RequestParam(required = false) String[] category,
            @RequestParam(required = false) Double minPrice,
            @RequestParam(required = false) Double maxPrice,
            @RequestParam(required = false) Boolean inStock,
            Model model) {

        List<Product> products = productService.filterProducts(category, minPrice, maxPrice, inStock);
        model.addAttribute("products", products);
        return "productList";
    }
    
    @GetMapping("/addToWishlist")
    public String addToWishlist(@RequestParam("productId") int productId, HttpSession session) {
        productService.add(productId, session);
        return "wishlist";
    }
    
    @GetMapping("/productDetails")
    public String productDetails(@RequestParam("productId") int productId, Model model) {

        Product product = productService.getProductById(productId);

        model.addAttribute("product", product);

        return "productDetails";
    }
    
    @GetMapping("/editProduct")
    public String editProduct(@RequestParam("id") int id, Model model) {

        Product product = productService.getProductById(id);
        model.addAttribute("product", product);

        return "editProduct";   
    }
    
    @PostMapping("/updateProduct")
    public String updateProduct(Product product) {

    	Product existing = productService.getProductById(product.getId());

    	if(product.getImg1() == null || product.getImg1().isEmpty()){
    	    product.setImg1(existing.getImg1());
    	}
    	if(product.getImg2() == null || product.getImg2().isEmpty()){
    	    product.setImg2(existing.getImg2());
    	}
    	if(product.getImg3() == null || product.getImg3().isEmpty()){
    	    product.setImg3(existing.getImg3());
    	}

        productService.updateProduct(product);

        return "redirect:/productList";
    }
    
    @GetMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("id") int id) {

        productService.deleteProduct(id);

        return "redirect:/productList";
    }
}