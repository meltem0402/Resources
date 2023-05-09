@isTest
public class OpportunityTriggerHandlerTest {
     @isTest
    private static void populateClosedLostReasonTest(){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i = 1; i<=5;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'TestOpp'+ i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            oppList.add(opp);
        }
        test.startTest();
        insert oppList;
        
        try{
            for(Opportunity opp : oppList){
                opp.StageName = 'Closed Lost';
            }
            update oppList;
        }
                    
            catch(Exception e){
            Boolean expectedExceptionThrown 
                = (e.getMessage().contains('Please populate Closed Lost Reason'))? true : false;
                System.assertEquals(true,expectedExceptionThrown , e.getMessage());
                
            }
            Test.stopTest();
 
        }
    }