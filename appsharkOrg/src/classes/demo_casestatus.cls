/*  Author : Appshark Developer
    Date : 13/9/2016
    Description : Auto calculation using Json with Remote action
    Modification History : --*/
public class demo_casestatus
{
    public list<case> lstcase{get;set;}
    public string statusname{get;set;}
    public demo_casestatus()
    {
        lstcase= new list<case>();
        lstcase=Database.query('SELECT Status,Subject,CaseNumber,CreatedDate,ClosedDate FROM case where Status=:statusname');
        system.debug('lstcase'+lstcase);
        
    }

}