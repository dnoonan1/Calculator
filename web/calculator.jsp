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
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    
    <body>
    <div class="container">
            
        <header class="jumbotron">
            <h1>Geometric Calculator</h1>    
        </header>
        
        <div class="row">
            <section id="rectangle" class="col-md-4">
                <header>
                    <h2 class="bg-primary text-center">Area of a Rectangle</h2>    
                </header>
                <div>
                    <img class="center-block" src="svg/rectangle.svg" alt="rectangle" width="300" height="200">
                    <div class="formula text-center">
                        <var>A</var> = <var>&#x2113;w</var>
                    </div>
                    <form id="form-rectangle" name="form-rectangle" class="form-horizontal"
                          method="POST" action="area-results">
                        <input type="hidden" name="shape" value="rectangle">
                        <div class="form-group">
                            <label for="length" class="control-label col-md-4">
                                Length (<var>&#x2113;</var>&thinsp;)
                            </label>
                            <div class="col-md-4">
                                <input type="text" id="length" name="length" class="form-control"
                                       placeholder="Length" required
                                       pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                                       value="${param.length}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="width" class="control-label col-md-4">
                                Width (<var>w</var>&thinsp;)
                            </label>
                            <div class="col-md-4">
                                <input type="text" id="width" name="width" class="form-control"
                                       placeholder = "Width" required
                                       pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                                       value="${param.width}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4 col-md-offset-4">
                                <input type="submit" value="Calculate"
                                       class="form-control btn btn-primary">
                            </div>
                        </div>
                    </form>
                    <h3 id="results-rectangle" class="text-success text-center"> 
                        Area =
                        <c:choose>
                            <c:when test="${empty rectangleArea}">
                                ?
                            </c:when>
                            <c:otherwise>
                                ${rectangleArea}
                            </c:otherwise>
                        </c:choose>
                    </h3>
                </div>
            </section>

            <section id="circle" class="col-md-4">
                <header>
                    <h2 class="text-center bg-primary">Area of a Circle</h2>    
                </header>
                <div>
                    <img class="center-block" src="svg/circle.svg" alt="circle" width="200" height="200">
                    <div class="formula text-center">
                        <var>A</var> = <var>&pi;r</var>&thinsp;<sup>2</sup>
                    </div>
                    <form id="form-circle" name="form-circle" class="form-horizontal"
                          action="area-results" method="POST">
                        <input type="hidden" name="shape" value="circle" required>
                        <div class="form-group">
                            <label for="radius" class="control-label col-md-4">
                                Radius (<var>r</var>&thinsp;)
                            </label>
                            <div class="col-md-4">
                                <input type="text" id="radius" name="radius" class="form-control"
                                       placeholder="Enter radius..." required
                                       pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                                       value="${param.radius}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4">
                                <input type="text" class="form-control invisible">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4 col-md-offset-4">
                                <input type="submit" value="Calculate" class="form-control btn btn-primary">
                            </div>
                        </div>
                    </form>
                    <h3 id="results-circle" class="text-success text-center"> 
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
                    </h3>
                </div>
            </section>

            <section id="triangle" class="col-md-4">
                <header>
                    <h2 class="bg-primary text-center">Area of a Triangle</h2>    
                </header>
                <div>
                    <img class="center-block" src="svg/triangle.svg" alt="triangle" width="300" height="200">
                    <div class="formula">
                        <table>
                            <tr>
                                <td rowspan="2"><var>A</var> = </td>
                                <td class="fraction"><var>bh</var></td>
                            </tr>
                            <tr>
                                <td class="text-center">2</td>
                            </tr>
                        </table>
                    </div>
                    <form id="form-triangle" name="form-triangle" class="form-horizontal"
                          action="area-results" method="POST">
                        <input type="hidden" name="shape" value="triangle">
                        <div class="form-group">
                            <label for="base" class="control-label col-md-4">
                                Base (<var>b</var>&thinsp;)
                            </label>
                            <div class="col-md-4">
                                <input type="text" id="base" name="base" class="form-control"
                                       placeholder="Enter base..." required
                                       pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                                       value="${param.base}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="height" class="control-label col-md-4">
                                Height (<var>h</var>&thinsp;)
                            </label>
                            <div class="col-md-4">
                                <input type="text" id="height" name="height" class="form-control"
                                       placeholder="Enter height..." required
                                       pattern="${FLOAT_REGEX}" title="${NON_NEGATIVE}"
                                       value="${param.height}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4 col-md-offset-4">
                                <input type="submit" value="Calculate" class="form-control btn btn-primary">
                            </div>
                        </div>
                    </form>
                    <h3 id="results-triangle" class="text-success text-center"> 
                        Area =
                        <c:choose>
                            <c:when test="${empty triangleArea}">
                                ?
                            </c:when>
                            <c:otherwise>
                                ${triangleArea}
                            </c:otherwise>
                        </c:choose>
                    </h3>
                </div>
            </section>
        </div> <!-- end of div.row -->
        
    </div> <!-- end of div.container -->
    </body>
</html>