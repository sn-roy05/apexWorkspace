public class UpdateParentAccount implements Queueable {
    private List<Account> accList ;
    private Id parentId;
    
    public UpdateParentAccount(List<Account>accRec,Id id){
        this.accList=accRec;
        this.parentId= id;
    }
    public void execute(QueueableContext bc){
        for(Account a:acclist){
            a.ParentId= parentId;
        }
        update accList;
    }
}
//to call this run below code
//List<Account> acc=[SELECT Id from Account WHERE BillingState = 'NY'];
//Id parentId = [SELECT Id from Account WHERE Name='GenePoint'][0].Id;
//UpdateParentAccount obj=new UpdateParentAccount(acc,parentId);
//Id jobId= System.enqueueJob(obj);