/*  Author : Appshark Developer
Date : 20/10/2016
Description : If New Account is created, Assign user from custom setting.
Modification History : --*/
public class HelperSetAccFromCS
{
    public static void SetAccFromCS(list<Account> lstAcc)
    {
        string CSname;      //store minimum count user name 
       // string StrAccID;
        List<user_record__c> mcs = user_record__c.getall().values(); //get all values from CS
        Decimal MinCount=mcs[0].count__c;  //store first digit
        for (Integer c = 1 ; c < mcs.size()-1; c++ )  //loop to find minimum count
        {
            if ( mcs[c].count__c < MinCount ) 
            {
                MinCount = mcs[c].count__c;
            }
        }
        for(user_record__c usr1 : [select name from user_record__c where count__c =:MinCount])
        {
            CSname= usr1.name;   //get name of minimum count record
        } 
        user_record__c CSusr = user_record__c.getInstance(CSname);
         for(Account objacc : lstAcc)  // insert user name in Account record
            {
                objacc.user__c= CSname;
                //StrAccID=objacc.Id;
            }
        CSusr.count__c = CSusr.count__c + 1; //increment count
        //CSusr.Account_ID__c = StrAccID;
        update CSusr;
       
    }
}