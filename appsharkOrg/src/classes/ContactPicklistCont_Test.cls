@isTest
private class ContactPicklistCont_Test {
    static testMethod void myTest() {
        Account objAcc = new Account(name='Test Account',AnshulAppshark__Status__c = 'close');
        insert objAcc;
        Contact objCon = new Contact (FirstName = 'xyzFirst',LastName = 'XyZLast',AccountId = objAcc.Id);
        insert objCon;
        Opportunity ObjOpp = new Opportunity( Name = 'mAWS Usage',
                                             AccountId = objAcc.Id,
                                             StageName = 'Negotiations',
                                             CloseDate = System.today(),
                                             Type = 'New Business - Add',
                                             Amount = 555888555);
        insert  ObjOpp;
        
        ContactPicklistCont cont = new ContactPicklistCont();
        cont.accountName = 'Test Account';
        cont.getcont();
        cont.contactList = new list<contact>();
        cont.LstOppo = new list<opportunity>();
      
    }
}