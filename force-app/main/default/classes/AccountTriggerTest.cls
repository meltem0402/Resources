@isTest
public class AccountTriggerTest {
   @isTest
    public static void updateName_SingleAcc_1(){
        //prep data
        Account singleTestAcc = New Account(name='test1111',phone='12345');
        insert singleTestAcc;
        
        //Test
        Account singleResultAcc = [SELECT Id,Name,Phone FROM Account];
        system.assert(string.isNotblank(singleResultAcc.id));
        system.assertEquals('TEST1111',singleResultAcc.name );
    }
    
    
     @isTest
    public static void updateName_MultiAcc_2(){
        
        // Prep Data
         
        List<Account> multiAcc = New List<Account>();
        for(Integer testnumber = 1;testnumber<=100;testnumber++){
            Account singleTestAcc = New Account(Name='test'+testnumber, phone='123'+testnumber);
            multiAcc.add(singleTestAcc);
        }
        
        insert multiAcc;
        
        // Test
        
        List<Account> resultAcc = [SELECT id, Name,Phone
                                  FROM Account];
        
        System.assertEquals(100, resultAcc.size());
        
        Integer testNo=1;
        for(Account singleTestAcc:resultAcc){
            
            System.assertEquals('TEST'+testNo, singleTestAcc.Name);
            testNo++;
        }
      
        }
    
     @isTest
    public static void updateName_SingleAcc_3(){
        
        // Prep Data
        Account singleTestAcc = New Account(name='test1111');
       
        String Errormsg;
        
        try{
             insert singleTestAcc;
        }catch(Exception e){
            Errormsg= e.getMessage();
        }
        
        // Test
        
       System.assert(Errormsg.contains('Phone'));
        
        
    }
    
}