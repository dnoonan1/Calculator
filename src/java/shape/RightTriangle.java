package shape;

/**
 * @author Dan Noonan
 */
public class RightTriangle {

    private double side1;
    private double side2;
    
    public RightTriangle(double side1, double side2) {
        this.side1 = side1;
        this.side2 = side2;
    }
    
    public double getArea() {
        return 0.5 * side1 * side2;
    }
    
    public double getHypotenuse() {
        return Math.sqrt(side1 * side1 + side2 * side2);
    }
    
}