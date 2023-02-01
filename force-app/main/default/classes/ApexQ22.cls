public class ApexQ22 {
    public static void undeleteRecords(){
        List<Account> accList=[SELECT Id,Name FROM Account WHERE Phone='123456' ALL ROWS];
        if(!accList.IsEmpty()){
        undelete accList;
    }
    }
}