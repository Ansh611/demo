/*  Author : Appshark Developer
    Date : 21/11/2016
    Description : create account, order, lineitem record if user enter record in object using batch
    Modification History : --*/
global class CustomerBatchToAcc implements Database.Batchable<sObject> {
    string AccName;
     string Num;
        date dat;
    Global Database.QueryLocator start(Database.BatchableContext BC) {
        //Retrive data from custom object and convert it into batch
        String query = 'SELECT AnshulAppshark__Date__c,Name,AnshulAppshark__Phone__c FROM AnshulAppshark__User_Input__c';
        return Database.getQueryLocator(query);
    }
    Global void execute(Database.BatchableContext BC, List<AnshulAppshark__User_Input__c> scope) {
        for(AnshulAppshark__User_Input__c a : scope) {
            AccName = a.Name;
            Num = a.AnshulAppshark__Phone__c;
            dat = a.AnshulAppshark__Date__c;
        }
        Account objacc = new Account();    //create account record
        objacc.Name = AccName;
        objacc.Phone = NUM;
        upsert objacc;
        AnshulAppshark__line__c objline = new AnshulAppshark__line__c();
        objline.Name = AccName;
        upsert objline;
        contract objcon = new contract();  // create contract record to update order record
         order objnew = new order();      //create order
       for(Account c : [SELECT Id FROM Account WHERE Name =: AccName limit 1])
        {
            objcon.AccountId = c.Id;
            objnew.AccountId = c.Id;
        }
        objcon.Status = 'Draft';
        objcon.StartDate = system.today();
        objcon.ContractTerm = 5 ;
        upsert objcon;
        for(contract con : [select id from contract where Accountid =: objnew.AccountId ])
        {
            objnew.ContractId = con.id;
        }
        objnew.Status = 'fulfilled';
        objnew.EffectiveDate = dat;
        upsert objnew;
    }
    Global void finish(Database.BatchableContext BC) {
    }
}