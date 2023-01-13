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
}