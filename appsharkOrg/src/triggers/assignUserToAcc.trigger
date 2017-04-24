/*  Author : Appshark Developer
    Date   : 19/9/2016
    Description : Assign user to Account, Each user has equally assigned account.
    Modification History : --*/
trigger assignUserToAcc on Account (before insert) {
helperAssignUserToAcc objHelper = new helperAssignUserToAcc(); // create instance of non static method
    // objHelper.AssignUserToAcc(Trigger.new); // calling method and give trigger.new as a parameter
}