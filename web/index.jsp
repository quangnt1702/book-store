<%-- 
    Document   : index
    Created on : Jun 21, 2021, 11:15:00 AM
    Author     : ACER
--%>


<%@page import="java.util.List"%>
<%@page import="quangnt.product.ProductDTO"%>
<%@page import="quangnt.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="MainController?action=Home" id="active">Home</a>
                <a href="login.html">Login</a>
                <div class="search_container">
                    <form action="MainController">
                        <input type="text" placeholder="Search..." name="search" />
                        <input type="submit" name="action" value="Search"/>
                    </form>
                </div>
            </div>
            <div class="banner">
                <p>Welcome to my website !!!</p>
            </div>
            <div class="content">
                <%
                    List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
                    if (list != null) {
                        if (!list.isEmpty()) {
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Category</th>
                            <th>Price</th> 
                            <th>Available</th>
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
                            <td><img src="<%=product.getProductImage()%>" alt="Image"></td>
                            <td><%=product.getCategory()%></td>
                            <td><%=product.getProductPrice()%></td>
                            <td><%=product.getProductQuantity()%></td>
                            <td><%=product.getDescription()%></td>
                            <td><input type="number" min="1" name="quantity" value="1"/></td>
                            <td><input type="submit"  name="action" value="Add into cart"/></td>
                        </tr>
                    </form>
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

