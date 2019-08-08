public with sharing  class AngularWithVfPage{	

	public static String getContacto(){
		return JSON.Serialize(new AngularWithVfPage().consultaContactos());
	}
    
        public List<Contact> consultaContactos(){
        return [SELECT id, name, email FROM Contact];
    }
}