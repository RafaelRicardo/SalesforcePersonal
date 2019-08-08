public class AccountFooRecordType {
	
    private static AccountFooRecordType instancia;
    public String id {get;private set;}
    
    private AccountFooRecordType(){
        id = Account.sObjectType.getDescribe().getRecordTypeInfosByName().get('Principal').getRecordTypeId();
    }
    
    public static AccountFooRecordType getInstancia(){
        if(instancia == null){ instancia = new AccountFooRecordType(); }
        return instancia;
    }
}