/*   Author      :- Anshul Deshmukh
     Date        :- 10/08/2016
     Discription :- Search account and display related account list, Click to show related contact, click to show detail page
     Modified by :- 

*/

public with sharing class search_account_name_apex
{
   public String searchstring {set;get;}   //hold user input
   public list<Account> lstAcc {set;get;}  //Get list of all the accounts  
   public list<Contact> lstCon {set;get;}  //Holds the list of contacts for that particular account
   public Opportunity objCon {set;get;}        
   public string recid{get;set;}          // hold value which is getting from params
   public string conid{get;set;}
   
   public void search()                //Searching for user entered input in org
   {	
       
       if(searchstring!=null && searchstring!='')
       {
   	       lstAcc= [select id,Name from Account where Name=:searchstring];
           lstCon=[select id,AccountId, FirstName, LastName from Contact where AccountId=:searchstring];
       }
   }
   public void showContacts()    // method to get contact related to selected account id
   {	
      lstCon=[select id,AccountId, FirstName, LastName from Contact where AccountId=:searchstring];
   }

 }