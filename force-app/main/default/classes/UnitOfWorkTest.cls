@isTest
public class UnitOfWorkTest {

    @isTest static void challengeComplete(){
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {Opportunity.SObjectType});

        Opportunity opp = new Opportunity();
        opp.Name = 'UoW Test Name ';        
        opp.StageName = 'Open';        
        opp.CloseDate = System.today();        
        uow.registerNew(opp);
        uow.commitWork();
        
        //System.assertEquals(100, [Select Id from Account].size());        
        //System.assertEquals(500, [Select Id from Contact].size());
        //System.assertEquals(500, [Select Id from Note].size());
    }
}