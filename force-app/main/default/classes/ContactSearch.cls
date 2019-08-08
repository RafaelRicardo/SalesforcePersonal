public class ContactSearch {
	
    public static List<Contact> searchForContacts(String cadena1, String cadena2){
        return [SELECT Name FROM Contact WHERE LastName =: cadena1  AND
                MailingPostalCode =: cadena2];
    }
}