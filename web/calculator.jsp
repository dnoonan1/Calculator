<%-- 
    Document   : calculator
    Created on : Sep 2, 2015, 9:22:41 PM
    Author     : Dan Noonan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="FLOAT_REGEX" value="[+]?[0-9]*\\.?[0-9]+" />
<c:set var="NON_NEGATIVE" value="Non-negative number" />

<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Geometric Calculator</title>
        <link href="css/styles.css" rel="stylesheet">
    </head>
    
    <body>
        
        <div class="container">
            
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
        
        <section id="rectangle">
            <header>
                <h2>Area of a Rectangle</h2>    
            </header>
            <div>
                <img src="svg/rectangle.svg" alt="rectangle" width="300" height="200">
                <aside class="formula">
                    <var>A</var> = <var>&#x2113;w</var>
                </aside>
                <form id="form-rectangle" name="form-rectangle" method="POST" action="area-results">
                    <input type="hidden" name="shape" value="rectangle">
                    <div class="field">
                        <label for="length">
                            Length (<var>&#x2113;</var>&thinsp;)
                        </label>
                        <input type="text" id="length" name="length" 
                               placeholder="Enter length..." required
                               pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                               value="${param.length}">
                    </div>
                    <div class="field">
                        <label for="width">
                            Width (<var>w</var>&thinsp;)
                        </label>
                        <input type="text" id="width" name="width"
                               placeholder = "Enter width..." required
                               pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                               value="${param.width}">
                    </div>
                    <input type="submit" value="Calculate">
                </form>
                <div id="results-rectangle" class="results"> 
                    Area =
                    <c:choose>
                        <c:when test="${empty rectangleArea}">
                            ?
                        </c:when>
                        <c:otherwise>
                            ${rectangleArea}
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>

        <section id="circle">
            <header>
                <h2>Area of a Circle</h2>    
            </header>
            <div>
                <img src="svg/circle.svg" alt="circle" width="200" height="200">
                <aside class="formula">
                    <var>A</var> = <var>&pi;r</var>&thinsp;<sup>2</sup>
                </aside>
                <form id="form-circle" name="form-circle" action="area-results" method="POST">
                    <input type="hidden" name="shape" value="circle"
                           required>
                    <div class="field">
                        <label for="radius">
                            Radius (<var>r</var>&thinsp;)
                        </label>
                        <input type="text" id="radius" name="radius"
                               placeholder="Enter radius..." required
                               pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                               value="${param.radius}">
                    </div>
                    <input type="submit" value="Calculate">
                </form>
                <div id="results-circle" class="results"> 
                    Area =
                    <c:choose>
                        <c:when test="${empty circleArea}">
                            ?
                        </c:when>
                        <c:otherwise>
                            <fmt:formatNumber value="${circleArea}"
                                              maxFractionDigits="5" />...
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>

        <section id="triangle">
            <header>
                <h2>Area of a Triangle</h2>    
            </header>
            <div>
                <img src="svg/triangle.svg" alt="triangle" width="300" height="200">
                <aside class="formula">
                    <table class="formula">
                        <tr>
                            <td rowspan="2"><var>A</var> = </td>
                            <td class="fraction"><var>bh</var></td>
                        </tr>
                        <tr>
                            <td class="center">2</td>
                        </tr>
                    </table>
                </aside>
                <form id="form-triangle" name="form-triangle" action="area-results" method="POST">
                    <input type="hidden" name="shape" value="triangle">
                    <div class="field">
                        <label for="base">
                            Base (<var>b</var>)&thinsp;
                        </label>
                        <input type="text" id="base" name="base"
                               placeholder="Enter base..." required
                               pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                               value="${param.base}">
                    </div>
                    <div class="field">
                        <label for="height">
                            Height (<var>h</var>)&thinsp;
                        </label>
                        <input type="text" id="height" name="height"
                               placeholder="Enter height..." required
                               pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                               value="${param.height}">
                    </div>
                    <input type="submit" value="Calculate">
                </form>
                <div id="results-triangle" class="results"> 
                    Area =
                    <c:choose>
                        <c:when test="${empty triangleArea}">
                            ?
                        </c:when>
                        <c:otherwise>
                            ${triangleArea}
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>
        </div> <!-- end of div.row -->
        
        </div> <!-- end of div.container-fluid -->
        
        <c:if test="${not empty param.shape}">
            <script>
                onload = function() {
                    document.getElementById("${param.shape}")
                            .scrollIntoView();
                };
            </script>
        </c:if>
        
    </body>
</html>