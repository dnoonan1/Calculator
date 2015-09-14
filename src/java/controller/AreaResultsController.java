package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CircleModel;
import model.RectangleModel;
import model.TriangleModel;

/**
 * @author Dan Noonan
 */
@WebServlet(name = "ResultsGenerator", urlPatterns = {"/area-results"})
public class AreaResultsController extends HttpServlet {

    private static final String DESTINATION_VIEW = "calculator.jsp";
    
    private static final String RECTANGLE = "rectangle";
    private static final String CIRCLE = "circle";
    private static final String TRIANGLE = "triangle";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String shape;
        double value;
        
        response.setContentType("text/html;charset=UTF-8");
        
        shape = request.getParameter("shape");
        
        switch (shape) {
            case RECTANGLE:
                String length = request.getParameter("length");
                String width = request.getParameter("width");
                try {
                    value = new RectangleModel().getArea(length, width);
                    request.setAttribute("rectangleArea", value);
                } catch (NumberFormatException e) {
                    // Do nothing; the view will handle this
                }
                
                break;
            case CIRCLE:
                String radius = request.getParameter("radius");
                try {
                    value = new CircleModel().getArea(radius);
                    request.setAttribute("circleArea", value);
                } catch (NumberFormatException e) {
                    // Do nothing; the view will handle this
                }
                
                break;
            case TRIANGLE:
                String base = request.getParameter("base");
                String height = request.getParameter("height");
                try {
                    value = new TriangleModel().getArea(base, height);
                    request.setAttribute("triangleArea", value);
                } catch (NumberFormatException e) {
                    // Do nothing; the view will handle this
                }
                
                break;
            default:
        }
        
        RequestDispatcher view =
                request.getRequestDispatcher(DESTINATION_VIEW);
        view.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}