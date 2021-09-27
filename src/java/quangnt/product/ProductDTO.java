package quangnt.product;

/**
 *
 * @author ACER
 */
public class ProductDTO {

    private String productID;
    private String productName;
    private float productPrice;
    private int productQuantity;
    private String productImage;
    private String category;
    private String status;
    private String createDate;
    private String description;
    private int productQuantityAvailable;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String productName, float productPrice, int productQuantity, String productImage, String category, String status, String createDate, String description) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.productImage = productImage;
        this.category = category;
        this.status = status;
        this.createDate = createDate;
        this.description = description;
    }

    public int getProductQuantityAvailable() {
        return productQuantityAvailable;
    }

    public void setProductQuantityAvailable(int productQuantityAvailable) {
        this.productQuantityAvailable = productQuantityAvailable;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(float productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}
