public class SOQLDemo {
    
    public static void parentToChildDemo() {
        
        List<Account> accList = [SELECT Id,Name,(Select Id,FirstName, LastName FROM Contacts)
                                 FROM Account WHERE Rating = 'Hot'];
        
        for(Account acc : accList){
            System.debug('Account Name : '+acc.Name);
            for(Contact con : acc.Contacts){
                System.debug(con.FirstName + ' ' + con.LastName);
            }
        }
    }
    
    public static void aggDemo(){
        AggregateResult[] groupedResults = [SELECT Account.Name, Sum(Amount) FROM Opportunity GROUP BY Account.Name];
        System.debug(groupedResults );
        for( AggregateResult ar : groupedResults){
            System.debug('Account ID = ' + ar.get('Name'));
            System.debug('Sum of Amount ' + ar.get('expro0'));
        }
    }
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