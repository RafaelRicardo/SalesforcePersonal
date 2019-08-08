trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {

    List<Task> tareas = new List<Task>();
    
    for(Opportunity op: Trigger.New){
        if((op.StageName).equals('Closed Won')){
            tareas.add(new Task(Subject = 'Follow Up Test Task',
                                WhatId = op.id));
        }
    }
    upsert tareas;
}