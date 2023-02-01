public class ApexQ20 {
    public static void oppCreatedLastMonth(){
    List<Opportunity> oppList=[SELECT Id,Name,StageName FROM Opportunity WHERE CloseDate= LAST_MONTH];
    List<Opportunity> updatedOpp=new List<Opportunity>();
    
    for(Opportunity opp:oppList){
        opp.StageName='Closed Won';
        updatedOpp.add(opp);
    }
    for(integer i=1;i<=5;i++){
        Opportunity opp= new Opportunity();
        opp.Name='Test Opportunity'+i;
        opp.CloseDate=date.newinstance(2022,12,18);
        Opp.StageName='Qualification';
        updatedOpp.add(opp);
        
    }
    upsert updatedOpp;
}
}