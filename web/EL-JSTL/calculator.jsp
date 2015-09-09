<%-- 
    Document   : calculator
    Created on : Sep 2, 2015, 9:22:41 PM
    Author     : Dan Noonan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>Geometric Calculator</title>
        <link href="css/styles.css" rel="stylesheet">
    </head>
    
    <body>
        
        <header>
            <h1>Geometric Calculator</h1>    
        </header>
        
        <nav>
            <ul>
                <li><a href="#rectangle">Rectangle</a></li>
                <li><a href="#circle">Circle</a></li>
                <li><a href="#triangle">Triangle</a></li>
            </ul>
        </nav>
        
        <h2 id="rectangle">Area of a Rectangle</h2>
        <svg width="300" height="200">
            <rect x="60" y="50" width="180" height="100" />
            <text class="var" x="30" y="100">&#x2113;</text>
            <text class="var" x="140" y="40">w</text>
        </svg>
        <form id="form-rectangle" name="form-rectangle"
              action="results" method="POST">
            <input type="hidden" name="shape" value="rectangle">
            <label for="length">Length</label>
            <input type="text" id="length" name="length" placeholder="Enter length..."
                   required>
            <label for="width">Width</label>
            <input type="text" id="width" name="width" placeholder = "Enter width..."
                   required>
            <input type="submit" value="Calculate">
        </form>
        <div id="results-rectangle" class="results"> 
            <c:set var="area" value="${rectangle-area}" />
            <c:if test="${area == 0}">
                <c:set var="rectangle-area" value="?"/>
            </c:if>
            Area = ${rectangle-area}
        </div>
        
        <h2 id="circle">Area of a Circle</h2>
        <svg width="200" height="200">
            <circle cx="100" cy="100" r="75" />
            <circle class="filled" cx="100" cy="100" r="3" />
            <line x1="100" y1="100" x2="175" y2="100" />
            <text class="var" x="130" y="90">r</text>
        </svg>
        <form id="form-circle" name="form-circle"
              action="results" method="POST">
            <input type="hidden" name="shape" value="circle" required>
            <label for="radius">Radius</label>
            <input type="text" id="radius" name="radius" placeholder="Enter radius...">
            <input type="submit" value="Calculate">
        </form>
        <div id="results-circle" class="results">
            <c:set var="area" value="${circle-area}" />
            <c:if test="${area == 0}">
                <c:set var="circle-area" value="?"/>
            </c:if>
            Area = ${circle-area}
        </div>

        <h2 id="triangle">Hypotenuse of a Right Triangle</h2>
        <svg width="300" height="200">
            <polygon points="25,175 275,175 275,25" />
            <text class="var" x="145" y="195">a</text>
            <text class="var" x="280" y="110">b</text>
            <text class="var" x="145" y="80">c</text>
        </svg>
        <form id="form-triangle" name="form-triangle"
              action="results" method="POST">
            <input type="hidden" name="shape" value="triangle">
            <label for="side1" class="var">a</label>
            <input type="text" id="side1" name="side1" placeholder="Enter side 1..."
                   required>
            <label for="side2" class="var">b</label>
            <input type="text" id="side2" name="side2" placeholder="Enter side 2..."
                   required>
            <input type="submit" value="Calculate">
        </form>
        <div id="results-triangle" class="results"> 
            <c:set var="hypotenuse" value="${triangle-hypotenuse}" />
            <c:if test="${hypotenuse == 0}">
                <c:set var="triangle-hypotenuse" value="?"/>
            </c:if>
            <span class="var">c</span> = ${triangle-hypotenuse}
        </div>
        
    </body>
</html>