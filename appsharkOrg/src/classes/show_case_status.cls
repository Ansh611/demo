/*  Author : Appshark Developer
    Date : 13/9/2016
    Description : Auto calculation using Json with Remote action test class
    Modification History : --*/
Global class show_case_status {
 @RemoteAction
    global static List<case> getcase_list(){
         List<case> lstcase = [SELECT Status, Subject,CaseNumber,CreatedDate,ClosedDate FROM case];
             return lstcase; 
        
    }
}