/*  Author : Appshark Developer
    Date : 13/9/2016
    Description : Auto calculation using Json with Remote action
    Modification History : --*/
public class case_status
{
    public list<case> lstcase{get;set;}
    public case_status()
    {
        lstcase= new list<case>();
        lstcase=[SELECT Status,Subject,CaseNumber,CreatedDate,ClosedDate FROM case];
        system.debug('lstcase'+lstcase);
        
    }

}