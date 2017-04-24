@isTest
private class AccConOpp_Test {
    static testMethod void myTest() {
         Account objAcc = new Account(name='Test Account',AnshulAppshark__Status__c = 'close');
        insert objAcc;
		Date myDate = date.newinstance(2016, 8, 2);
        Contact objCon = new Contact (FirstName = 'xyzFirst',LastName = 'XyZLast',AnshulAppshark__SC__c = True,AnshulAppshark__Stop_Date__c=myDate,AccountId = objAcc.Id);
        insert objCon;
        objCon.AssistantName='1542';
        update objCon;
        Opportunity objOpp = new Opportunity(Name='Test', 
                                             CloseDate = System.today(),
                                             AccountId=objAcc.Id, 
                                             StageName='Closed Won - One Time', 
                                             Probability=100);
        insert objOpp; 
        opportunitycontactrole pcr= new opportunitycontactrole();
        pcr.contactid=objCon.id;
        pcr.OpportunityId=objOpp.id;
        pcr.IsPrimary=true;
        pcr.Role='CEO';
        insert pcr;
        AccConOpp cont = new AccConOpp();
    }
}