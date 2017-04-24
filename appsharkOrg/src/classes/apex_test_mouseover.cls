public class apex_test_mouseover {
  
   
    //Holds list of account records with their childs.
    public list<Account> lstAccCon{set;get;}
    //Retrieving list Account records with their child records.
    public apex_test_mouseover ()
    {
        lstAccCon=[select Name,(select LastName from contacts) from Account];
    }
}