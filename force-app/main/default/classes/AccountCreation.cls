public class AccountCreation {
    
    public static void createAccount(){
        
        Account acc = new Account();
        acc.Name = 'STGS Account';
        
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'STGS Contact';
        
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'STGS Opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today();
        opp.AccountId = acc.Id;
        
        insert opp;
        
        Case c = new Case();
        c.AccountId = acc.Id;
        c.Origin = 'Phone';
        c.Status = 'New';
        
        insert c;
    }

}