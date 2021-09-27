package quangnt.order;

/**
 *
 * @author ACER
 */
public class Order {

    private String orderID;
    private String email;
    private String userID;
    private String address;
    private String phone;
    private float totalMoney;
    private String orderDate;
    private String statusID;
    public String paymentStatus;

    public Order() {
    }

    public Order(String orderID, String email, String userID, String address, String phone, float totalMoney, String orderDate, String statusID, String paymentStatus) {
        this.orderID = orderID;
        this.email = email;
        this.userID = userID;
        this.address = address;
        this.phone = phone;
        this.totalMoney = totalMoney;
        this.orderDate = orderDate;
        this.statusID = statusID;
        this.paymentStatus = paymentStatus;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

}
