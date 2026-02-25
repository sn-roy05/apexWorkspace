@isTest
public class UpdateParentAccountTest {
    @testSetup
    static void setup(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<100;i++){
            accList.add(new Account(Name='TestAcc' + i));   
        }
        accList.add( new Account(Name='ParentAcc'));
        insert accList;
    }
    
    @isTest
    private static void testQueueable(){
        Id pId= [SELECT Id FROM Account WHERE Name='ParentAcc'][0].id;
        List<Account> acc=[SELECT Id FROM Account WHERE Name LIKE 'TestAcc%'];
        UpdateParentAccount obj=new UpdateParentAccount(acc,pId);
        Test.startTest();
        System.enqueueJob(obj);
        Test.stoptest();
        System.assertEquals(100,[SELECT count() FROM Account WHERE ParentId =:pId]);
    }
}