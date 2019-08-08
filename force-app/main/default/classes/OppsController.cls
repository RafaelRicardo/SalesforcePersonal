public class OppsController {

    public ApexPages.StandardSetController setCon{
        get{
            if(setCon==null){
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                [SELECT id,name,type,amount,closedate FROM Opportunity]));
                setCon.setPageSize(5);
            }
            return setCon;
        }
        set;
    }
    
    public List<Opportunity> getOpportunities(){
        return (List<Opportunity>)setCon.getRecords();
    }
    
    public List<OppWrapper> getOpportunitiesWithIndex(){
        List<Opportunity> opps = getOpportunities();
        List<OppWrapper> oppsWrapped = new List<OppWrapper>();
        
        for(Integer i=0; i<opps.size(); i++){
            oppsWrapped.add(new OppWrapper(opps.get(i),i));
        }            
		return oppsWrapped;
    }
    
    public class OppWrapper{
        public Opportunity opp{get;set;}
        public Integer tabIndex{get;set;}
        public OppWrapper(Opportunity opp, Integer tabIndex){
            this.opp = opp;
            this.tabIndex = tabIndex;
        }
    }
}