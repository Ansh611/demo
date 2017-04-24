/*Author      : Appshark Developer
    Date        : 03/10/2016
    Description : Display and search Account record in table using javascript remote and Jquery templates. 
    Modification History : */
public with sharing class  testremotingcontroller {
    @RemoteAction
    public static Account[] searchAccounts(String accountName) {
        accountName = accountName.replaceAll('[*]', '%');
        return [select name,(select name from contacts),(select name from opportunities) from account where name =:accountName ];
        
    }   
}