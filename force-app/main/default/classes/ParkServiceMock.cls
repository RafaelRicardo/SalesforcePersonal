@isTest
global class ParkServiceMock implements webServiceMock{
	
    global void doInvoke(Object stub, Object request, Map<String,Object> response, String endPoint, String soapAction, 
                       String requestName, String responseNS, String responseName, String responseType){
        
     ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
     response_x.return_x = new String[]{'Park_1','Park_2','Park_3'};
     response.put('response_x', response_x);
    }
}