package model;

import shape.Rectangle;

/**
 * @author Dan Noonan
 */
public class RectangleModel {
    
    public double getArea(String length, String width)
            throws NullPointerException, NumberFormatException {
        double dLength = Double.parseDouble(length);
        double dWidth = Double.parseDouble(width);
        Rectangle rect = new Rectangle(dLength, dWidth);
        return rect.getArea();
    }
    
}