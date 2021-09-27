<%-- 
    Document   : manageProduct
    Created on : Jun 21, 2021, 4:20:29 PM
    Author     : ACER
--%>

<%@page import="java.util.List"%>
<%@page import="quangnt.user.UserDTO"%>
<%@page import="quangnt.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <title>Management Product Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="admin.jsp">Home</a>
                <a href="MainController?action=Home" id="active">Manage Product</a>
                <a href="MainController?action=Logout">Logout</a>             
            </div>
            <div class="banner">
                <p>Welcome Admin : <%=((UserDTO) session.getAttribute("LOGIN_USER")).getFullName()%>  !!!</p>
            </div>
            <div class="addNew">
                <a href="MainController?action=AddProduct">Add a new Product</a>
            </div>
            <div class="content">
                <%
                    List<ProductDTO> listAll = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
                    if (listAll != null) {
                        if (!listAll.isEmpty()) {
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Description</th>
                            <th>Edit</th>
                            <th>Delete</th>
                            <th>Status</th>
                            <th>Create Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (ProductDTO product : listAll) {
                        %>

                        <tr>
                            <td><%=count++%></td>
                            <td><%=product.getProductName()%></td>
                            <td><img src="<%=product.getProductImage()%>" alt="Image"></td>
                            <td><%=product.getCategory()%></td>
                            <td><%=product.getProductPrice()%></td>
                            <td><%=product.getProductQuantity()%></td>
                            <td><%=product.getDescription()%></td>
                            <td>
                                <form action="MainController">
                                    <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                                    <input type="hidden" name="productName" value="<%=product.getProductName()%>"/>
                                    <input type="hidden" name="productImage" value="<%=product.getProductImage()%>"/>
                                    <input type="hidden" name="productQuantity" value="<%=product.getProductQuantity()%>"/>
                                    <input type="hidden" name="productPrice" value="<%=product.getProductPrice()%>"/>
                                    <input type="hidden" name="status" value="<%=product.getStatus()%>"/>
                                    <input type="hidden" name="productCategory" value="<%=product.getCategory()%>"/>
                                    <input type="hidden" name="createDate" value="<%=product.getCreateDate()%>"/>
                                    <input type="hidden" name="description" value="<%=product.getDescription()%>"/>
                                    <input type="submit"  name="action" value="Edit"/>
                                </form>
                            </td>
                            <td>
                                <form action="MainController">
                                    <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                                    <input type="submit"  name="action" value="Delete"/>
                                </form>

                            </td>
                            <td><%=product.getStatus()%></td>
                            <td><%=product.getCreateDate()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>
