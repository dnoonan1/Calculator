<%-- 
    Document   : calculator
    Created on : Sep 2, 2015, 9:22:41 PM
    Author     : Dan Noonan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    final String FLOAT_REGEX = "[+]?[0-9]*\\.?[0-9]+";
    final String NON_NEGATIVE = "Non-negative number.";
%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        
        <section id="rectangle">
            <header>
                <h2>Area of a Rectangle</h2>    
            </header>
            <div>
                <img src="svg/rectangle.svg" alt="rectangle"
                     width="300" height="200">
                <aside class="formula">
                    <var>A</var> = <var>&#x2113;w</var>
                </aside>
                <form id="form-rectangle" name="form-rectangle"
                      method="POST" action="area-results">
                    <input type="hidden" name="shape" value="rectangle">
                    <div class="field">
                        <label for="length">
                            Length (<var>&#x2113;</var>&thinsp;)
                        </label>
                        <input type="text" id="length" name="length" 
                               placeholder="Enter length..." required
                               pattern="<%=FLOAT_REGEX%>" title="<%=NON_NEGATIVE%>"<%
                            String length = request.getParameter("length");
                            if (length != null) {
                                out.print(" value=\"" + length + "\"");
                            }
                            %>>
                    </div>
                    <div class="field">
                        <label for="width">
                            Width (<var>w</var>&thinsp;)
                        </label>
                        <input type="text" id="width" name="width"
                               placeholder = "Enter width..." required
                               pattern="<%=FLOAT_REGEX%>" title="<%=NON_NEGATIVE%>"<%
                            String width = request.getParameter("width");
                            if (width != null) {
                                out.print(" value=\"" + width + "\"");
                            }
                            %>>
                    </div>
                    <input type="submit" value="Calculate">
                </form>
                <div id="results-rectangle" class="results"> 
                    Area = <%
                        Object area = request.getAttribute("rectangleArea");
                        if (area == null) {
                            out.print("?");
                        } else {
                            out.print(area);
                        }
                    %>
                </div>
            </div>
        </section>

        <section id="circle">
            <header>
                <h2>Area of a Circle</h2>    
            </header>
            <div>
                <img src="svg/circle.svg" alt="circle"
                     width="200" height="200">
                <aside class="formula">
                    <var>A</var> = <var>&pi;r</var>&thinsp;<sup>2</sup>
                </aside>
                <form id="form-circle" name="form-circle"
                      action="area-results" method="POST">
                    <input type="hidden" name="shape" value="circle"
                           required>
                    <div class="field">
                        <label for="radius">
                            Radius (<var>r</var>&thinsp;)
                        </label>
                        <input type="text" id="radius" name="radius"
                               placeholder="Enter radius..." required
                               pattern="<%=FLOAT_REGEX%>" title="<%=NON_NEGATIVE%>"<%
                        String radius = request.getParameter("radius");
                        if (radius != null) {
                            out.print(" value=\"" + radius + "\"");
                        }
                        %>>
                    </div>
                    <input type="submit" value="Calculate">
                </form>
                <div id="results-circle" class="results"> 
                    Area = <%
                        area = request.getAttribute("circleArea");
                        if (area == null) {
                            out.print("?");
                        } else {
                            out.print(String.format("%.5f...", area));
                        }
                    %>
                </div>
            </div>
        </section>

        <section id="triangle">
            <header>
                <h2>Area of a Triangle</h2>    
            </header>
            <div>
                <img src="svg/triangle.svg" alt="triangle"
                     width="300" height="200">
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
                <form id="form-triangle" name="form-triangle"
                      action="area-results" method="POST">
                    <input type="hidden" name="shape" value="triangle">
                    <div class="field">
                        <label for="base">
                            Base (<var>b</var>)&thinsp;
                        </label>
                        <input type="text" id="base" name="base"
                               placeholder="Enter base..." required
                               pattern="<%=FLOAT_REGEX%>" title="<%=NON_NEGATIVE%>"<%
                            String base = request.getParameter("base");
                            if (base != null) {
                                out.print(" value=\"" + base + "\"");
                            }
                            %>>
                    </div>
                    <div class="field">
                        <label for="height">
                            Height (<var>h</var>)&thinsp;
                        </label>
                        <input type="text" id="height" name="height"
                               placeholder="Enter height..." required
                               pattern="<%=FLOAT_REGEX%>" title="<%=NON_NEGATIVE%>"<%
                            String height = request.getParameter("height");
                            if (height != null) {
                                out.print(" value=\"" + height + "\"");
                            }
                            %>>
                    </div>
                    <input type="submit" value="Calculate">
                </form>
                <div id="results-triangle" class="results"> 
                    Area = <%
                        area = request.getAttribute("triangleArea");
                        if (area == null) {
                            out.print("?");
                        } else {
                            out.print(area);
                        }
                    %>
                </div>
            </div>
        </section>
                
        <%
            Object shape = request.getParameter("shape");
            if (shape != null) {
                out.println("<script>");
                out.println("\t\tonload = function() { document.getElementById(\""
                        + shape + "\").scrollIntoView() }");
                out.print("\t</script>");
            }
        %>
        
    </body>
</html>