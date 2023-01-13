trigger OpportunityAmountTrigger on Opportunity (before insert,after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
          OpportunityTriggerHandler.updateDescription(Trigger.New);
        }else if(Trigger.isAfter){
            OpportunityTriggerHandler.latestOpportunityAmount(Trigger.New);
        }
}
}