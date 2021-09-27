package quangnt.shopping;

import java.util.HashMap;
import java.util.Map;
import quangnt.product.ProductDTO;

/**
 *
 * @author ACER
 */
public class Cart {

    private Map<String, ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public void add(ProductDTO product) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(product.getProductID())) {
            int currentQuantity = this.cart.get(product.getProductID()).getProductQuantity();
            product.setProductQuantity(currentQuantity + product.getProductQuantity());
        }
        cart.put(product.getProductID(), product);
    }

    public void delete(String productID) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(productID)) {
            this.cart.remove(productID);
        }
    }

    public void update(ProductDTO product) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(product.getProductID())) {
            this.cart.replace(product.getProductID(), product);
        }
    }
}
