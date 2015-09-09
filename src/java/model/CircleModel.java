package model;

import shape.Circle;

/**
 * @author Dan Noonan
 */
public class CircleModel {
    
    public double getArea(String radius) {
        double dRadius = Double.parseDouble(radius);
        Circle circle = new Circle(dRadius);
        return circle.getArea();
    }
    
}