trigger CaseTrigger on Case (before insert, before update, before delete,
                            after insert, after update, after delete, after undelete) {
	
    CaseTriggerHandler.gestionAccion(Trigger.isBefore, Trigger.isAfter, Trigger.isDelete, 
                                     Trigger.isInsert, Trigger.isUpdate, Trigger.NEW, 
                                     Trigger.newMap, Trigger.old, Trigger.oldMap);
}