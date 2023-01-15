public class ApexQ15 {
    public static void insertAccountWithOpp(){
        List<Account> accList = new List<Account>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=1;i<=5;i++){
            Account acc = new Account();
            acc.Name= 'Insert Account '+i;
            accList.add(acc);
            
        }
        if(!accList.isEmpty()){
        insert accList;
        }
        for(Account acc: accList){
            for(Integer i=1;i<=3;i++){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name+ i;
                opp.CloseDate = date.today();
                opp.StageName = 'Qualification';
                opp.AccountId = acc.Id;
                oppList.add(opp);
            }
        }
        if(!oppList.isEmpty()){
        insert oppList;
        }
    }
}