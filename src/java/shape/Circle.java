package shape;

/**
 * @author Dan Noonan
 */
public class Circle {

    private double radius;
    
    public Circle(double radius) {
        this.radius = radius;
    }
    
    public double getArea() {
        return Math.PI * radius * radius;
    }
    
}