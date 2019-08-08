public class AccountHandler {
	
    public static Account insertNewAccount(String cadena){
        
        Account cuenta = new Account(name=cadena);
        try{
            insert cuenta;
        }catch(DmlException e){
            System.debug('error en el insert');
            return null;
        }
        return cuenta;
    }
}