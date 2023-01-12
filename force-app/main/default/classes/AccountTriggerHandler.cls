public class AccountTriggerHandler {
    public static void ratingUpdate(List<Account> accList){
        for(Account acc: accList){
        if(acc.Industry != null && acc.Industry == 'Media'){
            acc.Rating = 'Hot';
        }
    }
    }
    public static void relatedOpp(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : accList){
            if(acc.Active__c == 'Yes'){
           
             Opportunity opp = new Opportunity();
             opp.Name = acc.Name;
             opp.CloseDate = system.today();
             opp.StageName = 'Qualification';
             opp.AccountId = acc.Id;
             oppList.add(opp);
           
             
            }
            insert oppList;
            }
        }
    public static void relatedContact(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList){
        Contact con = new Contact();
         con.LastName = acc.Name;
         con.AccountId = acc.Id;
         conList.add(con);
        }
        insert conList;
       
    }
    
    
    }