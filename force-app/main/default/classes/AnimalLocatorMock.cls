@isTest
global class AnimalLocatorMock implements HttpCalloutMock{
    
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setBody('{"animal":{"id":0,"name":"","eats":"","says":""}}');
        response.setStatusCode(200);
        return response;
    }

}