global class LeadProcessor implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
       return Database.getQueryLocator('SELECT id, LeadSource FROM Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> records){
        List<Lead> candidatosActualizar = new List<Lead>();
        for(Lead candidato: records){
            candidato.LeadSource = 'Dreamforce';
            candidatosActualizar.add(candidato);
        }
        update candidatosActualizar;
    }    
    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    } 
}