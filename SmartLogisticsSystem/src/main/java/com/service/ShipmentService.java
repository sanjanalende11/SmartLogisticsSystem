package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ShipmentDAO;
import com.model.Shipment;

import java.util.List;

@Service
public class ShipmentService {

    @Autowired
    private ShipmentDAO dao;

    @Transactional
    public void saveShipment(Shipment s) {
        dao.save(s);
    }

    @Transactional
    public List<Shipment> getShipments() {
        return dao.getAll();
    }

    @Transactional
    public Shipment getById(int id) {
        return dao.getById(id);
    }
}