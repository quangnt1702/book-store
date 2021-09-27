<%-- 
    Document   : admin
    Created on : Jun 21, 2021, 3:54:40 PM
    Author     : ACER
--%>


<%@page import="quangnt.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <title>Admin Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="admin.jsp" id="active">Home</a>
                <a href="MainController?action=Home">Manage Product</a>
                <a href="MainController?action=Logout">Logout</a>
            </div>
            <div class="banner">
                <p>Welcome Admin : <%=((UserDTO) session.getAttribute("LOGIN_USER")).getFullName()%> !!!</p>
            </div>
            <div>
                <h1>© Copyright QUANGNTSE150500</h1>
                <h1>© Please do not copy and reup</h1>
                <h1>© Please contact: quangnt1702@gmail.com if you find any problems!!!</h1>
                <h1>© Facebook: <a href="https://www.facebook.com/quangnt1702" target="_blank">facebook.com/quangnt1702</a></h1>
            </div>
        </div>
    </body>
</html>
