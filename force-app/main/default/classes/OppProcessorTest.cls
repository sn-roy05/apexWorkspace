@isTest
public class OppProcessorTest {
    @isTest
    private static void testBatchClass(){
        //create opportunity 
        List <Opportunity> oppList = new list<Opportunity>();
        for(Integer i =0;i<100;i++){
            oppList.add(new Opportunity(Name='OpportunityTest' + i, StageName='Needs Analysis', CloseDate=System.today()));
            
        }
        insert oppList;
        Test.startTest(); 
        OppProcessor opps=new OppProcessor();
		Id batchId= database.executeBatch(opps,200);
        Test.stopTest();
        List<Opportunity> updateOpp= [SELECT Id,Name,LeadSource from Opportunity WHERE LeadSource = 'Web'];
        System.assertEquals(100,updateOpp.size());
    }

}