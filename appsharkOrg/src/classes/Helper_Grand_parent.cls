/* Author:- Anshul Deshmukh
 * Date  :- 04/8/2016
   Discription  :- Trigger to show grand parent of account
   Modified by:-
 */

public class Helper_Grand_parent
{  
      public Boolean ifaccnotnull;
      public string parent_record_id;
      public void method_parent(list<Account> lstAcc)     //Method which recive trigger.new in parameter
    {       
        if(lstAcc!=Null)                                  //condition If trigger.new is not empty 
        {
            for(Account ObjAcc:lstAcc)                    //Retrive list of account object in ObjAcc
            {
                ifaccnotnull = true;                      //set Boolean true
                parent_record_id = ObjAcc.ParentId;       //Set id in String       
                while(ifaccnotnull)                       
                {                                         //Retrive related record to id (which save in string ) 
                Account obj_Parent_Account = [Select ParentId, Name From Account Where Id = : parent_record_id];
                    system.debug(obj_Parent_Account);
                if(obj_Parent_Account.ParentId == Null)    //Condition if Retrive related record is Null
                {
                    ObjAcc.Grand_parent__c = obj_Parent_Account.Name;  // update field to retrive record Name
                    System.debug(ObjAcc.Grand_parent__c);
                    ifaccnotnull = false;
                    break;
                }
                    else
                parent_record_id = obj_Parent_Account.ParentId;  //set retrive related id in string
                    //System.debug(parent_record_id);
            }
        }
        
       }
    }

}