public with sharing class CustomPaginationDemo
{

public List<ContactWrapper> lstWrapper {get;set;}
public List<ContactWrapper> lstSetController{get;set;}

CustomIterable obj;

    public CustomPaginationDemo(ApexPages.StandardController controller) 
    {
        lstWrapper =  new List<ContactWrapper>();
        lstSetController = new List<ContactWrapper>();    
          obj = new CustomIterable (lstWrapper); 
    }
     public void selectedRecords() {
        List<Id> selectedOpp = new List<Id>();
        for (ContactWrapper wrapRec: lstSetController) {
            /*Check if record is selected*/
          //  system.debug('@@oppId'+wrapRec.oppRecord.Id);
            if (wrapRec.isSelected) {
              //  system.debug('@@oppId'+wrapRec.oppRecord.Id);
                selectedOpp.add(wrapRec.cont.Id);
                System.debug('selected Ids------ '+selectedOpp);
            }
        }
        System.debug('selected Ids '+selectedOpp);
        id idAcc =  ApexPages.currentPage().getParameters().get('id');
        list<opportunity> lstOpp = [select name from Opportunity where id=:selectedOpp];
        //  system.debug('@@@@@@@@@@ParamSave'+ParamSave);
        for(opportunity objOpp : lstOpp)
        {
            objOpp.AccountId=idAcc;
        }
        update lstOpp;
        // list<string> str = new list<string>();
        //str.add('Opportunity added to Account');
        //wrapperRecordList = null;
    }
    public void getdata(){
        

        List<opportunity> lstOpp = [SELECT Name, Id FROM opportunity];
        
        for(Opportunity objOpp : lstOpp )
        {
            lstWrapper.add(new ContactWrapper(objOpp ,false));
        }

      
        obj.setPageSize = 5;
        next(); 
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