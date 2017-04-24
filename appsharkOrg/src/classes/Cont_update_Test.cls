@isTest(SeeAllData=true)
private class Cont_update_Test {
    static testMethod void myTest() {
        Account acc = new Account(name='Test Account',AnshulAppshark__Status__c = 'close');
        insert acc;
        Contact NewContact = new Contact (FirstName = 'xyzFirst',LastName = 'XyZLast',AccountId = acc.Id);
        insert NewContact;
        list<Account> lstAcc =[select id, AnshulAppshark__status__c from Account where name=: acc.Name];
        List<Account> lstAccUpd = new list<Account>();
        for(Account accUpt : lstAcc)
        {
            accUpt.AnshulAppshark__Status__c = 'open';
            lstAccUpd.add(accUpt);
        }
        update lstAccUpd;
    }
    
}