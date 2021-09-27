package quangnt.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import quangnt.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class ProductDAO {

    public List<ProductDTO> getListAllProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblProduct";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    float productPrice = Float.parseFloat(rs.getString("productPrice"));
                    int productQuantity = Integer.parseInt(rs.getString("productQuantity"));
                    String productImage = rs.getString("image");
                    String category = rs.getString("categoryID");
                    String status = rs.getString("statusID");
                    String createDate = rs.getString("createDate");
                    String description = rs.getString("description");
                    list.add(new ProductDTO(productID, productName, productPrice, productQuantity, productImage, getCategoryName(category), status, createDate, description));
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
        return list;
    }

    public List<ProductDTO> getListActiveProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select productID,productName,productPrice,productQuantity,image,categoryID,statusID,description from tblProduct";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    float productPrice = Float.parseFloat(rs.getString("productPrice"));
                    int productQuantity = Integer.parseInt(rs.getString("productQuantity"));
                    String productImage = rs.getString("image");
                    String category = rs.getString("categoryID");
                    String status = rs.getString("statusID");
                    String description = rs.getString("description");
                    if ("A".equals(status)) {
                        list.add(new ProductDTO(productID, productName, productPrice, productQuantity, productImage, getCategoryName(category), status, "", description));
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
        return list;
    }

    public List<ProductDTO> getListProduct(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select productName,productPrice,productQuantity,image,categoryID,statusID,description from tblProduct "
                        + "where productName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productName = rs.getString("productName");
                    float productPrice = Float.parseFloat(rs.getString("productPrice"));
                    int productQuantity = Integer.parseInt(rs.getString("productQuantity"));
                    String productImage = rs.getString("image");
                    String status = rs.getString("statusID");
                    String category = rs.getString("categoryID");
                    String description = rs.getString("description");
                    if ("A".equals(status)) {
                        list.add(new ProductDTO("", productName, productPrice, productQuantity, productImage, getCategoryName(category), status, "", description));
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
        return list;
    }

    public boolean addNewProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Insert into tblProduct(productID,productName,productPrice,productQuantity,image,categoryID,statusID,createDate,description) "
                        + "values(?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getProductID());
                stm.setString(2, product.getProductName());
                stm.setString(3, Double.toString(product.getProductPrice()));
                stm.setString(4, Integer.toString(product.getProductQuantity()));
                stm.setString(5, product.getProductImage());
                stm.setString(6, getCategoryID(product.getCategory()));
                stm.setString(7, product.getCreateDate());
                if ("available".equals(product.getStatus())) {
                    stm.setString(7, "A");
                }
                if ("notAvailable".equals(product.getStatus())) {
                    stm.setString(7, "NA");
                }
                stm.setString(8, product.getCreateDate());
                stm.setString(9, product.getDescription());
                check = stm.executeUpdate() > 0;
            }

//        } catch (Exception e) {
//            e.printStackTrace();
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

    public boolean deteleProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "Update tblProduct "
                    + "set statusID='NA' "
                    + "where productID = ? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, productID);
            check = stm.executeUpdate() > 0;
        } catch (Exception e) {
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

    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "update tblProduct "
                        + " set productName=?, productPrice=?, productQuantity=?, image=?, categoryID=?, statusID=?, description=?"
                        + " where productID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getProductName());
                stm.setString(2, Double.toString(product.getProductPrice()));
                stm.setString(3, Integer.toString(product.getProductQuantity()));
                stm.setString(4, product.getProductImage());
                stm.setString(5, getCategoryID(product.getCategory()));
                if ("available".equals(product.getStatus())) {
                    stm.setString(6, "A");
                } else if ("notAvailable".equals(product.getStatus())) {
                    stm.setString(6, "NA");
                }
                stm.setString(7, product.getDescription());
                stm.setString(8, product.getProductID());
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

    public boolean updateQuantity(String productID, int productQuantity) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblProduct "
                        + "set productQuantity=?, statusID=? "
                        + "where productID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, Integer.toString(productQuantity));
                String status = "A";
                if (productQuantity == 0) {
                    status = "NA";
                }
                stm.setString(2, status);
                stm.setString(3, productID);
                check = stm.executeUpdate() > 0;
            }

        } catch (Exception e) {
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

    public String getCategoryName(String categoryID) throws SQLException {
        String result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select name from tblCategory "
                        + " where categoryID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, categoryID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getString("name");
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
        return result;
    }

    public String getCategoryID(String categoryName) throws SQLException {
        String result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select categoryID from tblCategory "
                        + " where name=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, categoryName);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getString("categoryID");
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
        return result;
    }

    public List<Category> getCategory() throws SQLException {
        List<Category> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblCategory";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("categoryID");
                    String name = rs.getString("name");
                    list.add(new Category(id, name));
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
        return list;
    }
}
