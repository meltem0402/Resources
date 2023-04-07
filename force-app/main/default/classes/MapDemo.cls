public class MapDemo {
    
    public static void SObjectDemoWithoutLoop(){
        
        List<Account> accList = new List<Account>();
        accList = [SELECT Name, CreatedDate FROM Account LIMIT 5];
        
        Map<Id,Account> accMap = new Map<Id,Account>(accList);
        
        system.debug('Map Contains....'+ accMap);
        system.debug('Map Keys....'+ accMap.keySet());
        system.debug('Map Values....'+ accMap.values());
    }
    public static void SObjectDemoWithLoop(){
        
        List<Account> accList = new List<Account>();
        accList = [SELECT Name, CreatedDate FROM Account LIMIT 5];
        
        Map<Id,Account> accMap = new Map<Id,Account>(accList);
        
        for(Account acc : accList){
            accMap.put(acc.Id,acc);
            
        }
        
        system.debug('Map Contains....'+ accMap);
        system.debug('Map Keys....'+ accMap.keySet());
        system.debug('Map Values....'+ accMap.values());
        
    }
    
    public static void demo(){
        
        Map<Integer,String> colors = new Map<Integer, String>();
        Map<Integer,String> morecolors = new Map<Integer, String>();
        Map<Integer,String> colonedMap = new Map<Integer, String>();
        Set<Integer> intSet = new Set<Integer>();
        List<String> strList = new List<String>();
        colors.put(1,'Green');
        colors.put(2,'Blue');
        colors.put(3,'Red');
        colors.put(4,'Blue');
        system.debug('Map Contains....' + colors);
        colors.put(2,'Yellow');
        system.debug('Map Contains....' + colors);
        morecolors.put(10,'Black');
        morecolors.put(20,'White');
        colors.putAll(morecolors);
        system.debug('Map Contains....' + colors);
        colors.remove(1);
        system.debug('Map Contains....' + colors);
        system.debug('Map Contains....' + colors.size());
        system.debug('Map Contains....' + colors.values());
        colonedMap = colors.clone();
        system.debug('Map Contains....' + colonedMap);
        system.debug('Map Contains....' + colonedMap.containsKey(50));
        system.debug('Map Contains....' + colonedMap.containsKey(10));
        system.debug('Map Contains....' + colonedMap.equals(colors));
        system.debug('Map Contains....' + colonedMap.equals(morecolors));
        system.debug('Map Contains....' + colonedMap.get(10));
        system.debug('Map Contains....' + colonedMap.isEmpty());
        system.debug('Map Keys....' + colonedMap.keySet());
        
        intSet = colonedMap.keySet();
        strList = colonedMap.values();
        System.debug('Set Contains....'+ intSet);
        System.debug('List Contains....'+ strList);
        
    }
    
}