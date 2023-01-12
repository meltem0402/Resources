public class CaseTriggerHandler {
    public static void caseUpdateRelatedAccount(List<Case> caseList){
        List<Account> accList= new List<Account>();
        for(Case c : caseList){
           if(c.AccountId != Null){
               Account acc = new Account();
               acc.Id = c.AccountId;
               acc.Latest_Case_Number__c = c.CaseNumber;
               accList.add(acc);
               
            }
        }
        update accList;
        
        }
    }