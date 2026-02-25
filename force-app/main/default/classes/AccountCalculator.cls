//create an async future method to populate the number of contacts on an account
public class AccountCalculator {
    @future
    public static void countContact(List<Id>accIds){
        List<Account> accList= [SELECT Id,(SELECT Id from Contacts) FROM Account WHERE Id IN: accIds];
        for(Account acc: accList){
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        if(!accList.isEmpty())
        update accList;
    }

}
//to call the class 
//List<Account>accList = [SELECT Id from Account LIMIT 5];
//List<Id>accIds= new List<Id>();
//for (Account acc : accList){
//    accIds.add(acc.Id);
//}
//AccountCalculator.countContact(accIds);