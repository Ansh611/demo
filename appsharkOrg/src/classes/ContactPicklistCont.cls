/*
Discription -: Search Account and display related contact and opportunity
Date -: 30/12/16
*/
public  class ContactPicklistCont {
    public string recid{get;set;}
    public String accountName { get; set; }
    public list <contact> contactList { get; set; }
    public list <Opportunity> LstOppo { get; set; }  
   // public list <Opportunity> LstcntOppo { get; set; } 
    public Map<Id, Contact> mapConId{get;set;}
    public Map<String, List<OpportunityContactRole>> mapCntOpp{get;set;}
    public void getcont() {
        list <Account> lstAcc = new list<Account>(); //hold contact, Account ,Opportunity
        lstAcc = [select name,(select id,name from contacts),(select id,name from opportunities) from account where name =:accountName];
       // List<Opportunity> LstcntOppo = [Select name,(Select OpportunityId, ContactId From OpportunityContactRoles) From Opportunity ];

       ///////////////////
      for(Account objAcc : lstAcc)
        {
            contactList = objAcc.Contacts;
            LstOppo=objAcc.opportunities;
            
        }
        mapConId = new Map<Id, Contact>(contactList);
        for(OpportunityContactRole ocr : [select OpportunityId,ContactId from OpportunityContactRole])
        {
            system.debug('@@ocr.ContactId'+ocr.ContactId);
            if(mapCntOpp.get(mapConId.get(ocr.ContactId).Name) == null)
            {
                mapCntOpp.put(mapConId.get(ocr.ContactId).Name, new List<OpportunityContactRole>());
            }
            mapCntOpp.get(mapConId.get(ocr.ContactId).Name).add(ocr);

                //oppToUpdate = new Opportunity(Id = oppId, Primary_Contact__c = ocr.ContactId);
        }  

       ////////////// 
        
        
        
     /*   
        for(Account objAcc : lstAcc)
        {
            contactList = objAcc.Contacts;
            LstOppo=objAcc.opportunities;
            
        }
        mapConId = new Map<Id, Contact>(contactList);
        for(Opportunity opp : LstcntOppo)
        {
            if(mapCntOpp.get(mapConId.get(opp.OpportunityContactRoles.ContactId).Name) == null)
            {
                mapCntOpp.put(mapConId.get(opp.OpportunityContactRoles.ContactId).Name, new List<Opportunity>() );
            }
            mapCntOpp.get(mapConId.get(opp.OpportunityContactRoles.ContactId).Name).add(opp);
        }
      //  LstcntOppo = [Select name,(Select OpportunityId From OpportunityContactRoles) From Opportunity where id in (Select OpportunityId From OpportunityContactRole where ContactId =: recId)];
    */    
    }
/*     public void getcontoppo() {
         System.debug('recId  '+recId); 
        LstcntOppo = [Select name,(Select OpportunityId From OpportunityContactRoles) From Opportunity where id in (Select OpportunityId From OpportunityContactRole where ContactId =: recId)];
         System.debug('LstOppo   '+LstOppo);
     }*/
}