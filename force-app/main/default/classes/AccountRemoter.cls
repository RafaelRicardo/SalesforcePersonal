global class AccountRemoter {

    public String accountName {get;set;}
    public static Account account {get;set;}
    
    public AccountRemoter(){}
    
    @RemoteAction
    global static Account getAccount(String accountName){
        account = [SELECT id, Name, Phone, Type, NumberOfEmployees FROM Account WHERE Name =: accountName limit 1];
        return account;	
    }
}