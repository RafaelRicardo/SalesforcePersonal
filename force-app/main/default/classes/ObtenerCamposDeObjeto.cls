public class ObtenerCamposDeObjeto {
    
    Account cuenta = new Account();
    
    public List<selectOption> getPickValues(Sobject object_name, String field_name, String first_val) {
        
        List<selectOption> options = new List<selectOption>(); //new list for holding all of the picklist options
        
        if (first_val != null) { //if there is a first value being provided
            
            options.add(new selectOption(first_val, first_val)); //add the first option
            
        }
        
        Schema.sObjectType sobject_type = object_name.getSObjectType(); //muestra el sObject que fue pasado
        system.debug('1. sobject_type:: '+ sobject_type);
        Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe(); //describe the sobject
        system.debug('2. sobject_describe:: '+ sobject_describe);
        Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap(); //get a map of fields for the passed sobject
        system.debug('3. field_map:: '+ field_map);
        List<Schema.PicklistEntry> pick_list_values = field_map.get(field_name).getDescribe().getPickListValues(); //grab the list of picklist values for the passed field on the sobject
        system.debug('4. pick_list_values:: '+ pick_list_values);
        
        for (Schema.PicklistEntry a : pick_list_values) { //for all values in the picklist list
            options.add(new selectOption(a.getValue(), a.getLabel())); //add the value and label to our final list
        }
        return options; //return the List
    }
    public List<SelectOption> metodoEntrada(){
        return getPickValues(cuenta, 'Active__c', NULL); 
    }
    
    public  List<String> valoresLista(String ObjectApi_name,String Field_name){ 
        system.debug('entro en  getPicklistValues');
        List<String> lstPickvals=new List<String>();
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(ObjectApi_name);//From the Object Api name retrieving the SObject
        Sobject Object_name = targetType.newSObject();
        Schema.sObjectType sobject_type = Object_name.getSObjectType(); //grab the sobject that was passed
        Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe(); //describe the sobject
        Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap(); //get a map of fields for the passed sobject
        List<Schema.PicklistEntry> pick_list_values = field_map.get(Field_name).getDescribe().getPickListValues(); //grab the list of picklist values for the passed field on the sobject
        for (Schema.PicklistEntry a : pick_list_values) { //for all values in the picklist list
            lstPickvals.add(a.getValue());//add the value  to our final list
        }
        system.debug('retorno valor '+ lstPickvals);
        return lstPickvals;
}
    
    public  void main(){
        system.debug('entro en  main');
        List<String> listaNueva = new List<String>();
        listaNueva = valoresLista('Account','Active__c');
        system.debug('Lista: '+ listaNueva);
    }
}