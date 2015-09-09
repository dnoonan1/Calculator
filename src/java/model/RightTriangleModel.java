package model;

import shape.RightTriangle;

/**
 * @author Dan Noonan
 */
public class RightTriangleModel {
    
    public double getHypotenuse(String side1, String side2) {
        double dSide1 = Double.parseDouble(side1);
        double dSide2 = Double.parseDouble(side2);
        RightTriangle tri = new RightTriangle(dSide1, dSide2);
        return tri.getHypotenuse();
    }
    
}