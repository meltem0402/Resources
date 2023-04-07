public class LoopDemo {
    
    public static void showList(){
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        Map<Id,Account> accMap = new Map<Id, Account>();
        accList = [Select Id, Name FROM Account Limit 5];
        
        //Iteration on Account List to display data create set anad map
        System.debug('Display Data through List');
        if(accList.size() > 0){
            for(Account acc : accList){
                System.debug(acc.Id + ' - ' + acc.Name);
                accIds.add(acc.Id);       // set is having data
                accMap.put(acc.id, acc);  // map is having data
            
                
        }
        }
                
        
        //Display accIds through set
         System.debug('Display Data through Set');
        if(!accids.isEmpty()){
            for(Id accId : accIds){
                System.debug(accId);
                
            }
        }
            
            //Iterate Map based on Keys
            System.debug('Display Data through Map Keys');
            if(!accMap.isEmpty()){
                for(Id accId : accMap.keyset()){
                System.debug(accId);
            }
                    
        }
        //Iterate Map based on Values
        System.debug('Display Data through Map Values');
            if(!accMap.isEmpty()){
                for(Account acc : accMap.values()){
                System.debug(acc);
            }
                    
        }
        
        /*if(!accList.isEmpty()){
             for(Account acc : accList){
                System.debug(acc.Id + ' - ' + acc.Name);
            }
            
        }*/
    }
    
    public static void sumofNaturalNums(Integer n){
        Integer i, sum=0;
        for(i = 1; i<=n; i++){
            sum = sum+i;
           }
        System.debug('Sum = '+sum);
    }
    public static void tableWithWhile(Integer n){
        Integer i = 1;
        while( i<=10){
            System.debug(n + '*' + i + '=' + n*i);
            i++;
           }
        
    }
    public static void forDemo(){
       
        for(Integer i=1; i<=10; i++){
            System.debug(i);
        }
    
    }
    public static void oddNum(Integer n){
        for(Integer i=1; i<=n; i++){
            if(Math.mod(i, 2) != 0){
                System.debug(i);
            }
        }  
        }
    public static void table(Integer n){
        
        for(Integer i = 1;i<=10; i++){
           System.debug(n*i); 
          
        }
        }
    

}