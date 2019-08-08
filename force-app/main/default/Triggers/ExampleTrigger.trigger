trigger ExampleTrigger on Contact (after insert, after delete) {

    if(Trigger.isInsert){
        Integer recordCount = Trigger.new.size();
        EmailManager.sendMail('rricardocardonab@gmail.com', 'Trailhead Trigger Tutorial', recordCount + ' contact(s) were inserted.');

    }else if(Trigger.isDelete){
        
    }
}