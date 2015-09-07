package model;

import shape.Rectangle;

/**
 * @author Dan Noonan
 */
public class GeometricCalculator {
    
    public double getResult(String length, String width) {
        double dLength = Double.parseDouble(length);
        double dWidth = Double.parseDouble(width);
        Rectangle rect = new Rectangle(dLength, dWidth);
        return rect.getArea();
    }
    
}