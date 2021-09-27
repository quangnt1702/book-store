<%-- 
    Document   : error
    Created on : Jun 21, 2021, 4:42:03 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <%
            String message = (String) session.getAttribute("ERROR_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <h1><%=message%></h1>
    </body>
</html>
