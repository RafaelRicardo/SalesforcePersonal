trigger AccountDeletion on Account (before delete) {
    
    for(Account a: [SELECT id FROM Account WHERE id IN (SELECT AccountId FROM Opportunity) AND Id IN: Trigger.old]){
        Trigger.oldMap.get(a.id).addError('Cannot delete accounts with related opportunities');
    }
}