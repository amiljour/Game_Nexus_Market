package com.austinmiljour.gamenexusmarket.models;

public class CartItem {
	
    private Item item;
    private int quantity;

    public CartItem(Item item, int quantity) {
        this.item = item;
        this.quantity = quantity;
    }
    
    public CartItem() {}
    
    // Getters and setters
	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
	    double price = item.getDiscountedPrice() * quantity;
	    return Math.round(price * 100.0) / 100.0;
	}
}