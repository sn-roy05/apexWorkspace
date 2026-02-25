//batch class implementation for updating leadsource in opportunity records 
public class OppProcessor implements Database.Batchable<sObject>, Database.stateful {
    //database.stateful used to retain state of recordCount variable for this complete process
    
    public Integer recordCount =0 ;
    public Database.QueryLocator start(Database.BatchableContext bc){
       return Database.getQueryLocator([SELECT Id,Name from Opportunity]);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> oppList){
        for(Opportunity opp:oppList){
            opp.LeadSource = 'Web';
        }
        update oppList;
        recordCount += oppList.size();
    }

    public void finish(Database.BatchableContext bc){
        System.debug('Total opportunity processed '+ recordCount);
    }
}

// to call the class ,use below code in anonymous window
// OppProcessor opps=new OppProcessor();
//Id batchId= database.executeBatch(opps,10);