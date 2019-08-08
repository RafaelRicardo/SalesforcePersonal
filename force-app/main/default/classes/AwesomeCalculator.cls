public class AwesomeCalculator {
	
    public static Double add(Double x, Double y) {
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        return calculator.doAdd(x,y);
    }
    
    public static Double divide(Double x, Double y){
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        return calculator.doDivide(x,y);
    }
    
    public static Double multiplica(Double x, Double y){
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        return calculator.doMultiply(x,y);
    }
    public static Double resta(Double x, Double y){
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        return calculator.doSubtract(x,y);
    }
}