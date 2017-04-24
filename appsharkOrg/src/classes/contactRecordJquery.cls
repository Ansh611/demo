/*  Author : Appshark Developer
Date : 13/9/2016
Description : Display contact record with pagination,searching,sorting,checkbox 
Modification History : --*/
public class contactRecordJquery
{
    public list<contact> lstcontact{get;set;}
    public contactRecordJquery()
    {
        lstcontact= new list<contact>();
        lstcontact=[SELECT LastName,Email,MobilePhone FROM contact limit : 100];
       
    }
   /* public PageReference savedata(Contact con)
    {
        upsert con;
       PageReference pref = new ApexPages.StandardController(con).view();
        return pref;
    }*/
    
        public void updateRecord(){
        string strUpdateVals = Apexpages.currentPage().getParameters().get('vals');
        system.debug('updateVals--->'+strUpdateVals );
        list<String> lstColumnsValues=new list<string>();
        list<String> lstFields=new list<string>();
            list<contact> objcon = new list<contact>();
       // OrgConfiguration__c objColumns=new OrgConfiguration__c();
        
        if(strUpdateVals!=null)
        {
            lstColumnsValues=strUpdateVals.split(',');
            system.debug('lstColumnsValues---'+lstColumnsValues[0]);
          
        }    
        //if(selectedObject!=null && selectedObject!='')
           // objColumns=OrgConfiguration__c.getInstance(selectedObject);
      /*  if(objColumns!=null)
            lstFields=objColumns.Column_Names__c.split(',');*/
//            objcon=[Select Name from contact where id:=lstColumnsValues[0]];
     
        /*if(!lstFields.isempty())
        {
            for(Integer i=1; i<lstFields.size(); i++)
            {		if(lstColumnsValues[i]== 'null')  lstColumnsValues[i]='';
                //if(lstFields[i]!=null && lstFields[i]!='' && lstColumnsValues[i]!=null && lstColumnsValues[i]!='')
                    objSobjctSaving.put(lstFields[i], lstColumnsValues[i]);
            }
        }*/
       // update objcon;
        
    }
}