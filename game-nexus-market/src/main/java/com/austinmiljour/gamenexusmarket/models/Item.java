package com.austinmiljour.gamenexusmarket.models;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="items")
public class Item {
	
	@Id // to specify the primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment for the ID in MySQL
	private Long id;

	@NotNull
	@Size(min = 2, message = "Item name must be at least 2 characters long.")
	private String name;
	
	@NotNull
	@Size(min = 2, max = 255, message = "Image link must be at least 3 characters long but must be at shorter than 255 characters.")
	private String imageLink;
	
	@NotNull(message = "Price must be filled in.")
	@Min(value = 1, message = "Price must be greater than 0.")
	private Double price;
	
	@NotNull(message = "Inventory must be filled in.")
	private Integer inventory;
	
	@NotNull
	@Size(min = 1, max = 255, message = "Description must be at least 10 characters long.")
	private String description;
	
	// this is to link the tables
	@ManyToOne(fetch =  FetchType.EAGER)
	@JoinColumn(name="category_id") // this is the foreign key in MySQL
	private Category category;
	
	@NotNull(message = "Discount must be filled in.")
    @Min(value = 0, message = "Discount cannot be less than 0.")
    @Max(value = 1, message = "Discount cannot be more than 1.")
    private Double discount;
	
	// This will not be updated after it is created
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @PrePersist // execute when a record is created
    protected void onCreate(){
        this.createdAt = new Date();
    }
    
    @PreUpdate // execute when a record is updated
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
   
	public Item() {}
	
	public Double getDiscountedPrice() {
        if (discount != null && discount > 0) {
            double discountedPrice = price * (1 - discount);
            // Using BigDecimal for precise rounding
            BigDecimal bd = BigDecimal.valueOf(discountedPrice);
            bd = bd.setScale(2, RoundingMode.HALF_UP); // Round to 2 decimal places
            return bd.doubleValue();
        } else {
            return price;
        }
    }

	//	============ Getters and Setters ============

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageLink() {
		return imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getInventory() {
		return inventory;
	}

	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	
}