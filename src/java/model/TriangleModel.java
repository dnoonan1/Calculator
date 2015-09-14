package model;

import shape.Triangle;

/**
 * @author Dan Noonan
 */
public class TriangleModel {
    
    public double getArea(String base, String height)
            throws NumberFormatException {
        double dBase = Double.parseDouble(base);
        double dHeight = Double.parseDouble(height);
        Triangle tri = new Triangle(dBase, dHeight);
        return tri.getArea();
    }
    
}