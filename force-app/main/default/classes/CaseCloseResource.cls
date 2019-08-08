@RestResource(urlMapping='/Case/*')
global with sharing class CaseCloseResource {

    @HttpPost
    global static void closeCase(String razon){
        system.debug('caso id '+ razon);
        RestRequest request = RestContext.request;
        system.debug('caso request '+ request);
        String[] idCasoACerrar = request.requestURI.split('/');
        system.debug('caso id '+ idCasoACerrar[2]);
        
		Case caso = [SELECT id, reason FROM Case where id =: idCasoACerrar[2]];
        Set<id> setIdCaso = new Set<id>{caso.id};
        CaseService.closeCases(setIdCaso,razon);
    }
}