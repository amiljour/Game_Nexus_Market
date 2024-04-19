package com.austinmiljour.gamenexusmarket.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.austinmiljour.gamenexusmarket.models.CartItem;
import com.austinmiljour.gamenexusmarket.models.Item;

@Service
@SessionScope
public class CartService {
	
	private Map<Long, CartItem> items = new HashMap<>();
	
	//Add Item to Cart
	public void addItem(Item item) {
		CartItem cartItem = items.get(item.getId());
		if (cartItem == null) {
			cartItem = new CartItem(item, 1);
			items.put(item.getId(), cartItem);
		} else {
			cartItem.setQuantity(cartItem.getQuantity() + 1);
		}
	}
	
	//Remove Item from Cart
	public void removeItem(Long itemId) {
		CartItem cartItem = items.get(itemId);
		if (cartItem != null) {
			if (cartItem.getQuantity() > 1) {
				cartItem.setQuantity(cartItem.getQuantity() -1 );
			}else {
				items.remove(itemId);
			}
		}
	}
	
	//Clear Cart
	public void clearCart() {
		items.clear();
	}
	
	public Map<Long, CartItem> getItems(){
		return items;
	}
	
	public int getItemCount() {
		return items.values().stream().mapToInt(CartItem::getQuantity).sum();
	}

}
