package com.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ProductDAO;
import com.model.Product;

@Service
public class ProductService {

    @Autowired
    ProductDAO productDAO;

    @Transactional
    public void saveProduct(Product product) {
        productDAO.save(product);
    }

    @Transactional
    public List<Product> getAllProducts() {
        return productDAO.getAll();
    }

    @Transactional
    public Product getProductById(int id) {
        return productDAO.getById(id);
    }

    @Transactional
    public List<Product> searchProduct(String keyword) {
        return productDAO.searchProduct(keyword);
    }

    @Transactional
    public List<Product> filterByPrice(double min, double max) {
        return productDAO.filterByPrice(min, max);
    }

    @Transactional
    public List<Product> filterByCategory(String category) {
        return productDAO.filterByCategory(category);
    }

    @Transactional
    public List<Product> sortByPrice(String order) {
        return productDAO.sortByPrice(order);
    }
    
    @Transactional
    public List<Product> filterProducts(String[] category, Double minPrice, Double maxPrice, Boolean inStock) {
        return productDAO.filterProducts(category, minPrice, maxPrice, inStock);
    }

    @Transactional
    public List<Product> sortProducts(String sort) {
        return productDAO.sortProducts(sort);
    }

    @Transactional
	public void add(int productId, HttpSession session) {
    	
    	Product p = productDAO.findById(productId);

        if (p != null) {
            List<Product> wishlist = (List<Product>) session.getAttribute("wishlist");

            if (wishlist == null) {
                wishlist = new ArrayList<>();
            }

            wishlist.add(p);
            session.setAttribute("wishlist", wishlist);
        }
	
    }

    @Transactional
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		productDAO.update(product);
		
	}

    @Transactional
	public void deleteProduct(int id) {
		// TODO Auto-generated method stub
		 productDAO.delete(id);
	}
	
}