/*   Author     :- Anshul deshmukh 
     Date       :- 3/8/2016
     Description:- Display account list which have contact along with checkbox and text field if u enter 2 in text box and check 2 account then show related contact
     Modified by:-   */

public class Display_account_related_contact 
{
    public list<Account> lstAcc{set; get;}
    public list<AccountWrapper> lstaccwrap{set;get;}	//Holds list of all the accounts
    public list<Account>  lstAccounts{set;get;}	       //Holds accounts and their corresponding contacts

    public boolean testBool {get; set;}
   
    public Display_account_related_contact()              //Add account with related contact in wrapper class
    {
         AccountWrapper objAccwraper;                   
        lstaccwrap= new list<AccountWrapper>();
        lstAccounts= new list<Account>();
        lstAccounts=[select id,Name,(Select id,LastName from Contacts) from Account  where  id IN (Select AccountId from Contact)];
         for(Account acc:lstAccounts){              
            objAccwraper=new AccountWrapper();
            objAccwraper.objAcc=acc;
            lstaccwrap.add(objAccwraper);
        }       
    }
    public void showList(){                     //shows the list of the all selected accounts along with their contacts
      lstAcc= new list<Account>();
        
         for( AccountWrapper aw:lstaccwrap){    // Adding selected account in account object
             if(aw.selected){
                 lstAcc.add(aw.objAcc);
             }
        }
    }
      
      
}