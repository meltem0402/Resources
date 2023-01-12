public with sharing class ApexQ9 {
    public static void oppRelatedAccountAmount() {
        List<Account> accList= new List<Account>([SELECT Id, Name, (SELECT Name, Amount
FROM Opportunities) FROM Account WHERE Phone!=Null ]);
for (Account acc : accList){
Decimal totalAmount = 0; 
for(Opportunity opp: acc.Opportunities){
if(opp.Amount!=Null){ TotalAmount+=opp.Amount;
} }
System.debug('Account Name:' + acc.name
+', Number of Opportunities ' + acc.Opportunities.size() +', TotalAmount:'+TotalAmount);
}

    }
}