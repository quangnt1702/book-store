<%-- 
    Document   : editProduct
    Created on : Jun 29, 2021, 3:19:41 PM
    Author     : ACER
--%>


<%@page import="quangnt.product.Category"%>
<%@page import="java.util.List"%>
<%@page import="quangnt.product.ProductError"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/input.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <title>Edit Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="admin.jsp" >Home</a>
                <a href="MainController?action=Home" id="active">Manage Product</a>
                <a href="MainController?action=Logout">Logout</a>             
            </div>
            <div class="banner">
                <p>Edit product!!!</p>
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
                    Product ID:  <input type="text" name="productID"  required="" value="<%=request.getParameter("productID")%>" readonly=""></br></br>
                    Product Name: <input type="text" name="productName"  required="" value="<%=request.getParameter("productName")%>"></br>
                    <%=productError.getProductNameError()%></br>
                    Product Price:<input type="number" name="productPrice" required="" value="<%=request.getParameter("productPrice")%>"></br>
                    <%=productError.getProductPriceError()%></br>
                    Product Quantity: <input type="number" name="productQuantity" min="1" value="<%=request.getParameter("productQuantity")%>"></br></br>
                    Product Image:  <input type="text" name="productImage"  required="" value="<%=request.getParameter("productImage")%>"></br></br>
                    Product Category:
                    <select class="status" name="productCategory">
                        <option value="<%=request.getParameter("productCategory")%>" selected=""><%=request.getParameter("productCategory")%></option>
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
                    Product Description:  
                    <%
                        String description = request.getParameter("description");
                        if (description == null) {
                            description = "";
                        }
                    %>
                    <input type="text" name="productDescription" placeholder="Product Description" required="" value="<%=description%>"></br>
                    <%=productError.getProductDescriptionError()%></br>
                    Status:
                    <select class="status" name="status" >  

                        <% if ("A".equals(request.getParameter("status"))) {
                        %>
                        <option value="available" selected="">Available</option>
                        <option value="notAvailable">Non-Available</option>  
                        <%
                        } else if ("NA".equals(request.getParameter("status"))) {
                        %>
                        <option value="available">Available</option>
                        <option value="notAvailable" selected="">Non-Available</option>  
                        <%
                        } else {
                        %>
                        <option value="available">Available</option>
                        <option value="notAvailable">Non-Available</option> 
                        <%
                            }
                        %>
                    </select></br>
                    <input type="hidden" name="createDate" value="<%=request.getParameter("createDate")%>">          
                    <input class="button_checkOut" type="submit" name="action" value="Confirm Edit">
                </form>
            </div>
        </div>
    </body>
</html>
