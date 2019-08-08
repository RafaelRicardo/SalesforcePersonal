public class Callout_HttpGET {
    
    private Http http = new Http();
    private HttpResponse response;
    
    private static HttpRequest createRequest(String url, String type){
        HttpRequest request = new HttpRequest();
                    request.setEndpoint(url);
                    request.setMethod(type);
        return request;
    }
    
    public HttpResponse sendRequest(String url, String type){        
       response = http.send(Callout_HttpGET.createRequest(url,type));
       return response;
    }
        
    public static void deserializableJSON(HttpResponse response, String cadena){
        if(response.getStatusCode() == 200){
            Map<String,Object> resultado = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            List<Object> lista = (List<Object>)resultado.get(cadena);
            for(Object ob: lista){
                System.debug('Dato: '+ob);
            }
        }
    }
        
}