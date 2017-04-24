trigger ContactSCcount on Contact (after delete, after insert, after update) {
    Set<id> AccIds = new Set<id>();
    List<Account> AccToUpdate = new List<Account>();
    if (Trigger.isUpdate || Trigger.isDelete) {
        for (Contact objCon : Trigger.old)
            AccIds.add(objCon.Accountid);
    }
    if(Trigger.isinsert)
    for (Contact objCon : Trigger.new)
        AccIds.add(objCon.Accountid);
    // get a map of the Account with the number of Sc count
    Map<id,Account> mapAcc = new Map<id,Account>([select id, AnshulAppshark__Sc_Count__c from Account where id IN :AccIds]);
    // query the Account and the related contact and add the size of the contact count to the Account field
    Date myDate = date.newinstance(2016, 8, 2);
    Date myDate2 = date.newinstance(2017, 4, 2);
    for (Account objAcc : [select Id, Name, AnshulAppshark__Sc_Count__c,(select id from contacts where AnshulAppshark__SC__c =True AND AnshulAppshark__Stop_Date__c>: myDate and AnshulAppshark__Stop_Date__c <:  myDate2) from Account where Id IN :AccIds]) {
        mapAcc.get(objAcc.Id).AnshulAppshark__Sc_Count__c = objAcc.contacts.size();
        // add the value/Account in the map to a list so we can update it
        AccToUpdate.add(mapAcc.get(objAcc.Id));
    }
    update AccToUpdate;
}