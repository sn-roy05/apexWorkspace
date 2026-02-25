@isTest
public class dailyOppProcessorTest {
    @isTest
    private static void testSchedulableApex(){
        String sch= '0 0 0 5 1 ? 2026'; //Cron expression - Every day at midnight 
        
        //create test data
        List<Opportunity> opp = new List<Opportunity>();
        for(Integer i =0 ;i<400;i++){
            if(i<250){
                opp.add(new Opportunity(Name='TestOpp',StageName='Needs Analysis',CloseDate=System.today()));}
                else{
                    opp.add(new Opportunity(Name='TestOpp',StageName='Needs Analysis',CloseDate=System.today(),LeadSource='other'));
                }
        }
        
        Test.startTest();
        String scheduleId = System.schedule('Process Opportunity', sch,new dailyOppProcessor());
        Test.stopTest();
        List <Opportunity> updatedOppList =[SELECT Id,Name FROM Opportunity WHERE LeadSource='Web'];
        System.assertEquals(200,updatedOppList.size());
    } 

}