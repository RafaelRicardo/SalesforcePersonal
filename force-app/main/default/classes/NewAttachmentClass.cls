/********************************************************************
*@Author:      Rafael Cardona
*@Funtion:     Clase que me indica como adjuntar archivos en el caso
*@Visualforce: NewAttachment
********************************************************************/
public class NewAttachmentClass {

    public String subject {get; set;}
    public String description {get; set;}
    public String filename {get; set;}
    public Blob filebody {get; set;}

    public PageReference doSubmit() {
        //create a new case
        System.debug('=> '+filename);
        System.debug('*> '+filebody);
        Case basket = new Case(Subject = subject, Description = description);
        insert basket;

        //associate the attachment
        insert new Attachment(Name = filename, Body = filebody, ParentId = basket.Id);

        return null;
    }    
}