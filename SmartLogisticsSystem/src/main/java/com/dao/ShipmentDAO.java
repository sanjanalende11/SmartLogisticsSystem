package com.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Shipment;

import java.util.List;

@Repository
public class ShipmentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void save(Shipment s) {
        sessionFactory.getCurrentSession().saveOrUpdate(s);
    }

    public List<Shipment> getAll() {
        return sessionFactory.getCurrentSession()
                .createQuery("from Shipment", Shipment.class)
                .list();
    }

    public Shipment getById(int id) {
        return sessionFactory.getCurrentSession().get(Shipment.class, id);
    }
}