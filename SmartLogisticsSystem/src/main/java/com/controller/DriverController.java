package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Order;
import com.model.Shipment;
import com.service.OrderService;
import com.service.ShipmentService;

@Controller
public class DriverController {

    @Autowired
    private ShipmentService shipmentService;

    @Autowired
    private OrderService orderService;

    @PostMapping("/driver/updateShipmentStatus")
    public String updateShipmentStatus(@RequestParam("shipmentId") int shipmentId,
                                       @RequestParam("orderId") int orderId,
                                       @RequestParam("status") String status) {

        Shipment shipment = shipmentService.getById(shipmentId);

        if (shipment != null) {
            shipment.setStatus(status);
            shipmentService.saveShipment(shipment);

            Order order = orderService.getOrderById(orderId);

            if (order != null) {
                order.setShipmentStatus(status);

                if (status.equalsIgnoreCase("Pending")) {
                    order.setStatus("Shipment Pending");
                } else if (status.equalsIgnoreCase("In Transit")) {
                    order.setStatus("Out for Delivery");
                } else if (status.equalsIgnoreCase("Delivered")) {
                    order.setStatus("Delivered");

                    if (order.getPaymentMethod() != null &&
                            (order.getPaymentMethod().equalsIgnoreCase("COD") ||
                             order.getPaymentMethod().equalsIgnoreCase("Cash on Delivery"))) {
                        order.setPaymentStatus("Paid");
                    }
                }

                orderService.saveOrder(order);
            }
        }

        return "redirect:/driverdashboard";
    }
}