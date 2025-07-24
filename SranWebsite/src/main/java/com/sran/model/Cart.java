package com.sran.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    // Unique key: productId-size (e.g., "5-M")
    private Map<String, CartItem> items;

    public Cart() {
        this.items = new HashMap<>();
    }

    public void addCartItem(CartItem item) {
        int productId = item.getProduct().getProductId();
        String size = item.getSize().name(); // If enum Size

        String key = productId + "-" + size;

        if (items.containsKey(key)) {
            CartItem existingItem = items.get(key);
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
        } else {
            items.put(key, item);
        }

        System.out.println("Added: " + key + ", Quantity: " + item.getQuantity());
    }

    public void updateCartItem(int productId, String size, int quantity) {
        String key = productId + "-" + size;

        if (items.containsKey(key)) {
            if (quantity <= 0) {
                items.remove(key);
            } else {
                items.get(key).setQuantity(quantity);
            }
        }
    }

    public void removeCartItem(int productId, String size) {
        String key = productId + "-" + size;
        items.remove(key);
    }

    public Map<String, CartItem> getItems() {
        return items;
    }
    public double getTotalPrice() {
        return items.values().stream()
                    .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                    .sum();
    }


    public void clear() {
        items.clear();
    }
}
