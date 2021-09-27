package quangnt.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import quangnt.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class UserDAO {

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select fullName, phoneNumber, address, roleID, statusID, createDate from tblUsers where userID=? and password=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String phoneNumber = rs.getString("phoneNumber");
                    String address = rs.getString("address");
                    String roleID = rs.getString("roleID");
                    String status = rs.getString("statusID");
                    String createDate = rs.getString("createDate");
                    if ("A".equals(status)) {
                        user = new UserDTO(userID, fullName, phoneNumber, address, roleID, "", status, createDate);
                    }
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
        return user;
    }

    public boolean insertUserGG(UserDTO userGG) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblUsers(userID,fullName,roleID,statusID,password) values(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userGG.getUserID());
                stm.setString(2, userGG.getFullName());
                stm.setString(3, userGG.getRoleID());
                stm.setString(4, userGG.getStatus());
                stm.setString(5, userGG.getPassword());
                check = stm.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(UserDTO userGG) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select userID from tblUsers where userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userGG.getUserID());
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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
