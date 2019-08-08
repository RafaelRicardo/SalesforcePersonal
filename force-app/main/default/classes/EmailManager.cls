/****************************************************************************************************
*@Author:   Rafael Ricardo Cardona Bravo											                *
*@Function: Clase que envia mails obtenida de 														*
            -https://trailhead.salesforce.com/es-MX/modules/apex_database/units/apex_database_intro-*
*@Date:     11-02-2017																				*
*****************************************************************************************************/
public with sharing class EmailManager {
    
    public static void sendMail(String address, String subject, String body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        String[] toAddresses = new String[]{address};
            
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        inspectResults(results);
    }
    
    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;	
        
        for(Messaging.SendEmailResult res: results){
            if(res.isSuccess()){
                System.debug('Email sent successfully');
            }else{
                sendResult = false;
                System.debug('The follow errors occurred ' + res.getErrors());
            }
        }
        return sendResult;
    }
}