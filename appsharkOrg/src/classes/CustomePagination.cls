public with sharing class CustomePagination {
    public List<OppWrapper> lstWrapper {get;set;}
    public List<OppWrapper> lstSetController{get;set;}
    public set<String> lstSelected{get;set;}
    public Boolean flag{set;get;}
    CustomIterable obj;
     id idAcc =  ApexPages.currentPage().getParameters().get('id');
    public CustomePagination(ApexPages.StandardController controller) 
    {
        flag = false;
        lstWrapper =  new List<OppWrapper>();
        lstSetController = new List<OppWrapper>();
        lstSelected = new set<String>();
        obj = new CustomIterable (lstWrapper); 
        Integer cnt = 0;
        List<opportunity> lstOpp = [SELECT Name, Id FROM opportunity where AccountId !=:idAcc];
        for(Opportunity objOpp : lstOpp){
            lstWrapper.add(new OppWrapper(objOpp ,false, cnt));
            cnt = cnt+1;
        }
        obj.setPageSize = 5;
        next(); 
    }
    public void selectedRecords() {
        List<Id> selectedOpp = new List<Id>();
        for(OppWrapper cw : lstSetController){
            if(cw.isSelected){
                lstWrapper[cw.cnt].isSelected = true;
            }
        }
        for (OppWrapper wrapRec: lstWrapper) {
            if (wrapRec.isSelected) {
                selectedOpp.add(wrapRec.oppObj.Id);
            }
        }
       
        list<opportunity> lstOpp = [select name from Opportunity where id=:selectedOpp];
        system.debug('lstOpp@@@@@@@@@@@@@@'+lstOpp);
        if(!lstOpp.isEmpty())
        {
            for(opportunity objOpp : lstOpp)
            {
                flag = true;
                lstSelected.add(objOpp.Name);
                objOpp.AccountId=idAcc;
            }
        }
        update lstOpp;
    }
    public Boolean hasNext {
        get 
        {
            return obj.hasNext();
        }
        set;
    }
    public Boolean hasPrevious {
        get 
        {
            return obj.hasPrevious();
        }
        set;
    }
    public void next() 
    {
        lstSetController = obj.next();
    }
    public void previous() 
    {
        lstSetController = obj.previous();
    }
}