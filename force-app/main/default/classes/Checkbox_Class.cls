public class Checkbox_Class {

    List<accountWrapper> accountList = new List<accountWrapper>();
    List<Account> selectedAccount = new List<Account>();
    
    public List<accountWrapper> getAccounts(){
        for(Account a: [SELECT id,Name, AccountNumber, Phone FROM Account Limit 5]){
            accountList.add(new accountWrapper(a));
        }
        return accountList;
    }
    
    public PageReference getSelected(){
        selectedAccount.clear();
        for(accountWrapper accwrapper: accountList){
            if(accwrapper.selected == true){
                selectedAccount.add(accwrapper.acc);
            }
        }
        return null;
    }
    
    public List<Account> GetSelectedAccounts(){
        if(selectedAccount.size() > 0)
           return selectedAccount;
        else
            return null;
    }
    
    public class accountWrapper{
        public Account acc{get;set;}
        public Boolean selected{get;set;}
        public accountWrapper(Account a){
            acc      = a;
            selected = false;
        }
    }
}