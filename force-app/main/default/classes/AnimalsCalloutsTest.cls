@isTest
public class AnimalsCalloutsTest {

    @isTest static void testGetCallout(){
        StaticResourceCalloutMock mock= new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        Test.setMock(HttpCalloutMock.class, mock);        
        HttpResponse result = new Callout_HttpGET().sendRequest('GetAnimalResource','GET');        
        Callout_HttpGET.deserializableJSON(result,'animals');
        
        System.assertNotEquals(null, result,'The callout returned a null response');
        System.assertEquals(200,result.getStatusCode(),'The status code is not 200');
        System.assertEquals('application/json;charset=UTF-8',result.getHeader('Content-Type'),'The content type value is not expected');
        
        Map<String,Object> response = (Map<String,Object>)JSON.deserializeUntyped(result.getBody());
        List<object> animal = (List<object>)response.get('animals');
        System.assertEquals(3, animal.size(),'The array should only contain 3 items.');
     }
    
    @isTest static void testPostCallout(){
        String url = 'https://th-apex-http-callout.herokuapp.com/animals';
        String headKey = 'Content-Type';
        String headValue = 'application/json;charset=UTF-8';
        String body = '{"name":"mighty moose"}';
        String type = 'POST';
        
        Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());
        HttpResponse response = new Callout_HttpPOST().sendRequest(url, headKey, headValue, body, type);
        new Callout_HttpPOST().parserJSON(response);

		//Se verifican las respuestas del response        
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, response.getStatusCode());

    }
}