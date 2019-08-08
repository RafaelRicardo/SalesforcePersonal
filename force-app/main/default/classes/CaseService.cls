public class CaseService {

    public static void closeCases(Set<id> idCases, String rason){
        System.debug('entro closeCases ');
        List<Case> lstCasos = [SELECT id, reason FROM Case where ID IN: idCases];
        
        for(Case caso: lstCasos){
            caso.reason = rason;
            caso.Status = 'Closed';
        }   
        System.debug('entro closeCases '+lstCasos);
        update lstCasos;
    } 
}