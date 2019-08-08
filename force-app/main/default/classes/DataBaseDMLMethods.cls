public class DataBaseDMLMethods {

    //este metodo muestra como se crean dos sObject 
    //siendo una copia del que está, (ver pagina 34 Database DML Methods)
    //del PDF Apex Workbook
    public void insertaDatabaseMethods(){        
    Invoice_Statement__c inserta1 =
    new Invoice_Statement__c(Description__c = 'Invoice 1');
    
    Invoice_Statement__c inserta2 =
    new Invoice_Statement__c(Description__c = 'Another invoice');
    
    Database.SaveResult[] db_save = Database.insert(
        new Invoice_Statement__c[]{inserta1, inserta2},false);
    
    for(Database.SaveResult sr : db_save){
        if(!sr.isSuccess()){
           Database.Error err = sr.getErrors()[0];
            System.debug('err: '+ err);
        }
      }
    }
   
    //este metodo primero consulta los sObject fueron creados
    //para luego eliminarlos (ver pagina 34 Database DML Methods)
    //del PDF Apex Workbook
    public void eliminaDatabaseMethods(){
        Invoice_Statement__c[] elimina = [SELECT Id
                                          FROM Invoice_Statement__c
                                          WHERE Description__c = 'Invoice 1'
                                          OR Description__c = 'Another invoice'];
    Database.DeleteResult[] deleteresult = Database.delete(elimina, false);
        for(Database.DeleteResult dr: deleteresult){
            if(!dr.isSuccess()){
                Database.Error err = dr.getErrors()[0];
            }
        }
    }
    
    //como sabemos los registros eliminados se van a la papelera de 
    //reciclaje durante 15 dias; porlo tanto podemos restaurar los
    //Este metodo restauralos sObject eliminados en el metodo anterior
    public void restaura_sObjectEliminadosDatabaseMethods(){
        Invoice_Statement__c[] restaura = [SELECT Id
                                           FROM Invoice_Statement__c
                                           WHERE Description__c = 'Invoice 1'
                                           OR Description__c = 'Another invoice'
                                           ALL ROWS];
     Database.UndeleteResult[] undelRes = Database.undelete(restaura, false);
        for(Database.UndeleteResult dr: undelRes){
            if(!dr.isSuccess()){
                Database.Error err = dr.getErrors()[0];
            }
        }
    }
    
    
}