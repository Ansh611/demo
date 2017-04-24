/*  Author      : Appshark Developer
    Date        : 28/9/2016
    Description : Display Account record with pagination,searching,sorting,checkbox.
                  Multiple check to delete edit and save. 
    Modification History : --*/
public class WrapperDemo_Con {  
    /*List of wrappers*/  
    public List<sObjectWrapper> wrappers{get;set;}  
    public String ParamSave{set;get;} //Holds Account record id
    public String paramLastName{set;get;}//Holds Account name to update
    public String paramPhone{set;get;}//Holds Account Phone No to update
    /*Constructor*/  
    public WrapperDemo_Con(){  
        wrappers = getData();  
    }  
    /*method to delete the selected record*/   
    public void deleteRecords(){  
        List<Account> accToDel = new List<Account>();  
        for(sObjectWrapper wrap : wrappers){  
            /*Check if record is selected*/  
            if(wrap.isSelected){  
                accToDel.add(wrap.myAccount);  
            }  
        }  
        /*Delete the selected records*/  
        delete accToDel;  
        /*Referesh the data*/  
        wrappers = getData();  
    }  
     /*method to save the selected record*/
    public void saveRecord(){  
       // List<Account> accToSave = new List<Account>();  
        //for(sObjectWrapper wrap : wrappers){  
            /*Check if record is selected*/  
         //   if(wrap.isSelected){  
       //         accToSave.add(wrap.myAccount);  
        //    }  
      //  }  
        /*save the selected records*/  
      //  upsert accToSave;  
        /*Referesh the data*/  
     //  wrappers = getData();  
     Account objAcc=[select id,Name,Phone from Account where id=:ParamSave];
        
        objAcc.Name=paramLastName;
        objAcc.Phone=paramPhone;
        update objAcc; 
        wrappers = getData(); 
    }  
    /*method to query account and populate wrappers*/  
    private List<sObjectWrapper> getData(){  
        List<sObjectWrapper> wrappers = new List<sObjectWrapper>();  
        for(Account acc : [SELECT Name,Id,Phone, Description FROM Account limit 20]){  
            /*Create a new wrapper and add it to list*/  
            wrappers.add(new sObjectWrapper(acc,false));  
        }  
        return wrappers;  
    }  
    /*Wrapper class*/  
    public class sObjectWrapper{  
        public boolean isSelected{get;set;}  
        public Account myAccount{get;set;}  
        public sObjectWrapper(Account myAccount,Boolean isSelected){  
            this.myAccount = myAccount;  
            this.isSelected = isSelected;  
        }  
    }  
}