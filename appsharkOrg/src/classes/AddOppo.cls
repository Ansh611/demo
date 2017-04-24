public class AddOppo {
    public List<sObjectWrapper> wrappers{get;set;}
    public String ParamSave{set;get;} //Holds Opportunity record id
    public String paramLastName{set;get;}//Holds Opportunity name to update
    //public List<opportunity> lstOpp {get;set;}
    public AddOppo(ApexPages.StandardController controller){
    }
    public void getOpp(){
        wrappers = getData();
         system.debug('@@@@@@@@@@wrappers'+wrappers);
    }
    private List<sObjectWrapper> getData(){  
        List<sObjectWrapper> wrappers = new List<sObjectWrapper>();  
        for(Opportunity objOpp : [select name from Opportunity where name !='']){  
            /*Create a new wrapper and add it to list*/  
            wrappers.add(new sObjectWrapper(objOpp,false));  
        }  
        return wrappers;  
    }
    public void addOpp(){
      //  String interviewdate=Apexpages.currentPage().getParameters().get('interviewDate');
       id idAcc =  ApexPages.currentPage().getParameters().get('id');
        system.debug('@@@@@@@@@@accIds'+idAcc);
        list<opportunity> lstOpp = [select name from Opportunity where id=:ParamSave];
        system.debug('@@@@@@@@@@ParamSave'+ParamSave);
        for(opportunity objOpp : lstOpp)
        {
            objOpp.AccountId=idAcc;
        }
        update lstOpp;
         wrappers = Null;
    }
    /*Wrapper class*/  
    public class sObjectWrapper{  
        public boolean isSelected{get;set;}  
        public Opportunity myAccount{get;set;}  
        public sObjectWrapper(Opportunity myAccount,Boolean isSelected){  
            this.myAccount = myAccount;  
            this.isSelected = isSelected;  
        }  
    }
}