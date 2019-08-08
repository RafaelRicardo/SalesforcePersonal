global class batchEncadenado implements Database.Batchable<sObject>{
	
    global final String query;
    global String errores {get;set;}
    
    global batchEncadenado(String q) {
        query = q;
        errores = '';
    }

    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC,List<sObject> scope){
        try{    
        delete scope;
            System.debug('despues de update: '+ scope);
        System.assertEquals(scope, null);
            System.debug('despues de assertequals: '+ scope);
        }catch(Exception exe){
            System.debug('Mensaje de error: '+ exe.getCause());
            errores = exe.getCause() + ' - ' + exe.getLineNumber() + ' & ';
        }
          //  Database.emptyRecycleBin(scope);
        }
    
    global void finish(Database.BatchableContext BC){
        enviaEjecucionSchedule();
        eliminaCronTrigger();
        enviaMensaje(BC);
    }
    
    public void enviaEjecucionSchedule(){
        DateTime n = datetime.now().addMinutes(2);
        String cron = '';
        cron += n.second();
        cron += ' ' + n.minute();
        cron += ' ' + n.hour();
        cron += ' ' + n.day();
        cron += ' ' + n.month();
        cron += ' ' + '?';
        cron += ' ' + n.year();
        String nombre = 'Batch numero '+ cron;
        System.schedule(nombre, cron, new scheduleEcadenado());
    }
    
    public void enviaMensaje(Database.BatchableContext BC){        
        try{
        AsyncApexJob a = consultaAsyncApexJob(BC); 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Record Clean Up Status: ' + a.Status);
            mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures y errores de proceso: '+ errores);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 
        }catch(Exception ex){
            System.debug('Error en el mensaje');
        }
    }
    
    public AsyncApexJob consultaAsyncApexJob(Database.BatchableContext BC){
        return [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :BC.getJobId()];
    }
    
    public void eliminaCronTrigger(){
        try{
        List<CronTrigger> lstCron = [select Id, State, OwnerId, CronExpression, TimesTriggered, NextFireTime from CronTrigger  where NextFireTime = null AND State = 'DELETED'];
        for(CronTrigger crontrigger: lstCron){
        	System.abortJob(crontrigger.id);
        }
        }catch(Exception ex){
            System.debug('Error en la eliminacion del crontrigger');
            errores += ex.getCause() + ' - ' + ex.getLineNumber() + ' & ';
        }
    }    
}