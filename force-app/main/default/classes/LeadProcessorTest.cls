@isTest
public class LeadProcessorTest {
	
    @testSetup
    static void setup(){
        List<Lead> candidatoCrear = new List<Lead>();
        
        for(Integer i=0; i < 200; i++){
            candidatoCrear.add(new Lead(LastName = 'Batch crea Lead_'+i,
                                       Company = 'Campaña Lead Creado por Batch',
                                       LeadSource = 'Dreamforce'));
        }
        insert candidatoCrear;
    }
    
    static testmethod void test(){
        Test.startTest();
        LeadProcessor leadBatch = new LeadProcessor();
        Id batchId = Database.executeBatch(leadBatch);
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}