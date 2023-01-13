@isTest
public class OpportunityTriggerHandlerTest {
     @isTest
    public static void UpdateDescTest(){
        //Create Data
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i =1; i<=5; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'TestOpp' + i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.Amount = 200000;
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        Test.stopTest();
        
        List<Opportunity> updatedOppList = [SELECT ID,Description FROM Opportunity WHERE Id =: oppList[0].Id];
        system.assertEquals('Hot Opportunity', updatedOppList[0].Description );
    }
    @isTest
    public static void testlatestOpportunityAmount(){
      List<Account> accList = new List<Account>();
      List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=1;i<=5;i++){
         Account acc = new Account();
         acc.Name = 'Test'+ i;
         accList.add(acc);
        }
        insert accList;
        
        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = date.today();
            opp.AccountId = acc.Id;
            opp.Amount = 20000;
            oppList.add(opp);
        }
        
        test.startTest();
        insert oppList;
        test.stopTest();
        
        List<Account> updatedAcclist =[SELECT Id, Recent_Opportunity_Amount__c  FROM Account WHERE Id =: accList[0].Id];
        List<Opportunity> newOppList = [SELECT Id, Amount FROM Opportunity WHERE Id =: oppList[0].Id];
        system.assertEquals(newOppList[0].Amount , updatedAccList[0].Recent_Opportunity_Amount__c);
    }
}