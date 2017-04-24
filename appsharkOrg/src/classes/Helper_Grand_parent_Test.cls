@isTest
private class Helper_Grand_parent_Test 
{
    @isTest
   private static void insert_Account_Trigger_test()
   {
     Account a=new Account(Name='aaa',phone='1234');
        insert a;
        system.debug('Account'+a); 
    
   }
}