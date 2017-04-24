public class Flag_update_on_contact 
{
   public static void Flag_update(list<account> lstacc)
   {
      set<string> str = new set<string>();
       string stat;
      
      for (account objacc : lstacc) 
      {
       str.add(objacc.Id);
         stat = objacc.Status__c;
      }
      List<Contact> lstcon = new List <contact>();
        for(contact objcon : [ SELECT Id,status__c,AccountId from contact where AccountId = :str])
        {
            //if(lstcon.size() > 0 )
                objcon.status__c=stat;
                lstcon.add(objcon);
        } 
      update lstcon;
   }
}