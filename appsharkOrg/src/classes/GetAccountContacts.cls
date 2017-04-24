public class GetAccountContacts {  
    public List<Account> getAccConCases(){
        return [select id, Name, (select id, Name from Account.Contacts), (select id, ContactId, CaseNumber from Cases) from account LIMIT 10];
    }                
}