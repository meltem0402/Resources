public class DMLDemo {
    public static void databaseClassDemo(){
        
        List<Contact> conList = new List<Contact>{
            new Contact(FirstName = 'Joe',LastName = 'Smith'),
                new Contact(FirstName = 'Kathy',LastName = 'Smith'),
                new Contact()};
                    //insert conList;  //DML Statement
                    Database.SaveResult[] srList = Database.insert(conList,false);
        //Iterate through each returned result
        for(Database.SaveResult sr : srList ){
            if(sr.isSuccess()){
                //Operation was successful, so get the ID of the record taht was processed
                System.debug('Successfully inserted contact. Contact ID: '+sr.getId());
            }else{
                //Operation failed, so get all errors
                for(Database.error err : sr.getErrors()){
                    System.debug('The following error has occured.');
                    System.debug(err.getStatusCode() + ' : '+ err.getMessage());
                    System.debug('Contact fields taht affected this error: '+err.getFields());
                }
            }
        }
        
    }
    public static void undeleteDemo(){
        List<Account> acclist = new List<Account>();
        
        accList =[SELECT Id,Name, Rating FROM Account
                  WHERE Name Like 'Test DML %' ALL ROWS];
        if(!accList.isEmpty()){
            undelete acclist;
        }
        
    }
    
    public static void deleteDemo(){
        List<Account> acclist = new List<Account>();
        
        accList =[SELECT Id,Name, Rating FROM Account
                  WHERE Name Like 'Test DML %'];
        if(!accList.isEmpty()){
            delete accList;
        }
        
    }
    
    public static void upsertDemo(){
        
        List<Account> acclist = new List<Account>();
        
        accList =[SELECT Id,Name, Rating FROM Account
                  WHERE Rating = 'Hot'];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Industry = 'Energy';
            }
        }
        try{
            for(Integer i=1; i<=5; i++){
                Account acc = new Account();
                accList.add(acc);
            }
            if(!accList.isEmpty()){
                upsert accList;
            }
        }
        catch(DMLException e){
            system.debug(e);
        }
    }
    public static void updateDemo(){
        List<Account> acclist = new List<Account>();
        
        accList =[SELECT Id,Name, Rating FROM Account
                  WHERE Rating = 'Hot'];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Industry = 'Media';
            }
            update accList;
        }
    }
    
    public static void insertDemoSingle(){
        Account acc = new Account();
        acc.Name = 'Test DML 1';
        insert acc;
        
        System.debug('Account Id = ' + acc.Id);
        
        Account acc1 = new Account();
        acc1.Name = 'Test DML 2';
        insert acc1;
    }
    public static void insertDemoBulk(){
        
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        Account acc = new Account();
        acc.Name = 'Test DML 7';
        accList.add(acc);
        
        Account acc1 = new Account();
        acc1.Name = 'Test DML 8';
        accList.add(acc1);
        insert accList;
        
        Contact con = new Contact();
        con.LastName = acc.Name;
        con.FirstName = acc.Name;
        con.AccountId = accList[0].Id;
        conList.add(con);
        
        Contact con1 = new Contact();
        con1.LastName = acc1.Name;
        con1.FirstName = acc1.Name;
        con1.AccountId = accList[1].Id;
        conList.add(con1);
        
        insert conList;
    }
    public static void insertDemoBulkfor(){
        List<Account> accList = new List<Account>();
        for(Integer i=1; i<=200; i++){
            Account acc = new Account();
            acc.Name = 'Test DML ' + i;
            accList.add(acc);
        }
        insert accList;
        
    }
}