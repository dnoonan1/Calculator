<%-- 
    Document   : results
    Created on : Sep 2, 2015, 9:39:09 PM
    Author     : Dan Noonan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Results :: Geometric Calculator</title>
        <link href="css/styles.css" rel="stylesheet">
    </head>
    <body>
        <h1>Geometric Calculator</h1>
        <h2>Area of a Rectangle</h2>
        <div id="results">
            Area =
            <%=request.getAttribute("area")%>
        </div>
    </body>
</html>