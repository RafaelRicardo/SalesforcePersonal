global class MySchedulableClass implements Schedulable{

    global void execute(SchedulableContext ctx){
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                         FROM CronTrigger WHERE Id =: ctx.getTriggerId()];
        
        System.debug('conexpression: '+ ct.CronExpression);
        System.debug('TimesTriggered: '+ ct.TimesTriggered);
        
        Merchandise__c m = new Merchandise__c(Name='Scheduled job item',
                                             Description__c='Created by scheduler',
                                             Price__c=1,
                                             Total_Inventory__c=100);
        insert m;
    }
}