@isTest
private class ContactScCount_Test {
    static testMethod void myTest() {
        Account objAcc = new Account(name='Test Account',AnshulAppshark__Status__c = 'close');
        insert objAcc;
        Date myDate = date.newinstance(2016, 8, 2);
        Contact objCon = new Contact (FirstName = 'xyzFirst',LastName = 'XyZLast',AnshulAppshark__SC__c = True,AnshulAppshark__Stop_Date__c=myDate,AccountId = objAcc.Id);
        insert objCon;
        objCon.AssistantName='1542';
        update objCon;
        
    }
}