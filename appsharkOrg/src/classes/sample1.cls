public class sample1
{    
    public List<Account> acct {get;set;}
    public sample1()
    {
        acct = [SELECT Name, LastModifiedDate FROM Account where Name ='Dell'];
        
    }    
}