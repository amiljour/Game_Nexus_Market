package com.austinmiljour.gamenexusmarket.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.annotation.SessionScope;

import com.austinmiljour.gamenexusmarket.models.CartItem;
import com.austinmiljour.gamenexusmarket.models.Item;

@Service
@SessionScope
public class CartService {
	
	private final ItemService itemService;

    public CartService(ItemService itemService) {
        this.itemService = itemService;
    }
	
	private Map<Long, CartItem> items = new HashMap<>();
	
	//Add Item to Cart
	public boolean addItem(Item item) {
	    CartItem cartItem = items.get(item.getId());

	    if (cartItem == null) {
	        if (item.getInventory() > 0) {
	            cartItem = new CartItem(item, 1);  // Start with one item
	            items.put(item.getId(), cartItem);
	            return true;
	        }
	    } else {
	        if (cartItem.getQuantity() < item.getInventory()) {
	            cartItem.setQuantity(cartItem.getQuantity() + 1);
	            return true;
	        }
	    }
	    return false;
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
	
	// Cart Total Price
	public double getTotal() {
	    double total = 0.0;
	    for (CartItem cartItem : items.values()) {
	        total += cartItem.getTotalPrice();
	    }
	    return Math.round(total * 100.0) / 100.0;
	}
	
	@Transactional
    public boolean checkout() {
        boolean allUpdated = true;
        for (CartItem cartItem : items.values()) {
            boolean result = itemService.decrementItemInventory(cartItem.getItem().getId(), cartItem.getQuantity());
            if (!result) {
                allUpdated = false;
                break;
            }
        }

        return allUpdated;
    }
	
	public Map<Long, CartItem> getItems(){
		return items;
	}
	
	public int getItemCount() {
		return items.values().stream().mapToInt(CartItem::getQuantity).sum();
	}

}
