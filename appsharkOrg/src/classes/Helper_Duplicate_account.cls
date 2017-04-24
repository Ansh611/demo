/*
      Author       :- Anshul Deshmukh
      Date         :- 30/7/2016
      Discription  :- Trigger to avoid duplicate account  
      modified History:-
*/
public class Helper_Duplicate_account 
 {
     //Preparing Account names in Set from trigger.new

    public static void Duplicate_account(list<Account> setAcc)      
    {
        set<String> setAcc1 = new set<String>();
        for(Account acc : setAcc)
        {            
            setAcc1.add(acc.Name);        
        }
         // getting the list of accounts in database  with the account name we entered ( trigger.new)

        List<Account> accList = new List<Account>([select id,name from Account where name in: setAcc1]);
        for(Account acc1 : setAcc)
        {
            if(accList.size() > 0 )
                acc1.addError('Account already exists in your Organization with name '+acc1.name);
        }

    }

 }