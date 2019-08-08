public class selectOptionClass {
    
    //public String[] countries = new String[]{};
    public String countries {get;set;}
    
    public selectOptionClass(){
    	 getItems();        
    }
    
        public PageReference test() {
            return null;
        }
    
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
 	 	options.add(new SelectOption('US','US'));
 	 	options.add(new SelectOption('CANADA','Canada'));
 	 	options.add(new SelectOption('MEXICO','Mexico'));
 	 	return options;
    }
    
    public PageReference asigna(){
        system.debug('valor: ' + countries);
         countries = countries;
        return null;
    }
}