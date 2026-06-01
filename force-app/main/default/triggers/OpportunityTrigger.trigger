trigger OpportunityTrigger on Opportunity (before insert, before update) {
    if(Trigger.isBefore){
    if(Trigger.isInsert){
    OpportunityTriggerHandler.handleBeforeInsert(Trigger.new);
}
else if(Trigger.isUpdate){
    OpportunityTriggerHandler.handleBeforeUpdate(Trigger.new,Trigger.oldMap);
}
}
}