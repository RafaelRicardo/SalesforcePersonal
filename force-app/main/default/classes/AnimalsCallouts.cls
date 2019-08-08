/****************************************************************************************************************
*@Author:   Rafael Cardona
*@Function: Llamado a servicios callouts GET Y POST (Tema: integraciones)
*@URL:      https://trailhead.salesforce.com/modules/apex_integration_services/units/apex_integration_rest_callouts
****************************************************************************************************************/
public class AnimalsCallouts {
    
    public static HttpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
                    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
                    request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
            Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>)results.get('animals');
            for(Object animal: animals){
                System.debug('animal: '+ animal);
            }
        }        
        return response;
    }
    
    public static HttpResponse makePostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
                    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
                    request.setHeader('Content-Type','application/json;charset=UTF-8');
                    request.setMethod('POST');
                    request.setBody('{"name":"mighty moose"}');
        
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() != 201){
            System.debug('The status code returned not was expected '+ response.getStatusCode() + ' ' + response.getStatus());
        }else{
            System.debug('The status code returned was expected '+ response.getStatusCode() + ' ' + response.getStatus() + ' ' + response.getBody());
        }
        
        return response;
    }

}