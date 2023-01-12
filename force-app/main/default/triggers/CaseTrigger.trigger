trigger CaseTrigger on Case (after insert) {
     if(Trigger.isInsert){
         if(Trigger.isAfter){
             CaseTriggerHandler.caseUpdateRelatedAccount(Trigger.New);
         }
}
}