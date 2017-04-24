/*Trigger to update cpntact status*/
trigger Flag_update_on_contact on Account (after update) 
{
    //Flag_update_on_contact.Flag_update(trigger.new); 
    set<string> str = new set<string>();     //hold new status
   // set<string> strOld = new set<string>();  //hold old status
    List<Contact> lstcon = new List <contact>(); //hold updated contact record
    string stat;
    string statOld;
    for (account objacc : Trigger.old)   //getting old value
    {        
        statOld = objacc.Status__c;
    }
    for (account objacc : Trigger.new)   //getting new value
    {
        str.add(objacc.Id);
        stat = objacc.Status__c;
    }
    list <contact> lstcont = [SELECT Id,status__c,AccountId from contact where AccountId = :str And(status__c = :statOld)];
    for(contact objcon : lstcont)
    {
        //if(lstcon.size() > 0 )
        objcon.status__c=stat;
        lstcon.add(objcon);
    } 
    if(statOld != Null && stat != Null)
    {
        update lstcon;
    }
}