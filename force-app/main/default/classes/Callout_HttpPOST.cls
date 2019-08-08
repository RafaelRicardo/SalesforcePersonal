public class Callout_HttpPOST {
	
    private Http http = new Http();
    private HttpResponse response;
    
    private static HttpRequest createRequest(String url, String headKey, String headValue, String body, String type){
        HttpRequest request = new HttpRequest();
                    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
                    request.setHeader('Content-Type','application/json;charset=UTF-8');	
                    request.setBody('{"name":"mighty moose"}');
                    request.setMethod('POST');
        return request;
    }
    
    public HttpResponse sendRequest(String url, String headKey, String headValue, String body, String type){
        response = http.send(Callout_HttpPOST.createRequest(url,headKey,headValue,body,type));
        return response;
    }
    
    public void parserJSON(HttpResponse respuesta){
        if(respuesta.getStatusCode() != 201){
            System.debug('The code return was not the expected: '+
                        respuesta.getStatusCode()+ ' - '+ respuesta.getStatus());
        }else{
            System.debug('Body::'+ respuesta.getBody());
        }
    }
    
}