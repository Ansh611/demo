/*    Author       :- Anshul Deshmukh
      Date         :- 21/7/2016
      Discription  :- Trigger to count number of contacts associated with an account */ 

trigger countcontactrecord on Contact (after insert, after delete,after undelete,after update) {

    

    if(Trigger.isInsert || Trigger.isUndelete){
       HelperAccount_contactcreate.beforecontact(trigger.new);
    }
    

    if(Trigger.isDelete){
    HelperAccount_contactcreate.contactdel(trigger.old);
       
    }
  

    if(Trigger.isUpdate){
     HelperAccount_contactcreate.updatecontact(trigger.old);
       
}
}