@isTest
public class AccountTriggerTest {
    @isTest static void testMethodUno(){        
        List<Account> cuentas = new List<Account>();
        for(Integer k=0; k<200; k++){
            Account cuenta = new Account();
            cuenta.Name = 'Cuenta_'+ k+1;
            cuenta.BillingState = 'CA';
            cuenta.ShippingState = 'CA';
            cuentas.add(cuenta);
        }
        Test.startTest();
        insert cuentas;
        Test.stopTest();        
        List<Account> lista = [SELECT id,BillingState FROM Account WHERE BillingState = 'CA'];
        System.assertEquals(200, lista.size());
    }    
    @isTest static void testMethodTwo(){
        List<Account> cuentas = new List<Account>();
        for(Integer j=0; j<200; j++){
            Account cuenta2 = new Account();
            cuenta2.Name = 'Cuenta_'+ j+1;
            cuenta2.BillingState = 'CA';
            cuenta2.ShippingState = 'A';
            cuentas.add(cuenta2);
        }
        Test.startTest();
        insert cuentas;
        Test.stopTest();
    }
}