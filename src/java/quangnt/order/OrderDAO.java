package quangnt.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import quangnt.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class OrderDAO {

    public boolean checkOut(Order order) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Insert into tblOrder(orderID,userID,email,address,phoneNumber,totalMoney,orderDate,statusID,paymentStatus) "
                        + " values(?,?,?,?,?,?,?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, order.getOrderID());
                stm.setString(2, order.getUserID());
                stm.setString(3, order.getEmail());
                stm.setString(4, order.getAddress());
                stm.setString(5, order.getPhone());
                stm.setString(6, Double.toString(order.getTotalMoney()));
                stm.setString(7, order.getOrderDate());
                stm.setString(8, order.getStatusID());
                stm.setString(9, order.getPaymentStatus());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertOrderDetail(OrderDetail orderDetail) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Insert into tblOrderDetail(detailOrderID,orderID,productID,quantity,price,statusID) "
                        + " values(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, orderDetail.getOrderDetailID());
                stm.setString(2, orderDetail.getOrderID());
                stm.setString(3, orderDetail.getProductID());
                stm.setString(4, Integer.toString(orderDetail.getQuantity()));
                stm.setString(5, Double.toString(orderDetail.getPrice()));
                stm.setString(6, orderDetail.getStatusID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String orderID) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select orderID from tblOrder where orderID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
