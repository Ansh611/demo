/*  Author : Appshark Developer
Date : 21/11/2016
Description : Send email to contact mail id if Date expiry come closer in AccContactRole
Modification History : --*/
global class accCntRoleMailBatch implements Database.Batchable<sObject>{
    set<string> setAccId = new set<string>();
    set<string> setCntId = new set<string>();
    date startDate = system.today();
    date dueDate;
    integer numberDaysDue;
    Global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT id, AccountId,ContactId FROM AccountContactRole';
        return Database.getQueryLocator(query);
    }
    Global void execute(Database.BatchableContext BC, List<AccountContactRole> lstACR) {
        system.debug('execute');
        for(AccountContactRole objACR : lstACR) {
            setAccId.add(objACR.AccountId);
            setCntId.add(objACR.ContactId);
        }
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        list<Contact> lstCnt = [SELECT Id, Email FROM Contact where Id =:setCntId];
        for(Account objAcc :[SELECT id,AnshulAppshark__Date_Expries__c FROM Account where id =:setAccId])// AND AnshulAppshark__Date_Expries__c != Null
        {
            system.debug('objAcc@@@@@@@@@@@@'+objAcc);
            numberDaysDue = startDate.daysBetween(objAcc.AnshulAppshark__Date_Expries__c);
            system.debug('numberDaysDue@@@@@@@@@@'+numberDaysDue);
            for(contact objCnt : lstCnt)
            {
                if(numberDaysDue == 30)
                {
                    if (objCnt.Email != null)
                    {
                        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                        List<String> sendTo = new List<String>();
                        sendTo.add(objCnt.Email);
                        mail.setToAddresses(sendTo);
                        mail.setSenderDisplayName('Batch Testing Purpose');
                        mail.setSubject('Date Expries after 30 days ');
                        String body = 'Dear ' + objCnt.FirstName + ', ';
                        body += 'Your Product purchase experier after 30 days';
                        body += 'please reply to renew it.';
                        mail.setHtmlBody(body);
                        mails.add(mail);
                    }
                }
                if(numberDaysDue == 20)
                {
                    if (objCnt.Email != null)
                    {
                        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                        List<String> sendTo = new List<String>();
                        sendTo.add(objCnt.Email);
                        mail.setToAddresses(sendTo);
                        mail.setSenderDisplayName('Batch Testing Purpose');
                        mail.setSubject('Date Expries after 20 days ');
                        String body = 'Dear ' + objCnt.FirstName + ', ';
                        body += 'Your Product purchase experier after 20 days';
                        body += 'please reply to renew it.';
                        mail.setHtmlBody(body);
                        mails.add(mail);
                    }
                }
                if(numberDaysDue == 10)
                {
                    system.debug('10 days');
                    if (objCnt.Email != null)
                    {
                        system.debug('objCnt.Email---------'+objCnt.Email);
                        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                        List<String> sendTo = new List<String>();
                        sendTo.add(objCnt.Email);
                        mail.setToAddresses(sendTo);
                        mail.setSenderDisplayName('Batch Testing Purpose');
                        mail.setSubject('Date Expries after 10 days ');
                        String body = 'Dear ' + objCnt.FirstName + ', ';
                        body += 'Your Product purchase experier after 10 days';
                        body += 'please reply to renew it.';
                        mail.setHtmlBody(body);
                        mails.add(mail);
                    }
                }
            }
        }
         // Messaging.sendEmail(mails);
         system.debug('mails@@@@@@@@@@'+mails);
        system.debug('mails');
    }
    Global void finish(Database.BatchableContext BC) {
        system.debug('finish');
    }
}