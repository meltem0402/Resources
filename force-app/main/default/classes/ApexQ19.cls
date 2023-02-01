public class ApexQ19 {
    public static void updateAccPhoneAndNewAcc(){
        List<Account> accList=[SELECT Id,Name,Phone FROM Account WHERE Phone='654321'];
        List<Account> updatedAcc=new List<Account>();
        if(!accList.isEmpty()){
        for(Account acc:accList){
            acc.Phone='123456';
            updatedAcc.add(acc);
        }
        }
        for(integer i=1;i<=5;i++){
            Account acc= new Account();
            acc.Name='Test Account'+i;
            updatedAcc.add(acc);
            
        }
        if(!updatedAcc.isEmpty()){
        upsert updatedAcc;
    }
    }
}