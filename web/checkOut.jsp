<%-- 
    Document   : checkOut.jsp
    Created on : Jul 6, 2021, 12:01:29 AM
    Author     : ACER
--%>

<%@page import="quangnt.google.GooglePojo"%>
<%@page import="quangnt.order.OrderError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/input.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <title>Check out Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="MainController?action=Home" id="active">Home</a>
                <a href="viewCart.jsp">View Cart</a>
                <a href="MainController?action=Logout">Logout</a>
            </div>
            <div class="banner">
                <p>Check Out !!!<p>
            </div>
            <div class="content">
                <%
                    OrderError error = (OrderError) request.getAttribute("CHECK_OUT_ERROR");
                    if (error == null) {
                        error = new OrderError();
                    }
                    GooglePojo userGG = (GooglePojo) session.getAttribute("GG_USER");
                    String email = "";
                    if (userGG != null) {
                        email = userGG.getEmail();
                    }
                %>
                <form action="MainController">
                    Order ID<input type="text" name="orderID" required=""></br>
                    <%=error.getOrderIDError()%></br>
                    Email <input type="email" name="email" required="" value="<%=email%>"></br></br>
                    Address <input type="text" name="address" required=""></br></br>
                    Phone <input type="text" name="phone" required=""></br>
                    <%=error.getPhoneError()%></br>
                    Total money <input type="number" name="totalMoney"  value="<%=request.getParameter("totalMoney")%>" readonly=""/><br>
                    <input class="button_checkOut" type="submit" name="action" value="Check Out"/>               
                </form>
            </div>
        </div>
    </body>
</html>
