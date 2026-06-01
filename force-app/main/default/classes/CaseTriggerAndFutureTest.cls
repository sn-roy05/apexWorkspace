@isTest
public class CaseTriggerAndFutureTest {

    @isTest
    static void testFutureMethod() {

        // Create Cases
        List<Case> cases = new List<Case>();
        for(Integer i=0; i<3; i++){
            cases.add(new Case(
                Subject = 'Case' + i,
                Status = 'New',
                Origin = 'Phone'
            ));
        }
        insert cases;

        // Create Comments
        List<CaseComment> comments = new List<CaseComment>();
        for (Case c : cases) {
            comments.add(new CaseComment(
                ParentId = c.Id,
                CommentBody = 'Test comment',
                IsPublished = true
            ));
        }
        insert comments;

        // Update Cases → Trigger fires
        for (Case c : cases) {
            c.Status = 'Closed';
        }

        Test.startTest();
        update cases;
        Test.stopTest();

        // Validate
        Set<Id> caseIds = new Set<Id>();
        for(Case c : cases){
            caseIds.add(c.Id);
        }

        List<CaseComment> updated = [
            SELECT Id, CommentBody 
            FROM CaseComment 
            WHERE ParentId IN :caseIds
        ];

        System.assertEquals(3, updated.size());

        for(CaseComment cc : updated){
            System.assert(
                cc.CommentBody.contains('Case is closed'),
                'Each comment should be updated'
            );
        }
    }
}