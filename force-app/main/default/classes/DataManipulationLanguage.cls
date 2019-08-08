public class DataManipulationLanguage {

    public void crea_sObject(){
        Invoice_Statement__c objeto =
        new Invoice_Statement__c(Description__c = 'Mi nuevo invoice');
        insert objeto;
    }
    public void actualizasObject(){
        Invoice_Statement__c objeto = [SELECT Status__c FROM Invoice_Statement__c
                                       WHERE Description__c = 'Invoice 1'];
        objeto.Status__c = 'Negotiating';
        update objeto;
    }
    
    public void elimina_sObject(){
        Invoice_Statement__c elimina = [SELECT Status__c FROM Invoice_Statement__c
                                       WHERE Description__c = 'Negotiating'];
        delete elimina;
    }
    
    public void revive_sObject(){
      Invoice_Statement__c revive = [SELECT Status__c
                                     FROM Invoice_Statement__c
                                     WHERE Description__c = 'Negotiating'
                                     ALL ROWS];
        undelete revive;
    }
}