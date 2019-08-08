public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads(String cad){       
        
        
        return [FIND :cad IN ALL FIELDS 
                RETURNING Contact(LastName where LastName like :cad OR FirstName like :cad), 
                             Lead(LastName where LastName like :cad OR FirstName like :cad)];
    }
}