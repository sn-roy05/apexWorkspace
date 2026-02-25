public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> accList){
        for(Account acc:accList)
        acc.Description ='Test Description';
    }

}