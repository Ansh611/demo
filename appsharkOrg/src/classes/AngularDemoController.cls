global with sharing class AngularDemoController {
   // hardcode an account id for demo purposes
   //static String accountId = '0012800000mCIdR';
 
   global static void getAccount() {
      /* return JSON.serialize([select name, billingstreet,
           billingcity, billingstate, billingpostalcode
           from account where id = :accountId][0]);*/
    
   }    
 
   global static String getContacts() {
       return JSON.serialize([select id, name, email
           from contact]);// where accountId = :accountId]);
   }
}