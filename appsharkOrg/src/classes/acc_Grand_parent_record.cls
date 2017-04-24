public class acc_Grand_parent_record {
    list<id> occid = new list<id>();
    list<Account> objacc1 = new list<Account>();
    public void Method_grand_parent(list<Account> TriggerAcc)
    {
        for(Account objacc : TriggerAcc)
        {
        if(objacc.ParentId!=null)
        {
                occid.add(objacc.ParentId);
        }
        }
        objacc1 =[SELECT ParentId, Name FROM Account WHERE Id =:occid];
    }
}