public class ExceptionesPdf{

    public void exceptionLista_1(){
    
    try{
    List<Integer> lista = new List<Integer>();
    lista.add(15);
    
    Integer entero_1 = lista[0];
    Integer entero_2 = lista[1];
    }catch(ListException le){
          System.debug('Ha ocurrido una exception, tratando de '+ 
          'acceder a un dato que no existe en la lista '+le.getMessage());
          }
    }
    
    public void exception_Null(){
        try{
            String cadena;
            Boolean b = cadena.contains('abd');
        }catch(NullPointerException nu){
            System.debug('Exception tratando se acceder una variable'+ 
             ' que esta en null'+ nu.getMessage());
        }
    }
    
    public void exception_si_no(){
        try{
            List<Merchandise__c> objMerchandise = [SELECT Name 
                 FROM Merchandise__c WHERE Name='abd'];            
            System.debug('Tamaño lista: '+objMerchandise.size());
          Merchandise__c objetoMer = [SELECT Name FROM Merchandise__c
                                     WHERE Name = 'ajd' limit 1];  
        }catch(QueryException qe){
            System.debug('Exception query porque con el limit 1 estamos'+
        ' asegurando por lo menos un dato, pero como no hay ninguno con '+ 
        'esas especificaciones lanza el error '+ qe.getMessage());
        }
    }
    
    public void exception_DatoNoEstaEnLaConsulta(){
        try{
            Merchandise__c	objetoM = [SELECT Name
                                       FROM Merchandise__c LIMIT 1];
            Double inventory = objetoM.Total_Inventory__c;
        }catch(SObjectException se){
            System.debug('Ha ocurrido una exception '+ se.getMessage());
        }
    }
    
    public void diferentesMetodos_Exceptiones(){
        try{
        Merchandise__c objeto = [SELECT Name FROM Merchandise__c LIMIT 1];
        Double inventory = objeto.Total_Inventory__c;
        }catch(Exception e){
            System.debug('Exception type caught: '+e.getTypeName());
            System.debug('Message: '+ e.getMessage());
            System.debug('Cause: '+ e.getCause());
            System.debug('Line Number: '+ e.getLineNumber());
            System.debug('Stack trace: '+ e.getStackTraceString());
        }
    }
    
    public void exceptions_DMLException(){
        Merchandise__c m1 = new Merchandise__c(
            Name = 'coffeMaker',
            Description__c = 'Kitchenware',
            Price__c = 25,
            Total_Inventory__c = 1000);
        Merchandise__c m2 = new Merchandise__c(
        Name = 'coffemaker B',
        Description__c = 'kitchenware B');
        
        Merchandise__c m3 = new Merchandise__c();
        Merchandise__c[] mList = new List<Merchandise__c>();
        mList.add(m1);
        mList.add(m2);
        mList.add(m3);
        
        try{
            insert mList;
        }catch(DmlException de){
            Integer numError = de.getNumDml();
            System.debug('getNumDML = '+ numError);
            for(Integer i=0; i<numError; i++){
                System.debug('getDmlFieldNames= '+ de.getDmlFieldNames(i));
                System.debug('getDmlMessage= '+ de.getDmlMessage(i));
            }
        }
    }
}