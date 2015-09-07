<%-- 
    Document   : calculator
    Created on : Sep 2, 2015, 9:22:41 PM
    Author     : Dan Noonan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Geometric Calculator</title>
        <link href="css/styles.css" rel="stylesheet">
    </head>
    <body>
        <h1>Geometric Calculator</h1>
        <h2>Area of a Rectangle</h2>
        <form id="rectangle" action="results" method="POST">
            <label for="length">Length</label>
            <input type="text" id="length" name="length" placeholder="length"
                   autofocus>
            <label for="width">Width</label>
            <input type="text" id="width" name="width" placeholder = "width">
            <input type="submit" value="Calculate">
        </form>
    </body>
</html>