<%-- 
    Document   : addNew
    Created on : Jun 23, 2021, 8:29:58 PM
    Author     : ACER
--%>

<%@page import="quangnt.product.Category"%>
<%@page import="java.util.List"%>
<%@page import="quangnt.product.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <link href="css/input.css" rel="stylesheet" type="text/css"/>
        <title>Add new product Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="admin.jsp" >Home</a>
                <a href="MainController?action=Home" id="active">Manage Product</a>
                <a href="MainController?action=Logout">Logout</a>             
            </div>
            <div class="banner">
                <p>Add new a product!!!</p>
            </div>
            <div class="content">
                <%
                    ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
                    if (productError == null) {
                        productError = new ProductError();
                    }
                    List<Category> list = (List<Category>) request.getAttribute("LIST_CATE");
                %>
                <form action="MainController">
                    <p>Product ID:</p>
                    <input  type="text" name="productID" placeholder="Product ID" required=""></br>
                    <%=productError.getProductIDError()%></br>
                    <p>Product Name:</p>
                    <input type="text" name="productName" placeholder="Product Name" required=""></br>
                    <%=productError.getProductNameError()%></br>
                    <p>Product Price:</p>
                    <input  type="number" name="productPrice" placeholder="Product Price" required=""></br>
                    <%=productError.getProductPriceError()%></br>
                    <p>Product Quantity:</p>
                    <input type="number" name="productQuantity"  min="1" value="1" placeholder="Product Quantity"></br></br>
                    <p>Product Image:</p>
                    <input type="text" name="productImage" placeholder="Product Image"></br></br>
                    <p>Product Category:</p>
                    <select class="status" name="productCategory">
                        <%
                            if (list != null) {
                                if (!list.isEmpty()) {
                                    for (Category category : list) {

                        %>
                        <option value="<%=category.getName()%>"><%=category.getName()%></option>
                        <%                                    }
                                }
                            }
                        %>
                    </select></br></br>
                    <p>Product Description:</p>
                    <input type="text" name="productDescription" placeholder="Product Description" required=""></br>
                    <%=productError.getProductDescriptionError()%></br>
                    <p>Status:</p>
                    <select class="status" name="status">
                        <option value="available">Available</option>
                        <option value="non-available">Non-Available</option>
                    </select></br>
                    <input class="button_checkOut" type="submit" name="action" value="Confirm Add">
                </form>
            </div>
        </div>
    </body>
</html>
