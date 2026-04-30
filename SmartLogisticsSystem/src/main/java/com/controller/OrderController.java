package com.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.CartItem;
import com.model.Order;
import com.model.User;
import com.service.OrderService;

@Controller
public class OrderController {

    @Autowired
    private OrderService service;

    @GetMapping("/orderPage")
    public String orderPage() {
        return "order";
    }

    @PostMapping("/placeOrder")
    public String placeOrder(Order order, HttpSession session) {

        String username = getLoggedInUsername(session);

        order.setOrderNumber(generateOrderNumber());
        order.setOrderDate(getCurrentDateTime());
        order.setCustomerUsername(username);
        order.setShipmentStatus("Not Created");
        order.setStatus("Order Placed");

        if (isCOD(order.getPaymentMethod())) {
            order.setPaymentStatus("Pending");
        } else {
            order.setPaymentStatus("Paid");
        }

        service.saveOrder(order);

        session.setAttribute("lastOrderId", order.getId());

        return "redirect:/myOrders";
    }

    @GetMapping("/checkout")
    public String openCheckout(HttpSession session, Model model) {

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        List<CartItem> cartItems = new ArrayList<>();
        double cartTotal = 0;

        if (cart != null && !cart.isEmpty()) {
            cartItems = new ArrayList<>(cart.values());

            for (CartItem item : cartItems) {
                cartTotal += item.getProduct().getPrice() * item.getQuantity();
            }
        }

        double discountAmount = calculateDiscount(cartTotal);
        double finalAmount = cartTotal - discountAmount;

        User customer = (User) session.getAttribute("customer");

        model.addAttribute("customer", customer);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("cartTotal", cartTotal);
        model.addAttribute("discountAmount", discountAmount);
        model.addAttribute("finalAmount", finalAmount);

        return "checkout";
    }

    @PostMapping("/placeOrderFromCart")
    public String placeOrderFromCart(
            @RequestParam("customerName") String customerName,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address,
            @RequestParam("paymentMethod") String paymentMethod,
            HttpSession session) {

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            return "redirect:/cart";
        }

        String username = getLoggedInUsername(session);
        String orderNo = generateOrderNumber();

        double cartTotal = 0;

        for (CartItem item : cart.values()) {
            cartTotal += item.getProduct().getPrice() * item.getQuantity();
        }

        double discountAmount = calculateDiscount(cartTotal);
        double finalAmount = cartTotal - discountAmount;

        for (CartItem item : cart.values()) {

            Order order = new Order();

            order.setProductName(item.getProduct().getName());
            order.setProductImage(item.getProduct().getImg1());
            order.setQuantity(item.getQuantity());

            order.setCustomerName(customerName);
            order.setPhone(phone);
            order.setAddress(address);

            order.setPrice(item.getProduct().getPrice());
            order.setTotalAmount(item.getProduct().getPrice() * item.getQuantity());

           
            order.setDiscountAmount(discountAmount);
            order.setFinalAmount(finalAmount);

            order.setPaymentMethod(paymentMethod);

            if (isCOD(paymentMethod)) {
                order.setPaymentStatus("Pending");
            } else {
                order.setPaymentStatus("Paid");
            }

            order.setOrderNumber(orderNo);
            order.setOrderDate(getCurrentDateTime());
            order.setCustomerUsername(username);

            order.setShipmentStatus("Not Created");
            order.setStatus("Order Placed");

            service.saveOrder(order);
        }

        session.removeAttribute("cart");
        session.setAttribute("lastOrderNumber", orderNo);

        return "orderSuccess";
    }

    @GetMapping("/myOrders")
    public String myOrders(HttpSession session, Model model) {

        String username = getLoggedInUsername(session);

        model.addAttribute("list", service.getOrdersByUsername(username));

        return "myOrders";
    }

    @GetMapping("/admin/orders")
    public String adminOrders(Model model) {

        model.addAttribute("list", service.getOrders());

        return "adminOrders";
    }

    @GetMapping("/admin/viewOrderDetails")
    public String viewOrderDetails(@RequestParam("orderId") int orderId, Model model) {

        Order order = service.getOrderById(orderId);

        model.addAttribute("order", order);

        return "viewOrderDetails";
    }

    @PostMapping("/cancelOrder")
    public String cancelOrder(@RequestParam("orderId") int orderId, HttpSession session) {

        Order order = service.getOrderById(orderId);
        String username = getLoggedInUsername(session);

        if (order != null && order.getCustomerUsername().equals(username)) {

            if (order.getShipmentStatus() == null ||
                    order.getShipmentStatus().equalsIgnoreCase("Not Created") ||
                    order.getShipmentStatus().equalsIgnoreCase("Pending")) {

                order.setStatus("Cancelled");
                order.setShipmentStatus("Cancelled");

                service.saveOrder(order);
            }
        }

        return "redirect:/myOrders";
    }

    private boolean isCOD(String paymentMethod) {

        return paymentMethod != null &&
                (paymentMethod.equalsIgnoreCase("COD") ||
                 paymentMethod.equalsIgnoreCase("Cash on Delivery"));
    }

    private double calculateDiscount(double cartTotal) {

        if (cartTotal >= 5000) {
            return cartTotal * 10 / 100;
        }

        return 0;
    }

    private String generateOrderNumber() {

        return "ORD" + System.currentTimeMillis() + (int) (Math.random() * 1000);
    }

    private String getCurrentDateTime() {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

        return LocalDateTime.now().format(formatter);
    }

    private String getLoggedInUsername(HttpSession session) {

        Object usernameObj = session.getAttribute("username");

        if (usernameObj != null) {
            return usernameObj.toString();
        }

        return "Guest";
    }
}