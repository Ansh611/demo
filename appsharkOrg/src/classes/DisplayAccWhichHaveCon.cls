/*-- Author:-Babitha Jampani,
 * Date:-02/08/16,
 * Description:- Apex class for displays accounts with checkbox, and displays selected account's related contacts in other section
 * Modification History */

public class DisplayAccWhichHaveCon 
{
    //Holds account records with their corresponding contacts
    public list<Account> lstAccounts{set;get;}
    //Holds account records which have childs (contacts)
    public list<AccountWrapper> lstAccwrp{set;get;}
    //Holds account records which is selected
    public list<Account> lstAcc{set;get;}
    public DisplayAccWhichHaveCon()
    {
        //creating object for wrapper class
        AccountWrapper objAccWrp;
        lstAccwrp= new list<AccountWrapper>();
        lstAccounts= new list<Account>();
        //getting list of accounts with their contacts
        lstAccounts=[select id,Name,(Select id,LastName from Contacts) from Account  where  id In (Select AccountId from Contact)];
        for(Account objAcnt:lstAccounts)
        {
            //creating object for AccountWrapper class
            objAccWrp=new AccountWrapper();
            objAccWrp.objAcc=objAcnt;
            //adding accounts to list 
            lstAccwrp.add(objAccWrp);
        }
	}
    //In this collects contacts with their accounts which is selected
    public void DisplayConwithAcc()
    {
      lstAcc= new list<Account>();
		//Iterate loop to add accounts with their contacts and added to list.        
         for( AccountWrapper objAccwrp:lstAccwrp)
         {
             if(objAccwrp.selected)
             {
                 lstAcc.add(objAccwrp.objAcc);
             }
         }
    }
    //Wrapper class used to display list of contacts with checkboxes.
    public class AccountWrapper 
    {
    	public boolean selected{set;get;}
    	public Account objAcc{set;get;}
	}    
}