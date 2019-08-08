public with sharing class Asalesforcedx {
    public Asalesforcedx() {
    }

    public static List<Account> listaCuentas(){
        System.debug('Muestra de actualizacion');
        return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
    }
}