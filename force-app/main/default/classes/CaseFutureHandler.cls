public with sharing class CaseFutureHandler {

@future
public static void updateCaseComments(List<Id>caseIds){
//query directly caseComment record
List<CaseComment> c= [SELECT Id, CommentBody FROM CaseComment WHERE ParentId IN :caseIds];
for(CaseComment cc : c){
if (cc.CommentBody == null) {
        cc.CommentBody = 'Case is closed';
    } else if (!cc.CommentBody.contains('Case is closed')) {
        cc.CommentBody += ' - Case is closed';
    }
//cc.Reviewed__c = true;
}
if(!c.isEmpty()){
 update c;
}

}
}