package com.austinmiljour.gamenexusmarket.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
	
	@Id // to specify the primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment for the ID in MySQL
	private Long id;
	
	@NotEmpty(message="Fist name is required.")
	@Size(min=2, message="Fist name must be at least 2 characters long.")
	private String firstName;
	
	@NotEmpty(message="Last name is required.")
	@Size(min=2, message="Last name must be at least 2 characters long.")
	private String lastName;
	
	@NotEmpty(message="Email is required.")
	@Email(message="Must be a valid email.")
	private String email;
	
	@Column(name = "is_admin")
    private boolean admin;
	
	@NotEmpty(message="Password is required.")
	@Size(min=3, max=128, message="Password must be at least 8 characters long.")
	private String password;
	
	@Transient // field that is not stored in the database
    @NotEmpty(message="Confirm Password is required!")
    @Size(min=8, max=128, message="Confirm Password must be at least 8 characters long.")
    private String confirm;
	
	// this is to link the tables
//	@OneToMany(mappedBy="user")
//	private List<Book> books;

	// This will not be updated after it is created
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	@PrePersist // execute when a record is created
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate // execute when a record is updated
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public User() {}
	
//	============ Getters and Setters ============	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
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