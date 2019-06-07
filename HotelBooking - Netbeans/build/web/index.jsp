<%-- 
    Document   : index.jsp
    Created on : Jun 7, 2019, 5:41:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
      String redirectURL = "home";
      response.sendRedirect(redirectURL);
        %>
    </body>
</html>
