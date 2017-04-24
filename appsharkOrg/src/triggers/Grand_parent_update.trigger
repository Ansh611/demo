/* Author:- Anshul Deshmukh
 * Date  :- 04/8/2016
   Discription  :- Trigger to show grand parent of account
   Modified by:-
 */

trigger Grand_parent_update on Account (before insert,before update)
   {
     Helper_Grand_parent objHelper = new Helper_Grand_parent(); // create instance of non static method
     objHelper.method_Parent(Trigger.new); // calling method and give trigger.new as a parameter
   }