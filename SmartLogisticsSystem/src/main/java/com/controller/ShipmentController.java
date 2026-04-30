package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.model.Order;
import com.model.Shipment;
import com.service.OrderService;
import com.service.ShipmentService;

@Controller
@RequestMapping("/admin")
public class ShipmentController {

    @Autowired
    private ShipmentService service;

    @Autowired
    private OrderService orderService;

    @GetMapping("/createShipment")
    public String createShipment(@RequestParam("orderId") int orderId, Model model) {

        Shipment shipment = new Shipment();
        shipment.setOrderId(orderId);

        model.addAttribute("shipment", shipment);

        return "createShipment";
    }

    @PostMapping("/saveShipment")
    public String saveShipment(Shipment s) {

        s.setStatus("Pending");
        service.saveShipment(s);

        Order order = orderService.getOrderById(s.getOrderId());

        if (order != null) {
            order.setShipmentStatus("Pending");
            order.setStatus("Shipment Created");
            orderService.saveOrder(order);
        }

        return "redirect:/admin/viewShipment";
    }

    @GetMapping("/viewShipment")
    public String viewShipment(Model model) {

        model.addAttribute("list", service.getShipments());

        return "viewShipment";
    }

    @PostMapping("/updateShipment")
    @ResponseBody
    public String updateShipment(@RequestParam("id") int id,
                                 @RequestParam(required = false) String driverName,
                                 @RequestParam(required = false) String status) {

        Shipment shipment = service.getById(id);

        if (shipment == null) {
            return "fail";
        }

        if (driverName != null && !driverName.trim().isEmpty()) {
            shipment.setDriverName(driverName);
        }

        if (status != null && !status.trim().isEmpty()) {

            shipment.setStatus(status);

            Order order = orderService.getOrderById(shipment.getOrderId());

            if (order != null) {
                order.setShipmentStatus(status);

                if (status.equalsIgnoreCase("Pending")) {
                    order.setStatus("Shipment Pending");
                } 
                else if (status.equalsIgnoreCase("In Transit")) {
                    order.setStatus("Out for Delivery");
                } 
                else if (status.equalsIgnoreCase("Delivered")) {
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

        service.saveShipment(shipment);

        return "success";
    }
}