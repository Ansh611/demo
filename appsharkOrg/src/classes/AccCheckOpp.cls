public class AccCheckOpp {
    public Boolean flag{set;get;}
    public Boolean flag1{set;get;}
public AccCheckOpp(ApexPages.StandardController controller)
{
    flag = false;
     flag1 = false;
    id idAcc =  ApexPages.currentPage().getParameters().get('id');
    List<opportunity> lstOpp = [SELECT Name, Id FROM opportunity where AccountId =:idAcc];
   if(lstOpp.isEmpty())
   {
       flag = true;
        flag1 = false;
   }
    else{
        flag1 = true;
        flag = false;
    }
}
}