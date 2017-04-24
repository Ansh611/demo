/* Author:-Anshul Deshmukh,
* Date:-16/08/16,
* Description:- It displays company Total events completed, upcoming events and events cancelled. 
* Modification History:*/
public class company_events_detail {
    //Holds current company ID when we click on button 
    public String strEmpId{set;get;}
    //Holds year which is selected in picklist
    public Integer intSelectedYear{set;get;}
    list <Employee__c> emp = new list <Employee__c>();
    public company_Events_Detail(ApexPages.StandardController standController)
    {
        strEmpId = ApexPages.currentPage().getParameters().get('id'); 
        
    }
    public List<SelectOption> getYears()                 //For dynamic Picklist
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--Select--', '--Select--'));
        for (Integer i = System.Today().year() - 5; i < System.Today().year()+6 ; i++) 
        {
            options.add(new SelectOption(String.valueOf(i), String.valueOf(i)));
        }
        return options;
    }
    public void futureyear_events()
    {
        if(intSelectedYear > system.today().year())
        {
            emp = [select Name from Employee__c];
        }
    }
    public void pastyear_events()
    {
        if(intSelectedYear < system.today().year() )
        {
            
        }
    }
    public void cancelled_events()
    {
        
    }
}