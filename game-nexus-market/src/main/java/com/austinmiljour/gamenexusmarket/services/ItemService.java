package com.austinmiljour.gamenexusmarket.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.austinmiljour.gamenexusmarket.models.Item;
import com.austinmiljour.gamenexusmarket.repositories.ItemRepository;

@Service
public class ItemService {
	
	private final ItemRepository itemRepo;

	public ItemService(ItemRepository itemRepo) {
		this.itemRepo = itemRepo;
	}

	// Find All method
	public List<Item> allItemes() {
		return itemRepo.findAll();
	}

	// Create
	public Item createItem(Item newItem) {
		return itemRepo.save(newItem);
	}

	// Find One
	public Item oneItem(Long id) {
		Optional<Item> optionalItem = itemRepo.findById(id);
		if (optionalItem.isPresent()) {
			return optionalItem.get();
		} else {
			return null;
		}
	}
	
	@Transactional
    public boolean decrementItemInventory(Long itemId, int quantity) {
        Item item = itemRepo.findById(itemId).orElse(null);
        if (item != null && item.getInventory() >= quantity) {
            item.setInventory(item.getInventory() - quantity);
            itemRepo.save(item);
            return true;
        }
        return false;
    }

	// Update
		public Item updateItem(Item oneItem) {
			return itemRepo.save(oneItem);
		}

	// Delete
	public void deleteItemById(Long id) {
		itemRepo.deleteById(id);
	}

}
