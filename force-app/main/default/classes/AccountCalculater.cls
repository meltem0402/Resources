public class AccountCalculater {
    @future
    public static void countContacts(List<Id> accIds){
        List<Account> acclist = [SELECT Id, (SELECT Id FROM Contacts) FROM Account 
                                WHERE Id IN: AccIds];
        for(Account acc : accList){
            acc.Total_Contacts__c = acc.Contacts.size();
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }

}