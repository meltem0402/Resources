trigger OpportunityTrigger on Opportunity (before insert,before update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            
        }else if(Trigger.isAfter){
            
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            OpportunityTriggerHandler.populateClosedLostReason(Trigger.New,Trigger.OldMap);
        }else if(Trigger.isAfter){
            
        }
    }
    

}