package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;

	    private String name;
	    private double price;
	    private int quantity;

	    private String category;
	    private String description;
	    private String status;
	    

	    private String img1;
	    private String img2;
	    private String img3;
	    
	    private String brand;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public double getPrice() {
			return price;
		}

		public void setPrice(double price) {
			this.price = price;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getImg1() {
			return img1;
		}

		public void setImg1(String img1) {
			this.img1 = img1;
		}

		public String getImg2() {
			return img2;
		}

		public void setImg2(String img2) {
			this.img2 = img2;
		}

		public String getImg3() {
			return img3;
		}

		public void setImg3(String img3) {
			this.img3 = img3;
		}

		public String getBrand() {
			return brand;
		}

		public void setBrand(String brand) {
			this.brand = brand;
		}

		

		
	    
	    
	    
	    
	    
}
