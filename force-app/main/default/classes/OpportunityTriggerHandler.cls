public class OpportunityTriggerHandler {
    public static void updateDescription(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount != null && opp.Amount >=100000){
                opp.Description = 'Hot Opportunity';
            }
        }
    }
    public static void latestOpportunityAmount(List<Opportunity> oppList){
        List<Account> accList = new List<Account>();
        for(Opportunity opp: oppList){
            if(opp.Amount!=null && opp.AccountId!=null){
            Account acc = new Account();
            acc.Id = opp.AccountId;
            acc.Recent_Opportunity_Amount__c = opp.Amount;
            accList.add(acc);
        }
            if(accList.size()>0){
        update accList;
    }
}
}
    public static void UpdateDescriptionStage(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){
        for(Opportunity opp : oppList){
            if(oldMap == null || opp.StageName != oldMap.get(opp.Id).StageName){
                if(opp.Description == 'Closed Won'){
                    opp.Description = 'Opportunity is Closed Won';
                }else if(opp.Description == 'Closed Lost'){
                    opp.Description = 'Closed Lost';
                }else{
                    opp.Description = 'Opportunity is Open';
                }
            }
        }
        
        
        
        
        
        
    }
}