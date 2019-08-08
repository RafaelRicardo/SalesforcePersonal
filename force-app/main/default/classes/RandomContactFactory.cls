public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer num, String cad){
        List<Contact> listContacto = new List<Contact>();
        for(Integer i=0; i < num; i++){
            Contact contacto = new Contact(LastName = cad + ' ' +String.valueOf(i),
                                           FirstName = 'Test ' + String.valueOf(i));
            listContacto.add(contacto);
        }     
        return listContacto;
    }
}