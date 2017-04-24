public class AccImportCsv {
    public list<Account> LstAcc {get; set;}
    public AccImportCsv()
    {
        LstAcc = [SELECT Name, Id, BillingCity, Website FROM Account where BillingCity !=Null];
    }
}