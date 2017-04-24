/*  Author : Appshark Developer
    Date : 20/10/2016
    Description : If New Account is created, Assign user from custom setting.
    Modification History : --*/
trigger SetAccFromCS on Account (before insert) {
HelperSetAccFromCS.SetAccFromCS(trigger.new);
}