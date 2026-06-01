public with sharing class OpportunityTriggerHandler {
public static void handleBeforeInsert(List<Opportunity> oppList){
   applyPriorityLogic(oppList,null);
}

public static void handleBeforeUpdate(List<Opportunity> oppList,Map<Id, Opportunity> oldOppMap ){
  applyPriorityLogic(oppList,oldOppMap );
}

private static void applyPriorityLogic(List<Opportunity> oppList,Map<Id, Opportunity> oldOppMap){
 Date today= Date.today();
 Date sevenDaysFromNow = today.addDays(7);

 for(Opportunity opp : oppList){

//null check
 if(opp.Amount==null ||opp.CloseDate==null){
continue;
}

//if oldOppMap not null, check if values aren't updated
if(oldOppMap!= null){
Opportunity oldOpp= oldOppMap.get(opp.Id);
if(oldOpp!=null && (opp.Amount == oldOpp.Amount) && (opp.CloseDate == oldOpp.CloseDate)) {
continue;
}
}

//priority logic
if((opp.CloseDate >= today && opp.CloseDate <= sevenDaysFromNow) || (opp.Amount >= 1000000)){
opp.Priority__c='High';
}
else if(opp.Amount >= 200000 && opp.Amount < 1000000){
opp.Priority__c='Medium';
}
else{
opp.Priority__c='Low';
}

}

}

}