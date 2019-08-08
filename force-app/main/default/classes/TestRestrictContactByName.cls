@isTest
public class TestRestrictContactByName {

    @isTest static void TestVALIDNAMEContact(){    
        Contact contacto = new Contact(LastName = 'Nombre de contacto');
        insert contacto;
    }
    
    @isTest static void TestINVALIDNAMEContact(){    
        Contact contacto = new Contact(LastName = 'INVALIDNAME');
        Database.SaveResult resul = Database.insert(contacto, false);
    }
}