({
    packItem: function(component, event, helper){
        var varItem = component.get("v.item");
        varItem.Packed__c = true;
        component.set("v.item",varItem);
        					  
        var componenteBoton = event.getSource();        
        componenteBoton.set("v.disabled",true);
    }
})