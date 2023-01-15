public class AccountTriggerHandler {
    public static void ratingUpdate(List<Account> upList,List<Account> accList){
        for(Account acc: upList){
        if((accList == null && acc.Industry != null && acc.Industry == 'Media') 
            || (acc.Industry != null && acc.Industry == 'Media' && acc.Industry != accList[0].Industry)){
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
    public static void checkboxAccount(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc : accList){
            if(acc.Contact__c){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            conList.add(con);
            }
            if(acc.Active__c == 'Yes' && acc.Opportunity__c){
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name = acc.Name;
            opp.StageName = 'Qualification';
            opp.CloseDate = date.today();
            oppList.add(opp);
            }
            
        }
        insert conList;
        insert oppList;
    }
    public static void updateAccountPhone(List<Account> accList, List<Account> upList){
        for(Account acc: accList){
            if(accList != null  &&  accList[0].Phone != upList[0].Phone){
                acc.Description = 'Phone is updated';
                
            }
                
            }
        }
    public static void copyBillingAddress(List<Account> newList , List<Account> accList){
        for(Account acc : newList){
            if((accList == null && acc.CopyBillingToShipping__c) 
               || ( acc.CopyBillingToShipping__c && acc.CopyBillingToShipping__c != accList[0].CopyBillingToShipping__c)){
          acc.ShippingStreet = acc.BillingStreet;
          acc.ShippingCity = acc.BillingCity;
          acc.ShippingCountry = acc.BillingCountry;
          acc.ShippingPostalCode = acc.BillingPostalCode;
          acc.ShippingState = acc.BillingState;  
            }
        }
    }
    
    }