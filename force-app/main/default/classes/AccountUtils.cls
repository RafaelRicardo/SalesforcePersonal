public class AccountUtils {
    
    public static List<Account> accountsByState(String state){
        List<Account> listaCuentas = new List<Account>();
        listaCuentas = [SELECT id, Name FROM Account WHERE BillingState =: state];
        return listaCuentas;
    }
}