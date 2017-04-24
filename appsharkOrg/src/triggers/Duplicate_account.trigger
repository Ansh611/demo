/*  Author:- Anshul deshmukh
    Date  :- 30/7/2016
    Discription  :- Trigger to avoid duplicate account
 */
trigger Duplicate_account on Account (before insert) {
Helper_Duplicate_account.Duplicate_account(trigger.new); // calling helper class
}