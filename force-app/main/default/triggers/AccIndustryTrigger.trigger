trigger AccIndustryTrigger on Account (before insert,after insert,before update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.ratingUpdate(Trigger.New ,null);
          AccountTriggerHandler.copyBillingAddress(Trigger.New, null);
            
        }else if(Trigger.isAfter){
           //AccountTriggerHandler.relatedOpp(Trigger.New);
            //AccountTriggerHandler.relatedContact(Trigger.new);
            //AccountTriggerHandler.checkboxAccount(Trigger.new);
        
        }
    }
        if(Trigger.isUpdate){
            if(Trigger.IsBefore){
                //AccountTriggerHandler.updateAccountPhone(Trigger.new , Trigger.Old);
                AccountTriggerHandler.copyBillingAddress(Trigger.New, Trigger.Old);          }
                 AccountTriggerHandler.ratingUpdate(Trigger.New ,Trigger.Old);
}  
    
}