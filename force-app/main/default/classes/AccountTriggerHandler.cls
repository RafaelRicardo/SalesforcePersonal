public class AccountTriggerHandler {
	
    public static void CreateAccounts(List<Account> listaCuentas){
        System.debug('Entra a metodo');
        List<Account> cuentas = new List<Account>();
        for(Account cuenta: listaCuentas){
            if(cuenta.ShippingState == cuenta.BillingState){
                cuentas.add(cuenta);
            }
        }
    }
}