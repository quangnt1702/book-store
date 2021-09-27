<%-- 
    Document   : search
    Created on : Jun 22, 2021, 10:18:22 PM
    Author     : ACER
--%>

<%@page import="quangnt.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="quangnt.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <title>Search Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">

                <%
                    if (session.getAttribute("LOGIN_USER") != null) {
                %>
                <a href="MainController?action=Home" id="active">Home</a>
                <a href="viewCart.jsp">View Cart</a>
                <a href="MainController?action=Logout">Logout</a>
                <%
                } else {
                %>
                <a href="MainController?action=Home" id="active">Home</a>
                <a href="login.html">Login</a>
                <%
                    }
                %>
                <div class="search_container">
                    <form action="MainController" >
                        <input type="text" placeholder="Search.." name="search" value="<%=request.getParameter("search")%>"/>
                        <input type="submit" name="action" value="Search"/>
                    </form>
                </div>
            </div>
            <div class="banner">
                <p>Your search result!!!</p>
            </div>
            <div class="content">
                <%
                    List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("LIST_SEARCH");
                    if (list != null) {
                        if (!list.isEmpty()) {
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Description</th>
                            <th>Quantity</th>
                            <th>Buy</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (ProductDTO product : list) {
                        %>
                    <form action="MainController">
                        <tr>
                            <td><%=count++%></td>
                            <td><%=product.getProductName()%></td>
                            <td><img src="<%=product.getProductImage()%>" alt=""></td>
                            <td><%=product.getProductPrice()%></td>
                            <td><%=product.getProductQuantity()%></td>
                            <td><%=product.getDescription()%></td>
                            <td><input type="number" min="1" name="productQuantity" value="1"/></td>
                                <%
                                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                    if (loginUser == null) {
                                %>
                            <td><input type="submit"  name="action" value="Add into cart"/></td>
                                <%
                                } else {
                                %>
                            <td>
                                <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                                <input type="hidden" name="productName" value="<%=product.getProductName()%>"/>
                                <input type="hidden" name="productImage" value="<%=product.getProductImage()%>"/>
                                <input type="hidden" name="productQuantityAvailable" value="<%=product.getProductQuantity()%>"/>
                                <input type="hidden" name="productPrice" value="<%=product.getProductPrice()%>"/>
                                <input type="hidden" name="productCategory" value="<%=product.getCategory()%>"/>
                                <input type="submit"  name="action" value="Add to cart"/>
                            </td>
                            <%
                                }
                            %>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>  
                <%
                    }
                } else {
                %>
                <h1><%=request.getAttribute("NOT_FOUND")%></h1>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
