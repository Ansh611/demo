public class AccCnt {
    Public String accountName{get;set;}
    Public String selectedAcc{get;set;}
    public void opportunityList() {
        
        Contact con = [SELECT Name FROM  Contact  WHERE Id =:accountName];
        selectedAcc = con.Name;
    }
}