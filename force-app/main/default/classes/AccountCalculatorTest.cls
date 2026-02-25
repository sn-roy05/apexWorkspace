@isTest
public class AccountCalculatorTest {
    @isTest
    private static void countContactTest(){
        List<Account> accList = new List<Account>();
        for (Integer i = 0 ; i < 100; i++){
            accList.add(new Account(Name='Test Account' + i));
        }
        insert accList;
        List<Contact> conList= new List<Contact>();
        List<Id> accIds= new List<Id>();
        for(Account acc : accList){
            conList.add(new Contact(FirstName='Contact',LastName=acc.Name,AccountId=acc.Id));
            accIds.add(acc.Id);
        }
        insert conList;
        Test.startTest();
        AccountCalculator.countContact(accIds);
        Test.stopTest();
        
        List<Account> accs = [SELECT Id,Number_Of_Contacts__c from Account];
        System.assertEquals(1,accs[0].Number_Of_Contacts__c);
            
        
    }
  

}