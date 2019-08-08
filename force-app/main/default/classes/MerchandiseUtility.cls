public class MerchandiseUtility{

    public static void mainProcessing(){
        try{
        insertMerchandise();
        }catch(MerchandiseException me){
            System.debug('Message: '+me.getMessage());
            System.debug('Cause: '+me.getCause());
            System.debug('Line number: '+me.getLineNumber());
            System.debug('Stack trace: '+me.getStackTraceString());
        }
    }
    
    public static void insertMerchandise(){
        try{
        Merchandise__c obj = new Merchandise__c();
        insert obj;
        }catch(DmlException m){
        System.debug('Merchandise item could not be inserted');
        }
    }
}