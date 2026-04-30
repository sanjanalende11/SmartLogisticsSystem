package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.User;
import com.service.EmailService;
import com.service.OrderService;
import com.service.ShipmentService;
import com.service.UserService;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ShipmentService shipmentService;

    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @GetMapping("/register")
    public String showRegister() {
        return "register";
    }

    @PostMapping("/doRegister")
    public String register(User user, Model model) {

        User existing = userService.findByUsername(user.getUsername());

        if (existing != null) {
            model.addAttribute("error", "Account already exists. Please login.");
            return "register";
        }

        user.setRole("CUSTOMER");
        userService.saveUser(user);

        model.addAttribute("success", "Account created successfully. Please login.");
        return "login";
    }

    @PostMapping("/doLogin")
    public String login(User user, HttpSession session, Model model) {

        User existingUser = userService.findByUsername(user.getUsername());

        if (existingUser == null) {
            model.addAttribute("error", "Account does not exist. Please create account.");
            return "login";
        }

        User u = userService.checkLogin(user);

        if (u != null) {

            session.setAttribute("user", u);
            session.setAttribute("username", u.getUsername());
            session.setAttribute("role", u.getRole());
            session.setAttribute("address", u.getAddress());

            if (u.getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/admindashboard";
            } 
            else if (u.getRole().equalsIgnoreCase("CUSTOMER")) {
                return "redirect:/customerdashboard";
            } 
            else if (u.getRole().equalsIgnoreCase("DRIVER")) {
                return "redirect:/driverdashboard";
            }
        }

        model.addAttribute("error", "Invalid password!");
        return "login";
    }

    @GetMapping("/admindashboard")
    public String adminDashboard(Model model) {

        long newOrders = orderService.getOrders().stream()
                .filter(o -> "Not Created".equalsIgnoreCase(o.getShipmentStatus()))
                .count();

        model.addAttribute("newOrders", newOrders);
        model.addAttribute("orders", orderService.getOrders());

        return "admindashboard";
    }

    @GetMapping("/customerdashboard")
    public String customerDashboard() {
        return "customerdashboard";
    }

    @GetMapping("/driverdashboard")
    public String driverDashboard(Model model, HttpSession session) {

        model.addAttribute("list", shipmentService.getShipments());

        return "driverdashboard";
    }

    @GetMapping("/wishlist")
    public String wishlist() {
        return "wishlist";
    }

    @GetMapping("/forgotPassword")
    public String forgotPasswordPage() {
        return "forgotPassword";
    }

    @PostMapping("/sendResetEmail")
    public String sendResetEmail(@RequestParam("email") String email, Model model) {

        User user = userService.findByEmail(email);

        if (user == null) {
            model.addAttribute("error", "Email not registered");
            return "forgotPassword";
        }

        String otp = String.valueOf((int) (Math.random() * 900000) + 100000);

        user.setResetToken(otp);
        userService.updateUser(user);

        emailService.sendEmail(
                email,
                "Password Reset OTP",
                "Your OTP for password reset is: " + otp
        );

        model.addAttribute("email", email);
        model.addAttribute("msg", "OTP sent to your email");

        return "verifyOtp";
    }

    @PostMapping("/verifyOtp")
    public String verifyOtp(@RequestParam("email") String email,
                            @RequestParam("otp") String otp,
                            Model model) {

        User user = userService.findByEmail(email);

        if (user != null && otp.equals(user.getResetToken())) {
            model.addAttribute("email", email);
            return "resetPassword";
        }

        model.addAttribute("email", email);
        model.addAttribute("error", "Invalid OTP");

        return "verifyOtp";
    }

    @GetMapping("/resetPassword")
    public String resetPasswordPage() {
        return "resetPassword";
    }

    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 Model model) {

        User user = userService.findByEmail(email);

        if (user != null) {
            user.setPassword(password);
            user.setResetToken(null);
            userService.updateUser(user);

            model.addAttribute("success", "Password reset successfully. Please login.");
        }

        return "login";
    }
}