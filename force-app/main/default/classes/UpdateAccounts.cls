//sObject test class demo Skill Horizon NextGen L-23
public with sharing class UpdateAccounts {
    public static void UpdateAccounts() {
        //query accounts put the ids into a set to not repeat the action
        //contacts having name as Test something and id != null, then we are creating one account & updating the rating
        // , active field and adding it to the list and set 
        // then updating the list
        List <Account> accList = new List <Account>();
        Set<Id> accIdSet = new Set<Id>();
        for(Contact cont : [SELECT Id, Account.Id, Account.Rating, Account.Active__c FROM Contact
                             WHERE Name LIKE '%Test%' AND Account.Id != null]){
                if(!accIdSet.contains(cont.Account.Id)){
                Account acc= new Account();
                acc.Rating='Hot';
                acc.Active__c = 'Yes';
                acc.Id =cont.Account.Id;
                accList.add (acc);
                accIdSet.add(cont.Account.Id);
                }
        }
        if(!accIdSet.isEmpty()){
        update accList; 
        }      
    }
}