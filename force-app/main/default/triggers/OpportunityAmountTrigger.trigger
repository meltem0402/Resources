trigger OpportunityAmountTrigger on Opportunity (before insert,after insert,before update, after update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
          //OpportunityTriggerHandler.updateDescription(Trigger.New);
           OpportunityTriggerHandler.UpdateDescriptionStage(Trigger.new, null);
        }else if(Trigger.isAfter){
            //OpportunityTriggerHandler.latestOpportunityAmount(Trigger.New);
        }
}
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            OpportunityTriggerHandler.UpdateDescriptionStage(Trigger.New, Trigger.OldMap);
        }else if(Trigger.isAfter){
            OpportunityTriggerHandler.createTask(Trigger.New, Trigger.oldMap);
        }
    }
}