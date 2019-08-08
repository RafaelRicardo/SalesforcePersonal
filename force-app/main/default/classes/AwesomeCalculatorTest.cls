@isTest
private class AwesomeCalculatorTest {
	
    @isTest static void testCallout(){
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());
        Double x = 9.0;
        Double y = 3.0;
        Double result = AwesomeCalculator.add(x,y);        
        System.assertEquals(12.0, result);
    }
    
    @isTest static void testCalloutDivide(){
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock.CalculatorCalloutMockDivide());
        Double x = 9.0;
        Double y = 3.0;
        Double result2 = AwesomeCalculator.divide(x,y);        
        System.assertEquals(3.0, result2);        
    }
    
    @isTest static void testCalloutMultiply(){
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock.CalculatorCalloutMockMultiply());
        Double x = 9.0;
        Double y = 3.0;
        Double result2 = AwesomeCalculator.multiplica(x,y);        
        System.assertEquals(27.0, result2);        
    }
    
    @isTest static void testCalloutSustrae(){
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock.CalculatorCalloutMockSustrae());
        Double x = 9.0;
        Double y = 3.0;
        Double result2 = AwesomeCalculator.resta(x,y);        
        System.assertEquals(6.0, result2);        
    }
}