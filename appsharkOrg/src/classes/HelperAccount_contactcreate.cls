/*
      Author       :- Anshul Deshmukh
      Date         :- 21/7/2016
      Discription  :- Trigger to count number of contacts associated with an account  


*/



public class  HelperAccount_contactcreate {

//---------------------------------- for insert and undelete the record----------------
    
public static void beforecontact(list<contact> newtri)
{
Set<Id> aId = new Set<Id>();
        for(Contact opp :newtri){
            aId.add(opp.AccountId);
        }
        List<Account> acc = [select id,Contact_Count__c from Account where Id in:aId];
        List<Contact> con = [select id from contact where AccountId in :aId];

        for(Account a : acc){
            a.Contact_Count__c=con.size();

        }update acc;
    }
   //---------------------------------- for deleting the record---------------------------
    public static void contactdel(list<contact> newtri)
       {
   set<id> bid =new set<id>();
   for(contact con:newtri)
   {
   bid.add(con.AccountId);
      }
      List<Account> acc = [select id,Contact_Count__c from Account where Id in:bid];
        List<Contact> con = [select id from contact where AccountId in :bid];

        for(Account a : acc){
            a.Contact_Count__c=con.size();

           }
           update acc;
}
//------------------------------------for update contact-------------------------------------
public static void updatecontact(list<contact> newtri)
{
set<id> cid =new set<id>();
   for(contact won:newtri)
   {
   cid.add(won.AccountId);
      }
      List<Account> acc = [select id,Contact_Count__c from Account where Id in:cid];
        List<Contact> won = [select id from contact where AccountId in :cid];

        for(Account a : acc){
            a.Contact_Count__c=won.size();

           }
           update acc;
}
}