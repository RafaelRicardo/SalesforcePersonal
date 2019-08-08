/***************************************************************************************
*@Function: actuliza adjunto en un registro
*@Exercise: ejercicion de Create a Lightning Component with Server-Side Apex Controller 
            desde el trailhead
****************************************************************************************/

public class AttachmentController {

    
    @AuraEnabled
    public static void updatePicturePath(String recId){
        //In Lightning Experience, Attachments are stored in ContentDocuments
        System.debug('registro que llega: '+ recId);
        ContentDocumentLink docLink = [ SELECT ContentDocumentId
                               FROM ContentDocumentLink
                               WHERE LinkedEntityId = :recId order by Id desc Limit 1];
        //ContentVersion Id uniquely identifies the attachment
		ContentVersion ver = [SELECT Id FROM ContentVersion Where ContentDocumentId = :docLink.ContentDocumentId];
        //ContentVersion ver = [SELECT Id FROM ContentVersion Where ContentDocumentId = '0694M000004OXBvQAO'];
        
        //Update the Picture_Path field with the url of the image
        Speaker__c speaker = [SELECT Id FROM Speaker__c WHERE Id = :recId];
        speaker.Picture_Path__c = '/sfc/servlet.shepherd/version/download/'+ ver.Id;
        upsert speaker;
    } 
   
}