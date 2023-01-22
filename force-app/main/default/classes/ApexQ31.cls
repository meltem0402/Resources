public class ApexQ31 {
    public static void populateAccountPhoneOnEmp(){
        List<Employee__c> empList = [SELECT ID, Name,Phone__c, Account__r.Phone FROM Employee__c 
                                     WHERE CreatedDate = THIS_YEAR];
        
        for(Employee__c emp:empList){
            if(emp.Phone__c == null){
                emp.Phone__c = emp.Account__r.Phone;
                
            }
        }
        
        if(!empList.isEmpty()){
            update empList;
        }
    }
}