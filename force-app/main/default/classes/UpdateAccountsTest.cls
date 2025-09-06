/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
public class UpdateAccountsTest {
    @isTest
    private static void UpdateAccountsTestBulkified() {
        List<Account> accList = TestUtility.createAccountRecords('Test Acc',4,false );
        List <Contact> conList = TestUtility.createContactRecords('Test Cont',4,false );
        for (Integer i =0;i<4;i++)
        {
            accList[i].Active__c = 'No';
            accList[i].Rating = 'Warm';
        }
        insert accList;
        for (Integer i =0;i<4;i++)
        {
            conList[i].AccountId = accList[i].Id;
        }
        insert conList;
        UpdateAccounts.UpdateAccounts();
        Account updatedAcc = [select Id, Active__c, Rating FROM Account where Id =: accList[0].Id];
        System.assertEquals('Yes',updatedAcc.Active__c);

    }

   // @isTest
    // private static void UpdateAccountsTest() {
    //     // TO DO: implement unit test
    //     Account acc= new Account();
    //     acc.Name = 'Test Account';
    //     acc.Active__c = 'No';
    //     acc.Rating='Warm';
    //     insert acc;

    //     Contact con = new Contact ();
    //     con.FirstName ='Test';
    //     con.LastName='Test Cont';
    //     con.AccountId = acc.Id;
    //     insert con;
          
    //     UpdateAccounts.UpdateAccounts();
    //     Account updatedAcc = [select Id, Active__c, Rating FROM Account where Id =: acc.Id];
    //     System.assertEquals('Yes',updatedAcc.Active__c);
    // }
}