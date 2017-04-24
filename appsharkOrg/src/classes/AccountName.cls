/*  Author : Appshark Developer
    Date : 13/9/2016
    Description : Auto calculation using Json with Remote action
    Modification History : --*/
public  class AccountName {
public list<Account> lstAcc {set;get;}  //Get list of all the accounts  
    public void AccountName(){
    lstAcc  = [select Name from Account];
    }
    }