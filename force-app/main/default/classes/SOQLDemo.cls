public class SOQLDemo {
    public static void queryDemo1(){
        
        String indus = 'Energy';
        List<Account> accList = [SELECT Id,Name, Industry, Rating 
                                 FROM Account
                                 WHERE Industry =: indus];
        for(Account acc : accList){
            System.debug(acc);
        }
    }
    public static void queryDemo2(){
        
        Integer Ar = 10000;
        List<Account> accList = [SELECT Id,Name, Industry, Rating, AnnualRevenue
                                 FROM Account
                                 WHERE AnnualRevenue >=: AR];
        for(Account acc : accList){
            System.debug(acc);
        }
    }
    public static void queryDemo3(){
        Integer Ar = 10000;
        Set<Id> accIds = new Set<Id>();
        
        List<Account> accList = [SELECT Id 
                                 FROM Account
                                 LIMIT 10];
        for(Account acc : accList){
            accIds.add(acc.Id);
        }
        List<Account> accList1 = [SELECT Id,Name,Industry, AnnualRevenue 
                                  FROM Account
                                  WHERE Id IN: accIds];
        System.debug(accList1);
        System.debug([SELECT COUNT(Name) FROM Account]);
    }
    
    
    
}