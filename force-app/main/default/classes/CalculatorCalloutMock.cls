@isTest
global class CalculatorCalloutMock implements webServiceMock{
    
    global void doInvoke(Object stub, Object request, Map<String,Object> response, String endPoint, String soapAction, 
                       String requestName, String responseNS, String responseName, String responseType){
        
      calculatorServices.doAddResponse response_x = new calculatorServices.doAddResponse();
       response_x.return_x = 12.0;
       response.put('response_x', response_x);                    
}

global class CalculatorCalloutMockDivide implements webServiceMock{
    
   global void doInvoke(Object stub, Object request, Map<String,Object> response, String endPoint, String soapAction, 
                  String requestName, String responseNS, String responseName, String responseType){
                      
                      calculatorServices.doDivideResponse response_x = new calculatorServices.doDivideResponse();
                      response_x.return_x = 3.0;
                      response.put('response_x',response_x);         
                  }
}
    
    global class CalculatorCalloutMockMultiply implements webServiceMock{
        
        global void doInvoke(Object stub, Object request, Map<String,Object> response, String endPoint, String soapAction, 
                             String requestName, String responseNS, String responseName, String responseType){
                                 
                                 calculatorServices.doMultiplyResponse response_x = new calculatorServices.doMultiplyResponse();
                                 response_x.return_x = 27.0;
                                 response.put('response_x',response_x);         
                             }
    }
    
    global class CalculatorCalloutMockSustrae implements webServiceMock{
        
        global void doInvoke(Object stub, Object request, Map<String,Object> response, String endPoint, String soapAction, 
                             String requestName, String responseNS, String responseName, String responseType){
                                 
                                 calculatorServices.doSubtractResponse response_x = new calculatorServices.doSubtractResponse();
                                 response_x.return_x = 6.0;
                                 response.put('response_x',response_x);         
                             }
    }
}