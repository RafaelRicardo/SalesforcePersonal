global class scheduleEcadenado implements Schedulable{

        global void execute(SchedulableContext ctx) {
        // The query used by the batch job.
        String query = 'SELECT Id,CreatedDate FROM Merchandise__c ' +
            'WHERE Id NOT IN (SELECT Merchandise__c FROM Line_Item__c)';
        batchEncadenado c = new batchEncadenado(query);
        Database.executeBatch(c);
    }
}