public class SetClass {
    
    public static void demoSobjectWithSet(){
        
        Set<Id> accIds = new Set<Id>();
        List<Account> accList = new List<Account>();
        
        accList = [SELECT Id, Name FROM Account LIMIT 5];
        
        for(Account acc : accList){
            
            AccIds.add(acc.Id);
        }
        System.debug('Set Contains = '+ accIds);
    }
    
    public static void setMethod(){
    
        Set<Integer> intSet = new Set<Integer>();
        List<Integer> intList = new List<Integer>();
        Set<Integer> clonedSet = new Set<Integer>();
        
        intSet.add(10);
        intSet.add(20);
        intSet.add(30);
        
        intList.add(50);
        intList.add(60);
        intSet.addAll(intList);
        
        
        system.debug('Set Contanins = ' + intSet);
        clonedSet = intSet.clone();
        system.debug('Set Contatins = ' + clonedSet);
        system.debug('Element is avaiable = '+ intSet.contains(30));
        system.debug('Element is avaiable = ' + intSet.containsAll(intList));
        
        intSet.remove(20);
        system.debug('Set Contains = '+ intSet);
    }
}