package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.OrderDAO;
import com.model.Order;

@Service
public class OrderService {

    @Autowired
    private OrderDAO dao;

    @Transactional
    public void saveOrder(Order o) {
        dao.save(o);
    }

    @Transactional
    public List<Order> getOrders() {
        return dao.getOrders();
    }

    @Transactional
    public List<Order> getOrdersByUsername(String username) {
        return dao.getOrdersByUsername(username);
    }
    
    @Transactional
    public Order getOrderById(int orderId) {
        return dao.getOrderById(orderId);   
    }
    @Transactional
    public long getNewOrderCount() {
        return getOrders().stream()
                .filter(o -> "Not Created".equalsIgnoreCase(o.getShipmentStatus()))
                .count();
    }

	
}