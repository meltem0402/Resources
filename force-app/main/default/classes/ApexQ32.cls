public class ApexQ32 {
    public static void copyEmpPhoneContact(){
    List<Contact> conEmpList=[SELECT Id,Phone ,Name,Employee__r.Phone__c FROM Contact
                              WHERE CreatedDate=THIS_YEAR];
    
    for(Contact con:conEmpList){
        if(con.Phone==null){
            con.Phone=con.Employee__r.Phone__c;
        }
    }
    if(!conEmpList.isEmpty()){
        update conEmpList;
    }
}
}