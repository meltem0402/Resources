@isTest
public class CaseTriggerHandlerTest {
    @isTest
    public static void tescaseUpdateRelatedAccount(){
        List<Account> accList = new List<Account>();
        List<Case> caseList = new List<Case>();
        
        for(Integer i=1;i<=5;i++){
            Account acc = new Account();
            acc.Name = 'Test'+ i;
            accList.add(acc);
        }
        insert accList;
        
        for(Account acc : accList){
            Case cs = new Case();
            cs.AccountId = acc.Id;
            cs.Origin = 'Phone';
            cs.Status = 'New';
            caseList.add(cs);
           
        }
        
        test.startTest();
        insert caseList;
        test.stopTest();
        
        List<Case> newCaseList = [SELECT Id, CaseNumber FROM Case WHERE Id =: caseList[0].Id];
        List<Account> updatedAcc = [SELECT Id,Latest_Case_Number__c FROM Account WHERE Id =: accList[0].Id];
        system.assertEquals(newcaseList[0].CaseNumber, updatedAcc[0].Latest_Case_Number__c);
    }
}