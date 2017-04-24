/*  Author : Appshark Developer
    Date : 20/10/2016
    Description :If Checkbox checked, save user name and count to custom setting.
    Modification History : --*/
trigger SetUserToCS on User (after update) {

        HelperSetUserToCS.SetUserToCS(Trigger.new);
   }