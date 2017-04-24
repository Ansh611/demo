public class WrapperClassDemo {
    /*List of wrappers*/
    public List <WrapperClass> wrapperRecordList {
        get;
        set;
    }
    /*Constructor*/
    public WrapperClassDemo(ApexPages.StandardController controller) {
    }
    public void addOpportunity()
    {
        wrapperRecordList = getData();
    }
    /*method to collect the selected record*/
    public void selectedRecords() {
        List<Id> selectedOpp = new List<Id>();
        for (WrapperClass wrapRec: wrapperRecordList) {
            /*Check if record is selected*/
            system.debug('@@oppId'+wrapRec.oppRecord.Id);
            if (wrapRec.isSelected) {
                system.debug('@@oppId'+wrapRec.oppRecord.Id);
                selectedOpp.add(wrapRec.oppRecord.Id);
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
        wrapperRecordList = null;
    }
    /*method to soql Opportunity and generate the wrapper class list*/
    private List < WrapperClass > getData() {
        List < WrapperClass > wrapperTempList = new List < WrapperClass > ();
        for (opportunity objOpp: [SELECT Name, Id FROM opportunity]) {
            /*Create a new wrapper element and add it to wrapperTempList list*/
            wrapperTempList.add(new WrapperClass(objOpp, false));
        }
        return wrapperTempList;
    }
    /*Wrapper class definition*/
    public class WrapperClass {
        public Boolean isSelected {
            get;
            set;
        }
        public Opportunity oppRecord {
            get;
            set;
        }
        public WrapperClass(Opportunity oppRecord, Boolean isSelected) {
            this.oppRecord = oppRecord;
            this.isSelected = isSelected;
        }
    }
}