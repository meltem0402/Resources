trigger AccIndustryTrigger on Account (before insert,after insert,after update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.ratingUpdate(Trigger.New);
            
        }else if(Trigger.isAfter){
           //AccountTriggerHandler.relatedOpp(Trigger.New);
            //AccountTriggerHandler.relatedContact(Trigger.new);
            AccountTriggerHandler.checkboxAccount(Trigger.new);
        
        }
    }
    
   
}