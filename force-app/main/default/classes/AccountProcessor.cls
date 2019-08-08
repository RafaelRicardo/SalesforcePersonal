public class AccountProcessor {
	
    @Future(callout=true)
    public static void countContacts(List<id> lstIDCuentas){
        List<Account> lstCuentas = [SELECT id,Number_of_Contacts__c,(SELECT id FROM Contacts) FROM Account 
                                    WHERE id IN: (lstIDCuentas)];
        
        for(Account cuenta: lstCuentas){
            Integer cantidad = 0;
            for(Contact contacto: cuenta.Contacts){
                cantidad++;
            }
            cuenta.Number_of_Contacts__c = cantidad;
        }
        update lstCuentas;
    }
}