trigger AccountTrigger on Account (before insert) {
        Boolean isExito = false;    
        List<Account> cuentas = new List<Account>();
        System.debug('Tamaño de cuentas: '+ Trigger.Size);
    if(Trigger.isInsert && Trigger.isBefore){
          for(Integer j=0; j < Trigger.Size; j++){
            if(Trigger.New[j].ShippingState  == Trigger.New[j].BillingState ){
            System.debug('cuenta: '+ Trigger.New[j].ShippingState + ' - ' + Trigger.New[j].BillingState);
            cuentas.add(Trigger.New[j]);                
            }else if(Trigger.New[j].ShippingState  != Trigger.New[j].BillingState){
            System.debug('cuenta: '+ Trigger.New[j].ShippingState + ' - ' + Trigger.New[j].BillingState);
            Trigger.New[j].ShippingState = Trigger.New[j].BillingState;
            cuentas.add(Trigger.New[j]);
            }
        }
        AccountTriggerHandler.CreateAccounts(cuentas);
    }
}