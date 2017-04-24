/*
 Author 				: Santosh reddy
 Date 					: 08/08/2016
 Description 			: Create a VF page to display list of Accounts, when the mouse hovers againt an account 
				  	  	  show related contacts using Remote Action
 Last Modified History 	:
*/

global  with sharing class mouseover_acc_show_cnt {
   
    public List<Account> lstAcc { get; set; }					//holds List of accounts
    public mouseover_acc_show_cnt() 				//Constructor to define Account records
    { 
    	lstAcc=[Select id,name from Account limit 10];
    }
@remoteAction
     global static Contact[] contactPopup(String accId)			//Static Method to display related contacts on Hover
    {
        return  [Select AccountId,lastName From Contact where AccountId=:accId];		//Returns all the related contacts of an account
    }
}