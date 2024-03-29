package com.austinmiljour.gamenexusmarket.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="categories")
public class Category {
	
	@Id // to specify the primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment for the ID in MySQL
	private Long id;

	@NotNull
	@Size(min = 2, message = "Category name must be at least 2 character long.")
	private String name;
	
	// Link the table
	@OneToMany(mappedBy="category")
	private List<Item> items;
	
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
   
	public Category() {}

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

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
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
	
}