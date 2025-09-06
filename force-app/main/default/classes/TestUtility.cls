//To create some generic Test data related methods
//to be used in multiple classes accross the org 
public class TestUtility {
    public static List<Account>  createAccountRecords(String name,Integer count, Boolean isInsert){
        List<Account>accList = new List<Account>();
        for(Integer i =0;i<count;i++)
        {
            Account acc=new Account();
            acc.Name=name + i;
            accList.add(acc);
        }
        if(isInsert)
        {
            insert accList;
        }
        return accList;
    }
    public static List<Contact>  createContactRecords(String name,Integer count, Boolean isInsert){
        List<Contact>conList = new List<Contact>();
        for(Integer i =0;i<count;i++)
        {
            Contact con=new Contact();
            con.LastName=name + i;
            conList.add(con);
        }
        if(isInsert)
        {
            insert conList;
        }
        return conList;
    }

}