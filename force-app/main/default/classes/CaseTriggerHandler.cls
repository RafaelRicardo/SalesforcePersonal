public class CaseTriggerHandler {
    
    public static void gestionAccion(Boolean isBefore, Boolean isAfter, Boolean isDelete,Boolean isInsert,
    Boolean isUpdate,List<Case> newList,Map<id,Case> newMap,List<Case> oldList,Map<id,Case> oldMap){
                                         
     if(Trigger.isBefore){
         if(Trigger.isUpdate)CaseTriggerHandler.controlaBeforeUpdate(oldList,newList,oldMap,newMap);  
         if(Trigger.isInsert)CaseTriggerHandler.controlaBeforeUpdate(oldList,newList,oldMap,newMap);  
     }else if(Trigger.isAfter){
         
     }                                                                     
  }
    
    private static void controlaBeforeInsert(List<Case> oldList,List<Case> newList,
                                             Map<id,Case> oldMap,Map<id,Case> newMap){
      for(Case caso: newList){
                                      
       }
                                                 
     for(Case caso: oldList){
                                      
       }
    }
    
    private static void controlaBeforeUpdate(List<Case> oldList,List<Case> newList,
                                             Map<id,Case> oldMap,Map<id,Case> newMap){
       for(Case caso: newList){
           if(caso.Description != null && caso.Description != ''){
               caso.Subject = caso.Subject + ' Actualizado';
           }                                       
       }
    }
    
}