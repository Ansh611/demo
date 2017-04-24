public class AccountsController {
  @AuraEnabled
  public static List<Account> getAccounts() {
    return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone
    FROM Account ORDER BY createdDate ASC limit 10];
  }
    @AuraEnabled
    public static Account UpdData(Account Objacc){
    // Perform isUpdateable() check here 
    upsert Objacc;
    return Objacc;
}
}