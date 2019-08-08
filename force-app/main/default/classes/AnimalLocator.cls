public class AnimalLocator {
    
    public static String getAnimalNameById(Integer id){
        String nombreAnimal = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        
        HttpResponse response = http.send(request);
       
        JSONParser parser = JSON.createParser(response.getBody());       

        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'name')) {               
                parser.nextValue();
                system.debug('nombre:'+ parser.getCurrentName()+ ' -> '+ parser.getText());
                 nombreAnimal = parser.getText();
            }
        }               
        return nombreAnimal;
    }

}