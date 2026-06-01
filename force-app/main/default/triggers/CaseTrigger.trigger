//trigger to call async apex future method for below scenario : 
//Whenever a Case is closed (Status = "Closed"), you need to:
//Update all related child Case Comments (CaseComment object)
//Append a message like "Case is closed" to each comment
//Also update a custom checkbox field Reviewed__c = true on those comments

//to call future method and pass the Id of caseComments
trigger CaseTrigger on Case (after update) {
Set<Id> caseIds= new Set<Id>() ;
for (Case newCase: Trigger.new){
Case oldCase= Trigger.oldMap.get(newCase.Id);
if(newCase.Status == 'Closed' && oldCase.Status != 'Closed'){
caseIds.add(newCase.Id);
}
}
if(!caseIds.isEmpty()){
CaseFutureHandler.updateCaseComments(new List<Id> (caseIds));
}

}