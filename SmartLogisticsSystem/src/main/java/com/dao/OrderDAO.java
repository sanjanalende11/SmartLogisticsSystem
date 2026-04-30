package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Order;


@Repository
public class OrderDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void save(Order order) {
    	 sessionFactory.getCurrentSession().saveOrUpdate(order);
    }

    // Admin - get all orders
    public List<Order> getOrders() {
        return sessionFactory.getCurrentSession()
                .createQuery("from Order o order by o.id desc", Order.class)
                .list();
    }

    // Customer - get only their orders
    public List<Order> getOrdersByUsername(String username) {
        return sessionFactory.getCurrentSession()
                .createQuery("from Order o where o.customerUsername = :username order by o.id desc", Order.class)
                .setParameter("username", username)
                .list();
    }
    
    public Order getOrderById(int orderId) {
        return sessionFactory.getCurrentSession().get(Order.class, orderId);
    }

	
}