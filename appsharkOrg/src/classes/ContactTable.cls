Public class ContactTable
{
    public String size { get; set; }
    //This is Our collection of the class/wrapper objects WrapperContactWrapper
    Public List<WrapperContactWrapper> wrapperlist;
    Public Integer noOfRecords{get; set;}
    // Create a new Map to verify whether the contact is already added in the Map
    Map <id,Opportunity> SelectedcontactMap = new Map <id,Opportunity>();
    public boolean display{get;set;}
    public list<Opportunity> selectedList {get;set;}
    // instantiate the StandardSetController from a query locator

    public ApexPages.StandardSetController Setcon
    {
        get
        {
            if(Setcon == Null)
            {
                Setcon = new ApexPages.StandardSetController(Database.getQueryLocator([Select Name from Opportunity]));
                // sets the number of records in each page set
                setCon.setpagesize(10);
                noOfRecords = setCon.getResultSize();
            }
            return Setcon;
        }
        set;
    }
    //Returns a list of wrapper objects for the sObjects in the current page set
    Public List<WrapperContactWrapper> getContact()
    {
        getSelectedContact();
        // Initilaize the list to add the selected contact
        wrapperlist = new List <WrapperContactWrapper>();
        for(Opportunity cc : (List<Opportunity>)Setcon.getRecords())
        {
            if( SelectedcontactMap .ContainsKey(cc.id))
            {
                wrapperlist.add (new WrapperContactWrapper(cc,true));
            }
            else
            {
                wrapperlist.add(new WrapperContactWrapper(cc,false));
            }
        }
        return wrapperlist;}
    public void getSelectedContact(){
        if(wrapperlist!=null)
        {
            for(WrapperContactWrapper wr:wrapperlist)
            {
                if(wr.bool == true)
                {
                    SelectedcontactMap.put(wr.con.id,wr.con); // Add the selected contact id in to the SelectedcontactMap.
                }
                else
                {
                    SelectedcontactMap.remove(wr.con.id); // If you uncheck the contact, remove it from the selectedcontactMap
                }
            }
        }
    }
    public void clickMe()
    {
        display = true;
        getSelectedContact();
         list<opportunity> lstOpp = [select id from opportunity where id=: SelectedcontactMap.values()];
       for(opportunity objOpp : lstOpp)
           {
               objOpp.AccountId = ApexPages.currentPage().getParameters().get('id');
           }
         update lstOpp;
    }
    public integer pageNumber
    {
        get
        {
            return Setcon.getPageNumber();
        }
        set;
    }
}