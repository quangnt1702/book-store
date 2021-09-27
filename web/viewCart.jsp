<%-- 
    Document   : viewCart
    Created on : Jul 4, 2021, 9:15:06 PM
    Author     : ACER
--%>

<%@page import="quangnt.shopping.Cart"%>
<%@page import="quangnt.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <title>Your Cart Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="MainController?action=Home">Home</a>
                <a href="MainController?action=ViewCart" id="active">View Cart</a>
                <a href="MainController?action=Logout">Logout</a>
            </div>
            <div class="banner">
                <p>Welcome User !!!</p>
            </div>
            <%
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
            %>
            <h1 class="message">Not have any products!!!</h1>
            <%
            } else {
            %>
            <%
                String message = (String) request.getAttribute("SHOPPING_MESSAGE");
                if (message == null) {
                    message = "";
                }
            %>
            <h1 class="message"><%=message%></h1></br>
            <div class="content">               
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th>Total</th>
                            <th>Update</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            int count = 1;
                            double total = 0;
                            for (ProductDTO product : cart.getCart().values()) {
                                total += product.getProductPrice() * product.getProductQuantity();
                        %>                             
                    <form action="MainController">
                        <tr>
                            <td><%=count++%></td>
                            <td><%=product.getProductName()%></td>
                            <td>                               
                                <input type="number" name="productQuantity" value="<%=product.getProductQuantity()%>" required="" min="1"/>
                            </td>
                            <td><%=product.getProductPrice()%></td>
                            <td><%=product.getProductPrice() * product.getProductQuantity()%></td>
                            <td>
                                <input type="hidden" name="productQuantityAvailable" value="<%=product.getProductQuantityAvailable()%>"/>
                                <input type="submit" name="action" value="Update"/>
                            </td>
                            <td>
                                <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                                <input type="submit" name="action" value="Remove"/>
                            </td>
                        </tr>
                    </form>                               
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <h1>Total: <%=total%></h1>
            <div>
                <form action="MainController">
                    <input type="hidden" name="totalMoney" value="<%=total%>" min="1"/>
                    <input class="button" type="submit" name="action" value="Go To Check Out"/>
                </form>
            </div>       
            <%
                }
            %>
            <div class="shopping">
                <a  href="MainController?action=Home">Shopping more</a>
            </div>
        </div>
    </body>
</html>
