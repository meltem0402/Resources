public class ApexScenarioDemo {
    
    public static void apexScenario1(){
        
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, (SELECT Id,Name FROM Contacts) FROM Account
                   WHERE Phone != null];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                System.debug(acc.Name + ' has ' + acc.Contacts.size() + ' Contacts related.');
            }
        }
    }
    public static void apexScenario2(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, (SELECT Id,Name,Amount FROM Opportunities) FROM Account
                   WHERE Phone != null];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                Decimal total = 0;
                for(Opportunity opp : acc.Opportunities){
                    if(opp.Amount != null){
                        total = total + opp.Amount;
                    }
                }
                System.debug(acc.Name + ' has ' + total + ' worth Opportinities.');
                
            }
            
        }
        
        
    }
    public static void apexScenario3(){
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [SELECT Id, StageName FROM opportunity WHERE CreatedDate = THIS_YEAR];
        
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Opportunity is Closed Won';
                }else if(opp.StageName == 'Closed Lost'){
                    opp.Description = 'Opportunity is Closed Lost';
                }else{
                    opp.Description = 'Opportunity is Open';
                }
            }
            update oppList;
        }
    }
    public static void apexScenario4(){
        
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, (SELECT Id FROM Contacts) FROM Account];
        
        if(!acclist.isEmpty()){
            for(Account acc : accList){
                acc.Total_Contacts__c = acc.Contacts.size();
            }
            update accList;
        }
        
    }
}