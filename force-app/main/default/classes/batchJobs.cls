public class batchJobs{

    public List<BatchJob> batchJobs;
    public Integer numberOfJobs {get; set;}

    public List<BatchJob> getBatchJobs(){
    //Create new list of BatchJobs, a wrapper class that includes the job and percent complete.
    batchJobs = new List<BatchJob>();

    //If number of jobs was not defined, default to 20
    if(numberOfJobs== null || numberofJobs <= 0){
        numberofJobs = 20;
    }

    map<string,string> bgColorMap=new map<string,string>();
    bgColorMap.put('Queued','#f8f8f8');
    bgColorMap.put('Processing','#f8f8f8');
    bgColorMap.put('Aborted','#551A8B');
    bgColorMap.put('Completed','#f8f8f8');
    bgColorMap.put('Failed','#9E0508');
    bgColorMap.put('Preparing','#f8f8f8');

    map<string,string> fgColorMap=new map<string,string>();
    fgColorMap.put('Queued','#F7B64B');
    fgColorMap.put('Processing','#F7B64B');
    fgColorMap.put('Aborted','#B23AEE');
    fgColorMap.put('Completed','#20F472');
    fgColorMap.put('Failed','#FFB6C1');
    fgColorMap.put('Preparing','#F7B64B');

    //Query the Batch apex jobs
    for(AsyncApexJob a : [select TotalJobItems, Status, NumberOfErrors, MethodName, JobType, JobItemsProcessed, ExtendedStatus, Id, CreatedDate, CreatedById, CompletedDate, ApexClassId, ApexClass.Name From AsyncApexJob WHERE JobType='BatchApex' order by CreatedDate desc limit :numberOfJobs]){
        Double itemsProcessed = a.JobItemsProcessed;
        Double totalItems = a.TotalJobItems;

        BatchJob j = new BatchJob();
        j.job = a;

        //Determine the pecent complete based on the number of batches complete
        if(totalItems == 0){
            //A little check here as we don't want to divide by 0.
            j.percentComplete = 0;
        }else{
            j.percentComplete = ((itemsProcessed  / totalItems) * 100.0).intValue();
        }
        j.bgStatusColor=bgColorMap.get(a.Status);
        j.fgStatusColor=fgColorMap.get(a.Status);

        batchJobs.add(j);
    }
    return batchJobs;
}

//This is the wrapper class the includes the job itself and a value for the percent complete
public Class BatchJob{
    public AsyncApexJob job {get; set;}
    public Integer percentComplete {get; set;}
    public string bgStatusColor {get;set;}
    public string fgStatusColor {get;set;}

    public BatchJob(){
        this.job=null;
        this.percentComplete=0;
        bgStatusColor='';
        fgStatusColor='';
    }

    /*--------------------TEST METHOD------------------------*/
  /*  static testMethod void batchStatusBarTest(){    
        list<Account> accts=new list<Account>();
        for(integer i=0;i<(math.round(math.random()*200)+1);i++)
            accts.add(new Account(Name='test'+string.valueof(i)));
        insert accts;

        id batchInstance=database.executeBatch(new test_Batch());

        test.startTest();

        batchJobs controller = new batchJobs();
        controller.getBatchJobs();
        id batchInstance2=database.executeBatch(new test_Batch());
        controller.getBatchJobs();

        test.stopTest();
    }//END batchStatusBarTest*/

}//END class 
}