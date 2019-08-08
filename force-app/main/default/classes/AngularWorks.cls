global class AngularWorks {
	
       // hardcode an account id for demo purposes
   static String accountId = '00161000007SbeWAAS';
 
   global static String getAccount() {
       return JSON.serialize([select name, billingstreet,
           billingcity, billingstate, billingpostalcode
           from account where id = :accountId][0]);
   }    
 
   global static String getContacts() {
       return JSON.serialize([select id, name, email
           from contact where accountId = :accountId]);
   }
}